import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proximitystore/config/colors/app_colors.dart';

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
  final _emailController = TextEditingController();
  final _townController = TextEditingController();

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
