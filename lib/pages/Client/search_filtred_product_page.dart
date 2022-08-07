import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/config/images/app_images.dart';

import '../../config/colors/app_colors.dart';
import '../../config/routes/routes.dart';
import '../../providers/business_provider.dart';
import '../../providers/client_provider.dart';
import '../../widgets/autocomplete_search_product.dart';
import '../../widgets/background_image.dart';
import '../../widgets/custom_back_button_icon.dart';
import '../../widgets/custom_blue_button.dart';
import '../../widgets/widgets.dart';
import '../pages.dart';

class SearchFiltredProductPage extends StatelessWidget {
  const SearchFiltredProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            BackgroundImage(),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomBackButtonIcon(),
                      0.014.sw.horizontalSpace,
                      Padding(
                        padding: EdgeInsets.only(top: 0.014.sh),
                        child: Container(
                          child: SizedBox(
                            width: 0.76.sw,
                            child: AutocompleteSearchClientProduct(),
                          ),
                        ),
                      ),
                      0.024.sw.horizontalSpace,
                      Consumer<ClientProvider>(
                        builder: (context, value, child) => GestureDetector(
                          onTap: () {
                            context.read<BusinessProvider>().setSectorHintVisible();
                            showModalBottomSheet<void>(
                              isScrollControlled: true,
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20.r),
                                ),
                              ),
                              builder: ((context) => SheetStoreSectors(
                                    title: 'filtres'.tr(),
                                  )),
                            ).whenComplete(
                              () {
                                // context.read<BusinessProvider>().setSectorHintVisible();
                              },
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 0.026.sh),
                            child: Image(
                              height: 0.03.sh,
                              width: 0.065.sw,
                              image: AssetImage(AppImages.filterIcon),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Consumer<BusinessProvider>(
                    builder: (context, value, child) => SizedBox(
                      height: 200,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.022.sw),
                        child: Container(
                          width: double.infinity,
                          child: Wrap(
                            direction: Axis.horizontal,
                            children: context.read<BusinessProvider>().chekedsectorsList.keys.map((item) {
                              return Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 0.2),
                                    child: Expanded(
                                      child: Container(
                                        margin: EdgeInsets.all(3),
                                        padding: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2, color: AppColors.deepBlueColor),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(6.0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(top: 4, bottom: 4, right: 1.5, left: 2),
                                              child: Text(
                                                item,
                                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 12.sp,
                                                    color: AppColors.deepBlueColor,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                context.read<BusinessProvider>().removeSector(item);
                                                context.read<BusinessProvider>().isDeleteEnabled();
                                              },
                                              child: Container(
                                                height: 16,
                                                width: 16,
                                                child: Image(image: AssetImage('assets/icons/delete_icon.png')),
                                              ),
                                            ),
                                            0.0025.sw.horizontalSpace,
                                          ],
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
