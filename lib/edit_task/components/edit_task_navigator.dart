import 'package:flutter/material.dart';

import '../../utils/my_color.dart';

class EditTaskNavigator extends StatelessWidget {
  final Function()? onTapBack;
  const EditTaskNavigator({super.key, this.onTapBack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 24, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Tombol kembali
          InkWell(
            onTap: onTapBack,
            child: Ink(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: MyColors.white,
                  border: Border.all(color: Colors.grey.shade200),
                ),
                padding: const EdgeInsets.all(13),
                child: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
