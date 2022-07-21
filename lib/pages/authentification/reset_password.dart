import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/config/colors/app_colors.dart';
import 'package:proximitystore/utils/input_formatter.dart';
import 'package:proximitystore/widgets/background_image.dart';

import '../../config/images/app_images.dart';
import '../../config/routes/routes.dart';
import '../../providers/authentification_provider.dart';
import '../../services/validation_items.dart';
import '../../widgets/custom_back_button_icon.dart';
import '../../widgets/custom_blue_button.dart';
import '../../widgets/custom_grey_button.dart';
import '../../widgets/text_input_decoration.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        context.read<AuthentificationProvider>().disposeControllersResetpasswordppage();
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
                            0.07.sw,
                            0.068.sh,
                            0.349.sw,
                            0.04125.sh,
                          ),
                          child: Text(
                            maxLines: 2,
                            'resetYourPassword'.tr(),
                            style: Theme.of(context).textTheme.headline2?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 28.sp,
                                  height: 1.2,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 0.07.sw, right: 0.15.sw),
                          child: Text(
                            'enterYourNewPassword'.tr(),
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16.sp,
                                ),
                          ),
                        ),
                        0.137.sh.verticalSpace,
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
                            inputFormatters: InputFormatter.textFieldFormatter,
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                  height: 1.2,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Montserrat',
                                ),
                            obscureText: !context.watch<AuthentificationProvider>().isPasswordVisible,
                            keyboardType: TextInputType.emailAddress,
                            controller: context.watch<AuthentificationProvider>().passwordTextEditingController,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: textInputDecoration.copyWith(
                              hintText: 'Mot de passe',
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
                            validator: (email) => ValidationItem(val: email).validatePassword(),
                            onChanged: (password) {
                              context.read<AuthentificationProvider>().setPasswordValide(password);
                              context.read<AuthentificationProvider>().setIsReapetPasswordEqualpassword();
                            },
                          ),
                        ),
                        0.012.sh.verticalSpace,
                        Padding(
                          padding: EdgeInsets.only(
                            left: 0.636.sw,
                            right: 0.082.sw,
                          ),
                          child: Text(
                            maxLines: 1,
                            '8CharactersMinimum'.tr(),
                            style: Theme.of(context).textTheme.headline6?.copyWith(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12.sp,
                                ),
                          ),
                        ),
                        0.02894.sh.verticalSpace,
                        Padding(
                          padding: EdgeInsets.only(
                            left: 0.082.sw,
                            bottom: 0.0055.sh,
                          ),
                          child: Text(
                            'repeatPassword'.tr(),
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
                            inputFormatters: InputFormatter.textFieldFormatter,
                            obscureText: !context.watch<AuthentificationProvider>().isRepeatPasswordVisible,
                            keyboardType: TextInputType.emailAddress,
                            controller: context.watch<AuthentificationProvider>().repeatPasswordTextEditingController,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: textInputDecoration.copyWith(
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
                              hintText: 'passwordRepetition'.tr(),
                            ),
                            validator: (email) => ValidationItem(val: email).validatePassword(),
                            onChanged: (password) {
                              context.read<AuthentificationProvider>().setPasswordValide(password);
                              context.read<AuthentificationProvider>().setIsReapetPasswordEqualpassword();
                            },
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
