import 'package:flutter/material.dart';

import 'package:proximitystore/constant/ConstantWidgets/background_image.dart';
import 'package:proximitystore/constant/ConstantWidgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proximitystore/constant/ProxColors.dart';
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          0.07.sw,
                          0.08.sh,
                          0.28.sw,
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
                                  fontSize: 22,
                                ),
                              ),
                              TextSpan(
                                text: 'Store',
                                style: TextStyle(
                                  color: ProxColors.pink,
                                  fontFamily: 'Popins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                ),
                              ),
                              TextSpan(
                                text: ' n’est pas (encore) disponible dans votre secteur ',
                                style: TextStyle(
                                  color: ProxColors.darkblue,
                                  fontFamily: 'Popins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
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
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          0.085.sw,
                          0.02.sh,
                          0.18.sw,
                          0.27.sh,
                        ),
                        child: Text(
                          'Gardons contact, pour être prévenu et être parmi les premiers au courant : ',
                          style: TextStyle(
                            color: ProxColors.darkblue,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 0.066.sw,
                          ),
                          child: CustomButton(
                            onPressed: () => showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              builder: ((context) => SheetGeolocalisationOutsideParis()),
                            ),
                            textInput: 'Prévenez-moi',
                          ),
                        ),
                      ),
                      0.07.sh.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 0.13.sw,
                        ),
                        child: Text(
                          "Faites grandir la communauté ProximityStore, partagez l’application",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16,
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
