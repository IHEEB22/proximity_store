import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:provider/provider.dart';
import 'package:proximitystore/config/routes/routes.dart';
import 'package:proximitystore/models/client_procduct.dart';
import 'package:proximitystore/providers/client_provider.dart';

import '../config/colors/app_colors.dart';
import '../config/images/app_images.dart';
import '../providers/business_provider.dart';

class AutocompleteSearchClientProduct extends StatelessWidget {
  const AutocompleteSearchClientProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ClientProvider>(
      builder: (context, value, child) => Column(
        children: [
          Container(
            // height: context.read<ClientProvider>().hideSuggestion ? 9.sh : 0.15.sh,
            child: TypeAheadFormField<ClientProduct>(
              hideKeyboard: context.watch<ClientProvider>().hideKeyBord,
              suggestionsBoxVerticalOffset: context.read<ClientProvider>().hideSuggestion ? 9.sh : 0.14.sh,
              hideSuggestionsOnKeyboardHide: false,
              suggestionsBoxDecoration: SuggestionsBoxDecoration(
                color: AppColors.invisibleColor,
                constraints: BoxConstraints(
                  minHeight: 1.sh,
                  minWidth: 0.912.sw,
                ),
                offsetX: -26,
                elevation: 0,
              ),
              debounceDuration: Duration(microseconds: 500),
              onSuggestionSelected: (ClientProduct sugesstion) {
                context.read<ClientProvider>().setProductSelected(product: sugesstion);
                Navigator.pushNamed(context, AppRoutes.productDescriptionPage);
              },
              itemBuilder: (context, ClientProduct suggestion) {
                final product = suggestion;

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
                      mainAxisAlignment: MainAxisAlignment.end,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 0.05.sw, top: 0.0246.sh),
                                    child: Text(
                                      suggestion.productName.toUpperCase(),
                                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                            fontFamily: 'Montserrat',
                                            fontSize: 13.5.sp,
                                            height: 1.2,
                                            color: AppColors.darkBlueColor,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 22),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 0.04.sh,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: AppColors.whiteColor),
                                          color: AppColors.tranparentPinkWhiteColor,
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 0.012.sw, vertical: 0.0049.sh),
                                            child: Text(
                                              suggestion.storeFarDestination,
                                              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 10.sp,
                                                    color: AppColors.pinkColor,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        suggestion.productPrice.toString() + ' €',
                                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w800,
                                              color: AppColors.darkBlueColor,
                                            ),
                                      ),
                                    ],
                                  ),
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
                height: 500,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0.08.sh),
                        child: Text(
                          'noResult'.tr(),
                          style: Theme.of(context).textTheme.headline2?.copyWith(
                                color: AppColors.darkBlueColor,
                              ),
                        ),
                      ),
                      0.1.sh.verticalSpace,
                      Center(
                        child: Text(
                          'Ce produit se fait rare par ici !'.tr(),
                          style: Theme.of(context).textTheme.headline4?.copyWith(
                                fontFamily: 'Montserrat',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.darkBlueColor,
                              ),
                        ),
                      ),
                      0.04.sh.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.08.sw),
                        child: Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: Theme.of(context).textTheme.headline4?.copyWith(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16.sp,
                                    height: 1.2,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.darkBlueColor,
                                  ),
                              children: <TextSpan>[
                                TextSpan(text: 'thereAreNoProductsMatching'.tr()),
                                TextSpan(
                                    text: ' “' + context.watch<ClientProvider>().labelTextController.text + '” ',
                                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp)),
                                TextSpan(text: 'dans les magasins autour de vous actuellement'.tr()),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              suggestionsCallback: (query) async {
                return await context.read<ClientProvider>().getProductSuggestion(query: query, context: context);
              },
              textFieldConfiguration: TextFieldConfiguration(
                onTap: () {
                  context.read<ClientProvider>().hidekeyBord();
                },
                enabled: !context.watch<ClientProvider>().hideSuggestion,
                autofocus: true,
                maxLength: 8,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(
                    RegExp(
                        '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
                  ),
                ],
                controller: context.read<ClientProvider>().labelTextController,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      height: 1.2,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat',
                    ),
                decoration: InputDecoration(
                  counterText: '',
                  isDense: true,
                  prefixIconConstraints: BoxConstraints(maxHeight: 0.028.sh, maxWidth: 0.1.sw),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 0.018.sw),
                    child: GestureDetector(
                      onTap: () => context.read<ClientProvider>().setLabelValue(''),
                      child: Image(
                          height: 0.2.sh,
                          width: 0.2.sw,
                          image: AssetImage(
                            AppImages.xIcon,
                          )),
                    ),
                  ),
                  suffixIconConstraints: BoxConstraints(maxHeight: 26, maxWidth: 26),
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
                  contentPadding: EdgeInsets.symmetric(horizontal: 0.0426.sw, vertical: 0.01847.sh),
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
          ),
          0.0394.sh.verticalSpace,
        ],
      ),
    );
  }
}
