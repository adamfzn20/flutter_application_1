import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/data_storage/data_storage_provider.dart';
import 'package:provider/provider.dart';

class DataStoragePage extends StatefulWidget {
  const DataStoragePage({super.key});

  @override
  State<DataStoragePage> createState() => _DataStoragePageState();
}

class _DataStoragePageState extends State<DataStoragePage> {
  late DataStorageProvider storageProvider;

  @override
  void initState() {
    super.initState();
    storageProvider = Provider.of<DataStorageProvider>(context, listen: false);
    storageProvider.getStorageList();
  }

  @override
  Widget build(BuildContext context) {
    storageProvider = Provider.of<DataStorageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Storage'),
      ),
      body: ListView.builder(
        itemCount: storageProvider.fileUrls.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                  storageProvider.fileUrls[index],
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    storageProvider.fileUrls[index],
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
