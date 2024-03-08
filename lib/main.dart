import 'package:finixmulti_user/FirebaseServices/providers/firbase_auth_handler.dart';
import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:finixmulti_user/utils/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ServiceProvider()),
        ChangeNotifierProvider(create: (context) => FirebaseAuthHandler()),
      ],
      child: MaterialApp(
        title: 'Finix Electrical',
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
