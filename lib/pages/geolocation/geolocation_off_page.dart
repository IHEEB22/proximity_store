import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:proximitystore/config/colors/app_colors.dart';
import 'package:proximitystore/config/routes/routes.dart';

import 'package:proximitystore/widgets/background_image.dart';
import 'package:proximitystore/widgets/custom_blue_button.dart';
import 'package:proximitystore/widgets/custom_white_button.dart';

class GeoLocationOffPage extends StatelessWidget {
  const GeoLocationOffPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            BackgroundImage(),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Wrap(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          0.085.sw,
                          0.1048.sh,
                          0.226.sw,
                          0.087.sh,
                        ),
                        child: Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                text: 'proximity'.tr(),
                                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                      color: AppColors.blueColor,
                                      fontSize: 24.sp,
                                      height: 1.2,
                                    ),
                              ),
                              TextSpan(
                                text: 'store'.tr() + ' ',
                                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                      color: AppColors.pinkColor,
                                      fontSize: 24.sp,
                                      height: 1.2,
                                    ),
                              ),
                              TextSpan(
                                text: 'hasNoAccressToYourLocation'.tr(),
                                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                      color: AppColors.darkBlueColor,
                                      fontSize: 24.sp,
                                      height: 1.2,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 0.085.sw,
                          right: 0.15.sw,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'proximityStoreNeedsToAccessYourLocation'.tr(),
                              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400,
                                    height: 1.2,
                                    fontSize: 16.sp,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      0.314.sh.verticalSpace,
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 0.066.sw,
                          ),
                          child: CustomBlueButton(
                            onPressed: () async {
                              PermissionStatus locationStatus = await Permission.location.request();
                              print(locationStatus);

                              if (locationStatus.isGranted) {
                                Navigator.pushNamed(context, AppRoutes.searchProductPage);
                              } else if (locationStatus.isDenied) {
                                return;
                              } else if (locationStatus.isPermanentlyDenied) {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    title: Text(
                                      'allowAppToAccessYourLocation'.tr(),
                                      style: Theme.of(context).textTheme.subtitle2,
                                    ),
                                    content: Text(
                                      'youNeedToAllowLocationAccessFromAppSettings'.tr(),
                                      style: Theme.of(context).textTheme.headline4,
                                    ),
                                    actions: <Widget>[
                                      // if user deny again, we do nothing
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('cancel'.tr()),
                                      ),

                                      // if user is agree, you can redirect him to the app parameters :)
                                      TextButton(
                                        onPressed: () {
                                          openAppSettings();
                                          Navigator.pop(context);
                                        },
                                        child: Text('openAppSettings'.tr()),
                                      ),
                                    ],
                                  ),
                                );
                                return;
                              }
                            },
                            textInput: 'allowAccessToMyPosition'.tr(),
                          ),
                        ),
                      ),
                      0.039.sh.verticalSpace,
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 0.066.sw,
                          ),
                          child: CustomWhiteButton(
                            onPressed: () => Navigator.pushNamed(context, AppRoutes.addLocalisationAddressPage),
                            textInput: 'addAddress'.tr(),
                          ),
                        ),
                      ),
                      0.152.sh.horizontalSpace,
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
