import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:finixmulti_user/FirebaseServices/providers/services_provider.dart';
import 'package:finixmulti_user/textController/address_input_controller.dart';
import 'package:finixmulti_user/utils/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../Models/address.dart';
import '../../utils/app_colors.dart';
class AddressBottomSheet extends StatefulWidget {
  const AddressBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddressBottomSheet> createState() => _AddressBottomSheetState();
}

class _AddressBottomSheetState extends State<AddressBottomSheet> {
  AddressInputController addressInputController=AddressInputController();
  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceProvider>(builder: (_,serviceProvider,__){
      print(serviceProvider.bookingData.toJson());

      return Container(
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Container(
                        height: 3,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: MyAppColor.black_light,

                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: addressInputController.house_Controller,
                      decoration: InputDecoration(

                        hintText: "Flat,House no,Building ,Company",
                        isDense: true,
                        prefixIcon: Icon(Icons.home,size: 25,color: MyAppColor.primary_color,),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 15),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      controller: addressInputController.landmark_Controller,

                      decoration: InputDecoration(
                        hintText: "Landmark ",
                        prefixIcon: Icon(Icons.location_on,size: 25,color: MyAppColor.primary_color,),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 15),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: addressInputController.pincode_Controller,

                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "PinCode",
                              prefixIcon: Icon(Icons.pin_drop_outlined,size: 25,color: MyAppColor.primary_color,),

                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 15),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: TextField(
                            controller: addressInputController.city_Controller,

                            decoration: InputDecoration(
                              hintText: "City",
                              prefixIcon: Icon(Icons.location_city,size: 25,color: MyAppColor.primary_color,),
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 15),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      controller: addressInputController.state_Controller,

                      decoration: InputDecoration(
                        hintText: "State",
                        prefixIcon: Icon(Icons.stadium_outlined,size: 25,color: MyAppColor.primary_color,),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 15),
                        border: OutlineInputBorder(),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
                      child: ElevatedButton(
                        onPressed: () {
                          if(addressInputController.isValid()!='true'){
                            String error_text=addressInputController.isValid();
                            Fluttertoast.showToast(
                                msg: error_text,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 14.0
                            );
                          }else{
                            Address inputAddress=addressInputController.getData();
                            String addressStr='${inputAddress.neighbourhood},${inputAddress.stateDistrict},${inputAddress.state},${inputAddress.postcode}';
                            serviceProvider.setAddressData(inputAddress, addressStr);
                            print(serviceProvider.bookingData.toJson());
                            Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyAppColor.primary_color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Save Address",
                            style: TextStyle(
                              color: MyAppColor.white_light,
                              fontFamily: "Brand-Bold",
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
