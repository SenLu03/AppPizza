import 'package:btl_flutter/CallAPI/Model/bogo.dart';
import 'package:btl_flutter/UI/Widget/item_list.dart';
import 'package:flutter/material.dart';

import '../CallAPI/Network/network.dart';


class KidsBox extends StatefulWidget {
  const KidsBox({super.key});

  @override
  State<KidsBox> createState() => _KidsBoxState();
}

class _KidsBoxState extends State<KidsBox> {
  var getData = <BOGO>[];

  @override
  void initState() {
    super.initState();
    NetworkRequest.fetchBogo(7).then((dataFromServer) {
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
            },
          ),
        ),
      ],
    );
  }
}
