import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:proximitystore/constant/constant_widgets/background_image.dart';
import 'package:proximitystore/constant/constant_widgets/custom_blue_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proximitystore/constant/constant_proprities/prox_colors.dart';
import 'package:proximitystore/pages/localisation_search_dialogue.dart';
import 'package:proximitystore/pages/sheet_geolocalisation_outside_paris.dart';

class HomePageGeolocOff extends StatelessWidget {
  GoogleMapController? _mapController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            BackgroundImage(),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Wrap(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(
                            0.07.sw,
                            0.123.sh,
                            0.09.sw,
                            0.079.sh,
                          ),
                          child: Text(
                            'Renseigner une adresse',
                            style: TextStyle(
                              color: ProxColors.darkblue,
                              fontFamily: 'Popins',
                              fontWeight: FontWeight.w600,
                              fontSize: 22.sp,
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 0.085.sw,
                          right: 0.12.sw,
                        ),
                        child: Text(
                          'Nous afficherons les produits des\ncommerçants à proximité ',
                          style: TextStyle(
                            color: ProxColors.darkblue,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      0.10.sh.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 0.085.sw,
                        ),
                        child: LocationSearchDialog(mapController: _mapController),
                        // add leading attribut (not required) in the LocationSearchDialog widget and hint text (required)
                      ),
                      0.54.verticalSpace,
                    ],
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
