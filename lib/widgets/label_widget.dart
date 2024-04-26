import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
  final String title;

  const LabelWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.grey[600]),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
