import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/config/routes/routes.dart';
import 'package:proximitystore/services/validation_items.dart';

import '../config/colors/app_colors.dart';
import '../config/images/app_images.dart';
import '../providers/localistaion_controller_provider.dart';

class AutocompleteSearchAdresse extends StatelessWidget {
  final double symetricPadding;
  final bool searchPrefix;
  String? hintText;
  void Function(String)? onChanged;
  void Function(Prediction?) onSuggestionSelected;
  final String labelText;

  final bool labelEnabled;
  bool? hideKeyboard;
  AutocompleteSearchAdresse(
      {Key? key,
      this.hintText,
      required this.labelText,
      required this.symetricPadding,
      required this.searchPrefix,
      required this.labelEnabled,
      this.onChanged,
      required this.onSuggestionSelected,
      this.hideKeyboard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelEnabled
            ? Padding(
                padding: EdgeInsets.only(bottom: 0.0055.sh, left: 0.082.sw),
                child: Text(
                  labelText,
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                        fontFamily: 'Montserrat',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.4,
                      ),
                ))
            : SizedBox.shrink(),
        Consumer<LocalistaionControllerprovider>(
          builder: (context, value, child) => Container(
            padding: EdgeInsets.symmetric(horizontal: symetricPadding.sw),
            child: Focus(
              onFocusChange: (hasFocus) {},
              child: TypeAheadFormField<Prediction?>(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                errorBuilder: (context, error) => SizedBox.shrink(
                  child: Text('erreur'),
                ),
                validator: (addres) => ValidationItem(val: addres)
                    .validateTown(town: context.read<LocalistaionControllerprovider>().adress.text, context: context),
                onSuggestionSelected: onSuggestionSelected,

                //  (suggestion) {
                //   context.read<LocalistaionControllerprovider>().addressSelected(
                //         suggestion: suggestion ?? Prediction(description: 'adress n\'éxiste pas'),
                //       );
                //   context.read<LocalistaionControllerprovider>().setIsAdressSelected();
                //   if (labelEnabled == false) {
                //     Navigator.pushNamed(context, AppRoutes.geolocationEditAdressePage);
                //   }
                // },
                loadingBuilder: (context) => Center(child: CircularProgressIndicator()),
                suggestionsBoxVerticalOffset: 0.022.sh,
                hideSuggestionsOnKeyboardHide: false,
                suggestionsBoxDecoration: SuggestionsBoxDecoration(
                  color: AppColors.invisibleColor,
                  constraints: BoxConstraints(
                    maxHeight: 200,
                  ),
                  offsetX: 1.05,
                  elevation: 0,
                ),
                debounceDuration: Duration(microseconds: 1200),
                itemBuilder: (context, Prediction? suggestion) {
                  final location = suggestion!;
                  return Card(
                    elevation: 0.2.sm,
                    margin: EdgeInsets.all(3.sm),
                    child: ListTile(
                      iconColor: AppColors.deepBlueColor,
                      minVerticalPadding: 0,
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity(vertical: -3.2),
                      leading: Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                        ),
                        child: Icon(
                          size: 18.sm,
                          Icons.location_on,
                        ),
                      ),
                      title: Text(
                        location.description ?? '',
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  );
                },
                noItemsFoundBuilder: (context) => Container(
                  child: Center(
                    child: Text(
                      'adress n\'éxiste pas',
                      style: Theme.of(context).textTheme.headline3?.copyWith(
                            fontFamily: 'Montserrat',
                            fontSize: 18.sp,
                            color: AppColors.blueGreyColor,
                          ),
                    ),
                  ),
                ),
                suggestionsCallback: context.read<LocalistaionControllerprovider>().searchLocation,
                textFieldConfiguration: TextFieldConfiguration(
                  autofocus: true,
                  onChanged: onChanged,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(
                      RegExp(
                          '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
                    ),
                  ],
                  controller: context.watch<LocalistaionControllerprovider>().adress,
                  onTap: () {
                    context.read<LocalistaionControllerprovider>().disposeAdressListeners();
                  },
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        height: 1.2,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                      ),
                  decoration: InputDecoration(
                    isDense: searchPrefix,
                    prefixIconConstraints: searchPrefix ? BoxConstraints(maxHeight: 0.028.sh, maxWidth: 0.1.sw) : null,
                    prefixIcon: searchPrefix
                        ? Image(
                            height: 0.12.sh,
                            width: 0.2.sw,
                            image: AssetImage(
                              AppImages.searchIcon,
                            ))
                        : null,
                    hintText: hintText ?? 'addAddress'.tr(),
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
            ),
          ),
        ),
      ],
    );
  }
}
