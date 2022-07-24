import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proximitystore/config/routes/routes.dart';
import 'package:proximitystore/widgets/background_image.dart';
import 'package:proximitystore/widgets/custom_blue_button.dart';

import '../../widgets/custom_back_button_icon.dart';

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
              child: Wrap(children: <Widget>[
                CustomBackButtonIcon(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    0.375.sh.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.042.sw),
                      child: SizedBox(
                        width: double.infinity,
                        child: CustomBlueButton(
                          textInput: 'registerWithEmail'.tr(),
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.registerPage);
                          },
                        ),
                      ),
                    ),
                    0.036.sh.verticalSpace,
                    Center(
                      child: Text(
                        'or'.tr(),
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w300,
                              fontSize: 14.sp,
                            ),
                      ),
                    ),
                    0.036.sh.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.042.sw),
                      child: SizedBox(
                        width: double.infinity,
                        child: CustomBlueButton(
                            textInput: 'toLogIn'.tr(),
                            onPressed: () => Navigator.pushNamed(context, AppRoutes.loginPage)),
                      ),
                    ),
                    0.116.sh.verticalSpace,
                    Padding(
                      padding: EdgeInsets.only(left: 0.0453.sw),
                      child: Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            TextSpan(
                              text: 'byCreatingAnAccountYouAgree'.tr() + ' ',
                              style: Theme.of(context).textTheme.headline6?.copyWith(
                                    fontFamily: 'Montserrat',
                                    fontSize: 12.sp,
                                  ),
                            ),
                            TextSpan(
                                text: 'toComplyWithTheGeneralConditionsOfProximityStore.'.tr(),
                                style: Theme.of(context).textTheme.headline6?.copyWith(
                                      fontFamily: 'Montserrat',
                                      decoration: TextDecoration.underline,
                                      fontSize: 12.sp,
                                    ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    ///Change this to naviagate to cgu app
                                    print('Login Text Clicked');
                                  }),
                          ],
                        ),
                      ),
                    ),
                    0.21.sh.verticalSpace,
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
