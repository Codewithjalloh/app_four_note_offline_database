import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final String text;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;

  const NoteTile({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
