import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/config/colors/app_colors.dart';
import 'package:proximitystore/widgets/custom_blue_button.dart';

import '../config/images/app_images.dart';
import '../providers/business_provider.dart';

class ProductAddedSheet extends StatelessWidget {
  ProductAddedSheet({
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
            0.07.sh.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.052.sw),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 0.032.sw),
                    child: Text(
                      context.read<BusinessProvider>().productDescription.text,
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                            fontFamily: 'Montserrat',
                            fontSize: 15.sp,
                            letterSpacing: 0.1,
                            height: 1.5,
                          ),
                    ),
                  ),
                  0.065.sh.verticalSpace,
                  Padding(
                    padding: EdgeInsets.only(right: 0.045.sw),
                    child: Text(
                      'isBeingValidatedByOurTeams'.tr(),
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontFamily: 'Montserrat',
                            fontSize: 16.sp,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            0.123.sh.verticalSpace,
          ],
        ),
      ),
    );
  }
}
