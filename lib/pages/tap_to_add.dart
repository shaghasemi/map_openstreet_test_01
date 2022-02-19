import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_openstreet_test_01/service/api_service_neshan.dart';
import 'package:map_openstreet_test_01/service/geo_reverse_model.dart';

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
  final MapController _mapController = MapController();
  final GeolocatorPlatform geolocatorAndroid = GeolocatorPlatform.instance;
  final List<_PositionItem> _positionItems = <_PositionItem>[];
  final ApiServiceNeshan _apiServiceNeshan = ApiServiceNeshan();
  GeoReverseModelRequest _request = GeoReverseModelRequest();

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
                mapController: _mapController,
                options: MapOptions(
                  center: LatLng(45.5231, -122.6765),
                  zoom: 13.0,
                  onTap: _handleTap,
                  // controller: _mapController,
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
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.my_location),
            onPressed: _getCurrentPosition,
          ),
        ],
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

  Future<void> _getCurrentPosition() async {
    /*final hasPermission = await _handlePermission();

    if (!hasPermission) {
      return;
    }*/

    print("Print Current 2:");
    final position = await geolocatorAndroid.getCurrentPosition();
    print("Print Current 2: ${position}");
    _request.lng = position.longitude;
    _request.lat = position.latitude;

    setState(() {
      _mapController.move(LatLng(position.latitude, position.longitude), 16);
      _apiServiceNeshan.geoReverse(_request).then((value) {
        // print("Print Geo Info 0: ${jsonEncode(value)}");
        print("Print Geo Info 1: ${value.state}");
        print("Print Geo Info 2: ${value.city}");
      });
      // mapController.move(dublin, 5.0);
    });
    _updatePositionList(
      _PositionItemType.position,
      position.toString(),
    );
  }

  void _updatePositionList(_PositionItemType type, String displayValue) {
    _positionItems.add(_PositionItem(type, displayValue));
    /*print("Print Current 2: ${position}");
    setState(() {
      mapController.move(dublin, 5.0);
    });*/
  }
}

enum _PositionItemType {
  log,
  position,
}

class _PositionItem {
  _PositionItem(this.type, this.displayValue);

  final _PositionItemType type;
  final String displayValue;
}
