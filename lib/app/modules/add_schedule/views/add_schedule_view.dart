import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_schedule_controller.dart';

class AddScheduleView extends GetView<AddScheduleController> {
  AddScheduleView({super.key});
  TimeOfDay timeOfDay = TimeOfDay.now();
  final _formKey = GlobalKey<FormState>();

  Future displayTimePicker(
      BuildContext context, TextEditingController textfieldController) async {
    var time = await showTimePicker(context: context, initialTime: timeOfDay);

    if (time != null) {
      textfieldController.text = "${time.hour}:${time.minute}";
      controller.timeController.add(textfieldController);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color.fromARGB(255, 7, 173, 214),
        title: const Text('Add Medicine Schedule'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Center(
            child: ListView(children: [
        // Menambahkan gambar dari assets di sini
        Container(
          padding: const EdgeInsets.all(20),
          child: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsHVZKc9O3QxbF3QxyuV_jvtsA_FhOA3JrvA&s', // Path gambar lokal
            width: 150,
            height: 150,
          ),
        ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Add Medicine',
              style: TextStyle(
                color: Color.fromARGB(255, 7, 173, 214),
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: controller.nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'Name',
              ),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'This field cannot be empty';
                }
                return null;
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: TextFormField(
              controller: controller.frequencyController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'Frequency',
              ),
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                controller.frequency.value = int.parse(value);
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'This field cannot be empty';
                }
                return null;
              },
            ),
          ),
          Obx(
            () => Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.frequency.value,
                itemBuilder: (context, index) {
                  final timeController = TextEditingController();
                  return Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: TextFormField(
                      controller: timeController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Time',
                      ),
                      textInputAction: TextInputAction.next,
                      onTap: () {
                        displayTimePicker(context, timeController);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field cannot be empty';
                        }
                        return null;
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 7, 173, 214),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              child: const Text('Add'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  controller.add(
                    controller.nameController.text,
                    int.parse(controller.frequencyController.text),
                  );
                }
              },
            ),
          ),
        ])),
      ),
    );
  }
}
'blablabla'
