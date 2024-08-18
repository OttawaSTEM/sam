import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:developer';

import 'package:logging/logging.dart';

void main() {
  runZonedGuarded(onStartUp, onCrashed);
}

void onStartUp() async {
  Logger.root.onRecord.listen(onLogRecord);
  hierarchicalLoggingEnabled = true;
  runApp(const HomePage());
}

void onCrashed(Object error, StackTrace stackTrace) {
  Logger.root.shout('App Crashed.', error, stackTrace);
}

void onLogRecord(LogRecord record) {
  log(
    record.message,
    time: record.time,
    sequenceNumber: record.sequenceNumber,
    level: record.level.value,
    name: record.loggerName,
    zone: record.zone,
    error: record.error,
    stackTrace: record.stackTrace,
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/images/head.jpg"),
            fit: BoxFit.scaleDown,
          ),
        ),
        // child: Stack(
        //   children: <Widget>[
        //     Positioned(
        //       // left: landscapeScreen ? screenPosition('x', 0.15) : screenPosition('x', 0.095),
        //       // top: landscapeScreen ? screenPosition('y', -0.8) : screenPosition('y', -0.546),
        //       child: IconButton(
        //         icon: Image.asset('assets/images/head.jpg'),
        //         iconSize: 50,
        //         onPressed: () => Get.back(),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
