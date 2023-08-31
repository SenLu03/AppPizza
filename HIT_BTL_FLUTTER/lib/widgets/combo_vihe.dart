import 'package:btl_flutter/UI/Widget/item_list.dart';
import 'package:flutter/material.dart';

import '../CallAPI/Model/bogo.dart';
import '../CallAPI/Network/network.dart';

class ViHe extends StatefulWidget {
  const ViHe({super.key});

  @override
  State<ViHe> createState() => _ViHeState();
}

class _ViHeState extends State<ViHe> {
  var getData =[];
  BOGO? selectedBOGO;

  @override
  void initState() {
    super.initState();
    NetworkRequest.fetchBogo(6).then((dataFromServer) {
      setState(() {
        getData = dataFromServer;
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
