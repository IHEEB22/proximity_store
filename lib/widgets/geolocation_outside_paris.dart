import 'package:flutter/material.dart';

import 'package:proximitystore/constant/ConstantWidgets/background_image.dart';

import 'package:proximitystore/constant/ProxColors.dart';

class GeolocationOutsideParis extends StatelessWidget {
  const GeolocationOutsideParis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          backround_image(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  32,
                  56,
                  70,
                  54,
                ),
                child: RichText(
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Proximity',
                        style: TextStyle(
                            color: ProxColors.blue,
                            fontFamily: 'Popins',
                            fontWeight: FontWeight.w600,
                            fontSize: 22.0),
                      ),
                      TextSpan(
                        text: 'Store',
                        style: TextStyle(
                          color: ProxColors.pink,
                          fontFamily: 'Popins',
                          fontWeight: FontWeight.w600,
                          fontSize: 22.0,
                        ),
                      ),
                      TextSpan(
                        text:
                            ' n’est pas (encore) disponible dans votre secteur 🙁',
                        style: TextStyle(
                          color: ProxColors.black2,
                          fontFamily: 'Popins',
                          fontWeight: FontWeight.w600,
                          fontSize: 22.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 32,
                  top: 54,
                  right: 47,
                ),
                child: Text(
                  'Mais nous travaillons d’arrache-pied pour vous proposer nos services au plus vite !',
                  style: TextStyle(
                    color: ProxColors.black2,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w300,
                    fontSize: 16.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  32,
                  17,
                  70,
                  220,
                ),
                child: Text(
                  'Gardons contact, pour être prévenu et être parmi les premiers au courant : ',
                  style: TextStyle(
                    color: ProxColors.black2,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
