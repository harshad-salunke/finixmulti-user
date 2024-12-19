import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:finixmulti_user/FirebaseServices/firebase_database_dao.dart';
import 'package:finixmulti_user/FirebaseServices/providers/firbase_auth_handler.dart';
import 'package:finixmulti_user/FirebaseServices/providers/services_provider.dart';
import 'package:finixmulti_user/Models/UserModle.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:finixmulti_user/textController/RegistrationController.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/global_widgets.dart';
import '../../widgets/global/drop_downlist.dart';
import '../../widgets/global/my_elevated_button.dart';
import '../../widgets/global/progress_dialog.dart';
import '../main_screen.dart';
import 'login_screen.dart';

class GuestLoginScreen extends StatefulWidget {
  static String routePath = "/guestscreen";

  const GuestLoginScreen({Key? key}) : super(key: key);

  @override
  State<GuestLoginScreen> createState() => _GuestLoginScreenState();
}

class _GuestLoginScreenState extends State<GuestLoginScreen> {
  RegistrationController registrationController = RegistrationController();
  FirebaseAuthHandler firebaseAuthHandler=FirebaseAuthHandler();
  bool _passwordVisible=true;
  var gender_list=[
    "Male",
    "Female",
    "Other"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/company_logo.png'),
                    height: 70,
                  ),
                  SizedBox(height: 5,),
                  Text(
                    '  Wellcome  Guest',
                    style: GoogleFonts.firaSansExtraCondensed(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 400,
                    padding: const EdgeInsets.only(bottom: 15),
                    margin: const EdgeInsets.only(bottom: 15 * 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: registrationController.full_nameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.person,
                              size: 25,
                            ),
                            filled: false,
                            hintText: "Enter Full Name",
                            labelText: "Full Name",
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 22, horizontal: 15),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: MyAppColor.primary_color)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: MyAppColor.primary_color)),
                          ),
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Brand-Bold",
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        TextField(
                          controller: registrationController.mobile_controller,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.call,
                              size: 25,
                            ),
                            filled: false,
                            labelText: "Mobile Number",
                            prefixText: '+91',

                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 22, horizontal: 15),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: MyAppColor.primary_color)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: MyAppColor.primary_color)),
                          ),
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Brand-Bold",
                            fontSize: 16,
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        MyElevatedButton(
                            title: "Continue",
                            height: 55,
                            width: double.infinity,
                            fontsize: 18,
                            radius: 10,
                            bg_color: MyAppColor.primary_color,
                            fontWeight: FontWeight.w600,
                            onPressed: createUserAccount

                            ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



 void createUserAccount()  async {

   if (registrationController.full_nameController.text.isEmpty) {
     showToast("Please enter full name ...!", ContentType.failure,context);
   }
   else if (registrationController.mobile_controller.text.length < 10 ||
       registrationController. mobile_controller.text.length > 10) {
     showToast("Please Enter Correct Mobile Number ...!", ContentType.failure,context);

   }
   else{
      UserModel usermodle=registrationController.getUserData();
      usermodle.email=usermodle.phone_number+"guest@gmail.com";
      usermodle.password=usermodle.phone_number+"guest@gmail.com";
      usermodle.gender="Male";
      usermodle.register_date=DateTime.now().toString();
      List<String> fullname=usermodle.name.split(" ");
      usermodle.name="Guest "+fullname.first;
      showProgressBar(context,'Please Wait..');
      String auth_response=await  Provider.of<FirebaseAuthHandler>(context,listen: false).signUpWithEmailAndPassword(usermodle);

      if(auth_response=='created'){

        await Provider.of<ServiceProvider>(context,listen: false).saveUserDetails(usermodle);
        Navigator.pop(context);
        showToast("Wellcome Guest ...!", ContentType.success,context);
        Provider.of<ServiceProvider>(context,listen: false).featchOffers();
        Provider.of<ServiceProvider>(context,listen: false).fetchUserDetails();
        Provider.of<ServiceProvider>(context,listen: false).fetchProducts();
        Provider.of<ServiceProvider>(context,listen: false).fetchServices();
        Provider.of<ServiceProvider>(context,listen: false).fetchBookings();

        Navigator.of(context).pushNamedAndRemoveUntil(
          MainScreen.routePath,
              (route) => false,
        );

      }else{
        Navigator.pop(context);
        showToast(auth_response, ContentType.failure,context);
      }


    }

  }
}
