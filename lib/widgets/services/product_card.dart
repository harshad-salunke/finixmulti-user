import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';
class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 10),
      margin: EdgeInsets.fromLTRB(15, 5, 15, 5),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(

                    child: Image(
                      image: AssetImage(
                          "assets/images/newlogo.png"
                      ),
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Fan Service",
                        style: GoogleFonts.openSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),

                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
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
                          ),
                          SizedBox(width: 15,),
                          Text(
                            "10 % off",
                            style:GoogleFonts.openSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.green,

                            ),

                          ),

                        ],
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [

                          Text(
                            "₹ 200.0",
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                                color: MyAppColor.black_light

                            ),
                          ),
                          SizedBox(width: 8,),
                          Text(
                            "₹ 299.0",
                            style:GoogleFonts.openSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: MyAppColor.black_light,
                              decoration: TextDecoration.lineThrough,

                            ),

                          ),



                        ],
                      ),

                    ],
                  ),
                ],
              ),
              Center(
                child: Icon(Icons.arrow_forward_ios),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),

                  Icon(Icons.circle,color: Colors.green,
                    size: 15,),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Finixmulti electrical assured",
                    style: GoogleFonts.ubuntu(
                        color: MyAppColor.black_light
                    ),)
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 5),
                child: Row(
                  children: [
                    Icon(Icons.verified_outlined,
                      color:Colors.green ,),
                    Text("Varified",
                      style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.green
                      ),),
                  ],
                ),
              ),


            ],
          )
        ],
      ),
    );
  }
}
