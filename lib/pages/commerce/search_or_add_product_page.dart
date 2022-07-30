import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proximitystore/pages/commerce/add_product_sheet.dart';

import '../../widgets/autocomplete_search_product.dart';
import '../../widgets/widgets.dart';

class SearchOrAddProductPage extends StatefulWidget {
  SearchOrAddProductPage({Key? key}) : super(key: key);

  @override
  State<SearchOrAddProductPage> createState() => _SearchOrAddProductPageState();
}

class _SearchOrAddProductPageState extends State<SearchOrAddProductPage> {
  void showCongratsBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      context: context,
      builder: (BuildContext context) => AddProductSheet(),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showCongratsBottomSheet(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundImage(),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomBackButtonIcon(),
                      Padding(
                        padding: EdgeInsets.only(left: 0.82.sw, top: 0.02.sh),
                        child: Image(
                          height: 0.0295.sh,
                          width: 0.064.sw,
                          image: AssetImage('assets/icons/user.png'),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      0.085.sw,
                      0.055.sh,
                      0.028.sw,
                      0.052.sh,
                    ),
                    child: Text(
                      'myProducts'.tr(),
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 25.sp,
                          ),
                    ),
                  ),
                  0.035.sh.verticalSpace,
                  Column(
                    children: [
                      AutocompleteSearchProduct(),
                      0.0751.sh.verticalSpace,
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 0.0853.sw),
                              child: Text(
                                'itsVeryEmptyHere!'.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      height: 1.4.sp,
                                    ),
                              ),
                            ),
                            0.0246.sh.verticalSpace,
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 0.0853.sw, right: 0.24.sw),
                              child: Text(
                                'thisIsWhereYouWillFindTheProductsYouAdd'.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      height: 1.4.sp,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 0.082.sw, right: 0.082.sw, top: 0.85.sh),
              child: SizedBox(
                width: double.infinity,
                child: CustomBlueButton(
                    textInput: 'addMyNewProduct'.tr(), onPressed: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
