
import 'package:carousel_slider/carousel_slider.dart';
import 'package:finixmulti_user/FirebaseServices/providers/services_provider.dart';
import 'package:finixmulti_user/widgets/home_page/service_discount_banner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'discount_card.dart';
class SlidingBanner extends StatefulWidget {
  Function isBooknowBtnClick;
  SlidingBanner({required this.isBooknowBtnClick}) ;

  @override
  State<SlidingBanner> createState() => _SlidingBannerState();
}

class _SlidingBannerState extends State<SlidingBanner> {
  int current_index=0;
  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceProvider>(builder: (_,serviceProvider,__){
      return serviceProvider.isOfferLoading?
      Container(
        margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[200]!,
          highlightColor: Colors.grey[300]!,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            height: 170,
            width: double.infinity,

          ),
        ),
      ):
      Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          children: [
            CarouselSlider(
                options: CarouselOptions(
                    viewportFraction: 1,
                    initialPage: 0,
                    height: 170,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    reverse: false,
                    autoPlayInterval: Duration(seconds: 4),
                    autoPlayAnimationDuration: Duration(milliseconds: 900),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.2,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index,reason){
                      setState(() {
                        current_index=index;
                      });
                    }

                ),
                items: [
                  DiscountCard(discountText: '${serviceProvider.offersModelData.productOffer}',),
                  ServiceDiscountBanner(
                    img: "invitation_banner.gif",
                    title: "Invite Friends",
                    discription: "Earn ${serviceProvider.offersModelData.inviteFriend} Coins",
                    banner_color: Color(0xfff57387),
                    btn_color: Color(0xFFF72A48),
                    btn_text: "Invite",
                    buttonClick: (){
                      print('invite click');
                    },
                  ),
                  ServiceDiscountBanner(
                    img: "newlogo.png",
                    title: "${serviceProvider.offersModelData.serviceOffer} % off ",
                    discription: "Get Supper Fast service   \n valid for today ",
                    banner_color: Color(0xffcfdeff),
                    btn_color: Color(0xff204095),
                    btn_text: "Book Now",
                    buttonClick: (){
                      widget.isBooknowBtnClick();

                    },

                  ),
                ]
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i=0;i<3;i++)
                  Container(
                    width: 15,
                    height: 5,
                    margin: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                        color: i==current_index?Color(0xff9e0093):Colors.purple.withOpacity(0.3),
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                  ),





              ],
            )

          ],
        ),
      );

    });
  }
}
