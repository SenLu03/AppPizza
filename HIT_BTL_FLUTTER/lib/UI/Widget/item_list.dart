import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../AppRouter/AppRouter.dart';
import '../../Data/Combo.dart';

class ItemList extends StatelessWidget {
  var bogoItem;

  ItemList(this.bogoItem);

  @override
  Widget build(BuildContext context) {
    Combo combo=Combo(bogoItem);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 159, 159, 159)
                    .withOpacity(0.8),
                spreadRadius: 1,
                blurRadius: 4)
          ]),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6)),
            child: SizedBox.fromSize(
                child: Image.network('${bogoItem.image}')),
          ),
          Container(
            padding: const EdgeInsets.only(
                left: 12, right: 12, bottom: 8, top: 8),
            child: Column(children: [
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      "${bogoItem.name}",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed:(){},
                        style: ElevatedButton.styleFrom(
                          primary:
                          Color.fromARGB(255, 249, 190, 12),
                        ),
                        child: const Text(
                          "NEW",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ))
                ],
              ),
              const Divider(
                color: Colors.black,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          const Text(
                            "Từ: ",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black),
                          ),
                          Text(
                            "${bogoItem.price} VND",
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(AppRouter.detalScreen,arguments: {
                              'bogoItem':combo});
                          },
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(
                                  255, 41, 128, 42),
                              minimumSize: Size(45, 40)),
                          child: const Text(
                            "Chọn",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white),
                          ))),
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
