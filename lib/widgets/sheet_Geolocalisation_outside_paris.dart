import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proximitystore/constant/constant_widgets/custom_blue_button.dart';
import 'package:proximitystore/constant/constant_proprities/prox_colors.dart';
import 'package:proximitystore/constant/constant_widgets/TextInputDecoration.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:proximitystore/providers/sheet_provider.dart';
import 'package:proximitystore/services/validation_items.dart';

import 'package:provider/provider.dart';
import 'package:proximitystore/widgets/localisation_search_dialogue.dart';

class SheetGeolocalisationOutsideParis extends StatefulWidget {
  @override
  State<SheetGeolocalisationOutsideParis> createState() => _SheetGeolocalisationOutsideParisState();
}

class _SheetGeolocalisationOutsideParisState extends State<SheetGeolocalisationOutsideParis> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _townController = TextEditingController();
  GoogleMapController? _mapController;
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Wrap(children: <Widget>[
        Column(
          children: [
            0.055.sh.verticalSpace,
            Padding(
              padding: EdgeInsets.only(
                bottom: mediaQueryData.viewInsets.bottom,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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

                    0.02.sh.verticalSpace,
                    Padding(
                      padding: EdgeInsets.only(left: 0.042.sw),
                      child: Text(
                        'Renseignez votre e-mail',
                        style: TextStyle(
                          color: ProxColors.darkblue,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Montserrat',
                          letterSpacing: 0.4,
                        ),
                      ),
                    ),

                    0.0012.sh.verticalSpace,
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
                    0.01.sh.verticalSpace,
                    Padding(
                      padding: EdgeInsets.only(left: 0.042.sw),
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
                      child: LocationSearchDialog(mapController: _mapController),
                    ),
                    // maybe wrong
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
                              () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pop(context);
                                } else if (_formKey.currentState?.validate() ?? false) {
                                  context.read<SheetProvider>().addsheetInputs(
                                        email: _emailController.text,
                                        town: _townController.text,
                                      );
                                  Navigator.pop(context);
                                } else {
                                  Navigator.pop(context);
                                }
                                ;
                              };
                            }),
                      ),
                    ),
                    0.015.sh.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _townController.dispose();

    super.dispose();
  }
}
