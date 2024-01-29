import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:finixmulti_user/widgets/global/myappbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:google_fonts/google_fonts.dart';
class NotificationScreen extends StatefulWidget {
  static final routePath='/notificationScreen';
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 5,),
            MyAppBar(title: "Notifications"),
            Divider(color: MyAppColor.primary_color,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50,),
                Gif(
                  image: AssetImage("assets/images/empty_notification.gif"),
                  autostart: Autostart.once,
                  fit: BoxFit.contain,
                ),
                Text(
                  'No Notification Right Now !',
                  style: GoogleFonts.firaSansExtraCondensed(
                    color: MyAppColor.primary_color,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),


              ],
            )

          ],
        ),
      ),
    );
  }
}
