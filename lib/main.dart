import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:maps_up/Index.dart';
import 'package:maps_up/pages/appstate.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(
        value: AppState(),
      )
    ],
    child: Myapp(),
  ));
  // FlutterError.onError = (FlutterErrorDetails details) {
  //   FlutterError.dumpErrorToConsole(details);
  //   if (kReleaseMode) exit(1);
  // };
  // runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final user = provider.of<user>(context);

    //if (user == null) {
    // return Admin();
    //} else {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app',
      home: Index(),
    );
    //}
  }
}
