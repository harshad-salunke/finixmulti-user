import 'package:finixmulti_user/widgets/services/screens/products_screen.dart';
import 'package:finixmulti_user/widgets/services/screens/services_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/services/services_navbar.dart';
class AllServicesScreen extends StatefulWidget {
  const AllServicesScreen({Key? key}) : super(key: key);

  @override
  State<AllServicesScreen> createState() => _AllServicesScreenState();
}

class _AllServicesScreenState extends State<AllServicesScreen> {
  late  PageController pageController;
  int currentpage=0;
  @override
  void initState() {
    pageController=PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50,),
          Text("Services",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              fontFamily: "Brand-Bold"

            ),),
          ServicesNavBar(
            callback: (index){
              pageController.jumpToPage(index);
            },
            current: currentpage,
          ),

          Expanded(
            child: PageView(
              controller:pageController,
              onPageChanged: (index){
                setState(() {
                  currentpage=index;
                });
              },
              children: [
                ProductsScreen(),
                ServicesSreen()
              ],
            ),
          ),





        ],
      ),

    );
  }
}
