
import 'package:finixmulti_user/allScreens/login_screens/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

import '../../utils/app_colors.dart';
import '../../widgets/global/my_elevated_button.dart';
import '../main_screen.dart';

class LoginScreen extends StatefulWidget {
  static String routePath = "/loginscreen";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String animationURL;
  Artboard? _teddyArtboard;
  SMITrigger? successTrigger, failTrigger;
  SMIBool? isHandsUp, isChecking;
  SMINumber? numLook;

  StateMachineController? stateMachineController;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationURL = defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.iOS
        ? 'assets/animations/login.riv'
        : 'animations/login.riv';
    rootBundle.load(animationURL).then(
      (data) {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        stateMachineController =
            StateMachineController.fromArtboard(artboard, "Login Machine");
        if (stateMachineController != null) {
          artboard.addController(stateMachineController!);

          stateMachineController!.inputs.forEach((e) {
            debugPrint(e.runtimeType.toString());
            debugPrint("name${e.name}End");
          });

          stateMachineController!.inputs.forEach((element) {
            if (element.name == "trigSuccess") {
              successTrigger = element as SMITrigger;
            } else if (element.name == "trigFail") {
              failTrigger = element as SMITrigger;
            } else if (element.name == "isHandsUp") {
              isHandsUp = element as SMIBool;
            } else if (element.name == "isChecking") {
              isChecking = element as SMIBool;
            } else if (element.name == "numLook") {
              numLook = element as SMINumber;
            }
          });
        }

        setState(() => _teddyArtboard = artboard);
      },
    );
  }

  void handsOnTheEyes() {
    isHandsUp?.change(true);
  }

  void lookOnTheTextField() {
    isHandsUp?.change(false);
    isChecking?.change(true);
    numLook?.change(0);
  }

  void moveEyeBalls(val) {
    print(val);
    numLook?.change(val.length.toDouble());
  }

  void login() {
    isChecking?.change(false);
    isHandsUp?.change(false);
    if (_emailController.text == "admin" &&
        _passwordController.text == "admin") {
      successTrigger?.fire();
    } else {
      failTrigger?.fire();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffd6e2ea),
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
                    height: 80,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 400,
                    height: 400,
                    padding: const EdgeInsets.only(bottom: 15),
                    margin: const EdgeInsets.only(bottom: 15 * 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (_teddyArtboard != null && false)
                          Container(
                            padding: EdgeInsets.only(top: 70),
                            child: SizedBox(
                              width: 300,
                              height: 150,
                              child: Rive(
                                artboard: _teddyArtboard!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        TextField(
                          controller: _emailController,
                          onTap: lookOnTheTextField,
                          onChanged: moveEyeBalls,
              
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.email_outlined,size: 25,),
                            filled: false,
                            hintText: "Email",
                            labelText: "Email",
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 22, horizontal: 15),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: MyAppColor.primary_color
                                )
                            ),
              
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: MyAppColor.primary_color
                              )
                            ),
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
                          controller: _passwordController,
                          onTap: handsOnTheEyes,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            labelText: "Password",
                            isDense: true,
                            prefixIcon: Icon(Icons.lock,size: 25,),
                            suffixIcon: Icon(Icons.remove_red_eye_outlined,size: 25,),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 22, horizontal: 15),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: MyAppColor.primary_color
                                )
                            ),
              
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: MyAppColor.primary_color
                                )
                            ),
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
              
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forget Password ?",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Brand-Bold",
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
              
                        SizedBox(
                          height: 10,
                        ),
                        MyElevatedButton(
                            title: "Login",
                            height: 55,
                            width: double.infinity,
                            fontsize: 18,
                            radius: 10,
                            bg_color: MyAppColor.primary_color,
                            fontWeight: FontWeight.w600,
                            onPressed: () {
                                Navigator.pushNamed(context, MainScreen.routePath);
                            }),
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
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 55),
                            side: BorderSide(
                                color: MyAppColor.primary_color), // Border color
                            // Customize other button appearance here
              
                            // backgroundColor: Color(0xffd6e2ea),
              
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/icons/google_logo.png'),
                                height: 30,
                                width: 30,
                              ),
                              SizedBox(width: 10,),
                              Text(
                                "Login with Google",
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
                                  text: "Don't have an Account ? ",
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                              TextSpan(
                                text: "Register Now",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, RegisterScreen.routePath);
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
}
