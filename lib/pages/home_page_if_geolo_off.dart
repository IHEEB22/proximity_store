import 'package:flutter/material.dart';

import 'package:proximitystore/constant/constant_widgets/background_image.dart';
import 'package:proximitystore/constant/constant_widgets/custom_blue_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proximitystore/constant/constant_proprities/app_colors.dart';

import '../constant/constant_widgets/custom_white_button.dart';

class HomePageIfGeoloOff extends StatelessWidget {
  const HomePageIfGeoloOff({Key? key}) : super(key: key);

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
                          0.085.sw,
                          0.148.sh,
                          0.0256.sw,
                          0.067.sh,
                        ),
                        child: Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                text: 'Proximity',
                                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                      color: AppColors.blueColor,
                                    ),
                              ),
                              TextSpan(
                                text: 'Store',
                                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                      color: AppColors.pinkColor,
                                    ),
                              ),
                              TextSpan(
                                text: ' n’a pas accès à votre position ',
                                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                      color: AppColors.darkBlueColor,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // 0.041.sh.verticalSpace,
                      Padding(
                          padding: EdgeInsets.only(
                            left: 0.085.sw,
                            right: 0.186.sw,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ProximityStore a besoin d’accéder à ',
                                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                      fontFamily: 'Montserrat',
                                    ),
                              ),
                              Text(
                                'votre position pour trouver les',
                                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                      fontFamily: 'Montserrat',
                                    ),
                              ),
                              Text(
                                'produits autour de vous',
                                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                      fontFamily: 'Montserrat',
                                    ),
                              ),
                            ],
                          )),
                      0.314.sh.verticalSpace,
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 0.066.sw,
                          ),
                          child: CustomBlueButton(
                            onPressed: () {},
                            textInput: 'Autoriser l’accès à ma position',
                          ),
                        ),
                      ),
                      0.039.sh.verticalSpace,
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 0.066.sw,
                          ),
                          child: CustomWhiteButton(
                            onPressed: () {},
                            textInput: 'Renseigner une adresse',
                          ),
                        ),
                      ),
                      0.152.sh.horizontalSpace,
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
