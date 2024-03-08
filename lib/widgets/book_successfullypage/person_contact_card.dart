import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/app_colors.dart';
class PersonContactCard extends StatelessWidget {
  const PersonContactCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
          BoxShadow(
              color: MyAppColor.primary_light,
          blurRadius: 10.0,
          spreadRadius: 0.5,
          offset: Offset(0.7,0.7)
      )]

      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(20, 15, 20, 0),
      child:Column(
        children: [
          Row(
            children: [
              Card(
                child: Image(
                  image: AssetImage(
                      "assets/images/newlogo.png"
                  ),
                  fit: BoxFit.cover,
                  height: 70,
                  width: 70,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Help Center",
                    style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text("Call for any query",
                    style: GoogleFonts.ubuntu(
                      fontSize: 14,
                      color: MyAppColor.black_light,
                      fontWeight: FontWeight.w400,

                    ),
                  ),

                ],
              ),
            ],
          ),
          SizedBox(height: 5,),
          Divider(
            color: Colors.black12,
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              InkWell(
                onTap: (){
                  _launchPhoneCall();
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: MyAppColor.light_yellow,
                    borderRadius: BorderRadius.circular(18)
                  ),
                  child:Icon(
                      Icons.call,
                    color: MyAppColor.yellow,
                    size: 30,
                  ) ,
                ),
              ),
              InkWell(
                onTap: (){
openWhatsApp();
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: MyAppColor.light_purpl,
                      borderRadius: BorderRadius.circular(28)
                  ),
                  child:Icon(
                    Icons.message,
                    color: MyAppColor.purpl,
                    size: 30,
                  ) ,
                ),
              ),
              InkWell(
                onTap: (){

                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: MyAppColor.green_light,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child:Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 30,
                  ) ,
                ),
              ),

            ],
          ),
          SizedBox(height: 5,),


        ],
      ),
    );
  }
  void _launchPhoneCall() async {
    const phoneNumber = 'tel:+918007453007'; // Replace with the desired phone number
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      // Handle error, for example, show an error dialog
      print('Could not launch $phoneNumber');
    }
  }
  void openWhatsApp() async {
    String phoneNumber = '8007453007';

    String message = 'Hello , I am Harshad Salunke user of Finixmulti app' ;

    String whatsappUrl = 'https://wa.me/$phoneNumber/?text=${Uri.encodeFull(message)}';

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      print('Could not launch $whatsappUrl');
    }
  }

}
