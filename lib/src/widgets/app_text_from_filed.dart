import 'package:flutter_custom_ui_kit/common_exports.dart';

class AppTextFromFiled extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? title;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? placeholder;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;

  const AppTextFromFiled({
    this.title,
    this.onTap,
    this.validator,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.placeholder,
    this.keyboardType,
    this.obscureText = false,
    super.key,
  });

  @override
  State<AppTextFromFiled> createState() => _AppTextFromFiledState();
}

class _AppTextFromFiledState extends State<AppTextFromFiled> {
  final FocusNode focusNode = FocusNode();
  bool isAnimateLineFocused = false;
  late final ValueNotifier<bool> _obscureTextNotifier;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(_onFocusChange);
    _obscureTextNotifier = ValueNotifier<bool>(widget.obscureText);
  }

  @override
  void dispose() {
    focusNode
      ..removeListener(_onFocusChange)
      ..dispose();
    _obscureTextNotifier.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      isAnimateLineFocused = focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.title != null) ...{
                Text(
                  widget.title!,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              },
              const SizedBox(height: 8),
              ValueListenableBuilder<bool>(
                valueListenable: _obscureTextNotifier,
                builder: (context, obscureText, child) {
                  return TextFormField(
                    onTap: widget.onTap,
                    focusNode: focusNode,
                    validator: widget.validator,
                    controller: widget.controller,
                    obscureText: obscureText,
                    keyboardType: widget.keyboardType ?? TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: context.primaryColor.withValues(alpha: 0.1),
                      hintText: widget.placeholder,
                      prefixIcon: widget.prefixIcon,
                      suffixIcon: widget.suffixIcon ??
                          (widget.obscureText
                              ? IconButton(
                                  onPressed: () => _obscureTextNotifier.value =
                                      !_obscureTextNotifier.value,
                                  icon: Icon(
                                    obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: context.primaryColor,
                                  ),
                                )
                              : null),
                      contentPadding: EdgeInsets.all(kAppPadding),
                      border: const UnderlineInputBorder(
                          borderSide: BorderSide.none),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide.none),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide.none),
                    ),
                  );
                },
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedContainer(
              curve: Curves.easeInCubic,
              duration: const Duration(milliseconds: 500),
              height: isAnimateLineFocused ? 1.5 : 0.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.zero,
                color: isAnimateLineFocused ? context.primaryColor : null,
              ),
            ),
          ),
        ],
      );
}
