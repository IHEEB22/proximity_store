import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proximitystore/config/colors/app_colors.dart';
import 'package:proximitystore/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundImage(),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Wrap(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomBackButtonIcon(),
                      0.05.sh.verticalSpace,
                      Padding(
                        padding: EdgeInsets.only(left: 0.0853.sw, right: 0.38.sw),
                        child: Text(
                          'gladToMeetYou!'.tr(),
                          style: Theme.of(context).textTheme.headline2?.copyWith(
                                height: 1.4,
                              ),
                        ),
                      ),
                      0.192.sh.verticalSpace,
                      Padding(
                        padding: EdgeInsets.only(
                          left: 0.082.sw,
                          bottom: 0.0055.sh,
                        ),
                        child: Text(
                          'e-mailAddress'.tr(),
                          style: Theme.of(context).textTheme.headline3?.copyWith(
                                fontFamily: 'Montserrat',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.4,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 0.082.sw,
                        ),
                        child: TextFormField(
                          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                height: 1.2,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Montserrat',
                              ),
                          keyboardType: TextInputType.emailAddress,
                          // controller: context.read<LocalistaionControllerprovider>().emailTextEditingController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: textInputDecoration.copyWith(
                            hintText: 'e-mail',
                          ),
                          // validator: (email) => ValidationItem(val: email).validateEmail(),
                        ),
                      ),

                      0.03.sh.verticalSpace,
// ***********

                      Padding(
                        padding: EdgeInsets.only(
                          left: 0.082.sw,
                          bottom: 0.0055.sh,
                        ),
                        child: Text(
                          'password'.tr(),
                          style: Theme.of(context).textTheme.headline3?.copyWith(
                                fontFamily: 'Montserrat',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.4,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 0.082.sw,
                        ),
                        child: TextFormField(
                          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                height: 1.2,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Montserrat',
                              ),
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                          // controller: context.read<LocalistaionControllerprovider>().emailTextEditingController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: textInputDecoration.copyWith(
                            suffixIcon: Icon(
                              Icons.visibility,
                              color: AppColors.deepBlueColor,
                            ),
                            hintText: 'Mot de passe',
                          ),
                          // validator: (email) => ValidationItem(val: email).validateEmail(),
                        ),
                      ),
                      0.001.sh.verticalSpace,
                      Padding(
                        padding: EdgeInsets.only(left: 0.658.sw, right: 0.082),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'forgotYourPassword?'.tr(),
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ),
                      ),
                      0.198.sh.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.043.sw),
                        child: SizedBox(
                          width: double.infinity,
                          child: CustomGreyButton(
                            onPressed: () {},
                            textInput: 'continue'.tr(),
                          ),
                        ),
                      ),
                      0.022.sh.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'youDoNotHaveAnAccount?'.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontSize: 14.sp, color: AppColors.deepBlueColor),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'signUp'.tr(),
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: 14.sp,
                                    decoration: TextDecoration.underline,
                                    letterSpacing: 0.2,
                                  ),
                            ),
                          ),
                          0.08.sh.verticalSpace,
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
