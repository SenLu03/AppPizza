
import 'package:btl_flutter/AppRouter/AppRouter.dart';
import 'package:flutter/material.dart';

import '../../../ForgotPassWord/Screen/Screen1.dart';
import 'package:get/get.dart';


class ForgotPassWord extends StatelessWidget {
  const ForgotPassWord({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: ()=>Get.toNamed(AppRouter.forgotPassWord),
        child: const Text(
          'Quên mật khẩu',
          style: TextStyle(
            fontSize: 15,
          ),
        ));
  }
}
