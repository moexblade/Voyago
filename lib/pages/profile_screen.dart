import 'package:flutter/material.dart';
import 'welcome.dart';
import 'booking.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Function to show the SnackBar message for 1 second
  void showLoginPrompt(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Hide any current snackbar
    final snackBar = SnackBar(
      content: const Text(
        'Please create an account first.',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
      duration: const Duration(seconds: 2), // Set the duration to 2 second
      backgroundColor: Colors.black54,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // Profile Photo
            Container(
              width: 150.0,
              height: 150.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.lightBlueAccent, Colors.greenAccent],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topLeft,
                ),
              ),
              // To show a profile picture, uncomment the CircleAvatar below
              // child: const CircleAvatar(
              //   radius: 60,
              //   // backgroundImage: AssetImage('assets/images/profile.jpg'),
              //   backgroundColor: Colors.transparent,
              // ),
            ),

            const SizedBox(height: 15),

            // Name
            const Text(
              "Guest User",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            // Bio
            Text(
              "Travel lover • Explorer • Photographer",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),

            const SizedBox(height: 25),

            // Stats Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStat("Trips", "24"),
                _buildStat("Countries", "8"),
                _buildStat("Saved", "34"),
              ],
            ),

            const SizedBox(height: 25),

            // Edit Profile Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Show message when Edit Profile is pressed
                  showLoginPrompt(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Edit Profile",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 25),

            _buildOption(Icons.flight_takeoff, "My Trips", () {
              // Show message when My Trips is pressed
              showLoginPrompt(context);
            }),
            _buildOption(Icons.settings, "Settings", () {
              // Show message when Settings is pressed
              showLoginPrompt(context);
            }),
            _buildOption(Icons.help_outline, "Help & Support", () {
              // Show message when Help & Support is pressed
              showLoginPrompt(context);
            }),
            _buildOption(Icons.logout, "Logout", () {
              // Logout is an exception, it should navigate
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
            }),
          ],
        ),
      ),
    );
  }

  // Stat card widget
  Widget _buildStat(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(title, style: const TextStyle(fontSize: 16, color: Colors.grey)),
      ],
    );
  }

  // Option ListTile widget with onTap action
  Widget _buildOption(IconData icon, String title, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        // Optional: add a slight shadow to make it look like a card
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        leading: Icon(icon, size: 28, color: Colors.black),
        title: Text(title, style: const TextStyle(fontSize: 18)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: onTap, // Executes the provided action
      ),
    );
  }
}