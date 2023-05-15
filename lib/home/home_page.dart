import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startertemplate/home/home_logic.dart';
import 'package:startertemplate/utils/confirmation_popup.dart';
import 'package:startertemplate/edit_task/edit_task_page.dart';
import 'package:startertemplate/home/components/task_item.dart';
import 'package:startertemplate/view_task/view_task_page.dart';
import '../add_task/add_task_page.dart';
import '../utils/location_service.dart';
import '../utils/my_color.dart';
import '../utils/notification_service.dart';
import 'components/hero_tanggal_hari_ini.dart';
import 'components/tombol_tambah_task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Service
  NotificationService notificationService = NotificationService();
  LocationService locationService = LocationService();

  // Logic
  HomeLogic homeLogic = HomeLogic();
  late List<dynamic> taskList;

  @override
  void initState() {
    taskList = homeLogic.getTaskList();
    inspect(taskList);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime tanggalHariIni = DateTime.now();

    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        children: [
          // Hero tanggal sekarang
          Column(
            children: [
              HeroTanggalHariIni(
                tanggalHariIni: tanggalHariIni,
                heroHeight: screenHeight * .3,
                heroWidth: screenWidth,
              ),

              // Task list
              taskList.isEmpty
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: MyColors.white,
                              border: Border.all(color: Colors.grey.shade200),
                            ),
                            child: Text(
                              'Tidak ada task',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                      height: screenHeight * .7,
                      width: screenWidth,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: taskList.length,
                        itemBuilder: (context, index) {
                          // Task item
                          return TaskItem(
                            id: taskList[index].id,
                            judul: taskList[index].judul,
                            detail: taskList[index].detail,
                            deadline: taskList[index].deadline,
                            isDone: taskList[index].isDone,
                            onTapTask: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ViewTaskPage(
                                    id: taskList[index].id,
                                    judul: taskList[index].judul,
                                    detail: taskList[index].detail,
                                    deadline: taskList[index].deadline,
                                    isDone: taskList[index].isDone,
                                  ),
                                ),
                              );
                            },
                            onTapIsDone: () {},
                            onTapEdit: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditTaskPage(
                                    id: taskList[index].id,
                                    judul: taskList[index].judul,
                                    detail: taskList[index].detail,
                                    deadline:
                                        taskList[index].deadline.toString(),
                                  ),
                                ),
                              );
                            },
                            onTapDelete: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ConfirmationPopup(
                                    onCancel: () {
                                      debugPrint('Cancel');
                                    },
                                    onContinue: () {
                                      debugPrint('Continue');
                                      homeLogic.deleteTask(taskList[index].id);
                                      setState(() {
                                        taskList = homeLogic.getTaskList();
                                      });
                                    },
                                    judul: "Konfirmasi",
                                    detail: "Yakin ingin menghapus task ini?",
                                  );
                                },
                              );
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Divider(
                              height: 2,
                              thickness: 2,
                              color: Colors.grey[300],
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),

          // Tombol tambah warna kuning
          Positioned(
            top: screenHeight * .25,
            left: screenWidth * .75,
            child: TombolTambahTask(
              onTap: () async {
                // Test lat dan long
                // Position currentPosition =
                //     await locationService.getCurrentLocation();
                // double latitude = currentPosition.latitude;
                // double longitude = currentPosition.longitude;

                // debugPrint(latitude.toString());
                // debugPrint(longitude.toString());

                // Test local notifikasi
                // notificationService.showNotification(
                //     'Judul Notifikasi', 'Ini isi notifikasi');

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddTaskPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
