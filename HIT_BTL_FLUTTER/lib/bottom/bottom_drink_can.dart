import 'package:flutter/material.dart';

class BottomDrinkCan extends StatelessWidget {
  const BottomDrinkCan({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                  color: const Color.fromARGB(255, 248, 222, 222),
                  child: GridView.builder(
                      itemCount:10 ,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5.0,
                              mainAxisSpacing: 5.0,
                              childAspectRatio: 0.9),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.fromLTRB(15, 20, 15, 10),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 154, 152, 152)
                                          .withOpacity(0.4),
                                      spreadRadius: 1,
                                      blurRadius: 2)
                                ]),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(6),
                                      topRight: Radius.circular(6)),
                                  child: SizedBox.fromSize(
                                    child: Image.asset(
                                      'assets/ThucUong/Mirinda_Soda_Can.jpg',
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 8, 6, 5),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Expanded(
                                            flex: 6,
                                            child: Text(
                                              "Mirinda Soda Kem",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(),
                                          )
                                        ],
                                      ),
                                      const Divider(),
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Container(
                                                padding: EdgeInsets.all(8),
                                                child: const Text(
                                                  "0đ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18),
                                                ),
                                              )),
                                          Expanded(
                                              flex: 2,
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  style: ButtonStyle(
                                                    minimumSize:
                                                        MaterialStateProperty
                                                            .all<Size>(
                                                                Size(50, 45)),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                Colors.green),
                                                    overlayColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                Color.fromARGB(
                                                                    255,
                                                                    4,
                                                                    203,
                                                                    199)),
                                                    foregroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                Color.fromARGB(
                                                                    255,
                                                                    246,
                                                                    205,
                                                                    205)),
                                                  ),
                                                  child: const Text(
                                                    "Thêm",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                  ))),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }));
            },
          );
        },
        icon: Icon(
          Icons.add,
          color: Colors.green,
          size: 30,
        ),
      ),
    );
  }
}
