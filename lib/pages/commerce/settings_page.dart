import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/config/routes/routes.dart';
import 'package:proximitystore/providers/business_provider.dart';
import 'package:proximitystore/widgets/widgets.dart';

import '../../config/colors/app_colors.dart';
import '../../providers/authentification_provider.dart';
import '../../services/validation_items.dart';
import '../../widgets/custom_cupertino_dialog.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomBackButtonIcon(),
                      Padding(
                        padding: EdgeInsets.only(left: 0.74.sw, top: 0.004.sh),
                        child: TextButton(
                          onPressed: () {
                            showCupertinoModalPopup(
                                barrierColor: AppColors.transparentGreyColor,
                                context: context,
                                builder: (_) => CustomCupertinoDialog(
                                      secondTextColor: AppColors.darkPinkColor,
                                      istilteStyleItalic: false,
                                      title: 'moreOptions'.tr(),
                                      firstActionText: 'signOut'.tr(),
                                      secondActionText: 'deleteAccount'.tr(),
                                      firstOnPresssed: () {
                                        context.read<BusinessProvider>().setPickedFileFromGalery();
                                      },
                                      secondOnPresssed: () {
                                        context.read<BusinessProvider>().setPickedFileFromCamera();
                                      },
                                    ));
                          },
                          child: Image(
                            height: 0.0295.sh,
                            width: 0.064.sw,
                            image: AssetImage('assets/icons/more.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      0.085.sw,
                      0.086.sh,
                      0.028.sw,
                      0.086.sh,
                    ),
                    child: Text(
                      'accountSettings'.tr(),
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 25.sp,
                          ),
                    ),
                  ),
                  TextInputField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) => ValidationItem(val: email).validateEmail(),
                    controller: context.watch<BusinessProvider>().emailTextEditingController,
                    hintText: 'e-mailAddress'.tr(),
                    inputLabel: 'e-mailAddress'.tr(),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (email) {
                      context.read<BusinessProvider>().setEmailValide(email);
                      context.read<BusinessProvider>().setIsReapetPasswordEqualNewPassword();
                    },
                  ),
                  0.03.sh.verticalSpace,
                  TextInputField(
                    inputLabel: 'password'.tr(),
                    controller: context.read<BusinessProvider>().passwordTextEditingController,
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: !context.watch<BusinessProvider>().isPasswordVisible,
                    validator: (email) => ValidationItem(val: email).validatePassword(),
                    onChanged: (password) {
                      context.read<BusinessProvider>().setPasswordValide(password);
                      context.read<BusinessProvider>().setIsReapetPasswordEqualNewPassword();
                    },
                    suffixIcon: GestureDetector(
                      onTap: () => context.read<BusinessProvider>().setIsPasswordVisible(),
                      child: !(context.watch<BusinessProvider>().isPasswordVisible)
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
                    controller: context.read<BusinessProvider>().newPasswordTextEditingController,
                    inputLabel: 'newPassword'.tr(),
                    hintText: 'newPassword'.tr(),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (password) {
                      context.read<BusinessProvider>().setNewPasswordValide(password);
                      context.read<BusinessProvider>().setIsReapetPasswordEqualNewPassword();
                    },
                    obscureText: !context.watch<BusinessProvider>().isNewPasswordVisible,
                    suffixIcon: GestureDetector(
                      onTap: () => context.read<BusinessProvider>().setIsNewPasswordVisible(),
                      child: !(context.watch<BusinessProvider>().isNewPasswordVisible)
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
                  0.03.sh.verticalSpace,
                  TextInputField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (repeatPassword) => ValidationItem(val: repeatPassword).validatePassword(),
                    controller: context.read<BusinessProvider>().repeatNewPasswordTextEditingController,
                    inputLabel: 'confirmTheNewPassword'.tr(),
                    hintText: 'confirmTheNewPassword'.tr(),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (password) {
                      context.read<BusinessProvider>().setRepaetNewPasswordValide(password);
                      context.read<BusinessProvider>().setIsReapetPasswordEqualNewPassword();
                    },
                    obscureText: !context.watch<BusinessProvider>().isRepeatNewPasswordVisible,
                    suffixIcon: GestureDetector(
                      onTap: () => context.read<BusinessProvider>().setIsRepeatNewPasswordVisible(),
                      child: !(context.watch<BusinessProvider>().isRepeatNewPasswordVisible)
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
                    padding: EdgeInsets.only(right: 0.065.sw, left: 0.665.sw),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.termOfServicePage,
                        );
                        context.read<BusinessProvider>().disposeSettingsControllers();
                      },
                      style: TextButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.padded,
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'consultTheT&Cs'.tr(),
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                fontSize: 10.sp,
                                fontFamily: 'Montserrat',
                                decoration: TextDecoration.underline,
                                color: AppColors.deepBlueColor,
                              ),
                        ),
                      ),
                    ),
                  ),
                  0.102.sh.verticalSpace,
                  (context.watch<BusinessProvider>().isEmailValide &&
                          context.watch<BusinessProvider>().isReapetPasswordEqualpassword &&
                          context.watch<BusinessProvider>().isPasswordValide)
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.043.sw),
                          child: SizedBox(
                              width: double.infinity,
                              child: CustomBlueButton(
                                onPressed: () {},
                                textInput: 'continue'.tr(),
                              )),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.043.sw),
                          child: SizedBox(
                              width: double.infinity,
                              child: CustomGreyButton(
                                onPressed: null,
                                textInput: 'edit'.tr(),
                              )),
                        ),
                  0.1268.sh.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
