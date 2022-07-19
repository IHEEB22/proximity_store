import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proximitystore/widgets/background_image.dart';

import '../../widgets/custom_back_button_icon.dart';

GoogleMapController? _mapController;

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
              child: Wrap(
                children: [
                  Column(
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
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 0.085.sw,
                        ),
                        // child:
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
