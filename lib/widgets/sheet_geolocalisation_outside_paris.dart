import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proximitystore/config/colors/app_colors.dart';
import 'package:proximitystore/config/images/app_images.dart';

import 'package:proximitystore/providers/localistaion_controller_provider.dart';

import 'package:proximitystore/providers/sheet_provider.dart';
import 'package:proximitystore/services/validation_items.dart';

import 'package:provider/provider.dart';
import 'package:proximitystore/widgets/autocomplete_suggestions.dart';
import 'package:proximitystore/widgets/custom_blue_button.dart';
import 'package:proximitystore/widgets/text_input_field.dart';

import '../utils/input_formatter.dart';

class SheetGeolocalisationOutsideParis extends StatefulWidget {
  @override
  State<SheetGeolocalisationOutsideParis> createState() => _SheetGeolocalisationOutsideParisState();
}

class _SheetGeolocalisationOutsideParisState extends State<SheetGeolocalisationOutsideParis> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                  image: AssetImage(
                    AppImages.lineSheet,
                  ),
                  width: 0.105.sw,
                ),
              ),
              0.054.sh.verticalSpace,
              // Padding(
              //   padding: EdgeInsets.only(

              TextInputField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) => ValidationItem(val: email).validateEmail(),
                controller: context.watch<LocalistaionControllerprovider>().emailTextEditingController,
                hintText: 'e-mail'.tr(),
                inputLabel: 'e-mail'.tr(),
                keyboardType: TextInputType.emailAddress,
              ),
              0.02.sh.verticalSpace,

              Focus(
                onFocusChange: (hasFocus) => context.read<LocalistaionControllerprovider>().setIsTownHasFocus(hasFocus),
                child: TextInputField(
                  inputLabel: 'addTown'.tr(),
                  controller: context.watch<LocalistaionControllerprovider>().townTextFormFieldController,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (ville) => ValidationItem(val: ville).validateTown(
                    context: context,
                    town: context.read<LocalistaionControllerprovider>().townTextFormFieldController.text,
                  ),
                  onChanged: (value) => context.read<LocalistaionControllerprovider>().setIsTownHasFocus(true),
                  hintText: 'addTown'.tr(),
                ),
              ),

              Wrap(
                children: <Widget>[
                  Visibility(
                    child: AutoCompleteSuggestions(),
                    visible: context.watch<LocalistaionControllerprovider>().isTownHasFocus,
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
                    textInput: 'informMe'.tr(),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        Navigator.pop(context);
                      } else {
                        context.read<SheetProvider>().addsheetInputs(
                              email: context.read<LocalistaionControllerprovider>().emailTextEditingController.text,
                              town: context.read<LocalistaionControllerprovider>().townTextFormFieldController.text,
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
}
