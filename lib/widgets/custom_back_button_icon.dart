import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/config/images/app_images.dart';

import '../providers/authentification_provider.dart';

class CustomBackButtonIcon extends StatelessWidget {
  const CustomBackButtonIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        context.read<AuthentificationProvider>().disposeControllers();

        Navigator.pop(context);
      }),
      child: Padding(
        padding: EdgeInsets.only(
          top: 0.028.sh,
          left: 0.025.sw,
        ),
        child: Image.asset(
          AppImages.backIcon,
          width: 0.064.sw,
          height: 0.029.sh,
        ),
      ),
    );
  }
}
