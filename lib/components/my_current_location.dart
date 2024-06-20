import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Lokasi Anda"),
        content: const TextField(
          decoration: InputDecoration(hintText: "Mencari Lokasi..."),
        ),
        actions: [
          //batalkan button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batalkan'),
          ),

          //simpan button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Lokasi anda",
            style: TextStyle(color: Colors.white),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: const Row(
              children: [
                //addres
                Text(
                  "Ruang TI22-A1",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //drop down menu
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          )
        ],
      ),
    );
  }
}
