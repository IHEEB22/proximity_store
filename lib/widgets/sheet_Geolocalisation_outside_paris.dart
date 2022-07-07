import 'package:flutter/material.dart';
import 'package:proximitystore/constant/ConstantWidgets/custom_button.dart';
import 'package:proximitystore/constant/ProxColors.dart';
import 'package:proximitystore/constant/TextInputDecoration.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/services/providers.dart';

class SheetGeolocalisationOutsideParis extends StatelessWidget {
  @override

//   @override
//   State<sheet_Geolocalisation_outside_paris> createState() => _sheet_Geolocalisation_outside_parisState();
// }

// class _sheet_Geolocalisation_outside_parisState extends State<sheet_Geolocalisation_outside_paris> {
//   // final AuthService _auth = AuthService();
//   // final _formKey = GlobalKey<FormState>();
//   // String error = '';

//   // text field state
//   // String email = '';
//   // String ville = '';

  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Wrap(children: <Widget>[
      Padding(
        padding: EdgeInsets.only(
          bottom: mediaQueryData.viewInsets.bottom,
        ),
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
                decoration: textInputDecoration.copyWith(
                  hintText: 'e-mail',
                  errorText: '${context.watch<SheetValidation>().email.error}',
                ),
                // validator: (val) => val!.isEmpty ? '' : null,
                onChanged: (val) {
                  context.read<SheetValidation>().changeemail(val);
                },
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
                decoration: textInputDecoration.copyWith(
                  hintText: 'ville',
                  errorText: '${context.watch<SheetValidation>().ville.error}',
                ),

                // validator: (val) => val!.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  context.read<SheetValidation>().changeville(val);
                },
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
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            0.0046.sh.verticalSpace,
          ],
        ),
      ),
    ]);
  }
}
