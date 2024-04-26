import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const EmptyStateWidget({
    super.key,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 24),
          Image.asset('assets/images/empty_state_image.png'),
          const SizedBox(height: 24),
          Text(
            title ?? 'Tidak ada data',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            subtitle ?? 'Data tidak ditemukan',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
