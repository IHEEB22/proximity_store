import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/pages/pages.dart';
import 'package:proximitystore/widgets/background_image.dart';

import '../../config/routes/routes.dart';
import '../../providers/localistaion_controller_provider.dart';
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
                  SizedBox(
                    height: 400,
                    child: Column(
                      children: [
                        Consumer<LocalistaionControllerprovider>(
                          builder: (context, value, child) => AutocompleteSearchAdresse(
                            // minhei: 250,
                            symetricPadding: 0.0853,
                            searchPrefix: true,
                            labelEnabled: false,
                            onSuggestionSelected: (suggestion) {
                              context.read<LocalistaionControllerprovider>().addressSelected(
                                    suggestion: suggestion ?? Prediction(description: 'adress n\'éxiste pas'),
                                  );

                              context.read<LocalistaionControllerprovider>().setIsAdressSelected();
                              if (context.read<LocalistaionControllerprovider>().isAdressSelectedInParis(
                                  context, suggestion!.description ?? 'adress n\'éxiste pas')) {
                                Navigator.pushNamed(context, AppRoutes.geolocationSearchProductPage);
                              } else {
                                Navigator.pushNamed(context, AppRoutes.geoLocationOutsideParisPage);
                              }
                            },
                            hintText: 'town'.tr(),
                            labelText: 'addAdress'.tr(),
                          ),
                        ),
                        context.watch<LocalistaionControllerprovider>().space()
                            ? 0.4.sh.verticalSpace
                            : 0.03.sh.verticalSpace
                      ],
                    ),
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
