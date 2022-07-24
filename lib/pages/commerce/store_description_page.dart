import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/config/colors/app_colors.dart';

import '../../providers/authentification_provider.dart';
import '../../services/validation_items.dart';
import '../../widgets/widgets.dart';

class StoreDescriptionPage extends StatelessWidget {
  const StoreDescriptionPage({super.key});

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
                  CustomBackButtonIcon(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          0.085.sw,
                          0.056.sh,
                          0.28.sw,
                          0.038.sh,
                        ),
                        child: Text(
                          'myBusiness'.tr(),
                          style: Theme.of(context).textTheme.headline2?.copyWith(
                                fontWeight: FontWeight.w800,
                                fontSize: 25.sp,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 0.0443.sh,
                        ),
                        child: Row(
                          children: [
                            0.07.sw.horizontalSpace,
                            // to change the type of the switch
                            Transform.scale(
                              scale: 1.2,
                              child: Switch(
                                value: false,
                                // trackColor: AppColors.blueGreyColor,
                                onChanged: (value) => "change value",
                              ),
                            ),
                            0.0426.sw.horizontalSpace,
                            Text(
                              "vacationModeOff".tr(),
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14.sp,
                                    color: AppColors.deepBlueColor,
                                    letterSpacing: 0.2,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      0.0025.sh.verticalSpace,
                      TextInputField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) => ValidationItem(val: email).validateEmail(),
                        controller: context.watch<AuthentificationProvider>().emailTextEditingController,
                        hintText: 'fillInAName'.tr(),
                        inputLabel: 'nameOfYourBusiness'.tr(),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (email) {
                          context.read<AuthentificationProvider>().setEmailValide(email);
                        },
                      ),
                      0.03.sh.verticalSpace,
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) => ValidationItem(val: email).validateEmail(),
                        controller: context.watch<AuthentificationProvider>().emailTextEditingController,
                        hintText: 'enterAnAddress'.tr(),
                        inputLabel: 'address'.tr(),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (email) {
                          context.read<AuthentificationProvider>().setEmailValide(email);
                        },
                      ),
                      0.03.sh.verticalSpace,
                      TextInputField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) => ValidationItem(val: email).validateEmail(),
                        controller: context.watch<AuthentificationProvider>().emailTextEditingController,
                        hintText: 'fillInAPhoneNumber'.tr(),
                        inputLabel: 'telephone'.tr(),
                        keyboardType: TextInputType.phone,
                        onChanged: (email) {
                          context.read<AuthentificationProvider>().setEmailValide(email);
                        },
                      ),
                      0.0788.sh.verticalSpace,
                      Padding(
                        padding: EdgeInsets.only(left: 0.0426.sw),
                        child: Text(
                          'openingTime'.tr(),
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                color: AppColors.deepBlueColor,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      0.0382.sh.verticalSpace,
                      Container(
                        child: Text("horaire du store"),
                        color: AppColors.blueColor,
                      ),
                      0.0344.sh.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.082.sw),
                        child: SizedBox(
                          width: double.infinity,
                          child: CustomWhiteButton(
                            leading: Image(
                              image: AssetImage('assets/icons/clock.png'),
                            ),
                            textInput: 'changeSchedules'.tr(),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      0.0985.sh.verticalSpace,
                      Padding(
                        padding: EdgeInsets.only(left: 0.0426.sw),
                        child: Text(
                          'photoOfMyBusiness'.tr(),
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.deepBlueColor,
                              ),
                        ),
                      ),
                      0.0394.sh.verticalSpace,
                      // photoholder
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
