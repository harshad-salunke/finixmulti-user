import 'dart:ui';

import 'package:finixmulti_user/FirebaseServices/providers/services_provider.dart';
import 'package:finixmulti_user/allScreens/servicesPageSubscreen/product_details_screen.dart';
import 'package:finixmulti_user/allScreens/servicesPageSubscreen/service_details_screen.dart';
import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Models/product.dart';
import '../widgets/home_page/populer_product_card.dart';
import '../widgets/services/product_card.dart';

class SearchScreen extends StatefulWidget {
  static final String routePath = '/searchScreen';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product> productList=[];
  List<Product> serviceList=[];

  bool isSearching=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<ServiceProvider>(builder:(_,serviceProvider,__){

          return Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Icon(
                            Icons.arrow_back,
                            size: 30,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: TextField(
                            onChanged: (text){
                              isSearching=true;
                              productList.clear();
                              serviceList.clear();
                              serviceProvider.product_list.forEach((product) {
                                String name=product.name.toLowerCase();
                                if(name.contains(text.toLowerCase())){
                                  productList.add(product);
                                }
                              });

                              serviceProvider.service_list.forEach((product) {
                                String name=product.name.toLowerCase();

                                if(name.contains(text.toLowerCase())){
                                  serviceList.add(product);
                                }
                              });

                              if(text==''){
                                productList.clear();
                                serviceList.clear();
                              }
                              setState(() {
                              });

                            },

                            decoration: InputDecoration(
                              border: InputBorder.none, // Removes the underline

                              hintText: "Search proudct and service here..",
                            ),
                            autofocus: true,
                            style: TextStyle(
                                fontFamily: 'Brand-Regular', fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: MyAppColor.black_light,
                  ),
                  SizedBox(height: 8,),

                  serviceList.length>0? Container(
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 15,),
                            Text(
                              "Result for Services",
                              style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Expanded(child: Container()),
                            Icon(Icons.navigate_next_rounded),
                            SizedBox(width: 10,),

                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            height: 220,
                            margin: EdgeInsets.only(left: 10),
                            child:
                            serviceProvider.isServiceDataLoading? Center(
                              child: CircularProgressIndicator(),
                            ):
                            ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemCount: serviceList.length,
                              itemBuilder: (BuildContext con, int index) {
                                return InkWell(
                                  onTap: (){
                                    serviceProvider.setSelectedProduct(serviceList[index]);
                                    Navigator.pushNamed(context, ServiceDetailsScreen.routePath);
                                  },
                                  child: PopulerProductCard(
                                    product: serviceList[index],
                                    isPopularProduct: false,
                                    right: 10,
                                  ),
                                );
                              },
                            )
                        ),


                      ],
                    ),
                  ):Container(),
                  SizedBox(height: 8,),
                  productList.length>0? Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 15,),
                              Text(
                                "Result for Products",
                                style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Expanded(child: Container()),
                              Icon(Icons.arrow_drop_down_sharp),
                              SizedBox(width: 10,),

                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Expanded(
                              child:
                              serviceProvider.isProductDataLoading? Center(
                                child: CircularProgressIndicator(),
                              ):
                              ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: productList.length,
                                itemBuilder: (BuildContext con, int index) {
                                  return InkWell(
                                    onTap: (){
                                      serviceProvider.setSelectedProduct(productList[index]);
                                      Navigator.pushNamed(context, ProductDetailsScreen.routePath);
                                    },
                                    child: ProductCard(
                                      product: productList[index],
                                    ),
                                  );
                                },
                              )
                          ),
                    
                    
                        ],
                      ),
                    ),
                  ):Container(),



                ]
            ),
          );
        }),
      ),
    );
  }
}
