import 'package:carousel_slider/carousel_slider.dart';
import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:finixmulti_user/widgets/home_page/service_discount_banner.dart';
import 'package:finixmulti_user/widgets/home_page/sliding_banner_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../widgets/home_page/discount_card.dart';
import '../widgets/home_page/heading_widget.dart';
import '../widgets/home_page/service_hero_section.dart';
import '../widgets/home_page/service_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Column(
          children: [
            HeadingWidget(),
           SlidingBanner(),
            ServiceSection(),
            ServiceHeroSection(),
            ServiceSection(),


          ],
        ),
      );
  }
}
