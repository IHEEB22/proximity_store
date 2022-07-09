import 'package:flutter/material.dart';
import 'package:proximitystore/constant/ConstantWidgets/custom_button.dart';
import 'package:proximitystore/constant/ProxColors.dart';
import 'package:proximitystore/constant/TextInputDecoration.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:proximitystore/providers/sheet_provider.dart';
import 'package:proximitystore/services/validation_items.dart';

import 'package:provider/provider.dart';

class SheetGeolocalisationOutsideParis extends StatefulWidget {
  @override
  State<SheetGeolocalisationOutsideParis> createState() => _SheetGeolocalisationOutsideParisState();
}

class _SheetGeolocalisationOutsideParisState extends State<SheetGeolocalisationOutsideParis> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _townController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Wrap(children: <Widget>[
      Padding(
        padding: EdgeInsets.only(
          bottom: mediaQueryData.viewInsets.bottom,
        ),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              0.005.sh.verticalSpace,
              SizedBox(
                // width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.448.sw),
                  child: Image(
                    width: 0.105.sw,
                    height: 0.08.sh,
                    image: AssetImage(
                      'assets/icons/LineSheet.png',
                    ),
                  ),
                ),
              ),
              // sheet_heigh :324
              0.02.sh.verticalSpace,
              Padding(
                padding: EdgeInsets.only(left: 0.042.sw),
                child: Text(
                  'Renseignez votre e-mail',
                  style: TextStyle(
                    color: ProxColors.darkblue,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),

              0.0012.sh.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.042.sw),
                child: TextFormField(
                  controller: _emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: textInputDecoration.copyWith(
                    hintText: 'e-mail',
                    // errorText: ,
                  ),
                  validator: (email) => ValidationItem(val: email).validateEmail(),
                ),
              ),
              0.01.sh.verticalSpace,
              Padding(
                padding: EdgeInsets.only(left: 0.042.sw),
                child: Text(
                  'Renseignez votre ville',
                  style: TextStyle(
                    color: ProxColors.darkblue,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              0.0012.sh.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.042.sw),
                child: TextFormField(
                  controller: _townController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: textInputDecoration.copyWith(
                    hintText: 'ville',
                  ),
                  validator: (ville) => ValidationItem(val: ville).validateTown(),
                ),
              ),
              // maybe wrong
              0.04.sh.verticalSpace,
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.066.sw,
                  ),
                  child: CustomButton(
                      textInput: 'Prévenez-moi',
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          context.read<SheetProvider>().addsheetInputs(
                                email: _emailController.text,
                                town: _townController.text,
                              );
                          Navigator.pop(context);
                        } else {
                          Navigator.pop(context);
                        }
                      }),
                ),
              ),
              0.0046.sh.verticalSpace,
            ],
          ),
        ),
      ),
    ]);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _townController.dispose();
    // ignore: avoid_print

    super.dispose();
  }
}
