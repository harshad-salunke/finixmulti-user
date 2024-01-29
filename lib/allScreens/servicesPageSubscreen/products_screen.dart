import 'package:finixmulti_user/allScreens/servicesPageSubscreen/product_details_screen.dart';
import 'package:finixmulti_user/widgets/services/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../FirebaseServices/providers/services_provider.dart';
import '../../Models/product.dart';
import '../../widgets/booking_page/BookingCard.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product> productList=[];
  bool isSearching=false;
  @override
  Widget build(BuildContext context) {
    return  Consumer<ServiceProvider>(builder: (_,serviceProvider,__){
     if(!isSearching){
       productList.clear();
       productList.addAll(serviceProvider.product_list);
     }
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 60,
              margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: TextField(
                onChanged: (text){
                  isSearching=true;
                  productList.clear();
                  serviceProvider.product_list.forEach((product) {
                    if(product.name.contains(text)){
                      productList.add(product);
                    }else if(text==''){
                      productList.addAll(serviceProvider.product_list);
                    }
                  });
                  setState(() {
                  });

                },
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
      );
    });
  }
}
