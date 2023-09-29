import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finance_tracker_app/detail_page.dart';
import 'package:flutter_finance_tracker_app/expenses_page.dart';
import 'package:flutter_finance_tracker_app/income_page.dart';
import 'package:flutter_finance_tracker_app/models/finance_model.dart';
import 'package:flutter_finance_tracker_app/services/database_helper.dart';
import 'package:flutter_finance_tracker_app/settings_page.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Finance> finances = [];

  void _fetchFinances() async {
    final allFinances = await DatabaseHelper.getAllFinance();

    setState(() {
      finances = allFinances ?? [];
      _calculateTotalbyCategory();
    });
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

  List<FlSpot> chartData = [];

  void _calculateTotalbyCategory() {
    chartData = [];
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

    chartData.add(FlSpot(0, 0)); // Awal chart
    int index = 1;
    for (final finance in finances) {
      final nominal = finance.nominal;
      chartData.add(FlSpot(index.toDouble(), nominal?.toDouble() ?? 0));
      index++;
    }

    setState(() {});
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
                Container(
                    height: 200,
                    width: 300,
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(show: false),
                        titlesData: FlTitlesData(
                          leftTitles: SideTitles(showTitles: false),
                          bottomTitles: SideTitles(
                            showTitles: true,
                            getTitles: (value) {
                              final index = value.toInt();
                              if (index >= 0 && index < finances.length) {
                                final date = DateTime.parse(finances[index]
                                    .date); // Ganti dengan properti tanggal yang sesuai
                                return DateFormat.MMM().format(
                                    date); // Sesuaikan dengan format tanggal yang diinginkan
                              }
                              return '';
                            },
                          ),
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: Border.all(
                              color: const Color(0xff37434d), width: 1),
                        ),
                        minX: 0,
                        maxX: finances.length.toDouble() - 1,
                        minY: 0,
                        maxY: 100000, // Sesuaikan dengan skala yang sesuai
                        lineBarsData: [
                          LineChartBarData(
                            spots: finances.asMap().entries.map((entry) {
                              final index = entry.key;
                              final nominal = entry.value.nominal;
                              final isIncome = entry.value.kategori == 'income';

                              return FlSpot(
                                  index.toDouble(), nominal?.toDouble() ?? 0);
                            }).toList(),
                            isCurved: true,
                            dotData: FlDotData(show: false),
                            belowBarData: BarAreaData(show: false),
                            colors: [Colors.green], // Warna garis (line)
                            barWidth: 4, // Lebar garis (line)
                          ),
                          LineChartBarData(
                            spots: finances.asMap().entries.map((entry) {
                              final index = entry.key;
                              final nominal = entry.value.nominal;
                              final isIncome = entry.value.kategori == 'income';

                              return FlSpot(index.toDouble(),
                                  isIncome ? nominal?.toDouble() ?? 0 : 0);
                            }).toList(),
                            isCurved: true,
                            dotData: FlDotData(show: false),
                            belowBarData: BarAreaData(show: false),
                            colors: [Colors.red], // Warna garis (line)
                            barWidth: 4, // Lebar garis (line)
                          ),
                        ],
                      ),
                    )),
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
