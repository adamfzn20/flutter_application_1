import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/map/map_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  void initState() {
    super.initState();
    _checkLocationPermission(context);
  }

  Future<void> _checkLocationPermission(BuildContext context) async {
    PermissionStatus status = await Permission.location.status;

    if (status == PermissionStatus.denied) {
      await Permission.location.request();
    } else if (status == PermissionStatus.granted) {
      if (context.mounted) {
        Provider.of<MapProvider>(context, listen: false)
            .updateCurrentLocation();
      }
    } else if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geolocator Example'),
      ),
      body: Center(
        child: Consumer<MapProvider>(
          builder: (context, contrroler, child) {
            return contrroler.currentPosition != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Posisi Saat Ini:\nLatitude: ${contrroler.currentPosition!.latitude}\nLongitude: ${contrroler.currentPosition!.longitude}',
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          contrroler.launchMaps(
                            contrroler.currentPosition!.latitude,
                            contrroler.currentPosition!.longitude,
                          );
                        },
                        child: const Text('Open in Google Maps'),
                      ),
                    ],
                  )
                : const CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _checkLocationPermission(context);
        },
        child: const Icon(Icons.location_on),
      ),
    );
  }
}
