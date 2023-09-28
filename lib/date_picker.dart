import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final void Function(DateTime selectedDate) onDateSelected;

  const DatePicker({required this.onDateSelected, Key? key}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
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
      widget.onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}
