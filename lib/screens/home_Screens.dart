import 'package:carousel_pro/carousel_pro.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gngappv1/state/cart_state.dart';
import 'package:gngappv1/state/product_state.dart';
import 'package:gngappv1/widgets/add_drower.dart';
import 'package:gngappv1/widgets/singleProduct.dart';

import 'package:provider/provider.dart';

import 'all_products_screen.dart';
import 'cart_screens.dart';

class HomeScreens extends StatefulWidget {
  static const routeName = '/home-screens';

  @override
  _HomeScreensState createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  bool _init = true;
  bool _isLoding = false;

  @override
  void didChangeDependencies() async {
    if (_init) {
      Provider.of<CartState>(context).getCartDatas();
      Provider.of<CartState>(context).getoldOrders();
      _isLoding = await Provider.of<ProductState>(context).getProducts();
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductState>(context).poducts;
    final radius = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    );
    final padding = EdgeInsets.all(10);
    if (!_isLoding)
      return Scaffold(

        body: Center(
          // child: Text("Loading...."),
          child: SpinKitRotatingCircle(
            color: Colors.red,
            size: 50.0,
          ),
        ),
      );
    else
      return Scaffold(
        backgroundColor: Color(0xFFf8f8f8),
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color(0xFFf8f8f8),
          title: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFFe8e8e8),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Search for GNG....",
                  // hintStyle: TextStyle(fontSize: 13,),
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.search),
                ),

            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreens.routeName);
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.redAccent,
          items: <Widget>[
            Icon(Icons.account_box_outlined, size: 30),
            Icon(Icons.bookmark_border_outlined, size: 30),
            Icon(Icons.design_services, size: 30),
            Icon(Icons.shopping_cart, size: 30),
            Icon(Icons.home_outlined, size: 30),
          ],
        ),
        drawer: AppDrower(),

        body: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: 0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                    height: 110.0,
                    // width: 300.0,
                    child: Carousel(
                      images: [
                        NetworkImage('https://gngbd.com/images/images/5-min.jpg'),
                        NetworkImage('https://gngbd.com/images/images/6-min.jpg'),
                        NetworkImage('https://gngbd.com/images/images/2-min.jpg'),
                        NetworkImage('https://gngbd.com/static/images/26%20march.jpg'),
                        NetworkImage('https://gngbd.com/static/images/NOKIA.jpg'),
                      ],
                      dotSize: 4,
                      dotBgColor: Colors.white.withOpacity(0.0),
                      dotColor: Colors.red,
                      borderRadius: true,
                    )
                ),
              ),


            ),
            Container(height: 10, color: Color(0xFFffffff)),
            SizedBox(height: 5),
            Container(
              height: 100,
              width: double.infinity,
              child: GridView.count(
                // scrollDirection: Axis.horizontal,
                physics: ScrollPhysics(),
                crossAxisCount: 4,
                children: [
                  Padding(
                  padding: padding,
                    child: Card(
                      elevation: 5.0,
                      shape: radius,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          color: Colors.red.withOpacity(0.2),
                          
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.rate_review_outlined),

                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: padding,
                    child: Card(
                      elevation: 5.0,
                        shape: radius,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            color: Colors.blue.withOpacity(0.2),
                            child: IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.campaign),

                            ),
                          ),
                        ),
                    ),
                  ),
                  Padding(
                    padding: padding,
                    child: Card(
                      elevation: 5.0,
                        shape: radius,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            color: Colors.amber.withOpacity(0.2),
                            child: IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.category),

                            ),
                          ),
                        ),
                    ),
                  ),
                  Padding(
                    padding: padding,
                    child: Card(
                      elevation: 5.0,
                        shape: radius,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            color: Colors.greenAccent.withOpacity(0.2),
                            child: IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.branding_watermark_outlined),

                            ),
                          ),
                        ),
                    ),
                  ),
                ],
              ),
              ),
            Container(height: 10, color: Colors.white),
            Padding(
              padding: padding,
              child: Text('All Products', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))
            ),
            Padding(
              padding: padding,
            ),


          ],
        ),
      );


  }

}
