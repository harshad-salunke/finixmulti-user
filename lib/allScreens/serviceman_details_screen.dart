import 'package:cached_network_image/cached_network_image.dart';
import 'package:finixmulti_user/FirebaseServices/providers/services_provider.dart';
import 'package:finixmulti_user/Models/booking_modle.dart';
import 'package:finixmulti_user/Models/employee.dart';
import 'package:finixmulti_user/widgets/global/my_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
  late BookingModel bookingModel;
  late Employee assigneEmployee;
  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceProvider>(builder:(_,serviceProvider,__){
      bookingModel=serviceProvider.bookingData;
      assigneEmployee=serviceProvider.employeeData;
      return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                MyAppBar(title: "Service Man Details"),
                SizedBox(
                  height: 10,
                ),

             bookingModel.assignEmployeeUid==''?
             Card(
               
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(15.0),
                 
               ),
               child: Padding(
                 padding: EdgeInsets.all(10),
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(15.0),
                   child: Image.asset(
                     'assets/images/operator.png',
                     fit: BoxFit.fill,
                     height: 150,
                     width:180,
                   ),
                 ),
               ),
             ):
             Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: CachedNetworkImage(
                      imageUrl: assigneEmployee.profile,
                      placeholder: (context, url) => Image.asset(
                        "assets/images/newlogo.png", // Replace with your loading image
                        fit: BoxFit.fill,
                        height: 200,
                        width: 220,
                      ),
                      errorWidget: (context, url, error) =>  Image.asset(
                        "assets/images/newlogo.png", // Replace with your loading image
                        fit: BoxFit.cover,
                        height: 200,
                        width: 220,
                      ),
                      fit: BoxFit.cover,
                      height: 200,
                      width: 220,
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
                       bookingModel.assignEmployeeUid==''?'Help Center': 'TRUSTED EXPERT',
                        style: GoogleFonts.firaSansExtraCondensed(
                          color: MyAppColor.golden_color,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            bookingModel.assignEmployeeUid==''?'Finixmulti Electrical' :  '${assigneEmployee.name}',
                            style: GoogleFonts.firaSansExtraCondensed(
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(child: Container()),
                      bookingModel.assignEmployeeUid==''?Container():    Row(
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

              bookingModel.assignEmployeeUid==''?Container(
                child: RichText(
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

              ):  Column(
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

              ],
            ),
          ),
        ),
      );
    });
  }
  void _launchPhoneCall() async {
    String phoneNumber = 'tel:+91${assigneEmployee.phone_number}'; // Replace with the desired phone number
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      // Handle error, for example, show an error dialog
      print('Could not launch $phoneNumber');
    }
  }
  void openWhatsApp() async {
    String phoneNumber = assigneEmployee.phone_number;
    String message = 'Hello , I am user of Finixmulti Electrical app' ;

    String whatsappUrl = 'https://wa.me/$phoneNumber/?text=${Uri.encodeFull(message)}';

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      print('Could not launch $whatsappUrl');
    }
  }
}
