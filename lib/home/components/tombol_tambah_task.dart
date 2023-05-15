import 'package:flutter/material.dart';

class TombolTambahTask extends StatelessWidget {
  final Function()? onTap;
  const TombolTambahTask({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 62.0,
        height: 62.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.yellow.shade600,
        ),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
