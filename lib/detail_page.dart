import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Cash Flow'),
        backgroundColor: const Color(0xFF3E616B),
      ),
      body: ListView.builder(itemBuilder: ((context, index) {
        return Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '[+] Rp 250.000',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2B4856)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Dapat bayaran panitia sertifikasi',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2B4856)),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      '25-09-2023',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2B4856).withOpacity(0.5)),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_back_rounded,
                size: 45,
                color: Colors.green.shade700,
              )
            ],
          ),
        );
      })),
    );
  }
}
