import 'package:cash_toggar_app/resources/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/colors_manager.dart';
import '../../resources/fonts_style.dart';
import '../../resources/icons_manager.dart';
import 'MyResponsiveText.dart';


class CustomDropdownMenu extends StatelessWidget {
  final List<String> items;
  final String hintText;
  final String label;
  final TextStyle? textStyle;
  final double heightFactor;
  final double widthFactor;
  final ValueChanged<String?>? onSelected;

  const CustomDropdownMenu({
    Key? key,
    required this.items,
    required this.label,
    required this.hintText,
    this.textStyle,
    this.heightFactor = 0.06,
    this.widthFactor = 1.0,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        // height: MediaQuery.of(context).size.height * heightFactor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyResponsiveText(
              text: label,
              style: getBold(
                fontColor: AppColors.primary_700_main,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: MediaQueryValues(context).height*0.009,
            ),
            FittedBox(
              child: DropdownMenu<String>(
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: Colors.grey
                    ),
                  )
                ),
                hintText: hintText,
                textStyle: getRegular(
                  fontColor: AppColors.b_w_200,
                  fontSize: 16,
                ),
                // trailingIcon: SvgPicture.asset(
                //   AppIcons.dropdown_icon_bold_icon_svg,
                // ),
                width: MediaQuery.of(context).size.width * widthFactor,
                onSelected: onSelected,
                dropdownMenuEntries:
                    items.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(
                    value: value,
                    label: value,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
