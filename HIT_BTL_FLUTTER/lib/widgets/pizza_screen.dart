import 'package:flutter/material.dart';

import '../CallAPI/Network/product_combo.dart';
import '../Data/Product.dart';
import '../UI/Widget/item_grid_2.dart';

class PizzaScreen extends StatefulWidget {
  const PizzaScreen({super.key});

  @override
  State<PizzaScreen> createState() => _PizzaScreenState();
}

class _PizzaScreenState extends State<PizzaScreen> {

  var getData=<Product>[];

  String dropdownValue1 = 'Nhỏ';
  String dropdownValue2 = 'Đế Giòn Xốp(Nhỏ)';
  @override
   void initState(){
    super.initState();
    NetworkRequestProduct.fetchProduct(2).then((datafromServer) {
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
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.475),
        itemBuilder: (context, index) {
          return ItemGrid02(getData[index]);
        },
      ),
    );
  }
}