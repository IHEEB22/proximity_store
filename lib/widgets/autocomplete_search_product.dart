import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

import '../config/colors/app_colors.dart';
import '../config/images/app_images.dart';
import '../models/product.dart';
import '../providers/business_provider.dart';

class AutocompleteSearchProduct extends StatelessWidget {
  const AutocompleteSearchProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 0.0426.sw,
        right: 0.025.sw,
      ),
      child: TypeAheadFormField<Product?>(
        minCharsForSuggestions: 2,
        suggestionsBoxVerticalOffset: 0.04.sh,
        hideSuggestionsOnKeyboardHide: false,
        suggestionsBoxDecoration: SuggestionsBoxDecoration(
          constraints: BoxConstraints(
            minHeight: 600,
          ),
          offsetX: 1.02,
          // elevation: 4,
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
              height: 0.2.sh,
              width: 0.864.sw,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 0.32.sw,
                    height: 0.2.sh,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: suggestion.productImage,
                      placeholder: (context, url) => new CircularProgressIndicator(),
                      errorWidget: (context, url, error) => new Icon(Icons.error),
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
                                      padding: EdgeInsets.symmetric(horizontal: 0.016.sw, vertical: 0.0049.sh),
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
                                  width: 0.12.sw,
                                  color: AppColors.transparentGreenColor,
                                ),
                              if (suggestion.productStatus == 'désactivé')
                                Container(
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 0.012.sw, vertical: 0.0049.sh),
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
                                  width: 0.15.sw,
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
                                      padding: EdgeInsets.symmetric(horizontal: 0.012.sw, vertical: 0.0049.sh),
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
                                  width: 0.16.sw,
                                ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 0.252.sw,
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
          child: Center(
            child: Text(
              'Produit n\'éxiste pas',
              style: Theme.of(context).textTheme.headline3?.copyWith(
                    fontFamily: 'Montserrat',
                    fontSize: 18.sp,
                    color: AppColors.blueGreyColor,
                  ),
            ),
          ),
        ),
        suggestionsCallback: context.read<BusinessProvider>().getProductSuggestion,
        textFieldConfiguration: TextFieldConfiguration(
          autofocus: context.watch<BusinessProvider>().isProducFieldInFocus ? true : false,
          controller: context.watch<BusinessProvider>().productTextEditingController,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                height: 1.2,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'Montserrat',
              ),
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
        ),
      ),
    );
  }
}
