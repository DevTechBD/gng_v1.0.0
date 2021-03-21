import 'package:flutter/material.dart';
import 'package:gngappv1/state/product_state.dart';
import 'package:gngappv1/widgets/add_drower.dart';
import 'package:gngappv1/widgets/singleProduct.dart';

import 'package:provider/provider.dart';

class FalvoritScreens extends StatelessWidget {
  static const routeName = '/favorit-screens';
  @override
  Widget build(BuildContext context) {
    final favorit = Provider.of<ProductState>(context).favorits;
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorits"),
      ),
      drawer: AppDrower(),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3 / 2,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: favorit.length,
        itemBuilder: (ctx, i) => SingleProduct(
          id: favorit[i].id,
          title: favorit[i].title,
          image: favorit[i].image,
          favorit: favorit[i].favorit,
        ),
      ),
    );
  }
}
