import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proximitystore/config/colors/app_colors.dart';

import 'package:proximitystore/widgets/sheet_geolocalisation_outside_paris.dart';
import 'package:proximitystore/widgets/background_image.dart';
import 'package:proximitystore/widgets/custom_blue_button.dart';

class GeolocationOutsideParisPage extends StatelessWidget {
  const GeolocationOutsideParisPage({Key? key}) : super(key: key);

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
                            style: Theme.of(context).textTheme.headline3?.copyWith(
                                  fontSize: 23.sp,
                                  color: AppColors.blueColor,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          TextSpan(
                            text: 'Store',
                            style: Theme.of(context).textTheme.headline3?.copyWith(
                                  fontSize: 23.sp,
                                  color: AppColors.pinkColor,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          TextSpan(
                            text: ' n’est pas (encore) disponible dans votre secteur',
                            style: Theme.of(context).textTheme.headline2?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.4,
                                  height: 1.2,
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
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontFamily: 'Montserrat',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w300,
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
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
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
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            fontFamily: 'Montserrat',
                            fontSize: 14.sp,
                            decoration: TextDecoration.underline,
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
