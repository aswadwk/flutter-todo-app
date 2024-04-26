import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/common/global_thme.dart';

class InputWidget extends StatelessWidget {
  final String? title;
  final String hintText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool isObscureText;
  final Function validate;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final bool? isReadOnly;
  final Color textColor;
  final Color cursorColor;

  const InputWidget({
    Key? key,
    this.title,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    this.isObscureText = false,
    this.validate = _defaultValidator,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.onTap,
    this.isReadOnly = false,
    this.textColor = Colors.black,
    this.cursorColor = Colors.black,
  }) : super(key: key);

  static void _defaultValidator(String value) {
    return;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscureText,
      style: TextStyle(
        fontSize: 16,
        color: textColor,
      ),
      validator: (value) {
        return validate(value!);
      },
      onTap: onTap,
      readOnly: isReadOnly!,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: inputFormatters ?? [],
      cursorColor: cursorColor,
      cursorHeight: 24,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
        labelText: title,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
