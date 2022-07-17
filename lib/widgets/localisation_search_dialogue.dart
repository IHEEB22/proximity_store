import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proximitystore/widgets/text_input_decoration.dart';
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
  final TextEditingController _townTextFormFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: _townTextFormFieldController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: textInputDecoration.copyWith(
        hintText: 'ville',
      ),
      validator: (email) => ValidationItem(val: email).validateEmail(),
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      // suggestionsCallback: (pattern) => pattern.isNotEmpty
      //     ? context.read<LocalistaionControllerprovider>().searchLocation(context, pattern)
      //     : Future.value([]),
      // itemBuilder: (context, Prediction? suggestion) {
      //   return Padding(
      //     padding: EdgeInsets.zero,
      //     child: Card(
      //       elevation: 0.2.sm,
      //       margin: EdgeInsets.all(3.sm),
      //       child: ListTile(
      //         focusColor: ProxColors.bluegrey,
      //         dense: true,
      //         iconColor: ProxColors.deepblue,
      //         minVerticalPadding: 0,
      //         contentPadding: EdgeInsets.zero,
      //         visualDensity: VisualDensity(horizontal: 2, vertical: -3.2),
      //         title: Text(
      //           suggestion!.description ?? "suggestion not found",
      //           style: TextStyle(color: ProxColors.deepblue, fontSize: 14.sp),
      //           maxLines: 1,
      //         ),
      //         leading: Padding(
      //           padding: EdgeInsets.only(
      //             left: 16,
      //           ),
      //           child: Icon(
      //             size: 18.sm,
      //             Icons.location_on,
      //           ),
      //         ),
      //       ),
      //     ),
      //   );
      // },
      // onSuggestionSelected: (Prediction? suggestion) =>
      //     _controller.text = suggestion!.description ?? "suggestion not found",
      // validator: (value) {
      //   ValidationItem(val: value).validateTown(context);
      // }),
    );
  }
}
