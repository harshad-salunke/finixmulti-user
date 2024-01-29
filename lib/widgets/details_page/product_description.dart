import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Models/product.dart';





class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            product.name,
            style: TextStyle(
              fontFamily: 'brand-bold',
              fontSize: 23
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.all(16),
            width: 48,
            decoration: BoxDecoration(
    color:  const Color(0xFFFFE6E6),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SvgPicture.asset(
              "assets/icons/Heart Icon_2.svg",
              colorFilter: ColorFilter.mode(
                  // product.isFavourite
               const Color(0xFFFF4848),
                  BlendMode.srcIn),
              height: 16,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 64,
            bottom: 20
          ),
          child: Text(
            product.des,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}
