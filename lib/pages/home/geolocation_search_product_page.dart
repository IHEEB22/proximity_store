import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proximitystore/config/colors/app_colors.dart';
import 'package:proximitystore/config/images/app_images.dart';
import 'package:proximitystore/widgets/autocomplete_search_label.dart';
import 'package:proximitystore/widgets/background_image.dart';

import '../../config/routes/routes.dart';

class GeolocationSearchProductPage extends StatelessWidget {
  const GeolocationSearchProductPage({Key? key}) : super(key: key);

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
                      children: <Widget>[
                        Image(
                          width: 0.064.sw,
                          height: 0.032.sh,
                          image: AssetImage(
                            AppImages.pinIcon,
                          ),
                        ),
                        0.02.sw.horizontalSpace,
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
                            text: 'proximity'.tr(),
                            style: Theme.of(context).textTheme.headline3?.copyWith(
                                  color: AppColors.blueColor,
                                  fontSize: 40.sp,
                                  letterSpacing: 0.6,
                                ),
                          ),
                          TextSpan(
                            text: 'store'.tr(),
                            style: Theme.of(context).textTheme.headline3?.copyWith(
                                  color: AppColors.pinkColor,
                                  fontSize: 40.sp,
                                  letterSpacing: 0.6,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  0.065.sh.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.085.sw),
                    child: AutocompleteSearchLabel(),
                  ),
                  0.6.sh.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.welcomePage);
                        },
                        child: Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                text: 'storeSpace'.tr(),
                                style: Theme.of(context).textTheme.headline4?.copyWith(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.sp,
                                      height: 1.5,
                                    ),
                              ),
                              WidgetSpan(
                                child: 0.02.sw.horizontalSpace,
                              ),
                              WidgetSpan(
                                  child: Image(
                                height: 0.025.sh,
                                width: 0.015.sh,
                                image: AssetImage(AppImages.vector),
                              )),
                            ],
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
