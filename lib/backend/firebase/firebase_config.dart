import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAzj8i4y6nOXnWE1L9DGg8FYkPfE6QiyJY",
            authDomain: "prod-stylist-savvy.firebaseapp.com",
            projectId: "prod-stylist-savvy",
            storageBucket: "prod-stylist-savvy.appspot.com",
            messagingSenderId: "1085320474742",
            appId: "1:1085320474742:web:2c3bdc5553acf2b2796f57",
            measurementId: "G-7CV21C6Y77"));
  } else {
    await Firebase.initializeApp();
  }
}
