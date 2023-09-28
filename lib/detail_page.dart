import 'package:flutter/material.dart';
import 'package:flutter_finance_tracker_app/models/finance_model.dart';
import 'package:flutter_finance_tracker_app/services/database_helper.dart';

class DetailPage extends StatefulWidget {
  final Finance? finance;
  const DetailPage({Key? key, this.finance}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Future<List<Finance>?> getDataFromDatabase() async {
    final finances = await DatabaseHelper.getAllFinance();
    return finances;
  }

  List<Finance>? financeList;
  @override
  void initState() {
    super.initState();
    getDataFromDatabase().then((result) {
      setState(() {
        financeList = result;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Cash Flow'),
        backgroundColor: const Color(0xFF3E616B),
      ),
      body: ListView.builder(
          itemCount: financeList?.length ?? 0,
          itemBuilder: ((context, index) {
            final finances = financeList![index];
            Color iconColor =
                finances.kategori == 'expenses' ? Colors.red : Colors.green;
            IconData iconArrow = finances.kategori == 'income'
                ? Icons.arrow_back_rounded
                : Icons.arrow_forward_rounded;
            String tanda = finances.kategori == 'income' ? '+' : '-';
            return Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '[ ${tanda} ] Rp ${finances.nominal}',
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF2B4856)),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          finances.keterangan,
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF2B4856)),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          '${DateTime.parse(finances.date).day}-${DateTime.parse(finances.date).month}-${DateTime.parse(finances.date).year}',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF2B4856).withOpacity(0.5)),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          finances.kategori,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF2B4856).withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    iconArrow,
                    size: 45,
                    color: iconColor,
                  )
                ],
              ),
            );
          })),
    );
  }
}
