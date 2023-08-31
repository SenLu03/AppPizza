
import 'package:btl_flutter/UI/Widget/item_list.dart';
import 'package:flutter/material.dart';

import '../CallAPI/Network/network.dart';


class MyBoxScreen extends StatefulWidget {
  const MyBoxScreen({super.key});

  @override
  State<MyBoxScreen> createState() => _MyBoxScreenState();
}

class _MyBoxScreenState extends State<MyBoxScreen> {
  var getData= [];
  @override
  void initState() {
    super.initState();
    NetworkRequest.fetchBogo(9).then((dataFromServer) {
      setState(() {
        getData= dataFromServer;
      });
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: getData.length,
                itemBuilder: (context, index) {
                  return ItemList(getData[index]);
                }))
      ],
    );
  }
}
