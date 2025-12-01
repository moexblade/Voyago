import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text("Sign In", style: TextStyle(color: Colors.white, fontFamily: "PlayfairDisplay-italic", fontSize: 32)),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(gradient: LinearGradient(
          colors: [Colors.lightBlueAccent, Colors.greenAccent],
          begin: Alignment.bottomLeft,
          end: Alignment.topLeft,
        ),),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    const Text(
                      "Welcome Back",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold, fontFamily: "PlayfairDisplay"
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Sign in with your email and password\nor continue with social media",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontFamily: "PlayfairDisplay"),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    const SignInForm(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocalCard(
                          icon: const Icon(Icons.g_mobiledata, color: Colors.red),
                          press: () {},
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SocalCard(
                            icon: const Icon(Icons.facebook, color: Colors.blue),
                            press: () {},
                          ),
                        ),
                        SocalCard(
                          icon: const Icon(Icons.alternate_email, color: Colors.blue),
                          press: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const NoAccountText(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const authOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.white),
  borderRadius: BorderRadius.all(Radius.circular(100)),
);

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            onSaved: (email) {},
            onChanged: (email) {},
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: "Enter your email / phone number",
              labelText: "Email / Phone Number",
              labelStyle: TextStyle(color: Colors.white),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintStyle: const TextStyle(color: Colors.white),
              contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              suffixIcon: const Icon(Icons.mail, color: Colors.white),
              border: authOutlineInputBorder,
              enabledBorder: authOutlineInputBorder,
              focusedBorder: authOutlineInputBorder.copyWith(
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: TextFormField(
              onSaved: (password) {},
              onChanged: (password) {},
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter your password",
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.white),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintStyle: const TextStyle(color: Colors.white),
                contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                suffixIcon: const Icon(Icons.lock, color: Colors.white),
                border: authOutlineInputBorder,
                enabledBorder: authOutlineInputBorder,
                focusedBorder: authOutlineInputBorder.copyWith(
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.black,
              foregroundColor: Colors.black,
              minimumSize: const Size(double.infinity, 48),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
            child: const Text("Continue", style: TextStyle(color: Colors.white, fontSize: 18),),
          )
        ],
      ),
    );
  }
}

class SocalCard extends StatelessWidget {
  const SocalCard({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final Widget icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 56,
        width: 56,
        decoration: const BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}

class NoAccountText extends StatelessWidget {
  const NoAccountText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don’t have an account? ",
          style: TextStyle(color: Colors.white),
        ),
        GestureDetector(
          onTap: () {},
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
