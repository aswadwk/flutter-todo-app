import 'package:flutter/material.dart';
import 'package:todo_app/common/global_thme.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final String? type;

  ButtonWidget({
    Key? key,
    required this.title,
    required this.onPressed,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: type == 'secondary'
            ? Colors.white
            : Theme.of(context).colorScheme.primary,

        // foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: type == 'secondary'
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: type == 'secondary'
                  ? Theme.of(context).colorScheme.primary
                  : Colors.white,
            ),
      ),
    );
  }
}
