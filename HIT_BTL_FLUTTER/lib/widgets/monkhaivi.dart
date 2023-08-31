import 'package:btl_flutter/CallAPI/Network/product_combo.dart';
import 'package:btl_flutter/UI/Widget/item_grid.dart';
import 'package:flutter/material.dart';

import '../Data/Product.dart';
class MonKhaiVi extends StatefulWidget {
  const MonKhaiVi({super.key});

  @override
  State<MonKhaiVi> createState() => _MonKhaiViState();
}

class _MonKhaiViState extends State<MonKhaiVi> {
  var getData=<Product>[];
  
  @override
  void initState(){
    super.initState();
    NetworkRequestProduct.fetchProduct(5).then((datafromServer) {
      setState(() {
        getData=datafromServer;
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
            childAspectRatio: 0.65),
        itemBuilder: (context, index) {
          return ItemGrid(getData[index]);
        },
      ),
    );
  }
}
