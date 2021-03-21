import 'package:flutter/material.dart';
import 'package:gngappv1/state/product_state.dart';
import 'package:gngappv1/widgets/singleProduct.dart';
import 'package:provider/provider.dart';

class AllProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductState>(context).poducts;
    return Scaffold(
      appBar: AppBar(),
      body:GridView.builder(
        physics: ClampingScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    // childAspectRatio: 1/1,
    crossAxisCount: 2,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    ),
    itemCount: 7,
    itemBuilder: (ctx, i) => SingleProduct(
    id: product[i].id,
    title: product[i].title,
    marcketPrice: product[i].marcketPrice,
    image: product[i].image,
    favorit: product[i].favorit,
    ),
    ),
    );
  }
}
