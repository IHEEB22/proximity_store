import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proximitystore/widgets/background_image.dart';

import '../../widgets/autocomplete_search_adresse.dart';
import '../../widgets/custom_back_button_icon.dart';

class AddLocalisationAddressPage extends StatelessWidget {
  const AddLocalisationAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            BackgroundImage(),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  0.01.sh.verticalSpace,
                  CustomBackButtonIcon(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      0.07.sw,
                      0.068.sh,
                      0.09.sw,
                      0.079.sh,
                    ),
                    child: Text(
                      'addAddress'.tr(),
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 22.sp,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 0.085.sw,
                      right: 0.12.sw,
                    ),
                    child: Text(
                      'weWillDisplayTheNearsetProductsForYou'.tr(),
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                  0.10.sh.verticalSpace,
                  AutocompleteSearchAdresse(
                    symetricPadding: 0.0853,
                    searchPrefix: true,
                    labelEnabled: false,
                    hintText: 'town'.tr(),
                    labelText: 'addAdress'.tr(),
                  ),
                  0.54.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
