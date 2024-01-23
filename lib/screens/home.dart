import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ListView with Input Form'),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: InputForm(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return DataTable(
                    border: TableBorder.all(),
                    headingTextStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    dataTextStyle:
                        const TextStyle(color: Colors.black, fontSize: 18),
                    columns: const [
                      DataColumn(label: Text("Nama")),
                      DataColumn(label: Text("Alamat")),
                      DataColumn(label: Text("Umur"))
                    ],
                    rows: const [
                      DataRow(cells: [
                        DataCell(Text("Deri Ramdani")),
                        DataCell(Text("Bandung")),
                        DataCell(Text("31")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("Deri Ramdani")),
                        DataCell(Text("Bandung")),
                        DataCell(Text("31")),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("Deri Ramdani")),
                        DataCell(Text("Bandung")),
                        DataCell(Text("31")),
                      ]),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nama'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(labelText: 'Alamat'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(labelText: 'Umur'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String address = addressController.text;
                String age = ageController.text;

                if (kDebugMode) {
                  print('Name: $name, Alamat: $address, Umur: $age');
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
