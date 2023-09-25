import 'package:flutter/material.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  DateTime selectDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectDate) {
      setState(() {
        selectDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Pemasukan'),
        backgroundColor: const Color(0xFF3E616B),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tambah Pemasukan Anda Disini',
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Tanggal',
                style: TextStyle(
                    color: Color(0xFF3E616B), fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    // color: const Color(0xFFCAD2C5).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: const Color(0xFF3E616B), width: 2.0)),
                child: TextFormField(
                  readOnly: true,
                  controller: TextEditingController(
                    text: "${selectDate.toLocal()}".split(' ')[0],
                  ),
                  onTap: () {
                    _selectDate(context);
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.transparent,
                    suffixIcon: Icon(
                      Icons.calendar_month_outlined,
                      color: Color(0xFF3E616B),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Nominal',
                style: TextStyle(
                    color: Color(0xFF3E616B), fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: const Color(0xFF3E616B), width: 2.0)),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: InputBorder.none, prefixText: 'Rp '),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
