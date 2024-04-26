import 'package:flutter/material.dart';

class CheckBoxFormField extends FormField<bool> {
  final bool isChecked;
  final Widget? label;
  final void Function(bool?) onChanged;
  CheckBoxFormField({
    super.key,
    required this.isChecked,
    this.label,
    required this.onChanged,
    FormFieldValidator<bool>? validator,
  }) : super(
          initialValue: isChecked,
          validator: validator,
          builder: (field) {
            void onChangedHandler(bool? value) {
              field.didChange(value);
              onChanged(value);
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    onChangedHandler(!isChecked);
                  },
                  child: Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: onChangedHandler,
                        activeColor: Theme.of(field.context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        checkColor: Colors.white,
                      ),
                      const SizedBox(width: 10),
                      label ?? const SizedBox(),
                    ],
                  ),
                ),
                field.isValid
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Text(
                          field.errorText ?? "",
                          style: TextStyle(
                            color: Colors.red[700],
                            fontSize: 13.0,
                          ),
                        ),
                      ),
              ],
            );
          },
        );

  @override
  _CheckBoxFormFieldState createState() => _CheckBoxFormFieldState();
}

class _CheckBoxFormFieldState extends FormFieldState<bool> {
  @override
  CheckBoxFormField get widget => super.widget as CheckBoxFormField;

  @override
  void didChange(bool? value) {
    super.didChange(value);
  }
}
