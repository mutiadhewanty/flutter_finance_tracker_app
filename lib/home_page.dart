import 'package:flutter/material.dart';
import 'package:flutter_finance_tracker_app/detail_page.dart';
import 'package:flutter_finance_tracker_app/expenses_page.dart';
import 'package:flutter_finance_tracker_app/income_page.dart';
import 'package:flutter_finance_tracker_app/models/finance_model.dart';
import 'package:flutter_finance_tracker_app/services/database_helper.dart';
import 'package:flutter_finance_tracker_app/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Finance> finances = [];

  void _fetchFinances() async {
    final allFinances = await DatabaseHelper.getAllFinance();

    print('Jumlah data sebelum: ${finances.length}');

    setState(() {
      finances = allFinances ?? [];
      _calculateTotalbyCategory();
    });

    print('Jumlah data setelah: ${finances.length}');
    for (final finance in allFinances!) {
      print('Nominal: ${finance.nominal}');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchFinances();
    _calculateTotalbyCategory();
  }

  Map<String, int> totalByCategory = {
    'income': 0,
    'expenses': 0,
  };

  void _calculateTotalbyCategory() {
    for (final finance in finances) {
      final kategori = finance.kategori;
      final nominal = finance.nominal;

      if (kategori == 'income' && nominal != null) {
        totalByCategory['income'] = (totalByCategory['income'] ?? 0) + nominal;
      } else if (kategori == 'expenses' && nominal != null) {
        totalByCategory['expenses'] =
            (totalByCategory['expenses'] ?? 0) + nominal;
      }
    }
  }

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
                Text(
                  'Pengeluaran: Rp ${totalByCategory['expenses']}',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Pemasukan: Rp ${totalByCategory['income']}',
                  style: const TextStyle(
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
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const DetailPage()));
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
                                'assets/images/detail.png',
                              ),
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
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SettingsPage()));
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
                                'assets/images/settings.png',
                              ),
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
