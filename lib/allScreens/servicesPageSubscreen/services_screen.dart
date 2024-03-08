import 'package:finixmulti_user/FirebaseServices/providers/services_provider.dart';
import 'package:finixmulti_user/allScreens/servicesPageSubscreen/service_details_screen.dart';
import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:finixmulti_user/widgets/home_page/populer_product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Models/product.dart';

class ServicesSreen extends StatefulWidget {
  const ServicesSreen({Key? key}) : super(key: key);

  @override
  State<ServicesSreen> createState() => _ServicesSreenState();
}

class _ServicesSreenState extends State<ServicesSreen> {
  bool isSearching=false;
  List<Product> serviceList=[];
  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceProvider>(builder: (_,serviceProvider,__){
      if(!isSearching){
        serviceList.clear();
        serviceList.addAll(serviceProvider.service_list);
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(25, 2, 0, 5),
            child: Text(
              "Category",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: MyAppColor.primary_color,
                  fontFamily: 'Brand-Bold'),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 2, 15, 2),
            padding: EdgeInsets.zero,
            child: TextField(
              onChanged: (text){
                isSearching=true;
                serviceList.clear();
                serviceProvider.service_list.forEach((product) {
                  String name=product.name.toLowerCase();
                  if(name.contains(text.toLowerCase())){
                    serviceList.add(product);
                  }else if(text==''){
                    serviceList.addAll(serviceProvider.service_list);
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
                contentPadding: EdgeInsets.symmetric(horizontal: 5),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xff9e0093)),
                ),
                hintText: "Search service name...",
                prefixIcon: Icon(Icons.search_rounded),
              ),
            ),
          ),
          serviceProvider.isServiceDataLoading?
          Expanded(child: Center(
            child: CircularProgressIndicator(),
          )):
          Expanded(
            child: Container(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.720),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                    horizontal: 13,

                  ),
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: serviceList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        serviceProvider.setSelectedProduct(serviceList[index]);
                        Navigator.pushNamed(context, ServiceDetailsScreen.routePath);
                      },
                      child: PopulerProductCard(
                        product: serviceList[index],
                        isPopularProduct: false,
                        right: 8,
                        bottom: 8,
                        top: 8,

                      ),
                    );
                  },
                )),
          )
        ],
      );
    });
  }

}
