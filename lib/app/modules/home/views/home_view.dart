import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pengingat_obat/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 7, 173, 214),
        title: const Text('Home'),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: controller.obx(
        (state) => ListView.builder(
          itemCount: state!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(state[index].name),
              subtitle:
                  Text("${state[index].frequency.toString()} kali sehari"),
              onTap: () => Get.toNamed(Routes.DETAIL_MEDICINE,
                  arguments: state[index].id),
            );
          },
        ),
        // onLoading: Center(child: CircularProgressIndicator()),
        // onEmpty: Center(child: Text("Data Kosong")),
        onLoading: Center(
          child: CircularProgressIndicator(),
        ),
        onEmpty: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsHVZKc9O3QxbF3QxyuV_jvtsA_FhOA3JrvA&s', // Gambar yang akan ditampilkan
              ),
              SizedBox(height: 16),
              Text(
                "Data Kosong",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton( 
  onPressed: () {
    Get.toNamed(Routes.ADD_SCHEDULE);
  },
  backgroundColor:  const Color.fromARGB(255, 7, 173, 214), // Warna latar belakang tombol
  foregroundColor: Colors.white, // Warna ikon
  child: const Icon(Icons.add),
),
    );
  }
}
