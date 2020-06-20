import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController mapController;
  Set<Marker> markers = new Set<Marker>();
  double lat = -5.8232923;
  double long = -35.2273384;

  void _onMapCreated(GoogleMapController controller){
      mapController = controller;
     
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:TextField(
          onSubmitted: (val){
            lat= -5.8112948;
            long = -35.2062349;

            LatLng position = LatLng(lat, long);
            mapController.moveCamera(CameraUpdate.newLatLng(position));

            final Marker marker = Marker(
              markerId: new MarkerId('123456'),
              position: position,
              infoWindow: InfoWindow(
                title: "Doação mais próxima",
                snippet: "Natal/RN"
              )
            );
            setState(() {
              markers.add(marker);
            });
          },
        )
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        mapType: MapType.hybrid,
        onCameraMove: (data) {
          print(data);
        },
        onTap: (position){
          print(position);
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, long),
          zoom: 16.0
        ),
        markers: markers,
      ),
    );
  }
}

