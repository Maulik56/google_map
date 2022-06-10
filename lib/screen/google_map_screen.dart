import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  Set<Marker> _markers = {};
  BitmapDescriptor? mapMarker;

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), "assets/images/marker.png");
  }

  @override
  void initState() {
    setCustomMarker();
    super.initState();
  }

  void _onMapCreated(GoogleMapController) {
    setState(
      () {
        _markers.add(
          Marker(
            markerId: MarkerId("Id-1"),
            icon: mapMarker!,
            position: LatLng(22.5448131, 88.3403691),
            infoWindow: InfoWindow(
                title: "Victoria Memorial", snippet: "A Historical Place"),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Map"),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        initialCameraPosition:
            CameraPosition(target: LatLng(22.5448131, 88.3403691), zoom: 15),
      ),
    );
  }
}
