import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gngappv1/state/cart_state.dart';
import 'package:gngappv1/state/product_state.dart';
import 'package:gngappv1/widgets/add_drower.dart';
import 'package:gngappv1/widgets/singleProduct.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'package:provider/provider.dart';

import 'all_products_screen.dart';
import 'campaign_screen.dart';
import 'cart_screens.dart';
import 'category_screen.dart';

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


  PersistentTabController _controller = PersistentTabController(initialIndex: 0);
  // _controller = PersistentTabController(initialIndex: 0);




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
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: (value) {

          },
          items: [
            BottomNavigationBarItem(
                title: Text("Account"),
                icon: RaisedButton(
                    color: Colors.white,
                    elevation: 0.0,
                  onPressed: (){},
                  child: Icon(Icons.account_box_outlined)
                ),
            ),
            BottomNavigationBarItem(
              title: Text("Account"),
              icon: RaisedButton(
                  color: Colors.white,
                  elevation: 0.0,
                  onPressed: (){},
                  child: Icon(Icons.account_box_outlined)
              ),
            ),
            BottomNavigationBarItem(
              title: Text("Account"),
              icon: RaisedButton(
                color: Colors.white,
                  elevation: 0.0,
                  onPressed: (){},
                  child: Icon(Icons.account_box_outlined)
              ),
            ),
            BottomNavigationBarItem(
              title: Text("Account"),
              icon: RaisedButton(
                  color: Colors.white,
                elevation: 0.0,
                  onPressed: (){},
                  child: Icon(Icons.account_box_outlined)
              ),
            ),
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
                          color: Colors.red.withOpacity(0.5),
                          
                          child: 
                            RaisedButton(
                              onPressed: (){
                                Navigator.push(context,
                                MaterialPageRoute(builder: (context) => CategoryScreen())
                                );
                              },
                              child: Image.asset("images/categories.png")
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
                            child: RaisedButton(
                              onPressed: (){
                                Navigator.push(context,
                                MaterialPageRoute(builder: (context) => CampaignScreen())
                                );
                              },
                              child: Image.asset("images/review.png", height: 60, width: 100),
                              autofocus: true,
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
                            child: RaisedButton(
                              onPressed: (){},
                              child: Image.asset("images/brands.png")
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
                            child: RaisedButton(
                              onPressed: (){},
                              child: Image.asset("images/campaigns.png")
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
        // Product Grid View //
        Container(
          padding: padding,
          height: 1300,
          child: GridView.count(
            // childAspectRatio: 2400/2400,
              physics: ScrollPhysics(),
              crossAxisCount: 2,
              children: List.generate(product.length, (i){
                return SingleProduct(
                  id: product[i].id,
                  title: product[i].title,
                  image: product[i].image,
                  marcketPrice: product[i].marcketPrice,
                  favorit: product[i].favorit,
                );
              }),
          ),
        ),

          ],
        ),
      );




  }
  List<Widget> _buildScreens() {
      return [
        HomeScreens(),
        CartScreens(),
        CampaignScreen(),
      ];
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.settings),
        title: ("Settings"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.settings),
        title: ("Settings"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

}
