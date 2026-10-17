import 'package:flutter_custom_ui_kit/common_exports.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final String subTitle;

  const TitleWidget({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: kToolbarHeight + 16),
          if (title == "Login" || title == "Create Account") ...{
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(Icons.arrow_back),
            ),
            const SizedBox(height: 16),
          },
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            subTitle,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
        ],
      );
}
