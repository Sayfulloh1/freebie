import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_flutter/repository/repository_impl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const double _cameraZoom = 10; // Adjust zoom level as needed

class _MyHomePageState extends State<MyHomePage> {
  final _repository = RepositoryImpl(); // Assuming your repository instance
  late GoogleMapController _mapController;
  LatLng? _userLocation;
  String? _token; // Variable to store retrieved token
  double? _distance; // Variable to store calculated distance

  @override
  void initState() {
    super.initState();
    _getUserLocation();
    _getToken(); // Call getToken on app launch (or when needed)
  }

  Future<void> _getUserLocation() async {
    final location = await _repository.getLocation();
    setState(() {
      _userLocation = LatLng(location['latitude']!, location['longitude']!);
    });
  }

  Future<void> _getToken() async {
    // Implement logic to get username and password (e.g., user input)
    final username = 'tester'; // Replace with actual username
    final password = 'tester1'; // Replace with actual password
    final response = await _repository.getToken(username, password);
    /*if (response.isRight()) {
      setState(() {
        _token = response.right;
      });
    } else {
      // Handle errors during token retrieval (e.g., show a snackbar)
      print("Error getting token: ${response.left}");
    }*/
    response.fold((left) {
      print(left.toString());
    }, (right) {
      setState(() {
        _token = right;
      });
    });
  }

  Future<void> _calculateDistance() async {
    if (_userLocation != null && _token != null) {
      // Replace with your actual values (assuming String types for latitude/longitude)
      final userLatitude = _userLocation!.latitude.toString();
      final userLongitude = _userLocation!.longitude.toString();
      final response =
          await _repository.getDistance(userLatitude, userLongitude, _token!);
      response.fold((left) {
        print(left.toString());
      }, (right) {
        setState(() {
          _distance = right;
        });
      });
    } else {
      // Handle scenario where location or token is not available (e.g., show a message)
      print("Location or token unavailable for distance calculation");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _userLocation == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _userLocation!, // Use user location
                      zoom: 10,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _mapController = controller;
                    },
                    // Add a marker on the user location (optional)
                    markers: {
                      Marker(
                        markerId: MarkerId('user_location'),
                        position: _userLocation!,
                        infoWindow: InfoWindow(title: 'Your Location'),
                      ),
                    },
                  ),
                ),
                // Display calculated distance (optional)
                if (_distance != null)
                  Text(
                    'Distance: $_distance kilometers',
                    // Adjust unit based on API response
                    style: TextStyle(fontSize: 16),
                  ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
         await _getUserLocation();
         await _calculateDistance();

          // Call function to get user location again
        },
        tooltip: 'Refresh Location',
        child: const Icon(Icons.location_on_rounded),
      ),
    );
  }
}
