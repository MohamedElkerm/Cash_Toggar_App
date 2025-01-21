
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cash_toggar_app/resources/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../generated/l10n.dart';
import '../../../helper/global_widgets/MyResponsiveText.dart';
import '../../../resources/colors_manager.dart';
import '../../../resources/fonts_style.dart';
import '../../../resources/values_manager.dart';


class MakeSpaceFromStatusBar extends StatelessWidget {
  const MakeSpaceFromStatusBar({super.key});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQueryValues(context).height * 0.007,
    );
  }
}

// class OnBoardingHeaderImage extends StatelessWidget {
//   const OnBoardingHeaderImage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Image.asset(
//       AppImages.onBoardingHeader,
//       fit: BoxFit.fill,
//     );
//   }
// }

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
    required this.function,
  });

  final Function function;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQueryValues(context).height * 0.02,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p20,
          ),
          child: InkWell(
            onTap: () {
              function();
            },
            child: MyResponsiveText(
              text: S.of(context).skip,
              style: getBold(
                fontColor: AppColors.primaryColor,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OnBoardingImage extends StatelessWidget {
  const OnBoardingImage({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.cyan,
      height: MediaQueryValues(context).height * 0.4,
      width: MediaQueryValues(context).width,
      child: SvgPicture.asset(
        imagePath,
        fit: BoxFit.fill,
      ),
    );
  }
}

class MyCircleButton extends StatelessWidget {
  const MyCircleButton({
    super.key,
    required this.function,
  });

  final Function function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 2,
      ),
      child: FloatingActionButton(
        // mini: true,
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          function();
        },
      ),
    );
  }
}

class MyCircleButtonWithText extends StatelessWidget {
  const MyCircleButtonWithText({
    super.key,
    required this.function,
  });

  final Function function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        function();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: const StadiumBorder()),
      child: MyResponsiveText(
        text: S.of(context).enter,
        style: TextStyle(),
      ),
    );
  }
}

// class OnBoardingHeaderWithSkipButton extends StatelessWidget {
//   const OnBoardingHeaderWithSkipButton({
//     super.key,
//     required this.function,
//     required this.noSkip,
//   });
//
//   final Function function;
//   final bool noSkip;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         const OnBoardingHeaderImage(),
//         noSkip == true
//             ? SizedBox()
//             : SkipButton(
//                 function: function,
//               ),
//       ],
//     );
//   }
// }

class MyIndicator extends StatelessWidget {
  const MyIndicator({
    super.key,
    required this.controller,
    required this.count,
    this.activeDotColor = AppColors.primary_700_main,
    this.dotColor = AppColors.primary_100,
  });

  final PageController controller;
  final count;
  final activeDotColor;
  final dotColor;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      effect: ExpandingDotsEffect(
        dotHeight: MediaQueryValues(context).height*0.013,
        dotWidth: MediaQueryValues(context).width*0.026,
        activeDotColor: activeDotColor,
        dotColor: dotColor,
      ),
    );
  }
}
