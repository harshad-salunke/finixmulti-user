import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadingWidget extends StatefulWidget {
  const HeadingWidget({Key? key}) : super(key: key);

  @override
  State<HeadingWidget> createState() => _HeadingWeidgetState();
}

class _HeadingWeidgetState extends State<HeadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
      ),
      child: Column(
        children: [

          SizedBox(height: 30,),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/harshad.png"),
                  radius: 25,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Mr Unknown",
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 17,
                          )),
                      Text("Good Morning",
                          style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontSize: 10,
                          ))
                    ],
                  ),
                ),
                Expanded(child: Container()),
                IconButton(
                    onPressed: () {},
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
                  child: SizedBox(
                    height: 60,
                    child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xff9e0093))),
                          hintText: "Search here...",
                          prefixIcon: Icon(Icons.search_rounded)),
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
  }
}
