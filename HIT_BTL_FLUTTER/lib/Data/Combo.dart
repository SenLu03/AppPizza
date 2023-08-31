import 'package:btl_flutter/Data/Product.dart';

import '../CallAPI/Model/bogo.dart';

class Combo{
  BOGO product;
  int? pizzaId;
  String? appertizer,drink;
  int? appertizerId,drinkId;
  Combo(this.product);
}