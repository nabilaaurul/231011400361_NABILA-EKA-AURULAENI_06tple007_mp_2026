import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Workshop Kampus',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
        fontFamily: 'Roboto',
      ),
      home: WorkshopPage(),
    );
  }
}

class WorkshopPage extends StatefulWidget {
  @override
  _WorkshopPageState createState() => _WorkshopPageState();
}

class _WorkshopPageState extends State<WorkshopPage> {
  List<Map<String, dynamic>> workshops = [
    {"judul": "Flutter UI Mastery", "tanggal": "10 Mei 2026", "lokasi": "Lab Komputer", "kuota": 20, "terisi": 15},
    {"judul": "AI untuk Pemula", "tanggal": "12 Mei 2026", "lokasi": "Aula Kampus", "kuota": 30, "terisi": 10},
    {"judul": "Web Development Bootcamp", "tanggal": "15 Mei 2026", "lokasi": "Ruang 301", "kuota": 25, "terisi": 20},
    {"judul": "UI/UX Design", "tanggal": "18 Mei 2026", "lokasi": "Lab Desain", "kuota": 20, "terisi": 5},
  ];

  void daftarWorkshop(int index) {
    TextEditingController namaController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Pendaftaran Workshop"),
          content: TextField(
            controller: namaController,
            decoration: InputDecoration(
              labelText: "Nama lengkap",
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                if (namaController.text.isNotEmpty) {
                  setState(() {
                    workshops[index]["terisi"]++;
                  });

                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Pendaftaran berhasil")),
                  );
                }
              },
              child: Text("Daftar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workshop Kampus"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: workshops.length,
        itemBuilder: (context, index) {
          var w = workshops[index];
          bool full = w["terisi"] >= w["kuota"];
          double progress = w["terisi"] / w["kuota"];

          return Card(
            margin: EdgeInsets.only(bottom: 12),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    w["judul"],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text("Tanggal: ${w["tanggal"]}"),
                  Text("Lokasi: ${w["lokasi"]}"),

                  SizedBox(height: 12),

                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey[300],
                    color: full ? Colors.red : Colors.blue,
                  ),

                  SizedBox(height: 6),

                  Text("Kuota: ${w["terisi"]}/${w["kuota"]}"),

                  SizedBox(height: 12),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: full ? null : () => daftarWorkshop(index),
                      child: Text(full ? "Penuh" : "Daftar"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}