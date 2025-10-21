import 'package:flutter/material.dart';

class RedioWidget extends StatelessWidget {
  const RedioWidget({
    super.key,
    required this.titleRadio,
    required this.categColor,
  });

  final String titleRadio;
  final Color categColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      //materialって何者？
      child: Theme(
        data: ThemeData(unselectedWidgetColor: categColor),
        child: RadioListTile(
          contentPadding: EdgeInsets.zero,
          title: Transform.translate(
            offset: const Offset(-16, 0),
            child: Text(
              titleRadio,
              style: TextStyle(color: categColor, fontWeight: FontWeight.w700),
            ),
          ),
          value: 1,
          groupValue: 0,
          onChanged: (value) {
            print("clicked");
          },
        ),
      ),
    );
  }
}
