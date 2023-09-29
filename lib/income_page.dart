import 'package:flutter/material.dart';
import 'package:flutter_finance_tracker_app/date_picker.dart';
import 'package:flutter_finance_tracker_app/home_page.dart';
import 'package:flutter_finance_tracker_app/models/finance_model.dart';

import 'services/database_helper.dart';

class IncomePage extends StatefulWidget {
  final Finance? finance;
  const IncomePage({Key? key, this.finance}) : super(key: key);

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  var keteranganController = TextEditingController();
  var nominalController = TextEditingController();
  late DateTime _selectedDate;

  @override
  void _handleDateSelected(DateTime selectedDate) {
    setState(() {
      _selectedDate = selectedDate;
    });
  }

  void initState() {
    super.initState();
    if (widget.finance != null) {
      nominalController.text = widget.finance!.nominal.toString();
      keteranganController.text = widget.finance!.keterangan;
    }
  }

  void _saveIncomeData() async {
    final id = widget.finance?.id;
    final date = _selectedDate.toIso8601String();
    final nominal = int.tryParse(nominalController.value.text) ?? 0;
    final keterangan = keteranganController.value.text;

    final finance = Finance(
      id: id,
      date: date,
      nominal: nominal,
      keterangan: keterangan,
      kategori: 'income',
    );

    await DatabaseHelper.addFinance(finance);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Pemasukan berhasil disimpan.'),
      ),
    );
  }

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
                      border: Border.all(
                          color: const Color(0xFF3E616B), width: 2.0)),
                  child: DatePicker(
                    onDateSelected: _handleDateSelected,
                  )),
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
                  controller: nominalController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    prefixIcon: Text('   Rp '),
                    prefixIconConstraints:
                        BoxConstraints(minWidth: 0, minHeight: 0),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Keterangan',
                style: TextStyle(
                    color: Color(0xFF3E616B), fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 135,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: const Color(0xFF3E616B), width: 2.0)),
                child: TextFormField(
                  controller: keteranganController,
                  maxLines: null,
                  decoration: const InputDecoration(
                    prefixText: '   ',
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    nominalController.clear();
                    keteranganController.clear();
                  },
                  icon: const Icon(Icons.restart_alt_rounded),
                  label: const Text(
                    "Reset",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFCA9E5B),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _saveIncomeData();
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const HomePage()));
                  },
                  icon: const Icon(Icons.save_alt_rounded),
                  label: const Text(
                    "Simpan",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8AB37A),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  icon: const Icon(Icons.arrow_back_rounded),
                  label: const Text(
                    "Kembali",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF557682),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
