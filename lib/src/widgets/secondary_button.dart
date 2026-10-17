import 'package:flutter_custom_ui_kit/common_exports.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData? prefixIcon;
  final bool isExpand;
  final double? borderRadius;

  const SecondaryButton({
    required this.title,
    required this.onTap,
    this.prefixIcon,
    this.borderRadius,
    this.isExpand = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
    width: isExpand ? double.infinity : null,
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? kAppBorderRadius),
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
