import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Proxstore extends StatelessWidget {
  const Proxstore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              children: [
                Container(
                  height: constraints.maxHeight * 0.25,
                  child: RichText(
                      text: const TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: 'hey there',
                      style: TextStyle(color: Colors.amber),
                    ),
                    TextSpan(
                        text: ' hey there',
                        style: TextStyle(color: Colors.amber)),
                  ])),
                ),
                Container(
                  color: Colors.red,
                  height: constraints.maxHeight * 0.5,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
