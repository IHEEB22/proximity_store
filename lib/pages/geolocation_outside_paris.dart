import 'package:flutter/material.dart';

import 'package:proximitystore/constant/constant_widgets/background_image.dart';
import 'package:proximitystore/constant/constant_widgets/custom_blue_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proximitystore/constant/constant_proprities/prox_colors.dart';
import 'package:proximitystore/pages/sheet_geolocalisation_outside_paris.dart';

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      0.0853333.sw,
                      0.084.sh,
                      0.192.sw,
                      0.072.sh,
                    ),
                    child: Text.rich(
                      TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'Proximity',
                            style: TextStyle(
                              color: ProxColors.blue,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 23.sp,
                            ),
                          ),
                          TextSpan(
                            text: 'Store',
                            style: TextStyle(
                              color: ProxColors.pink,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 23.sp,
                            ),
                          ),
                          TextSpan(
                            text: ' n’est pas (encore) disponible dans votre secteur',
                            style: TextStyle(
                              color: ProxColors.darkblue,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 23.sp,
                              letterSpacing: 0.4,
                            ),
                          ),
                          WidgetSpan(
                            child: 0.01.sw.horizontalSpace,
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
                      left: 0.0853333.sw,
                      right: 0.13.sw,
                    ),
                    child: Text(
                      'Mais nous travaillons d’arrache-pied pour vous proposer nos services au plus vite !',
                      style: TextStyle(
                        color: ProxColors.darkblue,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      0.0853.sw,
                      0.03.sh,
                      0.17.sw,
                      0.271.sh,
                    ),
                    child: Text(
                      'Gardons contact, pour être prévenu et être parmi les premiers au courant :',
                      style: TextStyle(
                        color: ProxColors.darkblue,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
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
                  0.16.sh.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.13.sw,
                    ),
                    child: Text(
                      "Faites grandir la communauté ProximityStore, partagez l’application",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        color: ProxColors.deepblue,
                      ),
                    ),
                  ),
                  0.04.sh.verticalSpace
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
