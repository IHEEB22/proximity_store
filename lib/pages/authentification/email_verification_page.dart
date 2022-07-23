import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/config/routes/routes.dart';
import 'package:proximitystore/widgets/background_image.dart';
import 'package:proximitystore/widgets/custom_back_button_icon.dart';

import '../../config/images/app_images.dart';
import '../../providers/authentification_provider.dart';
import '../../widgets/text_input_field.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthentificationProvider>(
      builder: (context, value, child) => Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              BackgroundImage(),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'resendTheCode'.tr(),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 15.sp,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600),
                    ),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.only(bottom: 0.003.sh),
                      alignment: Alignment.bottomLeft,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                // reverse: true,
                physics: BouncingScrollPhysics(),
                child: Wrap(
                  children: <Widget>[
                    CustomBackButtonIcon(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            0.0826.sw,
                            0.056.sh,
                            0.28.sw,
                            0.109.sh,
                          ),
                          child: Text(
                            'verification'.tr(),
                            style:
                                Theme.of(context).textTheme.headline2?.copyWith(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 28.sp,
                                      height: 1.4,
                                    ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 0.0826.sw, right: 0.15.sw),
                          child: Text(
                            'toVerifyYourAccountEnterThe6DigitCodeReceivedByEmail'
                                .tr(),
                            style:
                                Theme.of(context).textTheme.bodyText2?.copyWith(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      height: 1.4.sp,
                                    ),
                          ),
                        ),
                        0.0923.sh.verticalSpace,
                        TextInputField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: context
                              .watch<AuthentificationProvider>()
                              .emailTextEditingController,
                          hintText: 'verificationCode'.tr(),
                          inputLabel: 'verificationCode'.tr(),
                          keyboardType: TextInputType.number,
                          onChanged: (verificationCode) {
                            if (verificationCode.length == 6) {
                              Navigator.pushNamed(context, AppRoutes.loginPage);
                              context
                                  .read()<AuthentificationProvider>()
                                  .disposeControllers();
                            }
                          },
                        ),
                        0.205.sh.verticalSpace,
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
