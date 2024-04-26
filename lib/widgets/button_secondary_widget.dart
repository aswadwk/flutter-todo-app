import 'package:flutter/material.dart';
import 'package:todo_app/common/global_thme.dart';

class SecondaryButtonWidget extends StatelessWidget {
  final String title;

  const SecondaryButtonWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 80,
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          'Lihat Semua',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: primaryColor,
                fontWeight: FontWeight.normal,
              ),
        ),
      ),
    );
  }
}
