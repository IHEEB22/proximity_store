import 'package:proximitystore/config/constant/constant_proprities/app_dimension.dart';

class PrincipalFunctions {
  double calculateDimensionPercentage({double? widgetHeight, double? widgetWidth}) {
    double dimentionPercentage = 0.0;
    if (widgetHeight != null)
      dimentionPercentage = widgetHeight / AppDimensions.screenHeight;
    else if (widgetWidth != null) dimentionPercentage = widgetWidth / AppDimensions.screenwidht;
    return dimentionPercentage;
  }
}
