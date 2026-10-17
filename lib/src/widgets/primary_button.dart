import 'package:flutter_custom_ui_kit/common_exports.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData? prefixIcon;
  final bool isExpand;
  final double? borderRadius;

  const PrimaryButton({
    required this.title,
    required this.onTap,
    this.prefixIcon,
    this.borderRadius,
    this.isExpand = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 48,
    width: isExpand ? double.infinity : null,
    child: ElevatedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: context.primaryColor.withValues(alpha: 0.5),
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(borderRadius ?? kAppBorderRadius),
        ),
      ),
      onPressed: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(width: kAppPadding - 8),
          if (prefixIcon != null) ...{
            Icon(prefixIcon, size: 24, color: Colors.white),
          },
        ],
      ),
    ),
  );
}
