

import 'package:flutter/material.dart';

import 'home_Screens.dart';


class SuccessOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Image.network("https://cdn3.iconfinder.com/data/icons/flat-actions-icons-9/792/Tick_Mark_Dark-512.png", height: 200)
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Center(child: Text("ORDER SUCCESSFULLY PLACED",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 0.7,
              fontSize: 18,
            ),
            )),
          ),
          SizedBox(height: 60),
          Container(
            height: 40,
            decoration: BoxDecoration(
              // color: Colors.white,

            ),
            child: Text(
              "Thanks For Ordering From GNGBD",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),

          // ignore: deprecated_member_use
          RaisedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder:
                (context) => HomeScreens(),
            ));
          },
          color: Colors.greenAccent,
            child: Text("CONTINUE SHOPPING"),
          ),
        ],
      )

    );
  }
}
