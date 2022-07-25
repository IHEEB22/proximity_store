import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/config/colors/app_colors.dart';
import 'package:proximitystore/pages/commerce/sheet_store_sectors.dart';
import 'package:proximitystore/providers/business_provider.dart';

import '../../services/validation_items.dart';
import '../../widgets/widgets.dart';

class StoreDescriptionPage extends StatefulWidget {
  const StoreDescriptionPage({super.key});

  @override
  State<StoreDescriptionPage> createState() => _StoreDescriptionPageState();
}

class _StoreDescriptionPageState extends State<StoreDescriptionPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomBackButtonIcon(),
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.only(top: 0.028.sh, left: 0.8.sw),
                          child: Image(
                            height: 0.0295.sh,
                            width: 0.064.sw,
                            image: AssetImage('assets/icons/settings_icon.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                        child: Consumer<BusinessProvider>(
                          builder: (context, value, child) => Row(
                            children: [
                              0.07.sw.horizontalSpace,
                              // to change the type of the switch
                              Transform.scale(
                                scale: 1.2,
                                child: Switch(
                                  activeColor: AppColors.deepBlueColor,
                                  value: context.watch<BusinessProvider>().switchValue,
                                  // trackColor: AppColors.blueGreyColor,
                                  onChanged: (value) => context.read<BusinessProvider>().setSwitchValue(),
                                ),
                              ),
                              0.0426.sw.horizontalSpace,
                              context.watch<BusinessProvider>().switchValue
                                  ? Text("vacationModeOff".tr(),
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                            fontFamily: 'Montserrat',
                                            fontSize: 16.sp,
                                            color: AppColors.deepBlueColor,
                                            letterSpacing: 0.2,
                                          ))
                                  : Text(
                                      "vacationModeOn".tr(),
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
                      ),
                      0.0025.sh.verticalSpace,
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextInputField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (businessName) => ValidationItem(val: businessName).validateBusinessName(),
                              controller: context.watch<BusinessProvider>().businessName,
                              hintText: 'fillInAName'.tr(),
                              inputLabel: 'nameOfYourBusiness'.tr(),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            0.03.sh.verticalSpace,
                            TextInputField(
                              readOnly: true,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (sector) => ValidationItem(val: sector).validateBusinessName(),
                              suffixIcon: GestureDetector(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'selectOneOrMoreSectors'.tr(),
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                            fontFamily: 'Montserrat',
                                            fontSize: 16.sp,
                                            height: 1.2,
                                            color: AppColors.deepBlueColor,
                                          ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: SizedBox(
                                        width: 0.05.sw,
                                        height: 0.012.sh,
                                        child: Image(
                                          image: AssetImage('assets/icons/Vector.png'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20.r),
                                      ),
                                    ),
                                    builder: ((context) => SheetStoreSectors()),
                                  );
                                },
                              ),
                              controller: context.watch<BusinessProvider>().sector,
                              hintText: ''.tr(),
                              inputLabel: 'sector'.tr(),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            0.025.sh.verticalSpace,
                            Visibility(
                              child: SizedBox(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 0.082.sw),
                                  child: Container(
                                    width: double.infinity,
                                    child: Wrap(
                                      direction: Axis.horizontal,
                                      children: context.read<BusinessProvider>().chekedsectorsList.map((item) {
                                        return Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 8.0),
                                              child: Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    border: BoxBorder(
                                                      BorderSide(
                                                        color: AppColors.deepBlueColor,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    item,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            0.03.sh.verticalSpace,
                            TextInputField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (adress) => ValidationItem(val: adress).validatePhoneNumber(),
                              controller: context.watch<BusinessProvider>().adress,
                              hintText: 'enterAnAddress'.tr(),
                              inputLabel: 'address'.tr(),
                              keyboardType: TextInputType.emailAddress,
                              // onChanged:()=>,
                            ),
                            0.03.sh.verticalSpace,
                            TextInputField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (phoneNumber) => ValidationItem(val: phoneNumber).validatePhoneNumber(),
                              controller: context.watch<BusinessProvider>().phoneNumber,
                              hintText: 'fillInAPhoneNumber'.tr(),
                              inputLabel: 'telephone'.tr(),
                              keyboardType: TextInputType.phone,
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
                            0.0381.sh.verticalSpace,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 0.082.sw),
                              child: SizedBox(
                                width: double.infinity,
                                child: Image(
                                  image: AssetImage('assets/icons/commerce_picture_place_holder.png'),
                                ),
                              ),
                            ),
                            0.0296.sh.verticalSpace,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 0.082.sw),
                              child: SizedBox(
                                width: double.infinity,
                                child: CustomWhiteButton(
                                  leading: Image(
                                    image: AssetImage('assets/icons/camera.png'),
                                  ),
                                  textInput: 'changeSchedules'.tr(),
                                  onPressed: () {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) => AlertDialog(
                                        title: Text(
                                          textAlign: TextAlign.center,
                                          'addThePhotoOfMyBusiness'.tr(),
                                          style: Theme.of(context).textTheme.subtitle2,
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              openAppSettings();
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'openTheCamera'.tr(),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              openAppSettings();
                                              Navigator.pop(context);
                                            },
                                            child: Text('chooseFromGallery'.tr()),
                                          ),
                                          TextButton(
                                            onPressed: () => Navigator.pop(context),
                                            child: Text('cancel'.tr()),
                                          ),
                                        ],
                                      ),
                                    );

                                    ;
                                  },
                                ),
                              ),
                            ),
                            0.065.sh.verticalSpace,
                            Padding(
                              padding: EdgeInsets.only(left: 0.0426.sw),
                              child: Text(
                                'description'.tr(),
                                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.deepBlueColor,
                                    ),
                              ),
                            ),
                            0.0382.sh.verticalSpace,
                            TextInputField(
                                minLines: 10,
                                maxLines: 10,
                                maxLength: 500,
                                additionalTopPading: 0.04.sh,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                controller: context.watch<BusinessProvider>().description,
                                hintText: 'describeYourStoreHereWhatYouWantYourCustomersToKnow'.tr(),
                                inputLabel: 'aboutOptional'.tr(),
                                keyboardType: TextInputType.multiline,
                                onChanged: (val) => context.read<BusinessProvider>().setTemperleft()),
                            0.015.sh.verticalSpace,
                            Consumer<BusinessProvider>(
                              builder: (context, value, child) => Padding(
                                padding: EdgeInsets.only(
                                  right: 0.082.sw,
                                ),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    '${context.watch<BusinessProvider>().temperLeft} ' + 'CharactersLeft'.tr(),
                                    style: Theme.of(context).textTheme.headline3?.copyWith(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            0.0615.sh.verticalSpace,
                            Container(
                              child: ((_formKey.currentState?.validate() ?? true) &&
                                      !(context.watch<BusinessProvider>().validateButtonPressed))
                                  ? SizedBox.shrink()
                                  : Consumer<BusinessProvider>(
                                      builder: (context, value, child) => Padding(
                                        padding: EdgeInsets.only(bottom: 0.02.sh),
                                        child: Center(
                                          child: Text(
                                            'someMandatoryFieldsAreNotFilledIn'.tr(),
                                            style: TextStyle(
                                              color: AppColors.pinkColor,
                                              fontFamily: 'Montserrat',
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.2,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.082.sw),
                        child: SizedBox(
                            width: double.infinity,
                            child: CustomBlueButton(
                                textInput: 'validate'.tr(),
                                onPressed: () {
                                  context.read<BusinessProvider>().setValidateButtonPressed();
                                  if (_formKey.currentState?.validate() ?? false) {
                                    print('you can navigate');
                                  }
                                  print('you can not navigate');
                                })),
                      ),
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
