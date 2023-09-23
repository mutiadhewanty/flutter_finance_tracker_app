import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 35)),
              Center(
                child: Image.asset(
                  "assets/images/logo_finance.png",
                  height: 295,
                  width: 245,
                ),
              ),
              const Text(
                "Finance Tracker",
                style: TextStyle(
                    color: Color(0xFF354F52),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFCAD2C5).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                  // controller: emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon:
                        const Icon(Icons.person, color: Color(0xFF354F52)),
                    hintText: "Username",
                    hintStyle: const TextStyle(color: Colors.black26),
                    filled: true,
                    fillColor: Colors.transparent,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFCAD2C5),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 23),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFCAD2C5).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(30),
                ),
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
                    filled: true,
                    fillColor: Colors.transparent,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFCAD2C5),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const HomePage()));
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF52796F),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "- or sign in with -",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF354F52),
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 36,
                    child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png"),
                  ),
                  const SizedBox(
                    width: 26,
                  ),
                  Container(
                    height: 36,
                    child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/2021_Facebook_icon.svg/2048px-2021_Facebook_icon.svg.png"),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account?",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF354F52).withOpacity(0.65)),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const RegisterPage()));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF354F52),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
