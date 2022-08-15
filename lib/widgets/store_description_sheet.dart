import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/providers/client_provider.dart';

import '../config/colors/app_colors.dart';
import '../config/images/app_images.dart';

class StoreDescriptionSheet extends StatelessWidget {
  const StoreDescriptionSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: 0.7216.sh,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.082.sw),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Text(
                  context.read<ClientProvider>().productSelected!.storeName.toString().toUpperCase(),
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                        fontFamily: 'Montserrat',
                        fontSize: 17.sp,
                        color: AppColors.darkBlueColor,
                      ),
                ),
                0.06.sw.verticalSpace,
                Consumer<ClientProvider>(
                  builder: (context, value, child) => SizedBox(
                    child: Container(
                      width: double.infinity,
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: ['computing', 'High-Tech'].map((item) {
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 0.025.sw),
                                child: Container(
                                  margin: EdgeInsets.all(3),
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 2, color: AppColors.lightPurpleColor),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6.0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 4, bottom: 4, right: 1.5, left: 2),
                                    child: Text(
                                      item,
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12.sp,
                                          color: AppColors.lightPurpleColor,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                0.044.sw.verticalSpace,
                Center(
                  child: SizedBox(
                    width: 0.888.sw,
                    height: 0.25.sh,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: context.watch<ClientProvider>().productSelected!.storeImage ?? 'notfound',
                      placeholder: (context, url) => new CircularProgressIndicator(),
                      errorWidget: (context, url, error) => new Icon(Icons.error),
                    ),
                  ),
                ),
                0.012.sh.verticalSpace,
                Text(
                  context.watch<ClientProvider>().productSelected!.storeDescription ?? '',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontFamily: 'Montserrat',
                      fontSize: 14.sp,
                      color: AppColors.darkBlueColor,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
