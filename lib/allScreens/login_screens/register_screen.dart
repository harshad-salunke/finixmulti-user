import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:finixmulti_user/FirebaseServices/firebase_database_dao.dart';
import 'package:finixmulti_user/FirebaseServices/providers/firbase_auth_handler.dart';
import 'package:finixmulti_user/FirebaseServices/providers/services_provider.dart';
import 'package:finixmulti_user/Models/UserModle.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
import 'guestLogin.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static String routePath = "/registrationscreen";

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                    height: 100,
                  ),
                  Text(
                    'Create account to \n get started',
                    style: GoogleFonts.firaSansExtraCondensed(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(
                    height: 25,
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
                          controller: registrationController.email_Controller,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              size: 25,
                            ),
                            filled: false,
                            hintText: "Enter Email",
                            labelText: "Email",
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
                        TextField(
                          controller: registrationController.password_Controller,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _passwordVisible,
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                            labelText: "Password",
                            isDense: true,
                            prefixIcon: Icon(
                              Icons.lock,
                              size: 25,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
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
                        DropDownList(
                          controller: registrationController.gender_Controller,
                          hintText: 'Gender',
                          items: gender_list,
                          obscureText: false,
                        ),

                        SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MyElevatedButton(
                            title: "Create",
                            height: 55,
                            width: double.infinity,
                            fontsize: 18,
                            radius: 10,
                            bg_color: MyAppColor.primary_color,
                            fontWeight: FontWeight.w600,
                            onPressed: createUserAccount

                            ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "OR",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Brand-Bold",
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, GuestLoginScreen.routePath);
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 50),
                            side: BorderSide(
                                color: MyAppColor.primary_color), // Border color

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.account_circle_outlined),
                              SizedBox(width: 10,),
                              Text(
                                "Continue as Guest",
                                style: TextStyle(
                                  color: MyAppColor.primary_color,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Brand-Bold",
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 15,
                        ),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Already have account ? ",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16)),
                              TextSpan(
                                text: "Login now",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pop(context);
                                  },
                              )
                            ])),
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
    if(registrationController.isValid()!="true"){
      String input_error=registrationController.isValid();
      showToast(input_error, ContentType.failure,context);

    }else{
      UserModel usermodle=registrationController.getUserData();
      showProgressBar(context,'CREATING');
      String auth_response=await  Provider.of<FirebaseAuthHandler>(context,listen: false).signUpWithEmailAndPassword(usermodle);

      if(auth_response=='created'){
        String? token = await FirebaseMessaging.instance.getToken();
        usermodle.msgToken=token!;
        print(token);
        await Provider.of<ServiceProvider>(context,listen: false).saveUserDetails(usermodle);
        Navigator.pop(context);
        showToast("Account Successfully Created ...!", ContentType.success,context);

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
