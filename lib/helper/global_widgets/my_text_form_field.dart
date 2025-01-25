import 'package:auto_size_text/auto_size_text.dart';
import 'package:cash_toggar_app/generated/assets.dart';
import 'package:cash_toggar_app/helper/localization/cubit/localization_cubit.dart';
import 'package:cash_toggar_app/resources/fonts_style.dart';
import 'package:cash_toggar_app/resources/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/colors_manager.dart';
import '../../resources/icons_manager.dart';
import 'MyResponsiveText.dart';

/// TODO : handle the focus node and validator

class MyTextFormField extends StatelessWidget {
  MyTextFormField({
    super.key,
    required this.hintText,
    required this.label,
    required this.textEditingController,
    required this.isPassword,
    required this.isHidden,
    required this.textInputType,
    this.changeVisibility,
    required this.prefixIcon,
    this.validator  = null,
  });

  TextEditingController textEditingController;
  String label;
  String hintText;
  bool isPassword;
  bool isHidden;
  TextInputType textInputType;
  Function? changeVisibility;
  var validator;
  String? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocalizationCubit, LocalizationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var localCubit = BlocProvider.of<LocalizationCubit>(context);
        return Column(
          crossAxisAlignment:
          localCubit.isArabic() ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            MyResponsiveText(
              text: label,
              style: getBold(
                fontColor: AppColors.secondaryColor,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: MediaQueryValues(context).height * 0.01,
            ),
            Container(
              // height: MediaQueryValues(context).height * 0.067,
              width: double.infinity,
              decoration: const BoxDecoration(
                  // color: Colors.red,

                  ),
              child: Directionality(
                textDirection: localCubit.isArabic() ? TextDirection.rtl : TextDirection.ltr,
                child: TextFormField(
                  validator: validator == null ? null : validator,
                  controller: textEditingController,
                  cursorColor: AppColors.secondaryColor,
                  keyboardType: textInputType,
                  textAlign: localCubit.isArabic() ? TextAlign.right : TextAlign.left,
                  obscureText: isHidden ? true : false,
                  decoration: InputDecoration(
                    // suffix: const Icon(Icons.person),

                    prefixIcon: prefixIcon == null
                        ? null
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            // Adjust padding as needed
                            child: SvgPicture.asset(
                              prefixIcon.toString(),
                              color: AppColors.secondaryColor,
                            ),
                          ),

                    suffixIcon: isPassword
                        ? isHidden
                            ? Column(
                                children: [
                                  SizedBox(
                                    height:
                                        MediaQueryValues(context).height * 0.02,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      changeVisibility!();
                                    },
                                    child: SvgPicture.asset(
                                      AppIcons.notHidePasswordIcon,
                                      color: AppColors.secondaryColor,
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  SizedBox(
                                    height:
                                        MediaQueryValues(context).height * 0.02,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      changeVisibility!();
                                    },
                                    child: SvgPicture.asset(
                                      AppIcons.hidePasswordIcon,
                                      color: AppColors.secondaryColor,
                                    ),
                                  ),
                                ],
                              )
                        : SizedBox(
                            height: MediaQueryValues(context).height * 0.025,
                          ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                      borderSide: const BorderSide(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                      borderSide: const BorderSide(
                          color: AppColors.secondaryColor, width: 1.5),
                    ),

                    hintText: hintText.toString(),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class MyTextFormFieldViewOnly extends StatelessWidget {
  const MyTextFormFieldViewOnly({
    super.key,
    required this.initialValue,
    required this.label,
    required this.isArabic,
  });

  final String label;
  final String initialValue;
  final bool isArabic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        // height: MediaQueryValues(context).height * 0.065,
        width: double.infinity,
        child: Directionality(
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          child: TextFormField(
            maxLines: 10,
            minLines: 1,
            cursorColor: AppColors.secondaryColor,
            readOnly: true,
            autofocus: true,
            textAlign: isArabic ? TextAlign.right : TextAlign.left,
            initialValue: initialValue,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              labelStyle: const TextStyle(
                color: AppColors.b_w_700,
                fontSize: 20,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
              ),
              label: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: MyResponsiveText(
                    text: label.toString(),
                    style: TextStyle(),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}

class MyTextFormFieldWithUpperTitle extends StatelessWidget {
  const MyTextFormFieldWithUpperTitle({
    Key? key,
    required this.hintText,
    required this.label,
    required this.textEditingController,
    required this.isPassword,
    required this.isHidden,
    required this.textInputType,
    this.changeVisibility,
    required this.isArabic,
    required this.multiLines,
    required this.numOfCopies,
    this.labelStyle = const TextStyle(color: AppColors.b_w_700, fontSize: 20),
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String label;
  final String hintText;
  final bool isPassword;
  final bool isHidden;
  final TextInputType textInputType;
  final Function? changeVisibility;
  final bool isArabic;
  final bool multiLines;
  final bool numOfCopies;
  final TextStyle labelStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.13,
      width: double.infinity,
      decoration: const BoxDecoration(
          // Add your decoration here
          ),
      child: Directionality(
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: MyResponsiveText(
                text: label,
                style: labelStyle,
              ),
            ),
            const SizedBox(height: 8), // Adjust the spacing as needed
            TextFormField(
              maxLines: multiLines ? 3 : 1,
              controller: textEditingController,
              cursorColor: AppColors.b_w_50,
              keyboardType: textInputType,
              inputFormatters: numOfCopies
                  ? <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      RangeTextInputFormatter(
                        1,
                        10,
                      ),
                    ]
                  : null,
              textAlign: isArabic ? TextAlign.right : TextAlign.left,
              obscureText: isHidden ? true : false,
              decoration: InputDecoration(
                suffix: isPassword
                    ? isHidden
                        ? InkWell(
                            onTap: () {
                              changeVisibility!();
                            },
                            child: SvgPicture.asset(
                              AppIcons.hidePasswordIcon,
                              color: AppColors.b_w_750,
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              changeVisibility!();
                            },
                            child: SvgPicture.asset(
                              AppIcons.notHidePasswordIcon,
                              color: AppColors.b_w_750,
                            ),
                          )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                // border: GradientOutlineInputBorder(
                //   borderRadius: BorderRadius.circular(9),
                //   gradient: const LinearGradient(
                //     colors: [
                //       Colors.grey,
                //       Colors.grey,
                //     ],
                //   ),
                //   width: 2,
                // ),
                // focusedBorder: GradientOutlineInputBorder(
                //   borderRadius: BorderRadius.circular(9),
                //   gradient: const LinearGradient(
                //     colors: [
                //       AppColors.gradientBegin,
                //       AppColors.gradientMiddle,
                //       AppColors.gradientEnd,
                //     ],
                //   ),
                //   width: 2,
                // ),
                hintText: hintText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RangeTextInputFormatter extends TextInputFormatter {
  final int min;
  final int max;

  RangeTextInputFormatter(this.min, this.max);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final int value = int.tryParse(newValue.text) ?? 0;
    if (value < min) {
      return TextEditingValue(
        text: min.toString(),
        selection: TextSelection.collapsed(offset: min.toString().length),
      );
    } else if (value > max) {
      return TextEditingValue(
        text: max.toString(),
        selection: TextSelection.collapsed(offset: max.toString().length),
      );
    }
    return newValue;
  }
}
