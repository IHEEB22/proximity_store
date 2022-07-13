import 'package:flutter/material.dart';

import 'package:proximitystore/constant/constant_widgets/background_image.dart';
import 'package:proximitystore/constant/constant_widgets/custom_blue_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proximitystore/constant/constant_proprities/prox_colors.dart';
import 'package:proximitystore/widgets/sheet_Geolocalisation_outside_paris.dart';

class GeolocationOutsideParis extends StatelessWidget {
  const GeolocationOutsideParis({Key? key}) : super(key: key);

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
                        child: Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                text: 'Proximity',
                                style: TextStyle(
                                  color: ProxColors.blue,
                                  fontFamily: 'Popins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22.sp,
                                ),
                              ),
                              WidgetSpan(
                                child: 0.1.sh.verticalSpace,
                              ),
                              TextSpan(
                                text: 'Store',
                                style: TextStyle(
                                  color: ProxColors.pink,
                                  fontFamily: 'Popins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22.sp,
                                ),
                              ),
                              WidgetSpan(
                                child: 0.1.sh.verticalSpace,
                              ),
                              TextSpan(
                                text: ' n’est pas\n(encore) disponible\ndans votre secteur',
                                style: TextStyle(
                                  color: ProxColors.darkblue,
                                  fontFamily: 'Popins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22.sp,
                                  letterSpacing: 0.4,
                                ),
                              ),
                              WidgetSpan(
                                child: Image(
                                  width: 0.064.sw,
                                  height: 0.029.sh,
                                  image: AssetImage(
                                    'assets/icons/sad_emoji.png',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 0.085.sw,
                          right: 0.12.sw,
                        ),
                        child: Text(
                          'Mais nous travaillons d’arrache-pied pour vous proposer nos services au plus vite !',
                          style: TextStyle(
                            color: ProxColors.darkblue,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          0.0853.sw,
                          0.025.sh,
                          0.17.sw,
                          0.271.sh,
                        ),
                        child: Text(
                          'Gardons contact, pour être prévenu et être parmi les premiers au courant : ',
                          style: TextStyle(
                            color: ProxColors.darkblue,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 0.067.sw,
                          ),
                          child: CustomBlueButton(
                            textInput: 'Prévenez-moi',
                            onPressed: () => showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20.r),
                                ),
                              ),
                              builder: ((context) => SheetGeolocalisationOutsideParis()),
                            ),
                          ),
                        ),
                      ),
                      0.15.sh.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 0.13.sw,
                        ),
                        child: Text(
                          "Faites grandir la communauté ProximityStore, partagez l’application",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      0.04.sh.verticalSpace
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
