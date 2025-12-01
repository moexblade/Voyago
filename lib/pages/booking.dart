import 'package:flutter/material.dart';

// Enum to represent the different trip types
enum TripType { oneWay, roundTrip, multiCity }

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  // State variables for the booking form
  String _fromLocation = "Istanbul (SAW)";
  String _toLocation = "Erbil (EBL)";
  DateTime _selectedDate = DateTime.now().add(const Duration(days: 7));
  int _passengers = 1;

  TripType _tripType = TripType.roundTrip;
  String _planeClass = 'Economy';

  // ** COLORS **
  // 1. Background Colors (Kept as Blue -> Green)
  final Color _backgroundStartColor = Colors.blueAccent;
  final Color _backgroundEndColor = Colors.greenAccent;

  // 2. Element Colors (Changed to Black as requested)
  final Color _elementsColor = Colors.black;

  // Helper function to format the date
  String get _dateText =>
      "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}";

  // Function to swap the origin and destination locations
  void _swapLocations() {
    setState(() {
      final temp = _fromLocation;
      _fromLocation = _toLocation;
      _toLocation = temp;
    });
  }

  // Function to show the date picker dialog
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2028),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: _elementsColor, // Calendar Header becomes Black
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // **Widget: Trip Type Selector**
  Widget _buildTripTypeSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTripTypeOption(
            label: 'One-way', type: TripType.oneWay, isFirst: true),
        _buildTripTypeOption(label: 'Round-trip', type: TripType.roundTrip),
        _buildTripTypeOption(
            label: 'Multi-city', type: TripType.multiCity, isLast: true),
      ],
    );
  }

  // **Helper Widget: Individual Trip Type Button**
  Widget _buildTripTypeOption({
    required String label,
    required TripType type,
    bool isFirst = false,
    bool isLast = false,
  }) {
    final bool isSelected = _tripType == type;
    final BorderRadius radius;

    if (isFirst) {
      radius = const BorderRadius.only(
        topLeft: Radius.circular(10),
        bottomLeft: Radius.circular(10),
      );
    } else if (isLast) {
      radius = const BorderRadius.only(
        topRight: Radius.circular(10),
        bottomRight: Radius.circular(10),
      );
    } else {
      radius = BorderRadius.zero;
    }

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _tripType = type;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            // Use Black for selected background
            color: isSelected ? _elementsColor : Colors.grey[100],
            borderRadius: radius,
            border: Border.all(
              // Use Black for border
              color: isSelected ? _elementsColor : Colors.grey.shade300,
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.grey[700],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // **Widget: Plane Class Dropdown**
  Widget _buildPlaneClassDropdown() {
    final List<String> classes = ['Economy', 'Business', 'First'];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.airplane_ticket, color: _elementsColor, size: 24), // Black Icon
          const SizedBox(width: 15),
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _planeClass,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey[700],
                ),
                isExpanded: true,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                dropdownColor: Colors.white,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _planeClass = newValue;
                    });
                  }
                },
                items: classes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontWeight: FontWeight.normal),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget to build the custom text input fields for location
  Widget _buildLocationInput({
    required String label,
    required String value,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Icon(icon, color: _elementsColor, size: 24), // Black Icon
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget to build the Date and Passenger selectors
  Widget _buildDatePickerAndPassengers() {
    return Row(
      children: [
        // Date Picker
        Expanded(
          child: InkWell(
            onTap: () => _selectDate(context),
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: _elementsColor, // Black Icon
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Departure Date",
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _dateText,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),

        // Passenger Count
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              Icon(Icons.person, color: _elementsColor, size: 20), // Black Icon
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Passengers",
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "$_passengers",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => setState(() => _passengers++),
                    child: Icon(
                      Icons.add_circle_outline,
                      size: 20,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: () {
                      if (_passengers > 1) {
                        setState(() => _passengers--);
                      }
                    },
                    child: Icon(
                      Icons.remove_circle_outline,
                      size: 20,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Widget for the main booking form card
  Widget _buildBookingFormCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          const Text(
            "Book Your Next Trip",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 20),

          // Trip Type Selector
          _buildTripTypeSelector(),
          const SizedBox(height: 20),

          // Location Inputs with Swap Button
          Stack(
            alignment: Alignment.centerRight,
            children: [
              Column(
                children: [
                  _buildLocationInput(
                    label: "From",
                    value: _fromLocation,
                    icon: Icons.flight_takeoff,
                  ),
                  const SizedBox(height: 15),
                  _buildLocationInput(
                    label: "To",
                    value: _toLocation,
                    icon: Icons.flight_land,
                  ),
                ],
              ),
              // Swap Button
              Positioned(
                child: GestureDetector(
                  onTap: _swapLocations,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade200, width: 2),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    // KEPT as EndColor (Green/Teal) for contrast, or you can use _elementsColor
                    child: Icon(
                      Icons.swap_vert,
                      color: Colors.white,
                      size: 44,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Date and Passenger Pickers
          _buildDatePickerAndPassengers(),

          const SizedBox(height: 20),

          // Plane Class Dropdown
          _buildPlaneClassDropdown(),

          const SizedBox(height: 30),

          // Search Button
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Searching for $_planeClass class tickets for a ${_tripType.toString().split('.').last} trip from $_fromLocation to $_toLocation on $_dateText for $_passengers passenger(s)...",
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                backgroundColor: _elementsColor, // Black Button
                foregroundColor: Colors.white,
                elevation: 10,
                shadowColor: _elementsColor.withOpacity(0.5),
              ),
              child: const Text(
                "Search Flights",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Determine the height of the top gradient section (e.g., 40% of screen height)
    final double screenHeight = MediaQuery.of(context).size.height;
    final double gradientHeight = screenHeight * 0.40;
    // Calculate where to position the card. Centered vertically on the gradient/white border.
    final double cardTopPosition =
        gradientHeight - 150; // Adjust for card's vertical center

    return Scaffold(
      backgroundColor: Colors.white,
      // Styled AppBar
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Booking",
          style: TextStyle(
            fontSize: 25,
            fontFamily: "PlayfairDisplay-italic",
            color: Colors.white,
          ),
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: const Icon(
                  Icons.notifications,
                  size: 50,
                  color: Colors.white,
                ),
              );
            },
          ),
        ],
      ),

      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            // Background Container
            Column(
              children: <Widget>[
                // Top Gradient Section (REMAINS BLUE -> GREEN)
                Container(
                  height: gradientHeight,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        _backgroundStartColor,
                        _backgroundEndColor
                      ], // Blue -> Green
                    ),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 100.0),
                    ),
                  ),
                ),
                // Bottom White Section
                Container(
                  height: screenHeight - gradientHeight,
                  color: Colors.white,
                ),
              ],
            ),

            // The Booking Form Card
            Positioned(
              top: cardTopPosition > 220 ? cardTopPosition : 150,
              left: 0,
              right: 0,
              child: _buildBookingFormCard(),
            ),
          ],
        ),
      ),
    );
  }
}