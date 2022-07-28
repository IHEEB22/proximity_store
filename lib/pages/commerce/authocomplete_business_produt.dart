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
                            child: Column(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: snapshot.data?[index].values.toList().length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return Container(
                                          // color: AppColors.whiteColor,
                                          child: Card(
                                              margin: EdgeInsets.only(bottom: 16),
                                              child: SizedBox(
                                                height: 123,
                                                width: 324,
                                                child: ListTile(
                                                  leading: SizedBox(
                                                    width: 109,
                                                    height: 123,
                                                    child: Image(
                                                      image: NetworkImage(snapshot.data?[index].values.toList()[1]),
                                                    ),
                                                  ),
                                                  title: Text(
                                                    '${snapshot.data?[index].values.toList()[0] ?? 'no data'}',
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                    ),
                                                  ),
                                                ),
                                              )),
                                        );
                                      }),
                                ),
                              ],
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
