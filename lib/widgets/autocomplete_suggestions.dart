import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/config/colors/app_colors.dart';
import 'package:proximitystore/providers/localistaion_controller_provider.dart';

class AutoCompleteSuggestions extends StatefulWidget {
  @override
  State<AutoCompleteSuggestions> createState() => _AutoCompleteSuggestionsState();
}

class _AutoCompleteSuggestionsState extends State<AutoCompleteSuggestions> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LocalistaionControllerprovider>(
      builder: (context, newPattern, child) => FutureBuilder<List<Prediction>?>(
          future: context
              .read<LocalistaionControllerprovider>()
              .searchLocation(text: context.read<LocalistaionControllerprovider>().townTextFormFieldController.text),
          builder: (context, AsyncSnapshot<List<Prediction>?> snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.042.sh, vertical: 0.001.sh),
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 0.2.sh,
                        child: ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: ((context, index) => Card(
                                elevation: 0.2.sm,
                                margin: EdgeInsets.all(3.sm),
                                child: ListTile(
                                  iconColor: AppColors.deepBlueColor,
                                  minVerticalPadding: 0,
                                  contentPadding: EdgeInsets.zero,
                                  visualDensity: VisualDensity(horizontal: 2, vertical: -3.2),
                                  leading: Padding(
                                    padding: EdgeInsets.only(
                                      left: 16,
                                    ),
                                    child: Icon(
                                      size: 18.sm,
                                      Icons.location_on,
                                    ),
                                  ),
                                  title: Text(
                                    snapshot.data?[index].description ?? '',
                                    maxLines: 1,
                                  ),
                                ),
                              )),
                        ),
                      ),
                      // 0.027.sh.verticalSpace,
                    ],
                  ),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting)
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 0.03.sh),
                child: Center(
                  widthFactor: 2.sw,
                  child: CircularProgressIndicator(
                    color: AppColors.lightBlueColor,
                  ),
                ),
              );
            else if (snapshot.hasError) {
              return Text("Somthing want wrong");
            }
            return SizedBox.shrink();
          }),
    );
  }
}
