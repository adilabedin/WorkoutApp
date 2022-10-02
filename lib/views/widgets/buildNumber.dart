import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BuildNumber extends StatefulWidget {
  final String name;
  final TextEditingController controller;

  const BuildNumber({required this.name, required this.controller, Key? key})
      : super(key: key);

  @override
  State<BuildNumber> createState() => _BuildNumberState();
}

class _BuildNumberState extends State<BuildNumber> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BuildNumber('Rest Time', controller);
  }

  BuildNumber(name, controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 80,
              height: 80,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Enter number...',
                  hintStyle: TextStyle(color: Colors.blue),
                  filled: true,
                  fillColor: Colors.black,
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: Colors.blue),
                keyboardType: TextInputType.number,
              ),
            ),
          ),
        ],
      );
}
