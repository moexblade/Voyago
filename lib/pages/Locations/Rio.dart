import 'package:flutter/material.dart';
import '/pages/booking.dart';
import '/pages/home.dart';

class Rio extends StatelessWidget {
  const Rio ({super.key});
  @override
  Widget build(BuildContext context) {
    // Note: Replace with actual image asset or network URL
    final String imageUrl = 'assets/images/Rio.jpg';

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
                                    Text('Rio de Janeiro, Brazil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                                    Text('\$450', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
                      _buildStatIcon(Icons.access_time, '9 Days', ),
                      _buildStatIcon(Icons.cloud, '29 °C'),
                      _buildStatIcon(Icons.star, '4'),
                      // Add an empty SizedBox to push the items to the left/spread them out
                      const SizedBox(width: 50),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Description Text
                  const Text(
                    "Rio de Janeiro 🇧🇷, known as the \"Cidade Maravilhosa\" (Marvelous City), is a stunning coastal metropolis where lush mountains ⛰️ and the world's largest urban forest, Tijuca National Park 🏞️, dramatically meet the Atlantic Ocean.\n\nThe city's spectacular landscape is dominated by two natural icons: the towering Sugarloaf Mountain (Pão de Açúcar) 🚠, accessible by cable car, and Corcovado Mountain, crowned by the colossal Christ the Redeemer (Cristo Redentor) 🙏 statue, one of the New Seven Wonders of the World.\n\nRio's legendary beach culture centers around the famous golden sands of Copacabana and Ipanema 🏖️, which are known for their mosaic-patterned promenades and vibrant, energetic atmospheres.\n\nBeyond the beaches, the lively, bohemian Lapa neighborhood is home to the historic Arcos da Lapa aqueduct and the colorful, mosaic-tiled Selarón Steps 🎨. This unique blend of natural beauty, iconic landmarks, and a pulsing culture of samba 🥁 and Carnival 🥳 makes Rio an unforgettable global spectacle."
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