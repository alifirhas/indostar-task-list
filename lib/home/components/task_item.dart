import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/my_color.dart';

class TaskItem extends StatefulWidget {
  final String id;
  final String judul;
  final String detail;
  final String deadline;
  final bool isDone;
  final Function()? onTapTask;
  final Function()? onTapIsDone;
  final Function()? onTapEdit;
  final Function()? onTapDelete;

  const TaskItem({
    super.key,
    required this.id,
    required this.judul,
    required this.detail,
    required this.deadline,
    required this.isDone,
    this.onTapTask,
    this.onTapIsDone,
    this.onTapEdit,
    this.onTapDelete,
  });

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTapTask,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 24,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.grey[200],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Leading, title, dan subtitle
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Leading
                GestureDetector(
                  onTap: widget.onTapIsDone,
                  child: widget.isDone == true
                      ? const Icon(Icons.check_box_outline_blank)
                      : const Icon(
                          Icons.check_box,
                          color: Colors.green,
                        ),
                ),

                const SizedBox(width: 16),

                // Title dan subtitle
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // title
                    Text(
                      widget.judul,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // sub title
                    Text(
                      "${widget.deadline} - ${widget.detail}",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Trailing
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Tombol edit
                GestureDetector(
                  onTap: widget.onTapEdit,
                  child: const Icon(
                    Icons.edit,
                    color: MyColors.blue,
                  ),
                ),
                const SizedBox(width: 16),

                // Tombol hapus
                GestureDetector(
                  onTap: widget.onTapDelete,
                  child: const Icon(
                    Icons.delete,
                    color: MyColors.red,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
