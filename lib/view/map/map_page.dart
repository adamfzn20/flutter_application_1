// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/view/map/map_provider.dart';
// import 'package:provider/provider.dart';

// class MapPage extends StatelessWidget {
//   const MapPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Map Page'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Consumer<MapProvider>(
//           builder: (context, controller, _) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Latitude: ${controller.currentLocation?.latitude}'),
//                   Text('Longitude: ${controller.currentLocation?.longitude}'),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton:
//           Consumer<MapProvider>(builder: (context, controller, _) {
//         return FloatingActionButton(
//           onPressed: controller.shareLocation,
//           child: const Icon(Icons.share),
//         );
//       }),
//     );
//   }
// }
