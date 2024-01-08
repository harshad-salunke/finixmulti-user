import 'package:finixmulti_user/allScreens/details_screen.dart';
import 'package:finixmulti_user/widgets/services/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../FirebaseServices/providers/services_provider.dart';
import '../../widgets/booking_page/BookingCard.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 60,
              margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xff9e0093)),
                  ),
                  hintText: "Search products...",
                  prefixIcon: Icon(Icons.search_rounded),
                ),
              ),
            ),
            Expanded(
              child: Consumer<ServiceProvider>(
                builder: (context,serviceProvider,_){
                  return serviceProvider.isProductDataLoaded? Center(
                    child: CircularProgressIndicator(),
                  ):
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: serviceProvider.product_list.length,
                    itemBuilder: (BuildContext con, int index) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(product: serviceProvider.product_list[index],)));
                        },
                        child: ProductCard(
                          product: serviceProvider.product_list[index],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
    );
  }
}
