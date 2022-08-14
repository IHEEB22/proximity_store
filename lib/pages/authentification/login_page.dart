import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'package:proximitystore/config/colors/app_colors.dart';
import 'package:proximitystore/config/routes/routes.dart';
import 'package:proximitystore/providers/authentification_provider.dart';
import 'package:proximitystore/widgets/widgets.dart';

import '../../services/validation_items.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                              'gladToMeetYou!'.tr(),
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
                              context.read<AuthentificationProvider>().setIsButtonDisabled();
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
                              context.read<AuthentificationProvider>().setIsButtonDisabled();
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
                          Padding(
                            padding: EdgeInsets.only(right: 0.052.sw, top: 0.012.sh),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                width: 0.32.sw,
                                height: 0.04.sh,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.forgetPassword,
                                    );
                                    context.read<AuthentificationProvider>().disposeControllers();
                                  },
                                  child: Text(
                                    'forgotYourPassword?'.tr(),
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
                          ),
                          0.198.sh.verticalSpace,
                          context.watch<AuthentificationProvider>().isButtonDisabled
                              ? Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 0.043.sw),
                                  child: SizedBox(
                                      width: double.infinity,
                                      child: CustomGreyButton(
                                        onPressed: null,
                                        textInput: 'continue'.tr(),
                                      )),
                                )
                              : Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 0.043.sw),
                                  child: SizedBox(
                                      width: double.infinity,
                                      child: CustomBlueButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, AppRoutes.searchProductPage);
                                        },
                                        textInput: 'continue'.tr(),
                                      )),
                                ),
                          0.0022.sh.verticalSpace,
                          Center(
                            child: Text.rich(
                              TextSpan(
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: 'youDoNotHaveAnAccount?'.tr(),
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                          fontSize: 14.sp,
                                          // change fontfamily to montserrat
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
                                            Navigator.pushNamed(context, AppRoutes.registerPage);
                                            context.read<AuthentificationProvider>().disposeControllers();
                                          },
                                          child: Text(
                                            // change fontfamily to montserrat
                                            'signUp'.tr(),
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
