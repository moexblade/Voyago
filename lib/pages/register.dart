import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with gradient-compatible background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Register",
          style: TextStyle(color: Colors.white, fontFamily: "PlayfairDisplay-italic", fontSize: 32),
        ),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true, // gradient behind appbar
      body: Container(
        height: double.infinity, // ensure gradient fills whole screen
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.greenAccent],
            begin: Alignment.bottomLeft,
            end: Alignment.topLeft,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                const SizedBox(height: 16),
                const Text(
                  "Complete Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold, fontFamily: "PlayfairDisplay"
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Complete your details or continue \nwith social media",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontFamily: "PlayfairDisplay"),
                ),
                const SizedBox(height: 24),
                const CompleteProfileForm(),
                const SizedBox(height: 24),
                const Text(
                  "By continuing you confirm that you agree \nwith our Terms and Conditions",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontFamily: "PlayfairDisplay"),
                ),
                const SizedBox(height: 16),
              ],
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

class CompleteProfileForm extends StatelessWidget {
  const CompleteProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // FIRST NAME
          TextFormField(
            onSaved: (value) {},
            onChanged: (value) {},
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: "Enter your first name",
              labelText: "First Name",
              labelStyle: TextStyle(color: Colors.white),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintStyle: const TextStyle(color: Colors.white),
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              suffixIcon: const Icon(Icons.person_outline, color: Colors.white,),
              border: authOutlineInputBorder,
              enabledBorder: authOutlineInputBorder,
              focusedBorder: authOutlineInputBorder.copyWith(
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // LAST NAME
          TextFormField(
            onSaved: (value) {},
            onChanged: (value) {},
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: "Enter your last name",
              labelText: "Last Name",
              labelStyle: TextStyle(color: Colors.white),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintStyle: const TextStyle(color: Colors.white),
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              suffixIcon: const Icon(Icons.person,color: Colors.white),
              border: authOutlineInputBorder,
              enabledBorder: authOutlineInputBorder,
              focusedBorder: authOutlineInputBorder.copyWith(
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // PHONE NUMBER
          TextFormField(
            onSaved: (value) {},
            onChanged: (value) {},
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: "Enter your phone number",
              labelText: "Phone Number",
              labelStyle: TextStyle(color: Colors.white),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintStyle: const TextStyle(color: Colors.white),
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              suffixIcon: const Icon(Icons.phone,color: Colors.white),
              border: authOutlineInputBorder,
              enabledBorder: authOutlineInputBorder,
              focusedBorder: authOutlineInputBorder.copyWith(
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Password
          TextFormField(
            onSaved: (value) {},
            onChanged: (value) {},
            keyboardType: TextInputType.phone,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter Password",
              labelText: "Password",
              labelStyle: TextStyle(color: Colors.white),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintStyle: const TextStyle(color: Colors.white),
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              suffixIcon: const Icon(Icons.password,color: Colors.white),
              border: authOutlineInputBorder,
              enabledBorder: authOutlineInputBorder,
              focusedBorder: authOutlineInputBorder.copyWith(
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Email
          TextFormField(
            onSaved: (value) {},
            onChanged: (value) {},
            decoration: InputDecoration(
              hintText: "Enter your email",
              labelText: "Email",
              labelStyle: TextStyle(color: Colors.white),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintStyle: const TextStyle(color: Colors.white),
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              suffixIcon: const Icon(Icons.location_on_outlined, color: Colors.white),
              border: authOutlineInputBorder,
              enabledBorder: authOutlineInputBorder,
              focusedBorder: authOutlineInputBorder.copyWith(
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // CONTINUE BUTTON
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
            child: const Text("Continue", style: TextStyle(color: Colors.white, fontSize: 18),),
          ),
        ],
      ),
    );
  }
}
