import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../providers/business_provider.dart';
import '../../widgets/background_image.dart';
import '../../widgets/custom_back_button_icon.dart';
import '../../widgets/text_input_field.dart';

class SearchOrAddProductPage extends StatelessWidget {
  const SearchOrAddProductPage({Key? key}) : super(key: key);

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
                TextInputField(
                    prefixDisabled: true,
                    keyboardType: TextInputType.emailAddress,
                    controller: context.watch<BusinessProvider>().product,
                    hintText: 'searchProduct'.tr(),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                        right: 0.025.sw,
                      ),
                      child: Image(
                        height: 0.025.sh,
                        width: 0.064.sw,
                        image: AssetImage('assets/icons/search_icon.png'),
                      ),
                    )),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
