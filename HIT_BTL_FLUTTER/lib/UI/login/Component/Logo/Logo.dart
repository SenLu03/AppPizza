import 'package:flutter/material.dart';

import '../../../../res/AppImage.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 217,
      height: 57,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImage.icLogo),
        ),
      ),
    );
  }
}
