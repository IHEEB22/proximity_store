import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:proximitystore/constant/constant_proprities/prox_colors.dart';

import 'package:provider/provider.dart';
import '../constant/constant widgets/TextInputDecoration.dart';
import '../providers/localistaion_controller_provider.dart';
import '../services/validation_items.dart';

class LocationSearchDialog extends StatefulWidget {
  final GoogleMapController? mapController;
  const LocationSearchDialog({
    required this.mapController,
  });

  @override
  State<LocationSearchDialog> createState() => _LocationSearchDialogState();
}

class _LocationSearchDialogState extends State<LocationSearchDialog> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: SizedBox(
        child: Form(
          key: _formKey,
          child: TypeAheadFormField<Prediction>(
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              hideOnError: true,
              textFieldConfiguration: TextFieldConfiguration(
                controller: _controller,
                textInputAction: TextInputAction.search,

                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.streetAddress,
                // noItemsFoundBuilder: Spiner(),
                // autofocus: true,
                decoration: textInputDecoration.copyWith(
                  hintText: 'ville',
                ),
              ),
              suggestionsCallback: (pattern) async {
                return await context.read<LocalistaionControllerprovider>().searchLocation(context, pattern);
              },
              itemBuilder: (context, Prediction? suggestion) {
                return Padding(
                  padding: EdgeInsets.zero,
                  child: Card(
                    elevation: 0.2.sm,
                    margin: EdgeInsets.all(3.sm),
                    child: ListTile(
                      focusColor: ProxColors.bluegrey,
                      dense: true,
                      iconColor: ProxColors.deepblue,
                      minVerticalPadding: 0,
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity(horizontal: 2, vertical: -3.2),
                      title: Text(
                        suggestion!.description ?? "suggestion not found",
                        style: TextStyle(color: ProxColors.deepblue, fontSize: 14.sp),
                        maxLines: 1,
                      ),
                      leading: Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                        ),
                        child: Icon(
                          size: 18.sm,
                          Icons.location_on,
                        ),
                      ),
                    ),
                  ),
                );
              },
              onSuggestionSelected: (Prediction? suggestion) =>
                  _controller.text = suggestion!.description ?? "suggestion not found",
              validator: (value) {
                ValidationItem(val: value).validateTown(context);
              }),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}
