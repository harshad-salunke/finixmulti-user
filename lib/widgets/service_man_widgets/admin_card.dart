import 'package:finixmulti_user/FirebaseServices/providers/services_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Models/employee.dart';
import '../../utils/app_colors.dart';
import '../services_onboarding/location_add_button.dart';
class AdminCard extends StatelessWidget {

  const AdminCard({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Consumer<ServiceProvider>(builder: (_,serviceProvider,__){
      Employee employee=serviceProvider.employeeData;
      return Column(
        children: [
          RichText(
              textAlign: TextAlign.center,

              text: TextSpan(
                  children: [
                    TextSpan(text:"Note : " ,
                      style:GoogleFonts.ubuntu(
                        color: Colors.red,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,

                      ),),
                    TextSpan(text:" Serviceman " ,
                      style:GoogleFonts.ubuntu(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),),

                    TextSpan(text:"detials share with you within the" ,style:GoogleFonts.ubuntu(
                      color: MyAppColor.black_light,
                      fontSize: 13,
                    ),),
                    TextSpan(text:" 5 min." ,style:GoogleFonts.ubuntu(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,

                      fontSize: 13,
                    ),)
                  ]
              )),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 20,
              ),
              CircleAvatar(
                backgroundImage: AssetImage(employee.profile),
                radius: 25,
              ),

              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text("${employee.name}",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      )),
                  Text(
                    "Call for any query",
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Expanded(child: Container()),
              SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  CircularIconButton(
                      index: 0,
                      icon: Icons.call,
                      bgcolor: Colors.green,
                      iconColor: Colors.white,
                      height: 40,
                      width: 40,
                      iconsize: 25,
                      hastext: false,
                      callback: (index) {
                        _launchPhoneCall(employee.phone_number);
                      }),
                  SizedBox(
                    width: 10,
                  ),
                  CircularIconButton(
                      index: 0,
                      icon: Icons.message,
                      bgcolor: MyAppColor.yellow,
                      iconColor: Colors.white,
                      height: 40,
                      width: 40,
                      iconsize: 25,
                      hastext: false,
                      callback: (index) {
                        openWhatsApp(employee.phone_number);
                      }),
                ],
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),

          Divider(
            color: MyAppColor.white_light,
          ),
        ],
      );
    });
  }
  void _launchPhoneCall(String phonestr) async {
    String phoneNumber = 'tel:+91${phonestr}'; // Replace with the desired phone number
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      // Handle error, for example, show an error dialog
      print('Could not launch $phoneNumber');
    }
  }
  void openWhatsApp(String phoneNumber) async {

    String message = 'Hello , I am user of Finixmulti app' ;

    String whatsappUrl = 'https://wa.me/$phoneNumber/?text=${Uri.encodeFull(message)}';

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      print('Could not launch $whatsappUrl');
    }
  }
}
