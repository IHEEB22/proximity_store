import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/config/colors/app_colors.dart';
import 'package:proximitystore/config/routes/routes.dart';
import 'package:proximitystore/pages/commerce/sheet_store_sectors.dart';
import 'package:proximitystore/providers/business_provider.dart';
import 'package:proximitystore/widgets/custom_cupertino_dialog.dart';

import '../../services/validation_items.dart';
import '../../widgets/widgets.dart';

class StoreDescriptionPage extends StatefulWidget {
  const StoreDescriptionPage({super.key});

  @override
  State<StoreDescriptionPage> createState() => _StoreDescriptionPageState();
}

class _StoreDescriptionPageState extends State<StoreDescriptionPage> {
  final GlobalKey<FormFieldState> _formKey = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundImage(),
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomBackButtonIcon(),
                      GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, appSetting);
                          // dispoee buisnessprovider
                        },
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
                ),
                Expanded(
                  flex: 15,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Wrap(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                0.085.sw,
                                0.056.sh,
                                0.028.sw,
                                0.0043.sh,
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
                                      scale: 1,
                                      child: CupertinoSwitch(
                                        activeColor: AppColors.deepBlueColor,
                                        value: context.watch<BusinessProvider>().switchValue,
                                        // trackColor: AppColors.blueGreyColor,
                                        onChanged: (value) => context.read<BusinessProvider>().setSwitchValue(),
                                      ),
                                    ),
                                    0.0426.sw.horizontalSpace,
                                    context.watch<BusinessProvider>().switchValue
                                        ? Text(
                                            "vacationModeOff".tr(),
                                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 14.sp,
                                                  color: AppColors.deepBlueColor,
                                                  letterSpacing: 0.2,
                                                ),
                                          )
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextInputField(
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    validator: (businessName) =>
                                        ValidationItem(val: businessName).validateBusinessName(),
                                    controller: context.watch<BusinessProvider>().businessName,
                                    hintText: 'fillInAName'.tr(),
                                    inputLabel: 'nameOfYourBusiness'.tr(),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  0.03.sh.verticalSpace,
                                  TextInputField(
                                    readOnly: true,
                                    validator: (_) => context.watch<BusinessProvider>().chekedsectorsList.isNotEmpty
                                        ? null
                                        : 'ce champ est obligatoire !',
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    controller: TextEditingController(text: ''),
                                    suffixIcon: Visibility(
                                      visible: context.watch<BusinessProvider>().sectorHintVisible,
                                      child: GestureDetector(
                                        onTap: () {
                                          context.read<BusinessProvider>().setSectorHintVisible();
                                          showModalBottomSheet<void>(
                                            isScrollControlled: true,
                                            context: context,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(20.r),
                                              ),
                                            ),
                                            builder: ((context) => SheetStoreSectors()),
                                          ).whenComplete(
                                            () {
                                              context.read<BusinessProvider>().setSectorHintVisible();
                                            },
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'selectOneOrMoreSectors'.tr(),
                                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 14.sp,
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
                                      ),
                                    ),
                                    hintText: ''.tr(),
                                    inputLabel: 'sector'.tr(),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  0.015.sh.verticalSpace,
                                  SizedBox(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 0.082.sw),
                                      child: Container(
                                        width: double.infinity,
                                        child: Wrap(
                                          direction: Axis.horizontal,
                                          children: context.read<BusinessProvider>().chekedsectorsList.keys.map((item) {
                                            return Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(right: 0.2),
                                                  child: Expanded(
                                                    child: Container(
                                                      margin: EdgeInsets.all(3),
                                                      padding: EdgeInsets.all(2),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(width: 2, color: AppColors.deepBlueColor),
                                                        borderRadius: BorderRadius.all(
                                                          Radius.circular(6.0),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(top: 4, bottom: 4, right: 1.5, left: 2),
                                                            child: Text(
                                                              item,
                                                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                                  fontFamily: 'Montserrat',
                                                                  fontSize: 12.sp,
                                                                  color: AppColors.deepBlueColor,
                                                                  fontWeight: FontWeight.w700),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              context.read<BusinessProvider>().removeSector(item);
                                                              context.read<BusinessProvider>().isDeleteEnabled();
                                                            },
                                                            child: Container(
                                                              height: 16,
                                                              width: 16,
                                                              child: Image(
                                                                  image: AssetImage('assets/icons/delete_icon.png')),
                                                            ),
                                                          ),
                                                          0.0025.sw.horizontalSpace,
                                                        ],
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
                                      child: context.read<BusinessProvider>().isPickedFileEmpty
                                          ? Image(
                                              image: AssetImage('assets/icons/commerce_picture_place_holder.png'),
                                            )
                                          : FutureBuilder<PickedFile?>(
                                              future: context.read<BusinessProvider>().pickedFile,
                                              builder: (context, snap) {
                                                if (snap.hasData) {
                                                  return Container(
                                                    height: 0.2413.sh,
                                                    child: Image.file(
                                                      File(snap.data!.path),
                                                      fit: BoxFit.fitWidth,
                                                    ),
                                                    color: Colors.blue,
                                                  );
                                                } else if (!snap.hasData) {
                                                  return SizedBox(
                                                    child: Column(
                                                      children: [
                                                        Image(
                                                          image: AssetImage(
                                                              'assets/icons/commerce_picture_place_holder.png'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                } else {
                                                  return Center(
                                                    child: Text('problem lors de l\'importation de votre photo'),
                                                  );
                                                }
                                              }),
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
                                        textInput: 'addPhoto'.tr(),
                                        onPressed: () {
                                          showCupertinoModalPopup(
                                            context: context,
                                            builder: (_) => CustomCupertinoDialog(
                                              title: 'addThePhotoOfMyBusiness'.tr(),
                                              firstActionText: 'chooseFromGallery'.tr(),
                                              secondActionText: 'openTheCamera'.tr(),
                                              firstOnPresssed: () {
                                                context.read<BusinessProvider>().setPickedFileFromGalery();
                                              },
                                              secondOnPresssed: () {
                                                context.read<BusinessProvider>().setPickedFileFromCamera();
                                              },
                                            ),
                                          );
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
                                      controller: context.watch<BusinessProvider>().storeDescription,
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
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 0.082.sw),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: CustomBlueButton(
                                          textInput: 'validate'.tr(),
                                          onPressed: () {
                                            context.read<BusinessProvider>().setValidateButtonPressed();
                                            if (_formKey.currentState?.validate() ??
                                                true && context.read<BusinessProvider>().chekedsectorsList.isNotEmpty) {
                                              print('you can navigate');
                                              Navigator.pushNamed(context, AppRoutes.searchProductPage);
                                            } else {
                                              print('you can not navigate');
                                            }
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
