import 'package:cash_toggar_app/generated/assets.dart';
import 'package:cash_toggar_app/resources/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../generated/l10n.dart';
import '../../../resources/colors_manager.dart';
import '../../../resources/fonts_style.dart';
import '../../../resources/icons_manager.dart';
import '../MyResponsiveText.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQueryValues(context).width * 0.8,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(
          50,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
              selectedIcon: Assets.iconsHomeBoldIconSvg,
              unselectedIcon: Assets.iconsHomeLinearIconSvg,
              label: S.of(context).home,
              isSelected: currentIndex == 0,
              onTap: () => onTap(0),
              context: context),
          _buildNavItem(
              selectedIcon: Assets.iconsTransactionsBoldIconSvg,
              unselectedIcon: Assets.iconsTransactionsLinearIconSvg,
              label: S.of(context).transactions,
              isSelected: currentIndex == 1,
              onTap: () => onTap(1),
              context: context),
          _buildNavItem(
              selectedIcon: Assets.iconsProfileBoldIconSvg,
              unselectedIcon: Assets.iconsProfileLinearIconSvg,
              label: S.of(context).profile,
              isSelected: currentIndex == 2,
              onTap: () => onTap(2),
              context: context),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required String selectedIcon,
    required String unselectedIcon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.secondaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(
            23,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 30,
                width: 20,
                child: SvgPicture.asset(
                  isSelected ? selectedIcon : unselectedIcon,
                  color: isSelected ? Colors.white : AppColors.myWhite,
                ),
              ),
              const SizedBox(width: 5),
              isSelected
                  ? MyResponsiveText(
                      text: label,
                      style: getBold(
                        fontColor:
                            isSelected ? AppColors.myWhite : AppColors.myWhite,
                        fontSize: 12,
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
