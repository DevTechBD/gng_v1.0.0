import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gngappv1/state/cart_state.dart';

import 'package:provider/provider.dart';

import 'home_Screens.dart';
import 'order_screens.dart';

class CartScreens extends StatelessWidget {
  static const routeName = '/cart-screens';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartState>(context).cartModel;
    if (cart == null)
      return Scaffold(
        backgroundColor: Color(0xFFffffff),
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,

        ),
        body: Center(
          child: Image.network("https://www.kiswahclothing.com/Content/img/empty_cart.png"),
        ),
      );
    else
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text("Cart Screens"),
          actions: [
            FlatButton.icon(
              onPressed: null,
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              label: Text(
                "${cart.cartproducts.length}",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [

              Expanded(
                child: ListView.builder(
                  itemCount: cart.cartproducts.length,
                  itemBuilder: (ctx, i) {
                    var item = cart.cartproducts[i];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Image.network("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg", height: 50, width: 60),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.product[0].title, style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold)),
                                Text("Price :৳\ ${item.price}", style: TextStyle(fontWeight: FontWeight.bold)),
                                Text("quantity : ${item.quantity}", style: TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            // ignore: deprecated_member_use
                            RaisedButton(
                              color: Colors.black,
                              onPressed: () {
                                Provider.of<CartState>(context, listen: false)
                                    .deletecartproduct(item.id);
                              },
                              child: Icon(Icons.delete, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Total: ৳\ ${cart.total}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.7))),
                  // Text("Date: ${cart.date}"),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    color: Color(0xFFc3232a),
                    onPressed: cart.cartproducts.length <= 0
                        ? null
                        : () {
                      Navigator.of(context).pushNamed(OrderNew.routeName);
                    },
                    child: Text("Checkout", style: TextStyle(color: Colors.white)),
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    color: Colors.red,
                    onPressed: cart.cartproducts.length <= 0
                        ? null
                        : () async {
                      bool isdelete = await Provider.of<CartState>(
                          context,
                          listen: false)
                          .deletecart(cart.id);
                      if (isdelete) {
                        Navigator.of(context)
                            .pushReplacementNamed(HomeScreens.routeName);
                      }
                    },
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }
}
