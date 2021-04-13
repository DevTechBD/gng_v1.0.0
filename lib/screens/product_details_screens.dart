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
    final prd = Provider.of<ProductState>(context).poducts;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        // title: Text("Product Details"),
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
                color: Colors.red,
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: RaisedButton.icon(

                    color: Color(0xFFc3232a),
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
            Container(
              width: 100,
              height: 190,
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
              ),
                scrollDirection: Axis.horizontal,
                itemCount: prd.length,
                itemBuilder: (ctx, i) => SingleProduct(
                  id: prd[i].id,
                  title: prd[i].title,
                  image: prd[i].image,
                  marcketPrice: prd[i].marcketPrice,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}