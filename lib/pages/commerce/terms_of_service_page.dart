import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/colors/app_colors.dart';
import '../../widgets/background_image.dart';
import '../../widgets/custom_back_button_icon.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundImage(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: CustomBackButtonIcon(),
                ),
                Expanded(
                  flex: 18,
                  child: SingleChildScrollView(
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
                                0.056.sh,
                                0.028.sw,
                                0.0043.sh,
                              ),
                              child: Text(
                                'termsOfService'.tr(),
                                style: Theme.of(context).textTheme.headline2?.copyWith(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 25.sp,
                                    ),
                              ),
                            ),
                            0.1.sh.verticalSpace,
                            Padding(
                                padding: EdgeInsets.only(left: 0.082.sw, right: 0.04.sw),
                                child: Text(
                                  'lorenText'.tr(),
                                  style: Theme.of(context).textTheme.headline2?.copyWith(
                                        fontFamily: 'Montserrat',
                                        fontSize: 15.sp,
                                        height: 1.5,
                                        fontWeight: FontWeight.w300,
                                        color: AppColors.deepBlueColor,
                                      ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
