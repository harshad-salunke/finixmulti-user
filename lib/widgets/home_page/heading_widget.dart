
import 'package:finixmulti_user/FirebaseServices/providers/services_provider.dart';
import 'package:finixmulti_user/Models/UserModle.dart';
import 'package:finixmulti_user/allScreens/profile_related_screens/notification_screen.dart';
import 'package:finixmulti_user/allScreens/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class HeadingWidget extends StatefulWidget {
  Function isProfileBtnClick;

   HeadingWidget({required this.isProfileBtnClick}) ;

  @override
  State<HeadingWidget> createState() => _HeadingWeidgetState();
}

class _HeadingWeidgetState extends State<HeadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceProvider>(builder: (context, serviceProvider, _) {
      UserModel userModel = serviceProvider.userData;
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap:(){
                      widget.isProfileBtnClick();
                    },
                    child: CircleAvatar(

                      backgroundImage: AssetImage(userModel.gender=='Male'?"assets/images/college_boy.png":"assets/images/college_girl.png"),
                      radius: 25,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(getName('${userModel.name}'),
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 17,
                            )),
                        Text("${getTimeOfDay()}",
                            style: GoogleFonts.openSans(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w500
                            ))
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, NotificationScreen.routePath);
                      },
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onTap: (){
                        Navigator.pushNamed(context, SearchScreen.routePath);
                      },
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: "Search Here.....",
                        prefixIcon: Icon(Icons.search_rounded),

                        contentPadding: EdgeInsets.symmetric(
                          vertical: 17,
                          horizontal: 10,
                        ),
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xff9e0093),
                    ),
                    margin: EdgeInsets.only(left: 10),
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.format_line_spacing_sharp,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
  String getTimeOfDay() {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('HH:mm').format(now); // format the time as HH:mm
    int hour = int.parse(formattedTime.split(":")[0]); // extract the hour from the formatted time
    if (hour >= 5 && hour < 12) {
      return "Good Morning"; // between 5am and 12pm
    } else if (hour >= 12 && hour < 17) {
      return "Good Afternoon"; // between 12pm and 5pm
    } else {
      return "Good Evening"; // after 5pm
    }
  }

  String getName(String name) {
   List<String> fullname= name.split(' ');
   if(name.length>15){
     return fullname[0];
   }
   return name;

  }

}
