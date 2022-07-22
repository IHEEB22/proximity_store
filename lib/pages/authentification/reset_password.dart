import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/config/colors/app_colors.dart';
import 'package:proximitystore/widgets/background_image.dart';

import '../../config/images/app_images.dart';
import '../../config/routes/routes.dart';
import '../../providers/authentification_provider.dart';
import '../../services/validation_items.dart';
import '../../widgets/custom_blue_button.dart';
import '../../widgets/custom_grey_button.dart';
import '../../widgets/text_input_field.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AuthentificationProvider>().disposeControllersResetPasswordPage();
    return Consumer<AuthentificationProvider>(
      builder: (context, value, child) => Scaffold(
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              BackgroundImage(),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.popAndPushNamed(context, AppRoutes.forgetPassword);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 0.028.sh,
                          left: 0.025.sw,
                        ),
                        child: Image.asset(
                          AppImages.backIcon,
                          width: 0.064.sw,
                          height: 0.029.sh,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            0.0853333.sw,
                            0.068.sh,
                            0.31.sw,
                            0.04125.sh,
                          ),
                          child: Text(
                            'resetYourPassword'.tr(),
                            style: Theme.of(context).textTheme.headline2?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 26.sp,
                                  height: 1.2,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 0.0853333.sw, right: 0.099.sw),
                          child: Text(
                            'enterYourNewPassword'.tr(),
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                ),
                          ),
                        ),
                        0.137.sh.verticalSpace,
                        TextInputField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (password) => ValidationItem(val: password).validatePassword(),
                          controller: context.watch<AuthentificationProvider>().passwordTextEditingController,
                          hintText: 'password'.tr(),
                          inputLabel: 'password'.tr(),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (password) {
                            context.read<AuthentificationProvider>().setPasswordValide(password);
                            context.read<AuthentificationProvider>().setIsReapetPasswordEqualpassword();
                          },
                          obscureText: !context.watch<AuthentificationProvider>().isPasswordVisible,
                          suffixIcon: GestureDetector(
                            onTap: () => context.read<AuthentificationProvider>().setIsPasswordVisible(),
                            child: !(context.watch<AuthentificationProvider>().isPasswordVisible)
                                ? Icon(
                                    Icons.visibility,
                                    color: AppColors.deepBlueColor,
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: AppColors.deepBlueColor,
                                  ),
                          ),
                        ),
                        0.012.sh.verticalSpace,
                        Padding(
                          padding: EdgeInsets.only(
                            right: 0.082.sw,
                          ),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              '8CharactersMinimum'.tr(),
                              style: Theme.of(context).textTheme.headline6?.copyWith(
                                    fontFamily: 'Montserrat',
                                    fontSize: 12.sp,
                                  ),
                            ),
                          ),
                        ),
                        0.02894.sh.verticalSpace,
                        TextInputField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (repeatPassword) => ValidationItem(val: repeatPassword).validatePassword(),
                          controller: context.watch<AuthentificationProvider>().repeatPasswordTextEditingController,
                          inputLabel: 'repeatPassword'.tr(),
                          hintText: 'repeatPassword'.tr(),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (password) {
                            context.read<AuthentificationProvider>().setPasswordValide(password);
                            context.read<AuthentificationProvider>().setIsReapetPasswordEqualpassword();
                          },
                          obscureText: !context.watch<AuthentificationProvider>().isRepeatPasswordVisible,
                          suffixIcon: GestureDetector(
                            onTap: () => context.read<AuthentificationProvider>().setIsRepeatPasswordVisible(),
                            child: !(context.watch<AuthentificationProvider>().isRepeatPasswordVisible)
                                ? Icon(
                                    Icons.visibility,
                                    color: AppColors.deepBlueColor,
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: AppColors.deepBlueColor,
                                  ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 0.082.sw,
                          ),
                        ),
                        0.1884.sh.verticalSpace,
                        context.watch<AuthentificationProvider>().isPasswordValide &&
                                context.watch<AuthentificationProvider>().isReapetPasswordEqualpassword
                            ? Column(
                                children: [
                                  0.032.sh.verticalSpace,
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 0.043.sw),
                                    child: SizedBox(
                                        width: double.infinity,
                                        child: CustomBlueButton(
                                          onPressed: () {},
                                          textInput: 'continue'.tr(),
                                        )),
                                  ),
                                ],
                              )
                            : Padding(
                                padding: EdgeInsets.symmetric(horizontal: 0.043.sw),
                                child: SizedBox(
                                    width: double.infinity,
                                    child: CustomGreyButton(
                                      onPressed: null,
                                      textInput: 'continue'.tr(),
                                    )),
                              ),
                        0.1268.sh.verticalSpace,
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
