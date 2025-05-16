import 'package:flutter/material.dart';
import 'package:wheel_picker/wheel_picker.dart';

class HeightPicker extends StatelessWidget {
  final int selectedHeight;
  final ValueChanged<int> onHeightSelected;

  const HeightPicker({
    super.key,
    required this.selectedHeight,
    required this.onHeightSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showHeightPicker(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.height, color: Colors.blue),
              Text("Height: ${selectedHeight}cm"),
            ],
          ),
        ),
      ),
    );
  }

  void _showHeightPicker(BuildContext context) {
    final heightController = WheelPickerController(itemCount: 200);
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 400,
          color: Colors.black,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                "Select Your Height",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Expanded(
                child: WheelPicker(
                  controller: heightController,
                  onIndexChanged: (index, value) {
                    onHeightSelected(index + 30);
                  },
                  builder: (context, index) {
                    return Center(
                      child: Text(
                        "${index + 30} CM",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    );
                  },
                  style: WheelPickerStyle(
                    itemExtent: 50,
                    squeeze: 1.2,
                    magnification: 1.3,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Confirm"),
              ),
            ],
          ),
        );
      },
    );
  }
}
