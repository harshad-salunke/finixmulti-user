import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:finixmulti_user/FirebaseServices/providers/services_provider.dart';
import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:finixmulti_user/widgets/global/my_elevated_button.dart';
import 'package:finixmulti_user/widgets/global/myappbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Models/UserModle.dart';
import '../../textController/RegistrationController.dart';
import '../../utils/global_widgets.dart';
import '../../widgets/global/drop_downlist.dart';
import '../../widgets/profile_page/profile_data_widget.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  void initState() {
    super.initState();
  }

  RegistrationController registrationController = RegistrationController();
  bool isReadOnly = false;
  double height = 20;
  double width = 13;
  var gender_list = ["Male", "Female", "Other"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<ServiceProvider>(builder: (_, serviceProvider, __) {
          registrationController.setData(serviceProvider.userData);
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 7,),
                MyAppBar(
                  title: 'Edit profile',
                ),
                Divider(
                  color: MyAppColor.primary_color,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Column(
                    children: [
                      headingWidget(serviceProvider),
                      editDataWidget(serviceProvider)
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget headingWidget(ServiceProvider serviceProvider) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(serviceProvider.userData.gender=='Male'?"assets/images/college_boy.png":"assets/images/college_girl.png"),
          radius: 30,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 2,
            ),
            Text("${serviceProvider.userData.name}",
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                )),
            Text("${serviceProvider.userData.email}",
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                )),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ],
    );
  }

  Widget editDataWidget(ServiceProvider serviceProvider) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          TextField(
            controller: registrationController.full_nameController,
            keyboardType: TextInputType.text,
            readOnly: isReadOnly,
            decoration: InputDecoration(
              fillColor: Colors.white,
              prefixIcon: Icon(
                Icons.person,
                size: 25,
              ),
              filled: false,
              labelText: "Full Name",
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: height,
                horizontal: width,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyAppColor.primary_color),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyAppColor.primary_color),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: MyAppColor.primary_color),
              ),
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
            keyboardType: TextInputType.text,
            readOnly: true,
            decoration: InputDecoration(
              fillColor: Colors.white,
              prefixIcon: Icon(
                Icons.email_outlined,
                size: 25,
              ),
              filled: false,
              labelText: "Email",
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: height,
                horizontal: width,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyAppColor.primary_color),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyAppColor.primary_color),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: MyAppColor.primary_color),
              ),
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
            readOnly: isReadOnly,
            maxLength: 10,

            decoration: InputDecoration(
              fillColor: Colors.white,
              prefixIcon: Icon(
                Icons.call,
                size: 25,
              ),
              filled: false,
              labelText: "Mobile",
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: height,
                horizontal: width,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyAppColor.primary_color),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyAppColor.primary_color),
              ),
              prefixText: '+91',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: MyAppColor.primary_color),
              ),
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
            height: 20,
          ),
          MyElevatedButton(
              title: "Save",
              height: 55,
              width: double.infinity,
              fontsize: 16,
              radius: 10,
              bg_color: MyAppColor.primary_color,
              fontWeight: FontWeight.bold,
              onPressed: () async {

                if(registrationController.isValid()!="true"){
                  String input_error=registrationController.isValid();
                  showToast(input_error, ContentType.failure,context);
                }else{
                  showProgressBar(context,'please wait..');
                  UserModel usermodle=registrationController.getUpdatedData(serviceProvider.userData);
                  await serviceProvider.updateUserDetails(usermodle);
                  Navigator.pop(context);
                  showToast("Profile Updated Successfully ...!", ContentType.success,context);
                  print(usermodle.toJson());
                }

              }),
        ],
      ),
    );
  }
}
