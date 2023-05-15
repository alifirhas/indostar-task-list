import 'package:flutter/material.dart';

import '../../utils/my_color.dart';

class ViewTaskNavigator extends StatelessWidget {
  final Function()? onTapBack;
  final Function()? onTapEdit;
  final Function()? onTapDelete;

  const ViewTaskNavigator(
      {super.key, this.onTapBack, this.onTapEdit, this.onTapDelete});

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

          // Tombol hapus dan edit
          Row(
            children: [
              // Tombol Edit
              InkWell(
                onTap: onTapEdit,
                child: Ink(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: MyColors.white,
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    padding: const EdgeInsets.all(13),
                    child: const Icon(
                      Icons.edit,
                      color: MyColors.blue,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),

              // Tombol hapus
              InkWell(
                onTap: onTapDelete,
                child: Ink(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: MyColors.white,
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    padding: const EdgeInsets.all(13),
                    child: const Icon(
                      Icons.delete,
                      color: MyColors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
