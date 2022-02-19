import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
// import 'package:latlong/latlong.dart';

import '../widgets/drawer.dart';

class TapToAddPage extends StatefulWidget {
  static const String route = '/tap';

  @override
  State<StatefulWidget> createState() {
    return TapToAddPageState();
  }
}

class TapToAddPageState extends State<TapToAddPage> {
  List<LatLng> tappedPoints = [];
  LatLng latlng = LatLng(45.5231, -122.6765);
  MapController _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    var markers = tappedPoints.map((latlng) {
      return Marker(
        width: 80.0,
        height: 80.0,
        point: latlng,
        builder: (ctx) => const FlutterLogo(),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Tap to add pins')),
      drawer: buildDrawer(context, TapToAddPage.route),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text('Tap to add pins'),
            ),
            Flexible(
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(45.5231, -122.6765),
                  zoom: 13.0,
                  onTap: _handleTap,
                  controller: _mapController,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  ),
                  MarkerLayerOptions(markers: markers)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleTap(tabPosition, point) {
    print("Print Point: ${point.toString()}");
    // print("Print Tab Position 1: ${tabPosition.global.toString()}");
    // print("Print Tab Position 2: ${tabPosition.relative.toString()}");
    // _mapController.move(LatLng(45.5231, -122.6765), 8);
    setState(() {
      // tappedPoints.add(latlng);
      _mapController.move(LatLng(45.5231, -122.6765), 8);
    });
  }
}
