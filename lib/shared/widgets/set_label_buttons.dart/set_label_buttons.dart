import 'package:flutter/material.dart';
import 'package:playflow_app/shared/themes/app_colors.dart';
import 'package:playflow_app/shared/themes/app_text_styles.dart';
import 'package:playflow_app/shared/widgets/divider/divider_vertical.dart';
import 'package:playflow_app/shared/widgets/label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final bool enabledPrimaryColor;

  SetLabelButtons({
    Key? key, 
    required this.primaryLabel, 
    required this.primaryOnPressed, 
    required this.secondaryLabel, 
    required this.secondaryOnPressed,
    this.enabledPrimaryColor = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.shape,
      height: 56,
      child: Row(
        children: [
          Expanded(
            child: LabelButton(
              label: primaryLabel,
              onPressed: primaryOnPressed,
              style: enabledPrimaryColor ? TextStyles.buttonPrimary : null,
            ),
          ),
          DividerVertical(),
          Expanded(
            child: LabelButton(
              label: secondaryLabel,
              onPressed: secondaryOnPressed,
            ),
          ),
        ],
      ),
    );
  }
}
