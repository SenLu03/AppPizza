
import 'package:btl_flutter/UI/Widget/item_list.dart';
import 'package:flutter/material.dart';

import '../CallAPI/Network/network.dart';


class NewCombo extends StatefulWidget {
  const NewCombo({super.key});

  @override
  State<NewCombo> createState() => _NewComboState();
}

class _NewComboState extends State<NewCombo> {
    var getData =[];
  @override
  void initState() {
    super.initState();
    NetworkRequest.fetchBogo(10).then((dataFromServer) {
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
