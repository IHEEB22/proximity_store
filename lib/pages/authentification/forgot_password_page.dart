import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/config/routes/routes.dart';
import 'package:proximitystore/widgets/background_image.dart';

import '../../config/images/app_images.dart';
import '../../providers/authentification_provider.dart';
import '../../services/validation_items.dart';
import '../../utils/input_formatter.dart';
import '../../widgets/custom_back_button_icon.dart';
import '../../widgets/custom_blue_button.dart';
import '../../widgets/custom_grey_button.dart';
import '../../widgets/text_input_decoration.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

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
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.popAndPushNamed(context, AppRoutes.loginPage),
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
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            0.07.sw,
                            0.056.sh,
                            0.384.sw,
                            0.038.sh,
                          ),
                          child: Text(
                            maxLines: 2,
                            'doYouForgotYourPassword?'.tr(),
                            style: Theme.of(context).textTheme.headline2?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 28.sp,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 0.07.sw, right: 0.2.sw),
                          child: Text(
                            maxLines: 3,
                            'enterYourEmailAddressToReceiveACodeToResetYourPassword.'.tr(),
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 1.4.sp,
                                ),
                          ),
                        ),
                        0.095.sh.verticalSpace,
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
                            inputFormatters: InputFormatter.textFieldFormatter,
                            keyboardType: TextInputType.emailAddress,
                            controller: context.watch<AuthentificationProvider>().emailTextEditingController,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: textInputDecoration.copyWith(
                              hintText: 'e-mailAddress'.tr(),
                            ),
                            validator: (email) => ValidationItem(val: email).validateEmail(),
                            onChanged: (email) {
                              context.read<AuthentificationProvider>().setEmailValide(email);
                            },
                          ),
                        ),
                        0.324.sh.verticalSpace,
                        context.watch<AuthentificationProvider>().isEmailValide
                            ? Column(
                                children: [
                                  0.032.sh.verticalSpace,
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 0.043.sw),
                                    child: SizedBox(
                                        width: double.infinity,
                                        child: CustomBlueButton(
                                          onPressed: () => Navigator.popAndPushNamed(context, AppRoutes.resetPassword),
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
                        0.1269.sh.verticalSpace,
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
