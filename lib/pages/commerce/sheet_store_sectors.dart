import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'package:proximitystore/providers/business_provider.dart';

import '../../config/colors/app_colors.dart';
import '../../config/images/app_images.dart';

class SheetStoreSectors extends StatelessWidget {
  const SheetStoreSectors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BusinessProvider>(
      builder: (context, value, child) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: 0.7216.sh,
            child: Column(
              children: [
                0.02.sh.verticalSpace,
                Center(
                  child: Image(
                    image: AssetImage(
                      AppImages.lineSheet,
                    ),
                    width: 0.105.sw,
                  ),
                ),
                0.054.sh.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 0.045.sw),
                      child: Text(
                        'sector'.tr(),
                        style: Theme.of(context).textTheme.headline2?.copyWith(
                              fontFamily: 'Montserrat',
                              fontSize: 16.sp,
                              color: AppColors.darkBlueColor,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 0.056.sw),
                      child: context.watch<BusinessProvider>().deleteEnabled
                          ? TextButton(
                              onPressed: () {
                                context
                                    .read<BusinessProvider>()
                                    .deletAllSectors();
                                context
                                    .read<BusinessProvider>()
                                    .setDeletePressed();
                              },
                              child: Text(
                                'delete'.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    ?.copyWith(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.pinkColor,
                                    ),
                              ),
                            )
                          : TextButton(
                              onPressed: null,
                              child: Text(
                                'delete'.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    ?.copyWith(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.transparentpinkColor,
                                    ),
                              ),
                            ),
                    ),
                  ],
                ),
                0.065.sh.verticalSpace,
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.025.sw),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: context
                            .watch<BusinessProvider>()
                            .sectorsData
                            .length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            margin: EdgeInsets.only(bottom: 0.00002.sh),
                            // elevation: 0.005,
                            child: CheckboxListTile(
                              onChanged: (value) {
                                context
                                    .read<BusinessProvider>()
                                    .setCheckoxValue(
                                        context
                                            .read<BusinessProvider>()
                                            .sectorsData
                                            .keys
                                            .toList()[index],
                                        value);

                                context
                                    .read<BusinessProvider>()
                                    .isDeleteEnabled();

                                context
                                    .read<BusinessProvider>()
                                    .addChekedSector(context
                                        .read<BusinessProvider>()
                                        .sectorsData
                                        .keys
                                        .toList()[index]);
                              },
                              value: context
                                  .read<BusinessProvider>()
                                  .sectorsData
                                  .values
                                  .toList()[index],
                              title: Text(
                                context
                                    .watch<BusinessProvider>()
                                    .sectorsData
                                    .keys
                                    .toList()[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: AppColors.deepBlueColor,
                                    ),
                              ),
                              side: BorderSide(
                                color: AppColors.lightPurpleColor,
                                width: 2,
                                style: BorderStyle.solid,
                              ),
                              contentPadding: EdgeInsets.only(
                                left: 0.026.sw,
                                right: 0.01.sw,
                              ),
                              checkColor: AppColors.whiteColor,
                              activeColor: AppColors.deepBlueColor,
                              secondary: null,
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
