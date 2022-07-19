import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proximitystore/config/routes/routes.dart';
import 'package:proximitystore/widgets/background_image.dart';
import 'package:proximitystore/widgets/custom_blue_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  0.375.sh.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.042.sw),
                    child: SizedBox(
                      width: double.infinity,
                      child: CustomBlueButton(textInput: 'registerWithEmail'.tr(), onPressed: () {}),
                    ),
                  ),
                  0.036.sh.verticalSpace,
                  Center(
                    child: Text(
                      'or'.tr(),
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(),
                    ),
                  ),
                  0.036.sh.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.042.sw),
                    child: SizedBox(
                      width: double.infinity,
                      child: CustomBlueButton(
                        textInput: 'toLogIn'.tr(),
                        onPressed: () => Navigator.pushNamed(context, AppRoutes.loginPage),
                      ),
                    ),
                  ),
                  0.116.sh.verticalSpace,
                  Padding(
                    padding: EdgeInsets.only(left: 0.0453.sw, right: 0.149.sw),
                    child: Text(
                      'byCreatingAnAccountYouAgreeTo'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(fontFamily: 'Montserrat', fontSize: 12.sp, decoration: TextDecoration.underline),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0.0453.sw),
                    child: Text(
                      'ComplyWithTheGeneralConditionsOfProximityStore'.tr(),
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontFamily: 'Montserrat',
                            fontSize: 12.sp,
                          ),
                    ),
                  ),
                  0.21.sh.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
