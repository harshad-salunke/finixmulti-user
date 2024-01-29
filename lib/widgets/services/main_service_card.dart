import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../Models/product.dart';

class MainServiceCard extends StatelessWidget {
  Product service;
  MainServiceCard({
    required this.service
  });
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(

        children: [

          Card(

            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: CachedNetworkImage(
                imageUrl: service.imgUri[0],
                placeholder: (context, url) => Image.asset(
                  "assets/images/newlogo.png", // Replace with your loading image
                  fit: BoxFit.cover,
                  height: 130,
                  width: 120,
                ),
                errorWidget: (context, url, error) => Image.asset(
                  "assets/images/newlogo.png", // Replace with your loading image
                  fit: BoxFit.cover,
                  height: 130,
                  width: 120,
                ),
                fit: BoxFit.cover,
                height: 130,
                width: 120,
              ),
            ),
          ),


          Text("${getText(service.name)}",
            textAlign: TextAlign.center,
            maxLines: 5,
            style: TextStyle(
                fontSize: 13,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: "Brand-Regular"

            ),)
        ],
      ),
    );
  }

  String getText(String name) {
    if(name.length>25){
      return '${name.substring(0,25)} ...';
    }
    return name;

  }
}
