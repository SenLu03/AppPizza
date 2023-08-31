
import 'package:btl_flutter/controller/detal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Choose_Appetizer extends GetView<DetalController>{

  Widget build(BuildContext context) {
    controller.context=context;
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
                  controller: controller.textAppertizer,
                  onTap: () {
                    _openGridView();
                  },
                  decoration: const InputDecoration(
                    labelText: 'Chọn món khai vị',
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
     context: controller.context,
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
           itemCount: controller.getDataAppetizer.length,
           itemBuilder: (context, index) {
             return InkWell(
               onTap: (){
                controller.textAppertizer.text=controller.getDataAppetizer.value[index].name;
               },
               child: Container(
                 margin: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                 child: Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(6),
                     color: Colors.white,
                     boxShadow: [
                       BoxShadow(
                         color: const Color.fromARGB(255, 154, 152, 152).withOpacity(0.4),
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
                           child: Image.network("${controller.getDataAppetizer.value[index].image}"),
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
                                     controller.getDataAppetizer.value[index].name,
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

                                 ],
                               ),
                             ),
                           ],
                         ),
                       ),
                       Expanded(
                         flex: 2,
                         child: ElevatedButton(
                           onPressed: () {
                             controller.textAppertizer.text =
                                 controller.getDataAppetizer[index].name;
                             controller.bogoItem.appertizerId= controller.getDataAppetizer[index].id;
                             Navigator.pop(
                                 context); // Close the bottom sheet
                           },
                           style: ButtonStyle(
                             minimumSize: MaterialStateProperty.all<Size>(
                                 Size(50, 45)),
                             backgroundColor:
                             MaterialStateProperty.all<Color>(
                                 Color.fromARGB(255, 7, 150, 12)),
                             overlayColor:
                             MaterialStateProperty.all<Color>(
                                 Colors.teal),
                             foregroundColor:
                             MaterialStateProperty.all<Color>(
                                 Color.fromARGB(255, 246, 205, 205)),
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
                       )
                     ],
                   ),
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
