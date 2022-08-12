import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/config/colors/app_colors.dart';
import 'package:proximitystore/config/routes/routes.dart';
import 'package:proximitystore/widgets/custom_blue_button.dart';

import '../config/images/app_images.dart';
import '../providers/business_provider.dart';

class AddProductSheet extends StatelessWidget {
  String? currentRoute;
  AddProductSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BusinessProvider>(
      builder: (context, value, child) => Container(
        height: 0.498.sh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            0.02.sh.verticalSpace,
            Center(
              child: Image(
                image: AssetImage(
                  AppImages.lineSheet,
                ),
                width: 0.105.sw,
              ),
            ),
            0.0345.sh.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'congratulationMessage'.tr(),
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        fontFamily: 'Montserrat',
                        fontSize: 24.sp,
                        color: AppColors.darkBlueColor,
                        height: 1.2,
                      ),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 0.01.sh),
                    child: Image(height: 0.035.sh, width: 0.05.sw, image: AssetImage(AppImages.congratsIcon)))
              ],
            ),
            0.0567.sh.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.052.sw),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'welcomeToTheProximityStoreCommunityItsAGreatPleasuretocountyouamongourcommittedbusinesses'.tr(),
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontFamily: 'Montserrat',
                          fontSize: 16.sp,
                        ),
                  ),
                  0.025.sh.verticalSpace,
                  Padding(
                    padding: EdgeInsets.only(right: 0.08.sw),
                    child: Text(
                      'youCanNowAddYourProductCatalog'.tr(),
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontFamily: 'Montserrat',
                            fontSize: 16.sp,
                            height: 1.2,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            0.1169.sh.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.082.sw),
              child: SizedBox(
                  width: double.infinity,
                  child: CustomBlueButton(
                    textInput: 'addMyNewProduct'.tr(),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.addNewProductPage);
                    },
                  )),
            ),
            0.024.sh.verticalSpace,
          ],
        ),
      ),
    );
  }
}
