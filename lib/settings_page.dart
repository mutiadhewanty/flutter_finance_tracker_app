import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _obscureText = true;
  bool _obscureText2 = true;

  var passwordController = TextEditingController();
  var newPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        backgroundColor: const Color(0xFF3E616B),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ganti Password',
                style: TextStyle(
                    color: Color(0xFF2B4856),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Password Saat Ini',
                style: TextStyle(
                    color: Color(0xFF3E616B), fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: const Color(0xFF3E616B).withOpacity(0.5),
                        width: 2)),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon:
                        const Icon(Icons.lock, color: Color(0xFF354F52)),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: const Color(0xFF354F52),
                      ),
                    ),
                    hintText: "Password",
                    hintStyle: const TextStyle(color: Colors.black26),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Password Baru',
                style: TextStyle(
                    color: Color(0xFF3E616B), fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: const Color(0xFF3E616B).withOpacity(0.5),
                        width: 2)),
                child: TextFormField(
                  controller: newPasswordController,
                  obscureText: _obscureText2,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon:
                        const Icon(Icons.lock, color: Color(0xFF354F52)),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText2 = !_obscureText2;
                        });
                      },
                      child: Icon(
                        _obscureText2 ? Icons.visibility_off : Icons.visibility,
                        color: const Color(0xFF354F52),
                      ),
                    ),
                    hintText: "Password Baru",
                    hintStyle: const TextStyle(color: Colors.black26),
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
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const HomePage()));
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
              const SizedBox(
                height: 65,
              ),
              Row(
                children: [
                  Container(
                    height: 165,
                    width: 165,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFF3E616B), width: 2.0),
                        borderRadius: BorderRadius.circular(15)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/images/photo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About This App',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2B4856)),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Aplikasi ini dibuat oleh:',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF2B4856)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Nama: Mutiara Dhewanty W',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF2B4856)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'NIM: 2141764073',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF2B4856)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Tanggal: 25 September 2023',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF2B4856)),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
