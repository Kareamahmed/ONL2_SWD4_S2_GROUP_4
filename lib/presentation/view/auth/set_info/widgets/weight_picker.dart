import 'package:flutter/material.dart';
import 'package:wheel_picker/wheel_picker.dart';

class WeightPicker extends StatelessWidget {
  final int selectedWeight;
  final ValueChanged<int> onWeightSelected;

  const WeightPicker({
    super.key,
    required this.selectedWeight,
    required this.onWeightSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showWeightPicker(context),
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
              Icon(Icons.line_weight, color: Colors.blue),
              Text("Weight: ${selectedWeight}kg"),
            ],
          ),
        ),
      ),
    );
  }

  void _showWeightPicker(BuildContext context) {
    final weightController = WheelPickerController(itemCount: 121);
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
                "Select Your Weight",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Expanded(
                child: WheelPicker(
                  controller: weightController,
                  onIndexChanged: (index, value) {
                    onWeightSelected(index + 30);
                  },
                  builder: (context, index) {
                    return Center(
                      child: Text(
                        "${index + 30} kg",
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
