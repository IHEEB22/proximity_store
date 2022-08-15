import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:proximitystore/config/images/app_images.dart';

import 'package:proximitystore/providers/localistaion_controller_provider.dart';

import 'package:proximitystore/providers/sheet_provider.dart';
import 'package:proximitystore/services/validation_items.dart';

import 'package:provider/provider.dart';
import 'package:proximitystore/widgets/autocomplete_search_adresse.dart';
import 'package:proximitystore/widgets/custom_blue_button.dart';
import 'package:proximitystore/widgets/text_input_field.dart';

class SheetGeolocalisationOutsideParis extends StatefulWidget {
  @override
  State<SheetGeolocalisationOutsideParis> createState() => _SheetGeolocalisationOutsideParisState();
}

class _SheetGeolocalisationOutsideParisState extends State<SheetGeolocalisationOutsideParis> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalistaionControllerprovider>(
      builder: (context, value, child) => SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
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
                    TextInputField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) => ValidationItem(val: email).validateEmail(),
                      controller: context.read<LocalistaionControllerprovider>().emailTextEditingController,
                      hintText: 'e-mail'.tr(),
                      inputLabel: 'e-mail'.tr(),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    0.02.sh.verticalSpace,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 100,
                          child: AutocompleteSearchAdresse(
                            onSuggestionSelected: (suggestion) {
                              context.read<LocalistaionControllerprovider>().addressSelected(
                                    suggestion: suggestion ?? Prediction(description: 'adress n\'éxiste pas'),
                                  );
                              context.read<LocalistaionControllerprovider>().setIsAdressSelected();
                            },
                            symetricPadding: 0.0853,
                            searchPrefix: false,
                            labelEnabled: true,
                            hintText: 'town'.tr(),
                            labelText: 'addTown'.tr(),
                          ),
                        ),
                        context.read<LocalistaionControllerprovider>().space()
                            ? 0.38.sh.verticalSpace
                            : 0.sh.verticalSpace
                      ],
                    ),
                    // 0.04.sh.verticalSpace,
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
                              context.read<LocalistaionControllerprovider>().disposeAdressValue();
                              context.read<LocalistaionControllerprovider>().disposeEmailValue();
                            } else {
                              context.read<SheetProvider>().addsheetInputs(
                                    email:
                                        context.read<LocalistaionControllerprovider>().emailTextEditingController.text,
                                    town: context.read<LocalistaionControllerprovider>().adress.text,
                                  );
                              context.read<LocalistaionControllerprovider>().disposeAdressValue();
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
          ],
        ),
      ),
    );
  }
}
