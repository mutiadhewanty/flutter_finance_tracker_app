import 'package:flutter/material.dart';
import 'package:flutter_finance_tracker_app/expenses_page.dart';
import 'package:flutter_finance_tracker_app/income_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 85),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Rangkuman Bulan Ini',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Pengeluaran: Rp 500.000',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Pemasukan: Rp 1.500.000',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ),
                const SizedBox(
                  height: 8,
                ),
                Image.asset(
                  'assets/images/chart.png',
                  height: 295,
                  width: 245,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const IncomePage()));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xFF3E616B),
                                    width: 2.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/income.png',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text('Tambah Pemasukan')
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ExpensesPage()));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xFF3E616B),
                                    width: 2.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/expenses.png',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text('Tambah Pengeluaran')
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 13.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xFF3E616B), width: 2.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              'assets/images/detail.png',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text('Detail Cash Flow')
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xFF3E616B), width: 2.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              'assets/images/settings.png',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text('Pengaturan')
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
