import 'package:flutter/material.dart';

class OptionsDialog extends StatefulWidget {
  final String title; 
  final List<String> options; 

  const OptionsDialog({super.key, required this.title, required this.options});

  @override
  State<OptionsDialog> createState() => _OptionsDialogState();
}

class _OptionsDialogState extends State<OptionsDialog> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title, style: const TextStyle(fontSize: 22)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children:
            widget.options.map((option) {
              return RadioListTile<String>(
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(option),
                ),
                value: option,
                groupValue: selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    selectedOption = value;
                  });
                },
              );
            }).toList(),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("No"),
        ),
        ElevatedButton(
          onPressed:
              selectedOption != null
                  ? () {
                    Navigator.pop(context, selectedOption);
                  }
                  : null,
          child: const Text("Yes"),
        ),
      ],
    );
  }
}
