import 'package:btl_flutter/AppRouter/AppRouter.dart';
import 'package:btl_flutter/UI/register/Screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: (){
          Get.toNamed(AppRouter.register);
        },
        child: const Text(
          'Đăng ký',
          style: TextStyle(
            fontSize: 15,
          ),
        )
    );
  }
}
