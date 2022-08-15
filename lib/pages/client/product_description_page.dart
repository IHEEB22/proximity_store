import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/providers/client_provider.dart';
import 'package:proximitystore/widgets/store_description_sheet.dart';

import '../../config/colors/app_colors.dart';
import '../../config/images/app_images.dart';
import '../../widgets/google_map_card.dart';
import '../../widgets/widgets.dart';

class ProductDescriptionPage extends StatelessWidget {
  const ProductDescriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Scaffold(
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.zero,
                      child: SizedBox(
                        height: 0.649.sh,
                        width: double.infinity,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: context.read<ClientProvider>().productSelected!.productImage,
                          placeholder: (context, url) =>
                              Container(child: Center(child: Image(image: AssetImage(AppImages.productImageHolder)))),
                          errorWidget: (context, url, error) => new Icon(Icons.error),
                        ),
                      ),
                    ),
                    0.0197.sh.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.0453.sw),
                      child: Column(
                        children: [
                          Text(context.read<ClientProvider>().productSelected!.productName.toUpperCase(),
                              style: Theme.of(context).textTheme.headline4?.copyWith(
                                    fontSize: 15.sp,
                                    letterSpacing: 0.1,
                                    height: 1.5,
                                  )),
                          0.0369.sh.verticalSpace,
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              padding: EdgeInsets.all(4.sm),
                              height: 0.0246.sh,
                              width: 0.25.sw,
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                child: Text(
                                  'reportProduct'.tr(),
                                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                        fontSize: 9.2.sp,
                                        fontFamily: 'Montserrat',
                                        decoration: TextDecoration.underline,
                                        color: AppColors.lightPurpleColor,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          0.0394.sh.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                context.read<ClientProvider>().productSelected!.productPrice.toString() + ' €',
                                style: Theme.of(context).textTheme.headline1?.copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.darkBlueColor,
                                    ),
                              ),
                              Container(
                                height: 0.04926.sh,
                                width: 0.312.sw,
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.whiteColor),
                                  color: AppColors.tranparentPinkWhiteColor,
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 0.012.sw, vertical: 0.0049.sh),
                                    child: Text(
                                      context.read<ClientProvider>().productSelected!.storeFarDestination,
                                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12.sp,
                                            color: AppColors.pinkColor,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          0.0739.sh.verticalSpace,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.3.sh,
                      width: double.infinity,
                      child: Container(
                        color: AppColors.lightWhiteColor,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.0426.sw),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              0.0295.sh.verticalSpace,
                              Text(
                                'toBeFoundAt'.tr(),
                                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              0.038.sh.verticalSpace,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    context.read<ClientProvider>().productSelected!.storeName,
                                    style: Theme.of(context).textTheme.headline2?.copyWith(
                                          fontFamily: 'Montserrat',
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet<void>(
                                        isScrollControlled: true,
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20.r),
                                          ),
                                        ),
                                        builder: ((context) => StoreDescriptionSheet()),
                                      );
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 0.0453.sw),
                                      child: Image(
                                        height: 0.0295.sh,
                                        width: 0.064.sw,
                                        image: AssetImage(AppImages.moreIcon),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              0.012.sh.verticalSpace,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    ((context.watch<ClientProvider>().productSelected!.storeStatus) ?? false)
                                        ? 'open'.tr()
                                        : 'close'.tr(),
                                    style: Theme.of(context).textTheme.headline2?.copyWith(
                                        color: (context.watch<ClientProvider>().productSelected!.storeStatus) ?? false
                                            ? AppColors.lightGreenColor
                                            : AppColors.lightPurpleColor,
                                        fontFamily: 'Montserrat',
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  0.012.sw.horizontalSpace,
                                  Text(
                                    ' · ',
                                    style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 44.sp),
                                  ),
                                  Text(
                                    'seeTimeTables'.tr(),
                                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                          fontSize: 16.sp,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w300,
                                          decoration: TextDecoration.underline,
                                          color: AppColors.deepBlueColor,
                                        ),
                                  ),
                                ],
                              ),
                              0.04.sh.verticalSpace,
                              CustomWhiteButton(
                                leading: Image(
                                  image: AssetImage(AppImages.phoneIcon),
                                ),
                                textInput: 'callTheMerchant'.tr(),
                                onPressed: () {},
                              ),
                              0.0295.sh.verticalSpace,
                            ],
                          ),
                        ),
                      ),
                    ),
                    0.0738.sh.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.0426.sw),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'gettingThere'.tr(),
                            style: Theme.of(context).textTheme.headline2?.copyWith(
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                          0.0344.sh.verticalSpace,
                          Text(
                            context.read<ClientProvider>().productSelected!.storeLocation ?? '',
                            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                  fontFamily: 'Montserrat',
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          0.0246.sh.verticalSpace,
                          Container(
                            color: AppColors.lightWhiteColor,
                            height: 0.27.sh,
                            width: 0.9146.sw,
                            // child:
                            //  GoogleMapCard(),
                          ),
                          0.0295.sh.verticalSpace,
                          SizedBox(
                              width: double.infinity,
                              child: CustomBlueButton(
                                textInput: 'showRoute'.tr(),
                                onPressed: () {},
                              )),
                          0.05.sh.verticalSpace,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomBackButtonIcon(),
          ],
        ),
      ),
    );
  }
}
// make nullable attribut in the ClientProduct such storeName Store location store Phone store status
