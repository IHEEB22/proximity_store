import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:proximitystore/constant/constant_proprities/prox_colors.dart';

import '../constant/constant widgets/TextInputDecoration.dart';
import '../providers/localistaion_controller_provider.dart';

class LocationSearchDialog extends StatelessWidget {
  final GoogleMapController? mapController;
  const LocationSearchDialog({required this.mapController});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: SizedBox(
        child: TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
            controller: _controller,
            textInputAction: TextInputAction.search,
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.streetAddress,
            // autofocus: true,
            decoration: textInputDecoration.copyWith(
              hintText: 'ville',
            ),
          ),
          suggestionsCallback: (pattern) async {
            return await context.read<LocalistaionControllerprovider>().searchLocation(context, pattern);
          },
          itemBuilder: (context, Prediction suggestion) {
            return Padding(
              padding: EdgeInsets.zero,
              child: ListTile(
                focusColor: ProxColors.bluegrey,
                dense: true,
                iconColor: ProxColors.deepblue,
                minVerticalPadding: 0,
                contentPadding: EdgeInsets.zero,
                visualDensity: VisualDensity(horizontal: 2, vertical: -4),
                title: Text(
                  suggestion.description ?? "suggestion not found",
                  style: TextStyle(color: ProxColors.deepblue, fontSize: 14.sp),
                  maxLines: 1,
                ),
                leading: Icon(Icons.location_on),
              ),
            );
          },
          onSuggestionSelected: (Prediction suggestion) {},
        ),
      ),
    );
  }
}
