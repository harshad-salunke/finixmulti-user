import 'package:finixmulti_user/FirebaseServices/providers/firbase_auth_handler.dart';
import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:finixmulti_user/utils/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:provider/provider.dart';

import 'FirebaseServices/providers/services_provider.dart';
import 'allScreens/splash_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAQJD2qaRKQplkmTjbors64wQrNgVNEtig",
            authDomain: "finixmulti-electrical.firebaseapp.com",
            databaseURL: "https://finixmulti-electrical-default-rtdb.firebaseio.com",
            projectId: "finixmulti-electrical",
            storageBucket: "finixmulti-electrical.appspot.com",
            messagingSenderId: "829843198764",
            appId: "1:829843198764:web:2e4ef0f7024e2538f3d289",
            measurementId: "G-2EKH6Q79MR"
        ));
  }else{
    await Firebase.initializeApp();

  }
  runApp( Myapp());
}


class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkForUpdate();
  }

  Future<void> checkForUpdate() async {
    print('checking for Update');
    InAppUpdate.checkForUpdate().then((info) {
      setState(() {
        if (info.updateAvailability == UpdateAvailability.updateAvailable) {
          print('update available');
          update();
        }
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  void update() async {
    print('Updating');
    await InAppUpdate.startFlexibleUpdate();
    InAppUpdate.completeFlexibleUpdate().then((_) {}).catchError((e) {
      print(e.toString());
    });
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ServiceProvider()),
        ChangeNotifierProvider(create: (context) => FirebaseAuthHandler()),
      ],
      child: MaterialApp(
        title: 'Finixmulti Electrical Pvt Ltd',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: MyAppColor.primary_color),
            useMaterial3: true,
            scaffoldBackgroundColor: Color(0xfff7f7f7)
        ),
        initialRoute: SplashScreen.routePath,
        routes: getAppRoutes(),
      ),
    );
  }
}


