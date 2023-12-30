import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
class AddressBottomSheet extends StatefulWidget {
  const AddressBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddressBottomSheet> createState() => _AddressBottomSheetState();
}

class _AddressBottomSheetState extends State<AddressBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  decoration: InputDecoration(
                    hintText: "Flat,House no,Building ,Company",
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 15),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Landmark (Optional)",
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
                        decoration: InputDecoration(
                          hintText: "PinCode",
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
                        decoration: InputDecoration(
                          hintText: "City",
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
                  decoration: InputDecoration(
                    hintText: "State",
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
                      Navigator.pop(context);
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
    );
  }
}
