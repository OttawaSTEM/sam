import 'package:flutter/material.dart';

class ControlPage extends StatelessWidget {
  const ControlPage({Key? key}) : super(key: key);

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
