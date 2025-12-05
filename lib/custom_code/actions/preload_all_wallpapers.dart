// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future preloadAllWallpapers(BuildContext context) async {
  try {
    // Query all wallpapers from your Firestore collection
    QuerySnapshot wallpapersSnapshot =
        await FirebaseFirestore.instance.collection('wallpapers').get();

    // Preload each wallpaper image
    for (QueryDocumentSnapshot doc in wallpapersSnapshot.docs) {
      try {
        WallpapersRecord wallpaper = WallpapersRecord.fromSnapshot(doc);

        // Check if image path exists and is not empty
        if (wallpaper.image.isNotEmpty) {
          // Precache the image
          await precacheImage(
            NetworkImage(wallpaper.image),
            context,
          );
        }
      } catch (e) {
        // Continue with next image if one fails
        print('Failed to preload wallpaper: ${e.toString()}');
      }
    }

    print('All wallpapers preloaded successfully!');
  } catch (e) {
    print('Error preloading wallpapers: ${e.toString()}');
  }
}
