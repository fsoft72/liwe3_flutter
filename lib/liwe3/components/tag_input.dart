// TagInput is a component that uses the InputText component and the Button component to create a tag input field.
// when the user inserts some text and presses 'enter' or the ',' key, the text is added as a tag to the list of tags.
// tags are shown as a list of chips, and can be removed by pressing the 'x' button on the chip.
//
// The component is implemented using GetX, which is a state management library that uses the observer pattern.
//
// The component has a controller that manages the state of the tags and the text input.
// The controller has a method to add a tag, and a method to remove a tag.
// The controller also has a method to update the text input value.
//
// The component has a view that uses the controller to update the UI.
// The view has a text input field that listens to the controller to update the value of the text input.
// The view also has a list of chips that listens to the controller to update the list of tags.
// The view has a method to add a tag when the user presses 'enter' or the ',' key.
// The view also has a method to remove a tag when the user presses the 'x' button on the chip.
//
// The component is used in the main.dart file to show how to use the component.

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liwe3_flutter/liwe3/components/input_text.dart';

class TagInput extends StatelessWidget {
  TagInput({super.key});

  final tags = <String>[].obs;

  void addTag(String text) {
    final String tag = text.trim();

    if (tag.isEmpty) return;
    if (tags.contains(tag)) return;

    tags.add(tag);
  }

  void removeTag(String tag) {
    tags.remove(tag);
  }

  List<String> getTags() {
    return tags.toList();
  }

  void setTags(List<String> newTags) {
    tags.value = newTags;
  }

  @override
  Widget build(BuildContext context) {
    final inputText = InputText(
      value: '',
      onSubmitted: (tag, input) => {
        addTag(tag),
        input.setValue(''),
        input.setFocus(),
      },
    );

    return Column(
      children: [
        inputText,
        Obx(() => Wrap(
              spacing: 8.0,
              children: tags
                  .map(
                    (tag) => Chip(
                      label: Text(tag),
                      onDeleted: () => removeTag(tag),
                    ),
                  )
                  .toList(),
            )),
      ],
    );
  }
}
