import 'package:flutter/material.dart';
import 'package:gngappv1/state/cart_state.dart';
import 'package:gngappv1/state/category_state.dart';

import 'package:gngappv1/widgets/category_card.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {


  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  bool _init = true;
  bool _isLoding = false;
  @override
  void didChangeDependencies() async {
    if (_init) {
      Provider.of<CartState>(context).getCartDatas();
      Provider.of<CartState>(context).getoldOrders();
      _isLoding = await Provider.of<CategoryState>(context).getCategories();
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {
    final ctr = Provider.of<CategoryState>(context).categories;
    final padding = EdgeInsets.all(10.0);
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         ListView(
           shrinkWrap: true,
           children: [
             Padding(
               padding: padding,
               child: Container(
                 height: 70,
                 color: Color(0xFFe8e8e8).withOpacity(0.8),
                 child: Align(
                   alignment: Alignment.centerLeft,
                   child: Text("TOP CATEGORIES",
                   style: TextStyle(
                     fontSize: 19,
                     fontWeight: FontWeight.bold,
                   ),
                   ),
                 ),
               ),
             ),

             // List Of Category //
             Padding(
               padding: padding,
               child: Container(
                 height: 550,
                 color: Color(0xFFe8e8e8).withOpacity(0.8),
                child:  GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                   itemCount: ctr.length,
                   itemBuilder: (ctx, i) {
                     return CategoryCard(
                       id: ctr[i].id,
                       title: ctr[i].title,
                       image: ctr[i].image,
                     );
                   },
                 ),
               ),
             ),
           ],
         ),
        ],
      ),
    );
  }
}
