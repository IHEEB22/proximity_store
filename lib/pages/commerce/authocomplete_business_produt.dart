import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/config/colors/app_colors.dart';
import 'package:proximitystore/models/product.dart';
import 'package:proximitystore/providers/business_provider.dart';

class AuthocompleteBusinessProdut extends StatelessWidget {
  const AuthocompleteBusinessProdut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: FutureBuilder(
          future: context.watch<BusinessProvider>().readJson(),
          builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData)
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 400.0,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 400,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 0.0439.sw),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: snapshot.data?[index].values.toList().length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return SizedBox(
                                            // color: AppColors.whiteColor,
                                            child: Card(
                                              margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(
                                                  Radius.circular(8.r),
                                                )),
                                                height: 123,
                                                width: 324,
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 123,
                                                      width: 109,
                                                      child: Image(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(snapshot.data?[index].values.toList()[1]),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding: EdgeInsets.only(left: 0.0321.sw),
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets.only(right: 0.0508.sw, top: 0.0246.sh),
                                                                child: Text(
                                                                    '${snapshot.data?[index].values.toList()[0] ?? 'no data'}'
                                                                        .toUpperCase(),
                                                                    style: Theme.of(context)
                                                                        .textTheme
                                                                        .bodyText1
                                                                        ?.copyWith(
                                                                            fontFamily: 'Montserrat',
                                                                            fontSize: 14.sp,
                                                                            height: 1.4,
                                                                            color: AppColors.darkBlueColor,
                                                                            letterSpacing: 0.4)),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                if (snapshot.data?[index].values.toList()[4] ==
                                                                    'activé')
                                                                  Container(
                                                                    margin: EdgeInsets.only(right: 0.041.sw),
                                                                    child: Center(
                                                                      child: Padding(
                                                                        padding: EdgeInsets.symmetric(
                                                                            horizontal: 0.016.sw, vertical: 0.0049.sh),
                                                                        child: Text(
                                                                          'activé',
                                                                          style: Theme.of(context)
                                                                              .textTheme
                                                                              .bodyText1
                                                                              ?.copyWith(
                                                                                fontFamily: 'Montserrat',
                                                                                fontSize: 10.sp,
                                                                                color: AppColors.lightGreenColor,
                                                                                fontWeight: FontWeight.w400,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    height: 0.04.sh,
                                                                    width: 0.1013.sw,
                                                                    color: AppColors.transparentGreenColor,
                                                                  ),
                                                                if (snapshot.data?[index].values.toList()[4] ==
                                                                    'désactivé')
                                                                  Container(
                                                                    child: Center(
                                                                      child: Padding(
                                                                        padding: EdgeInsets.symmetric(
                                                                            horizontal: 0.016.sw, vertical: 0.0049.sh),
                                                                        child: Text(
                                                                          'désactivé',
                                                                          style: Theme.of(context)
                                                                              .textTheme
                                                                              .bodyText1
                                                                              ?.copyWith(
                                                                                  fontFamily: 'Montserrat',
                                                                                  fontSize: 10.sp,
                                                                                  fontWeight: FontWeight.w400,
                                                                                  color: AppColors.deepBlueColor),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    height: 0.04.sh,
                                                                    width: 0.1413.sw,
                                                                    color: AppColors.GreyColor,
                                                                  ),
                                                                if (snapshot.data?[index].values.toList()[4] ==
                                                                    'en attente')
                                                                  Container(
                                                                    decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                        color: AppColors.lightPurpleColor,
                                                                      ),
                                                                    ),
                                                                    child: Center(
                                                                      child: Padding(
                                                                        padding: EdgeInsets.symmetric(
                                                                            horizontal: 0.012.sw, vertical: 0.0049.sh),
                                                                        child: Text(
                                                                          'en attente',
                                                                          style: Theme.of(context)
                                                                              .textTheme
                                                                              .bodyText1
                                                                              ?.copyWith(
                                                                                fontFamily: 'Montserrat',
                                                                                fontSize: 10.sp,
                                                                                fontWeight: FontWeight.w400,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    height: 0.04.sh,
                                                                    width: 0.1413.sw,
                                                                  ),
                                                                Padding(
                                                                  padding: EdgeInsets.only(
                                                                    left: 0.31.sw,
                                                                  ),
                                                                  child: Container(
                                                                    child: Text(
                                                                      '${snapshot.data?[index].values.toList()[2]}' +
                                                                          ' €',
                                                                      style: Theme.of(context)
                                                                          .textTheme
                                                                          .bodyText1
                                                                          ?.copyWith(
                                                                            fontSize: 18.sp,
                                                                            fontWeight: FontWeight.w800,
                                                                            color: AppColors.darkBlueColor,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            0.0135.sh.verticalSpace,
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            return Container(
              child: Text('error'),
            );
          }),
    );
  }
}
