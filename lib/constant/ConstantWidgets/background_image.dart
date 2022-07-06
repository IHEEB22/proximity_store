import 'package:flutter/material.dart';
import 'package:proximitystore/constant/AppDimension.dart';
import 'package:proximitystore/services/principal_functions.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            // color: Colors.blue,
            image: DecorationImage(
                image: AssetImage("assets/images/Background.png"),
                fit: BoxFit.fill)),
        height: MediaQuery.of(context).size.height *
            PrincipalFunctions()
                .calculateDimensionPercentage(widgetHeight: 497),
        width: MediaQuery.of(context).size.width *
            PrincipalFunctions().calculateDimensionPercentage(widgetWidth: 375),
      ),
    );
  }
}
