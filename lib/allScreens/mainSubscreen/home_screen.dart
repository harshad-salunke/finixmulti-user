
import 'package:finixmulti_user/widgets/home_page/sliding_banner_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../widgets/home_page/heading_widget.dart';
import '../../widgets/home_page/service_hero_section.dart';
import '../../widgets/home_page/product_section.dart';
import '../../widgets/home_page/service_section.dart';

class HomeScreen extends StatefulWidget {
  Function isBooknowBtnClick;
  Function isProfileBtnClick;

  HomeScreen({required this.isBooknowBtnClick,required this.isProfileBtnClick}) ;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return  SingleChildScrollView(
        child: Column(
          children: [
            HeadingWidget(
                isProfileBtnClick:widget.isProfileBtnClick

            ),
           SlidingBanner(),
            ProductSection(
                isBooknowBtnClick:widget.isBooknowBtnClick

            ),
            ServiceHeroSection(
                isBooknowBtnClick:widget.isBooknowBtnClick
            ),
            ServiceSection(
                isBooknowBtnClick:widget.isBooknowBtnClick

            ),
            SizedBox(height: 30,)
          ],
        ),
      );
  }
}
