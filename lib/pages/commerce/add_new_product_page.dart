import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/config/images/app_images.dart';
import 'package:proximitystore/config/routes/routes.dart';
import 'package:proximitystore/models/product.dart';

import '../../config/colors/app_colors.dart';
import '../../providers/business_provider.dart';
import '../../services/validation_items.dart';
import '../../widgets/custom_blue_button.dart';
import '../../widgets/custom_cupertino_dialog.dart';
import '../../widgets/custom_grey_button.dart';
import '../../widgets/custom_white_button.dart';
import '../../widgets/text_input_field.dart';

class AddNewProductPage extends StatelessWidget {
  const AddNewProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Scaffold(
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.zero,
                      child: context.read<BusinessProvider>().isPickedFileEmpty
                          ? Image(
                              fit: BoxFit.cover,
                              height: 0.505.sh,
                              image: AssetImage('assets/icons/commerce_picture_place_holder.png'),
                            )
                          : FutureBuilder<PickedFile?>(
                              future: context.read<BusinessProvider>().pickedFile,
                              builder: (context, snap) {
                                if (snap.hasData) {
                                  return Container(
                                    height: 0.505.sh,
                                    width: double.infinity,
                                    child: Image.file(
                                      File(snap.data!.path),
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                } else if (!snap.hasData) {
                                  return SizedBox(
                                    child: Column(
                                      children: [
                                        Image(
                                          image: AssetImage('assets/icons/commerce_picture_place_holder.png'),
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
                    0.0197.sh.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.082.sw),
                      child: CustomWhiteButton(
                        leading: Image(
                          image: AssetImage(AppImages.editIcon),
                        ),
                        textInput: 'editPhoto'.tr(),
                        onPressed: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (_) => CustomCupertinoDialog(
                              title: 'editPhoto'.tr(),
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
                    0.065.sh.verticalSpace,
                    TextInputField(
                        minLines: 5,
                        maxLines: 5,
                        maxLength: 150,
                        additionalTopPading: 0.04.sh,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: context.watch<BusinessProvider>().productDescription,
                        hintText: 'enterdescription'.tr(),
                        inputLabel: 'productDescription'.tr(),
                        keyboardType: TextInputType.multiline,
                        onChanged: (val) => context.read<BusinessProvider>().setTemperleftProduct()),
                    0.015.sh.verticalSpace,
                    Padding(
                      padding: EdgeInsets.only(
                        right: 0.082.sw,
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          '${context.watch<BusinessProvider>().temperLeftProduct} ' + 'CharactersLeft'.tr(),
                          style: Theme.of(context).textTheme.headline3?.copyWith(
                                fontFamily: 'Montserrat',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
                    0.045.sh.verticalSpace,
                    TextInputField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (phoneNumber) => ValidationItem(val: phoneNumber).validateProductPrice(),
                      controller: context.watch<BusinessProvider>().productPrice,
                      hintText: 'enterPrice'.tr(),
                      inputLabel: 'price'.tr(),
                      keyboardType: TextInputType.phone,
                    ),
                    0.0418.sh.verticalSpace,
                    Padding(
                      padding: EdgeInsets.only(left: 0.082.sw),
                      child: Text(
                        'sector'.tr(),
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                              fontFamily: 'Montserrat',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.4,
                            ),
                      ),
                    ),
                    0.03.sh.verticalSpace,
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.082.sw),
                        child: Container(
                          width: double.infinity,
                          child: Wrap(
                            direction: Axis.horizontal,
                            children: context.watch<BusinessProvider>().chekedsectorsList.keys.map((item) {
                              return GestureDetector(
                                onTap: () {
                                  context.read<BusinessProvider>().setSectorCheked(sectorName: item);
                                },
                                child: Container(
                                  margin: EdgeInsets.all(3.sm),
                                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 13.h),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: (context.watch<BusinessProvider>().chekedsectorsList[item] ?? false)
                                          ? AppColors.lightGreenColor
                                          : AppColors.deepBlueColor,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6.0),
                                    ),
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                            fontFamily: 'Montserrat', fontSize: 14.sp, fontWeight: FontWeight.w700),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: item,
                                              style: TextStyle(
                                                color: AppColors.deepBlueColor,
                                              )),
                                          context.watch<BusinessProvider>().chekedsectorsList[item] ?? false
                                              ? TextSpan(
                                                  text: '  ✓',
                                                  style: TextStyle(
                                                    color: AppColors.lightGreenColor,
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                )
                                              : TextSpan(text: ' '),
                                        ]),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    0.0763.sh.verticalSpace,
                    false
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 0.043.sw),
                            child: SizedBox(
                                width: double.infinity,
                                child: CustomGreyButton(
                                  onPressed: null,
                                  textInput: 'addTheProduc'.tr(),
                                )),
                          )
                        // ignore: dead_code
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 0.043.sw),
                            child: SizedBox(
                                width: double.infinity,
                                child: CustomBlueButton(
                                  onPressed: () {
                                    var json = jsonEncode(Product(
                                      productName: context.read<BusinessProvider>().product.text,
                                      productImage:
                                          "data:image/jpeg;base64,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",
                                      productPrice: 99.0,
                                    ).toJson());
                                    Navigator.pushNamed(context, AppRoutes.searchProductPage,
                                        arguments: {'currentRoute': 'addNewProductpage'});
                                  },
                                  textInput: 'addTheProduc'.tr(),
                                )),
                          ),
                    0.0022.sh.verticalSpace,
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 0.067.sw,
                top: 0.0689,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'cancel'.tr(),
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
