import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/config/routes/routes.dart';
import 'package:proximitystore/widgets/background_image.dart';
import 'package:proximitystore/widgets/custom_back_button_icon.dart';

import '../../providers/authentification_provider.dart';
import '../../services/validation_items.dart';
import '../../widgets/custom_blue_button.dart';
import '../../widgets/custom_grey_button.dart';
import '../../widgets/text_input_field.dart';

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
                    CustomBackButtonIcon(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            0.0826.sw,
                            0.056.sh,
                            0.28.sw,
                            0.038.sh,
                          ),
                          child: Text(
                            'doYouForgotYourPassword?'.tr(),
                            style: Theme.of(context).textTheme.headline2?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 25.sp,
                                  height: 1.4,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 0.0826.sw, right: 0.099.sw),
                          child: Text(
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
                        TextInputField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email) => ValidationItem(val: email).validateEmail(),
                          controller: context.watch<AuthentificationProvider>().emailResetTextEditingController,
                          hintText: 'e-mailAddress'.tr(),
                          inputLabel: 'e-mailAddress'.tr(),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (email) {
                            context.read<AuthentificationProvider>().setEmailResetvalide(email);
                          },
                        ),
                        0.324.sh.verticalSpace,
                        context.watch<AuthentificationProvider>().isEmailResetvalide
                            ? Column(
                                children: [
                                  0.032.sh.verticalSpace,
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 0.043.sw),
                                    child: SizedBox(
                                        width: double.infinity,
                                        child: CustomBlueButton(
                                          onPressed: () {
                                            Navigator.pushNamed(context, AppRoutes.resetPassword);
                                            context.read<AuthentificationProvider>().disposeControllers();
                                          },
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
