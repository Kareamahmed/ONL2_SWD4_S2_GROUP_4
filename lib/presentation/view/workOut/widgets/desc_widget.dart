import 'package:flutter/material.dart';
import 'package:striky/core/constants/text_fonts.dart';

class DescWidget extends StatefulWidget {
  const DescWidget({
    super.key,
    required this.desc,
  });

  final String desc;
  @override
  State<DescWidget> createState() => _DescWidgetState();
}

class _DescWidgetState extends State<DescWidget> {
  bool showless = true;

  @override
  void initState() {
    super.initState();
    showless = true;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Descriptions',
        style: TextFonts.kdarkboldfont16,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.desc,
            style: TextFonts.kdarkgrayfont14,
            maxLines: showless ? 4 : null,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                showless = !showless;
              });
            },
            child: Text(
              showless ? 'More...' : 'Less...',
              style: TextFonts.klightbluefont14,
            ),
          ),
        ],
      ),
    );
  }
}
