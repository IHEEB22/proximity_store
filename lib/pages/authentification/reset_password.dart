import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/config/colors/app_colors.dart';
import 'package:proximitystore/widgets/background_image.dart';

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
                    CustomBackButtonIcon(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            0.07.sw,
                            0.068.sh,
                            0.38.sw,
                            0.027.sh,
                          ),
                          child: Text(
                            'resetYourPassword'.tr(),
                            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 28.sp,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 0.07.sw, right: 0.19.sw),
                          child: Text(
                            'enterYourNewPassword'.tr(),
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16.sp,
                                  height: 1.4.sp,
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
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                  height: 1.2,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Montserrat',
                                ),
                            obscureText: !context.watch<AuthentificationProvider>().isPasswordVisible,
                            keyboardType: TextInputType.emailAddress,
                            controller: context.read<AuthentificationProvider>().passwordTextEditingController,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: textInputDecoration.copyWith(
                              hintText: 'Mot de passe',
                            ),
                            validator: (email) => ValidationItem(val: email).validatePassword(),
                            onChanged: (password) {
                              context.read<AuthentificationProvider>().setPasswordValide(password);
                            },
                          ),
                        ),
                        0.0098.sh.verticalSpace,
                        Padding(
                          padding: EdgeInsets.only(
                            left: 0.64.sw,
                          ),
                          child: Text(
                            '8CharactersMinimum'.tr(),
                            style: Theme.of(context).textTheme.headline6?.copyWith(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12.sp,
                                ),
                          ),
                        ),
                        0.027.sh.verticalSpace,
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
                            obscureText: !context.watch<AuthentificationProvider>().isPasswordVisible,
                            keyboardType: TextInputType.emailAddress,
                            controller: context.read<AuthentificationProvider>().passwordTextEditingController,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: textInputDecoration.copyWith(
                              hintText: 'passwordRepetition',
                            ),
                            validator: (email) => ValidationItem(val: email).validatePassword(),
                            onChanged: (password) {
                              context.read<AuthentificationProvider>().setPasswordValide(password);
                              context.read<AuthentificationProvider>().setIsButtonDisabled();
                            },
                          ),
                        ),
                        0.1884.sh.verticalSpace,
                        context.watch<AuthentificationProvider>().isPasswordValide
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
