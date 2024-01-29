import 'package:cached_network_image/cached_network_image.dart';
import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Models/product.dart';
import '../../utils/global_widgets.dart';


class PopulerProductCard extends StatelessWidget {
  bool isPopularProduct;
   PopulerProductCard({
    required this.isPopularProduct,
    required this.product,
      this.left=0,
     this.top=0,
     this.right=0,
     this.bottom=0
  }) ;
   double left;
   double top;
   double right;
   double bottom;


  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin:EdgeInsets.fromLTRB(left, top, right, bottom),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.02,
            child:   Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: CachedNetworkImage(
                  imageUrl: product.imgUri[0],
                  placeholder: (context, url) => Image.asset(
                    "assets/images/newlogo.png", // Replace with your loading image
                    fit: BoxFit.cover,
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    "assets/images/newlogo.png", // Replace with your loading image
                    fit: BoxFit.cover,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            )
              ,
          ),
          const SizedBox(height: 8),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              getText('${product.name}'),
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
            ),
          ),
          Row(
            children: [
              SizedBox(width: 10,),
              Text(
                isPopularProduct?  "₹ ${product.disPrice}":'${calculateDiscountPercentage(product.price, product.disPrice)} % off',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color:Color(0xFFFF7643),
                ),
              ),
              Expanded(child: Container()),
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(6),
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyAppColor.white_light
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/Heart Icon_2.svg",
                    colorFilter: ColorFilter.mode(
                         const Color(0xFFFF4848),
                        BlendMode.srcIn),
                  ),
                ),
              ),
              SizedBox(width: 5,),

            ],
          )
        ],
      ),
    );
  }
  String getText(String text){
    if(text.length>19){
      return '${text.substring(0,19)}...';
    }
    return text;
  }

}
