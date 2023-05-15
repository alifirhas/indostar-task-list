import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:startertemplate/edit_task/edit_task_page.dart';

import '../utils/my_color.dart';
import 'components/view_task_navigator.dart';

class ViewTaskPage extends StatefulWidget {
  final String id;
  final String judul;
  final String detail;
  final String deadline;

  const ViewTaskPage({
    super.key,
    required this.id,
    required this.judul,
    required this.detail,
    required this.deadline,
  });

  @override
  State<ViewTaskPage> createState() => _ViewTaskPageState();
}

class _ViewTaskPageState extends State<ViewTaskPage> {
  // Screen
  // final double screenWidth = MediaQuery.of(context).size.width;
  // final double screenHeight = MediaQuery.of(context).size.height;

  // Formatter
  final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');

  // Form key
  final _addTaskFormKey = GlobalKey<FormState>();

  // text editing controllers
  final judulController = TextEditingController();
  final detailController = TextEditingController();
  final deadlineController = TextEditingController();

  @override
  void initState() {
    super.initState();

    judulController.text = widget.judul;
    detailController.text = widget.detail;
    deadlineController.text = widget.deadline;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          children: [
            // Navigator
            ViewTaskNavigator(
              onTapBack: () {
                Navigator.pop(context);
              },
              onTapDelete: () {},
              onTapEdit: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditTaskPage(
                      id: widget.id,
                      judul: widget.judul,
                      detail: widget.detail,
                      deadline: widget.deadline,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),

            // Form
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _addTaskFormKey,
                child: Column(
                  children: [
                    // Input judul textfield
                    TextFormField(
                      enabled: false,
                      keyboardType: TextInputType.text,
                      controller: judulController,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: MyColors.white,
                        filled: true,
                        hintText: 'Nama task',
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                        ),
                        suffix: Text(
                          ' ',
                          style: GoogleFonts.inter(
                            color: Colors.grey.shade200,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Tolong isi judul task';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),

                    // Input detail textfield
                    TextFormField(
                      enabled: false,
                      keyboardType: TextInputType.text,
                      maxLines: 5,
                      controller: detailController,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: MyColors.white,
                        filled: true,
                        hintText: 'Detail task',
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                        ),
                        suffix: Text(
                          ' ',
                          style: GoogleFonts.inter(
                            color: Colors.grey.shade200,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Tolong isi detail task';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),

                    // Input date textfield
                    TextFormField(
                      enabled: false,
                      keyboardType: TextInputType.text,
                      controller: deadlineController,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: MyColors.white,
                        filled: true,
                        hintText: 'Deadline task',
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _selectDate(context);
                          },
                          icon: const Icon(Icons.date_range),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Tolong isi deadline task';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),

                    // Tombol selesaikan task
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Ink(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: MyColors.purple,
                              ),
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                'DONE',
                                style: GoogleFonts.inter(
                                  color: MyColors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    ).then((value) {
      var pickedDate = value.toString();
      setState(() {
        deadlineController.text =
            dateFormatter.format(dateFormatter.parse(pickedDate));
      });
    });
  }
}
