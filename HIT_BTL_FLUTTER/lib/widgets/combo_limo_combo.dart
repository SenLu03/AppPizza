
import 'package:btl_flutter/UI/Widget/item_list.dart';
import 'package:flutter/material.dart';

import '../CallAPI/Network/network.dart';


class ComboAndLiMoScreen extends StatefulWidget {
  const ComboAndLiMoScreen({super.key});

  @override
  State<ComboAndLiMoScreen> createState() => _ComboAndLiMoScreenState();
}

class _ComboAndLiMoScreenState extends State<ComboAndLiMoScreen> {
    var getData = [];
  @override
  void initState() {
    super.initState();
    NetworkRequest.fetchBogo(8).then((dataFromServer) {
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
