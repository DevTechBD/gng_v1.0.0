import 'package:flutter/material.dart';



class CategoryCard extends StatelessWidget {

  final int id;
  final String title;
  final String image;

  CategoryCard({
    Key key,
    this.id,
    this.title,
    this.image
}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: (){},
        child: Container(
          // color: Colors.white,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                spreadRadius: 10,
                blurRadius: 5.0,
              ),
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Image.network( "https://gngbd.com$image", fit: BoxFit.cover, height: 50,)
              ),
              Row(
                children: [
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(title, style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                  ),

                  // Text("${marcketPrice}"),
                ],
              ),
            ],
          ),

        ),

      ),

    );
  }
}
