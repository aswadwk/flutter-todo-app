import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownWidget extends StatelessWidget {
  final String? selectedValue;
  final List<DropdownMenuItem<String>> items;
  final Widget hitText;
  final String hintTextSearch;
  final TextEditingController textEditingController; // searchController
  final Function(Object?)? onChanged;
  final Function? validator;

  const DropdownWidget({
    Key? key,
    required this.hitText,
    required this.hintTextSearch,
    required this.onChanged,
    required this.textEditingController,
    required this.items,
    this.validator,
    this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
      isExpanded: true,
      hint: hitText,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black54,
      ),
      iconStyleData: const IconStyleData(
        icon: Padding(
          padding: EdgeInsets.only(right: 12),
          child: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.grey,
          ),
        ),
      ),
      items: items,
      value: selectedValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        return validator!(value);
      },
      onChanged: (value) {
        onChanged!(value);
      },
      dropdownStyleData: const DropdownStyleData(
        maxHeight: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
      // menuItemStyleData: const MenuItemStyleData(
      //   height:45,
      // ),
      dropdownSearchData: DropdownSearchData(
        searchController: textEditingController,
        searchInnerWidgetHeight: 50,
        searchInnerWidget: Container(
          height: 68,
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          child: TextFormField(
            expands: true,
            maxLines: null,
            controller: textEditingController,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              hintText: hintTextSearch,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        searchMatchFn: (item, filter) {
          return item.child
              .toString()
              .toLowerCase()
              .contains(filter.toLowerCase());
        },
      ),
      onMenuStateChange: (isOpen) {
        if (!isOpen) {
          // Clear the search value
          textEditingController.clear();
        }
      },
    );
  }
}
