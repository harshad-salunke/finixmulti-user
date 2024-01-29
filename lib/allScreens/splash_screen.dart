import 'dart:async';
import 'dart:ui';

import 'package:finixmulti_user/allScreens/login_screens/login_screen.dart';
import 'package:finixmulti_user/allScreens/mainSubscreen/home_screen.dart';
import 'package:finixmulti_user/allScreens/main_screen.dart';
import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gif/gif.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../FirebaseServices/providers/services_provider.dart';

class SplashScreen extends StatefulWidget {
  static final String routePath = '/splashscreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  @override
  void initState() {
    if(firebaseAuth.currentUser?.uid!=null){
      Provider.of<ServiceProvider>(context,listen: false).fetchProducts();
      Provider.of<ServiceProvider>(context,listen: false).fetchUserDetails();
      Provider.of<ServiceProvider>(context,listen: false).fetchBookings();
      Provider.of<ServiceProvider>(context,listen: false).fetchServices();

    }else{
      print('user not login');
    }
    super.initState();
    Timer(Duration(seconds: 5), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: SystemUiOverlay.values);
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: MyAppColor.status_bar_color,
      ));

      if(firebaseAuth.currentUser?.uid!=null){
        Navigator.pushReplacementNamed(context, MainScreen.routePath);
      }else{
        Navigator.pushReplacementNamed(context, LoginScreen.routePath);
      }

    });
  }

  @override
  void dispose( ) {
    // TODO: implement dispose
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Set the status bar color to transparent
    ));
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image(
              image: AssetImage('assets/images/newlogo.png'),
              height: 430,
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
              top: 55,
              left: 10,
              child: Image(
                image: AssetImage('assets/images/company_logo.png'),
                height: 70,
                width: 200,
              )),

          Positioned(
              top: 120,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'TRUSTED EXPERTS',
                    style: GoogleFonts.firaSansExtraCondensed(
                      color: MyAppColor.golden_color,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Innovation In Electrical \nServices For You',
                    style: GoogleFonts.firaSansExtraCondensed(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ' We make sure excellent services thought \n  our expert workers.',
                    style: GoogleFonts.ubuntu(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),

          //floating buttons

          Positioned(
            top: 340,
            left: 25,
            child: PhysicalModel(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30),
              clipBehavior: Clip.antiAlias,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  width: 160, // Adjust the width as needed
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  decoration: BoxDecoration(
                    color: Colors.white
                        .withOpacity(0.7), // Adjust opacity as needed
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.storefront,
                        size: 28,
                        color: Colors.deepPurpleAccent,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '25+',
                              style: GoogleFonts.openSansCondensed(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 22,
                              ),
                            ),
                            TextSpan(
                              text: '\nService Category',
                              style: GoogleFonts.ubuntu(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
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

          Positioned(
            top: 500,
            right: 10,
            child: PhysicalModel(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30),
              clipBehavior: Clip.antiAlias,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  width: 155, // Adjust the width as needed
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  decoration: BoxDecoration(
                    color: Colors.white
                        .withOpacity(0.7), // Adjust opacity as needed
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 28,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '3999+',
                              style: GoogleFonts.openSansCondensed(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 22,
                              ),
                            ),
                            TextSpan(
                              text: '\nUser Review',
                              style: GoogleFonts.ubuntu(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
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

          Positioned(
            bottom: 150,
            left: 10,
            child: PhysicalModel(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30),
              clipBehavior: Clip.antiAlias,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  width: 155, // Adjust the width as needed
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  decoration: BoxDecoration(
                    color: Colors.white
                        .withOpacity(0.7), // Adjust opacity as needed
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: 28,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '50+',
                              style: GoogleFonts.openSansCondensed(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 22,
                              ),
                            ),
                            TextSpan(
                              text: '\nExpert Worker',
                              style: GoogleFonts.ubuntu(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
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


          Positioned(
            bottom: 65,
            right: 0,
            left: 0,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Gif(
                  image:
                  AssetImage("assets/images/loading.gif"),
                  autostart: Autostart.loop,
                  height: 70,
                ),
                Text(
                  'LOADING . .',
                  style: GoogleFonts.ubuntu(
                    color:MyAppColor.golden_color,
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                  ),
                ),


              ],
            ) ,
          ),

        ],
      ),
    );
  }
}
