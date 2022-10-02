import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BuildTitle extends StatefulWidget {
  const BuildTitle({Key? key}) : super(key: key);

  @override
  State<BuildTitle> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BuildTitle> {
  final titleController = TextEditingController();
  @override
  void initState() {
    super.initState();

    titleController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    titleController.dispose();
  }

  Widget build(BuildContext context) {
    return buildTitle();
  }

  buildTitle() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: titleController,
          decoration: InputDecoration(
            hintText: 'Workout Name',
            labelText: 'Title',
            suffixIcon: titleController.text.isEmpty
                ? Container(width: 0)
                : IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => titleController.clear(),
                  ),
            border: OutlineInputBorder(),
          ),
          textInputAction: TextInputAction.done,
          // autofocus: true,
        ),
      );
}
