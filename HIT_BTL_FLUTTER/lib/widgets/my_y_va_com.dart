import 'package:btl_flutter/CallAPI/Network/product_combo.dart';
import 'package:btl_flutter/UI/Widget/item_grid.dart';
import 'package:flutter/material.dart';


import '../Data/Product.dart';


class MyYvaCom extends StatefulWidget {
  const MyYvaCom({super.key});

  @override
  State<MyYvaCom> createState() => _MyYvaComState();
}

class _MyYvaComState extends State<MyYvaCom> {
  var getData = <Product>[];

  @override
  void initState() {
    super.initState();
    NetworkRequestProduct.fetchProduct(3).then((datafromServer) {
      setState(() {
        getData = datafromServer;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: getData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            childAspectRatio: 0.7),
        itemBuilder: (context, index) {
          return ItemGrid(getData[index]);
        },
      ),
    );
  }
}
