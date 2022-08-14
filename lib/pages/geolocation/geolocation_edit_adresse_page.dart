import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/widgets/background_image.dart';
import 'package:proximitystore/widgets/custom_blue_button.dart';

import '../../config/routes/routes.dart';
import '../../providers/localistaion_controller_provider.dart';
import '../../widgets/autocomplete_search_adresse.dart';
import '../../widgets/custom_back_button_icon.dart';

class GeolocationEditAdressePage extends StatelessWidget {
  const GeolocationEditAdressePage({Key? key}) : super(key: key);

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
                  0.122.sh.verticalSpace,
                  Consumer<LocalistaionControllerprovider>(
                    builder: (context, value, child) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutocompleteSearchAdresse(
                          symetricPadding: 0.0853,
                          searchPrefix: true,
                          labelEnabled: false,
                          onSuggestionSelected: (suggestion) {
                            context.read<LocalistaionControllerprovider>().addressSelected(
                                  suggestion: suggestion ?? Prediction(description: 'adress n\'éxiste pas'),
                                );

                            context.read<LocalistaionControllerprovider>().setIsAdressSelected();
                            context.read<LocalistaionControllerprovider>().setIsAdressSelected();
                          },
                          hintText: 'town'.tr(),
                          labelText: 'addAdress'.tr(),
                        ),
                        context.watch<LocalistaionControllerprovider>().space()
                            ? 0.4.sh.verticalSpace
                            : 0.08.sh.verticalSpace
                      ],
                    ),
                  ),
                  Center(
                    child: Text(
                      'or'.tr(),
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                            fontSize: 14.sp,
                          ),
                    ),
                  ),
                  0.082.sh.verticalSpace,
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.066.sw,
                      ),
                      child: CustomBlueButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.geoLocationOutsideParisPage);
                          context.read<LocalistaionControllerprovider>().disposeAdressValue();
                        },
                        textInput: 'allowAccessToMyPosition'.tr(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
