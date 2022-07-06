import 'package:flutter/material.dart';
import 'package:proximitystore/constant/ConstantWidgets/custom_button.dart';
import 'package:proximitystore/constant/ProxColors.dart';
import 'package:proximitystore/constant/TextInputDecoration.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class sheet_Geolocalisation_outside_paris extends StatefulWidget {
  const sheet_Geolocalisation_outside_paris({Key? key}) : super(key: key);

  @override
  State<sheet_Geolocalisation_outside_paris> createState() =>
      _sheet_Geolocalisation_outside_parisState();
}

class _sheet_Geolocalisation_outside_parisState
    extends State<sheet_Geolocalisation_outside_paris> {
  // final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  // text field state
  String email = '';
  String ville = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(children: <Widget>[
        Container(
          child: Form(
            // key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                0.055.sh.verticalSpace,
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
                0.0335.sh.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(left: 0.042.sw),
                  child: Text(
                    'Renseignez votre e-mail',
                    style: TextStyle(
                      color: ProxColors.grey,
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
                    decoration:
                        textInputDecoration.copyWith(hintText: 'e-mail'),
                    validator: (val) => val!.isEmpty ? '' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                ),
                0.01.sh.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(left: 0.042.sw),
                  child: Text(
                    'Renseignez votre ville',
                    style: TextStyle(
                      color: ProxColors.grey,
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
                    decoration: textInputDecoration.copyWith(hintText: 'ville'),
                    obscureText: true,
                    validator: (val) => val!.length < 6
                        ? 'Enter a password 6+ chars long'
                        : null,
                    onChanged: (val) {
                      setState(() => ville = val);
                    },
                  ),
                ),
                // maybe wrong
                0.05.sh.verticalSpace,
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.066.sw,
                    ),
                    child: CustomButton(textInput: 'Prévenez-moi'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
