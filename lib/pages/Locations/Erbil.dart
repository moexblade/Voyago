import 'package:flutter/material.dart';
import '/pages/booking.dart';
import '/pages/home.dart';

class Erbil extends StatelessWidget {
  const Erbil ({super.key});
  @override
  Widget build(BuildContext context) {
    // Note: Replace with actual image asset or network URL
    final String imageUrl = 'assets/images/Kurdistan.jpg';

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
                                    Text('Erbil, Kurdistan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                                    Text('\$250', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
                      _buildStatIcon(Icons.access_time, '7 Days', ),
                      _buildStatIcon(Icons.cloud, '23 °C'),
                      _buildStatIcon(Icons.star, '4.7'),
                      // Add an empty SizedBox to push the items to the left/spread them out
                      const SizedBox(width: 50),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Description Text
                  const Text(
                    "Erbil (Hewlêr) 🇮🇶, the capital of the Kurdistan Region of Iraq (KRI) and one of the world's oldest continuously inhabited cities 📜, is a bustling metropolis where ancient history anchors a modern, expanding skyline. Its profound past is crystallized in the magnificent Erbil Citadel 🏰, a UNESCO World Heritage Site.\n\n This monumental oval-shaped tell (mound) rises dramatically in the city center, a testament to millennia of successive civilizations.\n\n Just below this ancient fortress, the vibrant, labyrinthine Qaysari Bazaar 🛍️ thrives, offering a true taste of authentic Kurdish commerce, spices, and textiles. Beyond the historical core, modern Erbil is a dynamic economic hub, marked by new, well-paved roads, shopping centers, and parks like the expansive Sami Abdul Rahman Park 🌳.\n\n Erbil serves as the political and cultural heart of the KRI, offering visitors a unique blend of warm Kurdish hospitality, diverse culture, and easy access to the stunning mountain landscapes ⛰️ and resorts that define the Kurdistan Region."
                    ,style: TextStyle(fontSize: 16, height: 1.4),
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