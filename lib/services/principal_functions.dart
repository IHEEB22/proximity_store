import 'package:proximitystore/constant/AppDimension.dart';

class PrincipalFunctions {
  double calculateDimensionPercentage(
      {double? widgetHeight, double? widgetWidth}) {
    double dimentionPercentage = 0.0;
    if (widgetHeight != null)
      dimentionPercentage = widgetHeight / AppDimensions.screenHeight;
    else if (widgetWidth != null)
      dimentionPercentage = widgetWidth / AppDimensions.screenwidht;
    return dimentionPercentage;
  }
}
