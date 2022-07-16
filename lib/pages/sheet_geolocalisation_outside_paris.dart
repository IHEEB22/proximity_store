import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proximitystore/constant/constant_widgets/custom_blue_button.dart';
import 'package:proximitystore/constant/constant_proprities/prox_colors.dart';
import 'package:proximitystore/constant/constant_widgets/TextInputDecoration.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proximitystore/providers/localistaion_controller_provider.dart';

import 'package:proximitystore/providers/sheet_provider.dart';
import 'package:proximitystore/services/validation_items.dart';

import 'package:provider/provider.dart';
import 'package:proximitystore/shared/widgets/autocomplete_suggestions.dart';

class SheetGeolocalisationOutsideParis extends StatefulWidget {
  @override
  State<SheetGeolocalisationOutsideParis> createState() => _SheetGeolocalisationOutsideParisState();
}

class _SheetGeolocalisationOutsideParisState extends State<SheetGeolocalisationOutsideParis> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _townController = TextEditingController();
  final TextEditingController? _townTextFormFieldController = TextEditingController();
  GoogleMapController? _mapController;
  @override
  Widget build(BuildContext context) {
    // Provider.of<LocalistaionControllerprovider>(context, listen: false);
    return Consumer<LocalistaionControllerprovider>(
      builder: (context, value, child) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              0.02.sh.verticalSpace,
              Center(
                child: Image(
                  width: 0.105.sw,
                  image: AssetImage(
                    'assets/icons/LineSheet.png',
                  ),
                ),
              ),
              0.054.sh.verticalSpace,
              Padding(
                padding: EdgeInsets.only(
                  left: 0.042.sw,
                  bottom: 0.0053.sh,
                ),
                child: Text(
                  'Renseignez votre e-mail',
                  style: TextStyle(
                    color: ProxColors.deepblue,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Montserrat',
                    letterSpacing: 0.4,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.042.sw),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: textInputDecoration.copyWith(
                    hintText: 'e-mail',
                  ),
                  validator: (email) => ValidationItem(val: email).validateEmail(),
                ),
              ),
              0.02.sh.verticalSpace,
              Padding(
                padding: EdgeInsets.only(
                  left: 0.042.sw,
                  bottom: 0.0053.sh,
                ),
                child: Text(
                  'Renseignez votre ville',
                  style: TextStyle(
                    color: ProxColors.blue,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.4,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              0.0012.sh.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.042.sw),
                child: Focus(
                  onFocusChange: (hasFocus) {
                    if (hasFocus) {
                      context.read<LocalistaionControllerprovider>().setIsTownHasFocus(hasFocus);
                      print("has focused:$hasFocus");
                    } else {
                      context.read<LocalistaionControllerprovider>().setIsTownHasFocus(hasFocus);
                      print("has focused:$hasFocus");
                    }
                  },
                  child: TextFormField(
                    // focusNode: context.read<LocalistaionControllerprovider>().townFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    controller: context.read<LocalistaionControllerprovider>().townTextFormFieldController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: textInputDecoration.copyWith(
                      hintText: 'ville',
                    ),
                    validator: (ville) => ValidationItem(val: ville).validateTown(context),
                    onChanged: ((value) {
                      context.read<LocalistaionControllerprovider>().setIsTownEmpty(value);
                    }),
                  ),
                ),
              ),
              Wrap(
                children: <Widget>[
                  Visibility(
                    child: AutoCompleteSuggestions(),
                    visible: context.watch<LocalistaionControllerprovider>().isTownNotEmpty &&
                        (context.watch<LocalistaionControllerprovider>().isTownHasFocus),
                  ),
                ],
              ),
              0.04.sh.verticalSpace,
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.066.sw,
                  ),
                  child: CustomBlueButton(
                    textInput: 'Prévenez-moi',
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        Navigator.pop(context);
                      } else {
                        context.read<SheetProvider>().addsheetInputs(
                              email: _emailController.text,
                              town: _townController.text,
                            );
                      }
                    },
                  ),
                ),
              ),
              0.015.sh.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _townController.dispose();

    super.dispose();
  }
}
