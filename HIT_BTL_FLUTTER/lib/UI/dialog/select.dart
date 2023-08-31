import 'package:btl_flutter/controller/detal_controller.dart';
import 'package:flutter/material.dart';

import '../../CallAPI/Network/pizza_network.dart';
import '../../Data/Product.dart';
import 'package:get/get.dart';

class Select extends StatefulWidget {
  static String displayText = '';
  static int id = 0, cataloryId = 0;
  @override
  _SelectState createState() => _SelectState();
}

class _SelectState extends State<Select> {
  var getData = <Product>[];
  List<String> itemList = [
    'Đế Giòn Xốp',
    'Đế Kéo Tay Truyền Thống',
    'Đế Mỏng Giòn'
  ];
  String selectedValue = '';
  String selectedProductName = ''; // Initialize selectedProductName
  bool showGridView = false;

  @override
  void initState() {
    super.initState();
    NetworkRequestSubMenu.fetchSub(Select.id + 1, (Select.cataloryId - 5))
        .then((dataFromServer) {
      setState(() {
        getData = dataFromServer;
      });
    });
    print('getData: $getData');
  }

  @override
  Widget build(BuildContext context) {
    Select.displayText = selectedProductName.isNotEmpty
        ? '$selectedProductName +$selectedValue'
        : selectedValue;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
            child: Column(
              children: [
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: Select.displayText),
                  onTap: () {
                    _openGridView();
                  },
                  decoration: const InputDecoration(
                    labelText: 'Chọn 1 bánh Pizza',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.add,
                      size: 30,
                      color: Color.fromARGB(255, 50, 132, 53),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openGridView() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: const Color.fromARGB(255, 248, 222, 222),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
              childAspectRatio: 0.75,
            ),
            itemCount: getData.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 154, 152, 152)
                            .withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                        ),
                        child: SizedBox.fromSize(
                          child: Image.network("${getData[index].image}"),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(6, 8, 5, 8),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    getData[index].name,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              color: Colors.black,
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      child: const Text(
                                        "0đ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text(
                                                'Chọn đế bánh pizza',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              content: Container(
                                                width: 400,
                                                height: 180,
                                                color: Color.fromARGB(
                                                    255, 31, 134, 43),
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: itemList.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    bool isHovered = false;
                                                    return InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedValue =
                                                              itemList[index];
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                      onHover: (value) {
                                                        setState(() {
                                                          isHovered = value;
                                                        });
                                                      },
                                                      child: Container(
                                                        color: isHovered ||
                                                                selectedValue ==
                                                                    itemList[
                                                                        index]
                                                            ? const Color
                                                                    .fromARGB(
                                                                255,
                                                                201,
                                                                138,
                                                                138)
                                                            : null,
                                                        child: ListTile(
                                                          title: Text(
                                                            itemList[index],
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      style: ButtonStyle(
                                        minimumSize:
                                            MaterialStateProperty.all<Size>(
                                                const Size(50, 45)),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                const Color.fromARGB(
                                                    255, 7, 150, 12)),
                                        overlayColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.teal),
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                const Color.fromARGB(
                                                    255, 246, 205, 205)),
                                      ),
                                      child: const Text(
                                        "Thêm",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
