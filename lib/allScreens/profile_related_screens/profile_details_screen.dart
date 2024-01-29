
import 'package:finixmulti_user/FirebaseServices/providers/services_provider.dart';
import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:finixmulti_user/widgets/global/myappbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../textController/RegistrationController.dart';
import '../../widgets/global/drop_downlist.dart';
import '../../widgets/profile_page/profile_data_widget.dart';
class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 7,),

            MyAppBar(title:'Personal data',),
            Divider(
              color: MyAppColor.primary_color,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                children: [
                  headingWidget(),

                  ProfileDataWidget(
                    isReadOnly: true,
                  ),
                ],
              ),
            ),

          ],
        ),
      ),

    );
  }
  Widget headingWidget() {
    return Consumer<ServiceProvider>(builder:(_,serviceProvider,__){
      return Row(
        children: [

          CircleAvatar(
            backgroundImage: AssetImage(serviceProvider.userData.gender=='Male'?"assets/images/college_boy.png":"assets/images/college_girl.png"),
            radius: 30,
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2,),
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

              SizedBox(height: 5,),

            ],
          ),


        ],
      );
    });
  }



}
