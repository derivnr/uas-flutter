import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return DataTable(
            border: TableBorder.all(),
            headingTextStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            dataTextStyle: const TextStyle(color: Colors.black, fontSize: 18),
            columns: const [
              DataColumn(label: Text("Name")),
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
      // body: Center(
      //   child: DataTable(
      //     border: TableBorder.all(),
      //     headingTextStyle: const TextStyle(
      //       fontSize: 20,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.black,
      //     ),
      //     dataTextStyle: const TextStyle(color: Colors.black, fontSize: 18),
      //     columns: const [
      //       DataColumn(label: Text("Name")),
      //       DataColumn(label: Text("Alamat")),
      //       DataColumn(label: Text("Umur"))
      //     ],
      //     rows: const [
      //       DataRow(cells: [
      //         DataCell(Text("Deri Ramdani")),
      //         DataCell(Text("Bandung")),
      //         DataCell(Text("31")),
      //       ]),
      //       DataRow(cells: [
      //         DataCell(Text("Deri Ramdani")),
      //         DataCell(Text("Bandung")),
      //         DataCell(Text("31")),
      //       ]),
      //       DataRow(cells: [
      //         DataCell(Text("Deri Ramdani")),
      //         DataCell(Text("Bandung")),
      //         DataCell(Text("31")),
      //       ]),
      //     ],
      //   ),
      // ),
    );
  }
}
