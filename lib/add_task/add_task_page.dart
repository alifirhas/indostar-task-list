import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:startertemplate/add_task/add_task_logic.dart';
import 'package:startertemplate/add_task/components/add_task_navigator.dart';
import 'package:startertemplate/home/home_page.dart';
import 'package:startertemplate/models/task_list_model.dart';
import 'package:uuid/uuid.dart';

import '../utils/location_service.dart';
import '../utils/my_color.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  // Logic
  final addTaskLogic = AddTaskLogic();

  // Formatter
  final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');

  // Service
  LocationService locationService = LocationService();

  // Form key
  final _addTaskFormKey = GlobalKey<FormState>();

  // text editing controllers
  final judulController = TextEditingController();
  final detailController = TextEditingController();
  final deadlineController = TextEditingController();

  @override
  void initState() {
    super.initState();
    locationService.getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          children: [
            // Navigator
            AddTaskNavigator(
              onTapBack: () {
                Navigator.pop(context);
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

                    // Input judul textfield
                    TextFormField(
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

                    // Input judul textfield
                    TextFormField(
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

                    // Tombol tambah task / button tambah task
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        InkWell(
                          onTap: () {
                            final navigator = Navigator.of(context);
                            final form = _addTaskFormKey.currentState;

                            if (form!.validate()) {
                              double latitude = locationService.getLatitude();
                              double longitude = locationService.getLongitude();

                              debugPrint(latitude.toString());
                              debugPrint(longitude.toString());

                              Task task = Task(
                                id: const Uuid().v4().toString(),
                                judul: judulController.text,
                                detail: detailController.text,
                                deadline: dateFormatter
                                    .parse(deadlineController.text),
                                lat: latitude,
                                long: longitude,
                                createdAt: DateTime.now(),
                                updatedAt: DateTime.now(),
                                deletedAt: DateTime.now(),
                              );

                              if (addTaskLogic.tambahTask(task)) {
                                navigator.pop();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                );
                              }
                            }
                          },
                          child: Ink(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: MyColors.purple,
                              ),
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                'TAMBAH TASK',
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
