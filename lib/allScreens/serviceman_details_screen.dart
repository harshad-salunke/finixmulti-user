import 'package:finixmulti_user/widgets/global/my_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/app_colors.dart';
import '../widgets/bookingDetails_page/star_card_widget.dart';
import '../widgets/global/myappbar.dart';
import '../widgets/services_onboarding/location_add_button.dart';
class ServicemanDetailsScreen extends StatefulWidget {
  static final String routPaht="/servicemanDetailsScreen";
  const ServicemanDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ServicemanDetailsScreen> createState() => _ServicemanDetailsScreenState();
}

class _ServicemanDetailsScreenState extends State<ServicemanDetailsScreen> {
  int currentStar=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
        
          children: [
            SizedBox(
              height: 50,
            ),
            MyAppBar(title: "Service Man Details"),
            SizedBox(
              height: 10,
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Image(
                  image: AssetImage(
                      "assets/images/newlogo.png"
                  ),
                  fit: BoxFit.cover,
                  height: 200,
                  width: 200,
                ),
              ),
            ),
        
            Container(
        
              padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
              width: 320,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: MyAppColor.primary_light,
                        blurRadius: 10.0,
                        spreadRadius: 0.5,
                        offset: Offset(0.7,0.7)
                    )]
        
              ),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
        
                children: [
                  Text(
                    'TRUSTED EXPART',
                    style: GoogleFonts.firaSansExtraCondensed(
                      color: MyAppColor.golden_color,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Harshad Salunke',
                        style: GoogleFonts.firaSansExtraCondensed(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          Icon(Icons.star,
                            color:Colors.orangeAccent ,),
                          Text("4.5",
                            style: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w700
                            ),),
                        ],
                      ),
                      SizedBox(width: 20,)
                    ],
                  ),
        
                  SizedBox(height: 5,),
        
        
        
        
                ],
              ),
            ),
        
            SizedBox(height: 15,),
        
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
                      Icons.qr_code_scanner,
                      color: Colors.green,
                      size: 30,
                    ) ,
                  ),
                ),
        
              ],
            ),
            SizedBox(height: 5,),
            Divider(color: MyAppColor.white_light,),
        
            Column(
              children: [
                Text(
                  "Give your Feedback",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: MyAppColor.primary_color,
                      fontFamily: 'Brand-Bold'),
                ),
                SizedBox(height: 5,),
        
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(int i=0;i<4;i++)
                         StarCardWidget(
                          isClicked: i<=currentStar,
                           index: i,
                           callback: (index){
                            setState(() {
                              currentStar=index;
                            });
                           },
                      )
        
                  ],
                ),
        
                Container(
                  margin: EdgeInsets.fromLTRB(20,10,20,10),
                  
                  child: TextField(
                    maxLines: 5, // or any specific number of lines you want

                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5
                      ),
                      hintText: "Write your feedback",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xff9e0093)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                )
        
              ],
            ),

        Container(
          margin: EdgeInsets.fromLTRB(20, 8, 20, 10),
          child: MyElevatedButton(
              title: "Submit",
              height:50 ,
              width: double.infinity,
              fontsize: 18,
              radius: 10, bg_color: MyAppColor.primary_color,
              fontWeight: FontWeight.w200, onPressed: (){}),
        )

        
        
        
          ],
        ),
      ),
    );
  }
  void _launchPhoneCall() async {
    const phoneNumber = 'tel:+919172692702'; // Replace with the desired phone number
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      // Handle error, for example, show an error dialog
      print('Could not launch $phoneNumber');
    }
  }
  void openWhatsApp() async {
    String phoneNumber = '9172692702';

    String message = 'Hello , I am Harshad Salunke user of Finixmulti app' ;

    String whatsappUrl = 'https://wa.me/$phoneNumber/?text=${Uri.encodeFull(message)}';

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      print('Could not launch $whatsappUrl');
    }
  }
}
