import 'package:flutter/material.dart';
import 'package:startertemplate/home/components/task_item.dart';
import '../add_task/add_task_page.dart';
import 'components/hero_tanggal_hari_ini.dart';
import 'components/tombol_tambah_task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
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
              SizedBox(
                height: screenHeight * .7,
                width: screenWidth,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    // Task item
                    return TaskItem(
                      id: index.toString(),
                      judul: "judul",
                      detail: "detail",
                      deadline: "deadline",
                      isDone: (index % 2 == 0) ? true : false,
                      onTapTask: () {},
                      onTapIsDone: () {},
                      onTapEdit: () {},
                      onTapDelete: () {},
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
              onTap: () {
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
