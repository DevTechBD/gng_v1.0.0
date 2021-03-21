import 'package:flutter/material.dart';
import 'package:gngappv1/state/cart_state.dart';
import 'package:gngappv1/widgets/add_drower.dart';

import 'package:provider/provider.dart';

class OrderScreens extends StatelessWidget {
  static const routeName = '/order-screens';
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CartState>(context).oldorder;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Old Orders"),
      ),
      drawer: AppDrower(),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (ctx, i) {
            return Card(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [

                    Text("Email: " + data[i].email, style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("Phone Number: " + data[i].phone),
                    Text("Address: " + data[i].address),
                    Text("Total : ${data[i].cart.total}"),

                    // RaisedButton(onPressed: (){},
                    // color: Colors.amber,
                    //   child: Text("Go Back To Home")
                    // ),
                  ],
                ),

              ),
            );
          },
        ),

      ),

    );
  }
}
