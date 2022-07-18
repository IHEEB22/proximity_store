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
import 'package:proximitystore/widgets/text_input_decoration.dart';

class SheetGeolocalisationOutsideParis extends StatefulWidget {
  @override
  State<SheetGeolocalisationOutsideParis> createState() => _SheetGeolocalisationOutsideParisState();
}

class _SheetGeolocalisationOutsideParisState extends State<SheetGeolocalisationOutsideParis> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    LocalistaionControllerprovider().emailTextEditingController.dispose();
    LocalistaionControllerprovider().townTextFormFieldController.dispose();
    super.dispose();
  }

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
              Padding(
                padding: EdgeInsets.only(
                  left: 0.042.sw,
                  bottom: 0.0053.sh,
                ),
                child: Text(
                  'addEmailAddress'.tr(),
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                        fontFamily: 'Montserrat',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.4,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.042.sw),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        height: 1.2,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                      ),
                  keyboardType: TextInputType.emailAddress,
                  controller: LocalistaionControllerprovider().emailTextEditingController,
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
                  'addTown'.tr(),
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                        fontFamily: 'Montserrat',
                        color: AppColors.blueColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
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
                    } else {
                      context.read<LocalistaionControllerprovider>().setIsTownHasFocus(hasFocus);
                    }
                  },
                  child: TextFormField(
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          height: 1.2,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                        ),
                    keyboardType: TextInputType.emailAddress,
                    controller: context.read<LocalistaionControllerprovider>().townTextFormFieldController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: textInputDecoration.copyWith(
                      hintText: 'town'.tr(),
                    ),
                    validator: (ville) => ValidationItem(val: ville).validateTown(
                        context: context,
                        town: context.read<LocalistaionControllerprovider>().townTextFormFieldController.text),
                    onChanged: (value) => context.read<LocalistaionControllerprovider>().setIsTownEmpty(value),
                  ),
                ),
              ),
              Wrap(
                children: <Widget>[
                  Visibility(
                    child: AutoCompleteSuggestions(),
                    visible: context.watch<LocalistaionControllerprovider>().isTownNotEmpty &&
                        context.watch<LocalistaionControllerprovider>().isTownHasFocus,
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
