// Copyright 2017-2023, Charles Weinberger & Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'package:sam/screens/bluetooth_off_screen.dart';
import 'package:sam/screens/scan_screen.dart';

void main() {
  FlutterBluePlus.setLogLevel(LogLevel.verbose, color: true);
  runApp(const FlutterBlueApp());
}

//
// This widget shows BluetoothOffScreen or
// ScanScreen depending on the adapter state
//
class FlutterBlueApp extends StatefulWidget {
  const FlutterBlueApp({Key? key}) : super(key: key);

  @override
  State<FlutterBlueApp> createState() => _FlutterBlueAppState();
}

class _FlutterBlueAppState extends State<FlutterBlueApp> {
  BluetoothAdapterState _adapterState = BluetoothAdapterState.unknown;

  late StreamSubscription<BluetoothAdapterState> _adapterStateStateSubscription;

  @override
  void initState() {
    super.initState();
    _adapterStateStateSubscription = FlutterBluePlus.adapterState.listen((state) {
      _adapterState = state;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _adapterStateStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = _adapterState == BluetoothAdapterState.on ? const ScanScreen() : BluetoothOffScreen(adapterState: _adapterState);

    return MaterialApp(
      color: Colors.lightBlue,
      home: screen,
      navigatorObservers: [BluetoothAdapterStateObserver()],
    );
  }
}

//
// This observer listens for Bluetooth Off and dismisses the DeviceScreen
//
class BluetoothAdapterStateObserver extends NavigatorObserver {
  StreamSubscription<BluetoothAdapterState>? _adapterStateSubscription;

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (route.settings.name == '/DeviceScreen') {
      // Start listening to Bluetooth state changes when a new route is pushed
      _adapterStateSubscription ??= FlutterBluePlus.adapterState.listen((state) {
        if (state != BluetoothAdapterState.on) {
          // Pop the current route if Bluetooth is off
          navigator?.pop();
        }
      });
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    // Cancel the subscription when the route is popped
    _adapterStateSubscription?.cancel();
    _adapterStateSubscription = null;
  }
}





// import 'package:flutter/material.dart';

// import 'dart:async';
// import 'dart:developer';

// import 'package:logging/logging.dart';

// void main() {
//   runZonedGuarded(onStartUp, onCrashed);
// }

// void onStartUp() async {
//   Logger.root.onRecord.listen(onLogRecord);
//   hierarchicalLoggingEnabled = true;
//   runApp(const HomePage());
// }

// void onCrashed(Object error, StackTrace stackTrace) {
//   Logger.root.shout('App Crashed.', error, stackTrace);
// }

// void onLogRecord(LogRecord record) {
//   log(
//     record.message,
//     time: record.time,
//     sequenceNumber: record.sequenceNumber,
//     level: record.level.value,
//     name: record.loggerName,
//     zone: record.zone,
//     error: record.error,
//     stackTrace: record.stackTrace,
//   );
// }

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Container(
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           image: DecorationImage(
//             image: AssetImage("assets/images/head.jpg"),
//             fit: BoxFit.scaleDown,
//           ),
//         ),
//         // child: Stack(
//         //   children: <Widget>[
//         //     Positioned(
//         //       // left: landscapeScreen ? screenPosition('x', 0.15) : screenPosition('x', 0.095),
//         //       // top: landscapeScreen ? screenPosition('y', -0.8) : screenPosition('y', -0.546),
//         //       child: IconButton(
//         //         icon: Image.asset('assets/images/head.jpg'),
//         //         iconSize: 50,
//         //         onPressed: () => Get.back(),
//         //       ),
//         //     ),
//         //   ],
//         // ),
//       ),
//     );
//   }
// }
