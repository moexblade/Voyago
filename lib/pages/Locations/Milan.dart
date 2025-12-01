import 'package:flutter/material.dart';
import '/pages/booking.dart';
import '/pages/home.dart';

class Milan extends StatelessWidget {
  const Milan ({super.key});
  @override
  Widget build(BuildContext context) {
    // Note: Replace with actual image asset or network URL
    final String imageUrl = 'assets/images/Italy.png';

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // 1. Change the child of SingleChildScrollView to a Column
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
          children: [
            // --- IMAGE CARD SECTION ---
            Center(
              child: Card(
                // Set rounded corners for the Card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 8, // Adds shadow
                margin: EdgeInsets.all(20), // Margin around the card
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    width: 350, // Fixed width for the card
                    height: 450, // Fixed height for the card
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        // 1. Background Image
                        Image.asset(imageUrl, fit: BoxFit.cover),

                        // 2. Top-Left Back Button (Unchanged)
                        Positioned(
                          top: 10,
                          left: 10,
                          child: FloatingActionButton.small(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              backgroundColor: Colors.white,
                              child: Icon(Icons.arrow_back, color: Colors.black)),
                        ),

                        // 3. Top-Right Save Icon (Unchanged)
                        Positioned(
                          top: 10,
                          right: 10,
                          child: FloatingActionButton.small(
                            onPressed: () {},
                            backgroundColor: Colors.white,
                            child: Icon(Icons.bookmark_border, color: Colors.black),
                          ),
                        ),

                        // 4. Bottom Info Container (Translucent) (Unchanged)
                        Positioned(
                          bottom: 20,
                          left: 20,
                          right: 20,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white.withOpacity(0.9)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Location and Price Row
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Milan, Italy', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    Text('Price', style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                                  ],
                                ),
                                SizedBox(height: 5),
                                // Maps Link and Price Value Row
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.location_on, size: 20),
                                        SizedBox(width: 5),
                                        Text('View on maps', style: TextStyle(fontSize: 16, decoration: TextDecoration.underline)),
                                      ],
                                    ),
                                    Text('\$400', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // --- OVERVIEW SECTION ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Overview',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),

                  // Stats Row (7 Days, 23°C, 4.7)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatIcon(Icons.access_time, '4 Days', ),
                      _buildStatIcon(Icons.cloud, '18 °C'),
                      _buildStatIcon(Icons.star, '4.1'),
                      // Add an empty SizedBox to push the items to the left/spread them out
                      const SizedBox(width: 50),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Description Text
                  const Text(
                    "Milan, a global capital of fashion 👠 and design 🛋️, is a city where historical grandeur meets cutting-edge modernity. Its undeniable centerpiece is the breathtaking Duomo di Milano ⛪, a colossal Gothic cathedral known for its intricate spires and stunning rooftop views. This architectural marvel stands at the heart of the city, dominating the Piazza del Duomo, a central hub of activity. Beneath the spires, Milan's past as a cultural and economic powerhouse is evident. The city is home to the world-renowned Teatro alla Scala 🎭, an opera house that has hosted legends, and the magnificent Galleria Vittorio Emanuele II ✨, a 19th-century glass-vaulted shopping arcade. Travelers can effortlessly move from admiring Renaissance masterpieces like Leonardo da Vinci's The Last Supper 🖼️ to immersing themselves in the vibrant modern atmosphere of the Navigli district 🛶 with its canals and buzzing nightlife. Milan is a dynamic blend of high culture, high finance, and irresistible Italian style. 🇮🇹",
                    style: TextStyle(fontSize: 16, height: 1.4),
                  ),
                  const SizedBox(height: 30),

                  // Book Now Button
                  SizedBox(
                    width: double.infinity, // Makes the button take full width
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Booking(),));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Book Now',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build the Stat Icon/Text combo
  Widget _buildStatIcon(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 24, color: Colors.black54),
        const SizedBox(width: 5),
        Text(text, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }
}