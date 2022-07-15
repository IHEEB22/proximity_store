import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proximitystore/constant/constant_widgets/background_image.dart';
import 'package:proximitystore/constant/constant_widgets/custom_blue_button.dart';
import 'package:proximitystore/shared/widgets/autocomplete_suggestions.dart';

import '../constant/constant_proprities/prox_colors.dart';

class HomePageGeolocON extends StatelessWidget {
  const HomePageGeolocON({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundImage(),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  0.03.sh.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.258.sw),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          width: 0.064.sw,
                          height: 0.029.sh,
                          image: AssetImage(
                            'assets/icons/pin.png',
                          ),
                        ),
                        0.0233.sw.horizontalSpace,
                        Text(
                          "Location holder",
                          style: TextStyle(
                            color: ProxColors.darkblue,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            decoration: TextDecoration.underline,
                          ),
                        )
                      ],
                    ),
                  ),
                  0.14.sh.verticalSpace,
                  Center(
                    child: Text.rich(
                      TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'Proximity',
                            style: TextStyle(
                              color: ProxColors.blue,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 40.sp,
                            ),
                          ),
                          TextSpan(
                            text: 'Store',
                            style: TextStyle(
                              color: ProxColors.pink,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 40.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  0.03.sh.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.082.sw),
                    child: Text("autocompletesuggestion"),
                  ),
                  0.496.sh.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "ESPACE COMMERÇANT",
                          style: TextStyle(
                            color: ProxColors.deepblue,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
