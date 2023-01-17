import 'package:flutter/material.dart';

class languageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
            onTap: () {},
            child:
                Text("English", style: Theme.of(context).textTheme.subtitle2)),
        SizedBox(
          height: 10,
        ),
        InkWell(
            onTap: () {},
            child:
                Text("العربيه", style: Theme.of(context).textTheme.subtitle2)),
      ],
    );
  }
}
