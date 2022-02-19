import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
// import 'package:latlong/latlong.dart';
import '../widgets/drawer.dart';

class EsriPage extends StatefulWidget {
  static const String route = 'esri';

  @override
  State<EsriPage> createState() => _EsriPageState();
}

class _EsriPageState extends State<EsriPage> {
  final MapController _mapController = MapController();

  /*@override
  void didUpdateWidget(covariant EsriPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      _mapController.move(LatLng(50.00, 40.00), 10);
    });
  }*/

  customMove(){
    setState(() {
      _mapController.move(LatLng(50.00, 40.00), 10);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Esri')),
      drawer: buildDrawer(context, EsriPage.route),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text('Esri'),
            ),
            Flexible(
              child: FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  center: LatLng(45.5231, -122.6765),
                  zoom: 13.0,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                        'https://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
