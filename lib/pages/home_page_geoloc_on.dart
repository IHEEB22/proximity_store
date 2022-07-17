import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proximitystore/constant/constant_widgets/background_image.dart';

import '../constant/constant_proprities/app_colors.dart';

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
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                decoration: TextDecoration.underline,
                                fontSize: 14.sp,
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
                            style: Theme.of(context).textTheme.headline3?.copyWith(
                                  color: AppColors.blueColor,
                                  fontSize: 40.sp,
                                ),
                          ),
                          TextSpan(
                            text: 'Store',
                            style: Theme.of(context).textTheme.headline3?.copyWith(
                                  color: AppColors.pinkColor,
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
                          style: Theme.of(context).textTheme.headline4?.copyWith(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                                fontSize: 14.sp,
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
