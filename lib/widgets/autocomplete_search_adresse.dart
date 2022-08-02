import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:provider/provider.dart';

import '../config/colors/app_colors.dart';
import '../providers/localistaion_controller_provider.dart';

class AutocompleteSearchAdresse extends StatelessWidget {
  const AutocompleteSearchAdresse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(bottom: 0.0055.sh, left: 0.082.sw),
            child: Text(
              'adress'.tr(),
              style: Theme.of(context).textTheme.headline3?.copyWith(
                    fontFamily: 'Montserrat',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.4,
                  ),
            )),
        Consumer<LocalistaionControllerprovider>(
          builder: (context, value, child) => Container(
            padding: EdgeInsets.symmetric(horizontal: 0.082.sw),
            child: TypeAheadFormField<Prediction?>(
              // minCharsForSuggestions: 2,
              onSuggestionSelected: (suggestion) =>
                  context.watch()<LocalistaionControllerprovider>().adress = suggestion,
              loadingBuilder: (context) => CircularProgressIndicator(),
              hideOnEmpty: true,
              suggestionsBoxVerticalOffset: 0.02.sh,
              hideSuggestionsOnKeyboardHide: true,

              suggestionsBoxDecoration: SuggestionsBoxDecoration(
                constraints: BoxConstraints(
                  minHeight: 150,
                  maxHeight: 200,
                ),
                offsetX: 1.02,
                elevation: 2,
              ),
              debounceDuration: Duration(microseconds: 200),

              itemBuilder: (context, suggestion) {
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
              keepSuggestionsOnLoading: false,

              hideOnError: true,
              hideOnLoading: true,
              suggestionsCallback: (pattern) => context.read<LocalistaionControllerprovider>().predictionList,
              textFieldConfiguration: TextFieldConfiguration(
                onChanged: (val) {
                  context.read<LocalistaionControllerprovider>().setAdressValue(val);
                  context.read<LocalistaionControllerprovider>().searchLocation(pattern: val);
                },
                controller: context.watch<LocalistaionControllerprovider>().adress,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      height: 1.2,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat',
                    ),
                decoration: InputDecoration(
                  hintText: 'addAddress'.tr(),
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
      ],
    );
  }
}
