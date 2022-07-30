import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/config/images/app_images.dart';
import 'package:proximitystore/models/product.dart';
import 'package:proximitystore/pages/commerce/add_product_sheet.dart';
import 'package:proximitystore/providers/business_provider.dart';

import '../../config/colors/app_colors.dart';
import '../../widgets/widgets.dart';
import 'authocomplete_business_produt.dart';

class SearchOrAddProductPage extends StatefulWidget {
  SearchOrAddProductPage({Key? key}) : super(key: key);

  @override
  State<SearchOrAddProductPage> createState() => _SearchOrAddProductPageState();
}

class _SearchOrAddProductPageState extends State<SearchOrAddProductPage> {
  void showCongratsBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      context: context,
      builder: (BuildContext context) => AddProductSheet(),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showCongratsBottomSheet(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundImage(),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomBackButtonIcon(),
                      Padding(
                        padding: EdgeInsets.only(left: 0.82.sw, top: 0.02.sh),
                        child: Image(
                          height: 0.0295.sh,
                          width: 0.064.sw,
                          image: AssetImage('assets/icons/user.png'),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      0.085.sw,
                      0.055.sh,
                      0.028.sw,
                      0.052.sh,
                    ),
                    child: Text(
                      'myProducts'.tr(),
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 25.sp,
                          ),
                    ),
                  ),
                  Stack(
                    children: [
                      0.035.sh.verticalSpace,
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: 0.0426.sw,
                                right: 0.025.sw,
                              ),
                              child: TypeAheadFormField<Product?>(
                                hideSuggestionsOnKeyboardHide: false,
                                suggestionsBoxDecoration: SuggestionsBoxDecoration(
                                  offsetX: 1.02,
                                  elevation: 5,
                                ),
                                debounceDuration: Duration(microseconds: 500),
                                onSuggestionSelected: (Product? sugesstion) {},
                                itemBuilder: (context, Product? suggestion) {
                                  final product = suggestion!;

                                  return Card(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                        Radius.circular(8.r),
                                      )),
                                      height: 123,
                                      width: 324,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 123,
                                            width: 109,
                                            child: Image(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(suggestion.productImage),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.only(left: 0.0321.sw),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(right: 0.0508.sw, top: 0.0246.sh),
                                                      child: Text(suggestion.productName.toUpperCase(),
                                                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                                              fontFamily: 'Montserrat',
                                                              fontSize: 14.sp,
                                                              height: 1.4,
                                                              color: AppColors.darkBlueColor,
                                                              letterSpacing: 0.4)),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      if (suggestion.productStatus == 'activé')
                                                        Container(
                                                          margin: EdgeInsets.only(right: 0.041.sw),
                                                          child: Center(
                                                            child: Padding(
                                                              padding: EdgeInsets.symmetric(
                                                                  horizontal: 0.016.sw, vertical: 0.0049.sh),
                                                              child: Text(
                                                                'activé',
                                                                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                                                      fontFamily: 'Montserrat',
                                                                      fontSize: 10.sp,
                                                                      color: AppColors.lightGreenColor,
                                                                      fontWeight: FontWeight.w400,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          height: 0.04.sh,
                                                          width: 0.1013.sw,
                                                          color: AppColors.transparentGreenColor,
                                                        ),
                                                      if (suggestion.productStatus == 'désactivé')
                                                        Container(
                                                          child: Center(
                                                            child: Padding(
                                                              padding: EdgeInsets.symmetric(
                                                                  horizontal: 0.016.sw, vertical: 0.0049.sh),
                                                              child: Text(
                                                                'désactivé',
                                                                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                                                    fontFamily: 'Montserrat',
                                                                    fontSize: 10.sp,
                                                                    fontWeight: FontWeight.w400,
                                                                    color: AppColors.deepBlueColor),
                                                              ),
                                                            ),
                                                          ),
                                                          height: 0.04.sh,
                                                          width: 0.1413.sw,
                                                          color: AppColors.GreyColor,
                                                        ),
                                                      if (suggestion.productStatus == 'en attente')
                                                        Container(
                                                          decoration: BoxDecoration(
                                                            border: Border.all(
                                                              color: AppColors.lightPurpleColor,
                                                            ),
                                                          ),
                                                          child: Center(
                                                            child: Padding(
                                                              padding: EdgeInsets.symmetric(
                                                                  horizontal: 0.012.sw, vertical: 0.0049.sh),
                                                              child: Text(
                                                                'en attente',
                                                                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                                                      fontFamily: 'Montserrat',
                                                                      fontSize: 10.sp,
                                                                      fontWeight: FontWeight.w400,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          height: 0.04.sh,
                                                          width: 0.1413.sw,
                                                        ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                          left: 0.31.sw,
                                                        ),
                                                        child: Container(
                                                          child: Text(
                                                            suggestion.productPrice.toString() + ' €',
                                                            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                                                  fontSize: 18.sp,
                                                                  fontWeight: FontWeight.w800,
                                                                  color: AppColors.darkBlueColor,
                                                                ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  0.0135.sh.verticalSpace,
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                noItemsFoundBuilder: (context) => Container(
                                  child: Text('produit n\'existe pas'),
                                ),
                                suggestionsCallback: (pattern) async {
                                  return await context.read<BusinessProvider>().getProductSuggestion(pattern);
                                },
                                textFieldConfiguration: TextFieldConfiguration(
                                  // scrollPadding: EdgeInsets.only(bottom: 5),

                                  decoration: InputDecoration(
                                    isDense: true,
                                    prefixIconConstraints: BoxConstraints(maxHeight: 0.028.sh, maxWidth: 0.1.sw),
                                    prefixIcon: Image(
                                        height: 0.12.sh,
                                        width: 0.2.sw,
                                        image: AssetImage(
                                          AppImages.searchIcon,
                                        )),
                                    hintText: 'searchProduct'.tr(),
                                    hintStyle: TextStyle(
                                      color: AppColors.blueGreyColor,
                                      fontFamily: 'Montserrat',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    errorStyle: TextStyle(
                                      color: AppColors.pinkColor,
                                      fontFamily: 'Montserrat',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.2,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 0.0426.sw, vertical: 0.0166.sh),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.sm),
                                      ),
                                      borderSide: BorderSide(
                                        color: AppColors.blueGreyColor,
                                        width: 1,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.deepBlueColor,
                                        width: 1,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.pinkColor,
                                        width: 1,
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.pinkColor,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  controller: context.watch<BusinessProvider>().productTextEditingController,
                                ),
                              ),
                            ),
                            // TextInputField(
                            //   prefixDisabled: true,
                            //   keyboardType: TextInputType.emailAddress,
                            //   controller: context.watch<BusinessProvider>().product,
                            //   hintText: 'searchProduct'.tr(),
                            //   prefixIcon: Padding(
                            //     padding: EdgeInsets.only(
                            //       right: 0.025.sw,
                            //     ),
                            //     child: Image(
                            //       height: 0.025.sh,
                            //       width: 0.064.sw,
                            //       image: AssetImage('assets/icons/search_icon.png'),
                            //     ),
                            //   ),
                            // // ),
                            0.0751.sh.verticalSpace,
                            SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 0.0853.sw),
                                    child: Text(
                                      'itsVeryEmptyHere!'.tr(),
                                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                            fontFamily: 'Montserrat',
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                            height: 1.4.sp,
                                          ),
                                    ),
                                  ),
                                  0.0246.sh.verticalSpace,
                                  Padding(
                                    padding: EdgeInsets.only(left: 0.0853.sw, right: 0.24.sw),
                                    child: Text(
                                      'thisIsWhereYouWillFindTheProductsYouAdd'.tr(),
                                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                            fontFamily: 'Montserrat',
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                            height: 1.4.sp,
                                          ),
                                    ),
                                  ),
                                  0.465.sh.verticalSpace,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.082.sw, vertical: 0.7.sh),
                          child: SizedBox(
                              width: double.infinity,
                              child: CustomBlueButton(textInput: 'addMyNewProduct'.tr(), onPressed: () {})),
                        ),
                      ),
                      // Positioned(
                      //   top: 50,
                      //   child: Padding(
                      //     padding: EdgeInsets.symmetric(horizontal: 0.082.sw),
                      //     child: SizedBox(
                      //         width: double.infinity,
                      //         child: CustomBlueButton(textInput: 'addMyNewProduct'.tr(), onPressed: () {})),
                      //   ),
                      // ),
                      0.035.sh.verticalSpace,
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
