import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/config/colors/app_colors.dart';
import 'package:proximitystore/config/routes/routes.dart';
import 'package:proximitystore/providers/authentification_provider.dart';
import 'package:proximitystore/widgets/widgets.dart';

import '../../services/validation_items.dart';

class RegisterPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthentificationProvider>(
      builder: (context, value, child) => Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              BackgroundImage(),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Wrap(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomBackButtonIcon(),
                          0.05.sh.verticalSpace,
                          Padding(
                            padding: EdgeInsets.only(left: 0.0853.sw, right: 0.38.sw),
                            child: Text(
                              'register'.tr(),
                              style: Theme.of(context).textTheme.headline2?.copyWith(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 28.sp,
                                  ),
                            ),
                          ),
                          0.192.sh.verticalSpace,
                          TextInputField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (email) => ValidationItem(val: email).validateEmail(),
                            controller: context.watch<AuthentificationProvider>().emailTextEditingController,
                            hintText: 'e-mailAddress'.tr(),
                            inputLabel: 'e-mailAddress'.tr(),
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (email) {
                              context.read<AuthentificationProvider>().setEmailValide(email);
                            },
                          ),
                          0.03.sh.verticalSpace,
                          TextInputField(
                            inputLabel: 'password'.tr(),
                            controller: context.watch<AuthentificationProvider>().passwordTextEditingController,
                            keyboardType: TextInputType.emailAddress,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            obscureText: !context.watch<AuthentificationProvider>().isPasswordVisible,
                            validator: (email) => ValidationItem(val: email).validatePassword(),
                            onChanged: (password) {
                              context.read<AuthentificationProvider>().setPasswordValide(password);
                              context.read<AuthentificationProvider>().setIsReapetPasswordEqualpassword();
                            },
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
                            hintText: 'password'.tr(),
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
                          0.03.sh.verticalSpace,
                          TextInputField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (repeatPassword) => ValidationItem(val: repeatPassword).validatePassword(),
                            controller: context.watch<AuthentificationProvider>().repeatPasswordTextEditingController,
                            inputLabel: 'repeatPassword'.tr(),
                            hintText: 'repeatPassword'.tr(),
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (password) {
                              context.read<AuthentificationProvider>().setRepeatPasswordValide(password);
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
                          0.0197.sh.verticalSpace,
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 0.068.sw,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 0.0345.sh,
                                  width: 0.0747.sw,
                                  child: Checkbox(
                                    fillColor: MaterialStateProperty.all(AppColors.lightPurpleColor),
                                    value: context.watch<AuthentificationProvider>().checkoxValue,
                                    onChanged: (val) {
                                      context.read<AuthentificationProvider>().setCheckoxValue();
                                    },
                                  ),
                                ),
                                0.03.sw.horizontalSpace,
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 0.12.sw),
                                    child: Text(
                                      'receiveAppUpdateInformationAndNewFeatures'.tr(),
                                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                                            fontSize: 10.sp,
                                            height: 1.4,
                                            fontFamily: "Montserrat",
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          0.122.sh.verticalSpace,
                          context.watch<AuthentificationProvider>().isReapetPasswordEqualpassword &&
                                  context.watch<AuthentificationProvider>().isEmailValide
                              ? Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 0.043.sw),
                                  child: SizedBox(
                                      width: double.infinity,
                                      child: CustomBlueButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, AppRoutes.loginPage);
                                          context.read<AuthentificationProvider>().disposeControllers();
                                        },
                                        textInput: 'continue'.tr(),
                                      )),
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
                          0.0022.sh.verticalSpace,
                          Center(
                            child: Text.rich(
                              TextSpan(
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: 'alreadyHaveAnAccount?'.tr() + ' ',
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                          fontSize: 14.sp,
                                          color: AppColors.deepBlueColor,
                                        ),
                                  ),
                                  WidgetSpan(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 0.00225.sh),
                                      child: SizedBox(
                                        height: 30,
                                        width: 120,
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(context, AppRoutes.loginPage);
                                            context.read<AuthentificationProvider>().disposeControllers();
                                          },
                                          child: Text(
                                            'login'.tr(),
                                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                                  fontSize: 15.sp,
                                                  color: AppColors.deepBlueColor,
                                                  decoration: TextDecoration.underline,
                                                ),
                                          ),
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.only(bottom: 0.003.sh),
                                            alignment: Alignment.bottomLeft,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          0.08.sh.verticalSpace,
                        ],
                      ),
                    )
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
