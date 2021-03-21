import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gngappv1/state/cart_state.dart';
import 'package:gngappv1/state/product_state.dart';
import 'package:gngappv1/widgets/singleProduct.dart';

import 'package:provider/provider.dart';

import 'cart_screens.dart';

class ProductDetailsScreens extends StatelessWidget {
  static const routeName = '/product-details-screens';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final product = Provider.of<ProductState>(context).singleProduct(id);
    final cart = Provider.of<CartState>(context).cartModel;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Product Details"),
        actions: [
          FlatButton.icon(
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreens.routeName);
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            label: Text(
              cart != null ? "${cart.cartproducts.length}" : '',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Image.network(
              "https://gngbd.com${product.image}",
              fit: BoxFit.cover,
              height: 500,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    Text("Regular Price : \৳ ${product.marcketPrice}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red),),

                    Text("Sale Price : \৳ ${product.sellingPrice}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red),),
                  ],
                ),
                // ignore: deprecated_member_use
                RaisedButton.icon(

                  color: Colors.red,
                  onPressed: () {
                    Provider.of<CartState>(context, listen: false)
                        .addtoCart(id);
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Add To Card",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            // Text(product.description)
            SizedBox(height: 20),
            Text("Product Details", style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.9)),),
            Divider(),
            // Text(product.description, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)),
            Html(
              data: product.description,

            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Related Products", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            ),
            Divider(),

          ],
        ),
      ),
    );
  }
}
