import 'package:flutter/material.dart';

import 'package:gngappv1/screens/product_details_screens.dart';
import 'package:gngappv1/state/product_state.dart';
import 'package:provider/provider.dart';

class SingleProduct extends StatelessWidget {
  final int id;
  final String title;
  final String image;
  final bool favorit;
  final int marcketPrice;

  const SingleProduct({
    Key key,
    this.id,
    this.title,
    this.image,
    this.favorit,
    this.marcketPrice,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(
            ProductDetailsScreens.routeName,
            arguments: id,
          );
        },
        child: Container(

          // color: Colors.white,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.2),
                spreadRadius: 10,
                blurRadius: 5.0,
              ),
            ],
            color: Colors.white,
          ),
        child: Column(
          children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Image.network( "https://gngbd.com$image", fit: BoxFit.cover, height: 90,)
          ),
            Row(
              children: [
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(title, style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                ),

                // Text("${marcketPrice}"),
              ],
            ),
            Row(
              children: [

                Padding(
                  padding: const EdgeInsets.only(top:2, left: 7),
                  child: Text("৳\ ${marcketPrice}", style: TextStyle(fontWeight: FontWeight.bold)),
                )

                // Text("${marcketPrice}"),
              ],
            ),
            // Text("asd")
          ],
        ),
        // child: Padding(
        //   padding: EdgeInsets.all(8.0),
        //   child: Image.network( "https://gngbd.com$image")
        // ),
        ),

      ),

    );

  }
}
