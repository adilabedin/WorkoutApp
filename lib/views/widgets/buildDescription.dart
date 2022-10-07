import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BuildDescription extends StatefulWidget {
  const BuildDescription(TextEditingController descriptionController,
      {Key? key})
      : super(key: key);

  @override
  State<BuildDescription> createState() => _BuildDescriptionState();
}

class _BuildDescriptionState extends State<BuildDescription> {
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildDescription(descriptionController);
  }

  Widget buildDescription(controller) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextFormField(
              controller: descriptionController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Enter Description',
                hintStyle: TextStyle(color: Colors.blue),
                filled: true,
                fillColor: Colors.black,
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      );
}
