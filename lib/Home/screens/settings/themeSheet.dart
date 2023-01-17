import 'package:flutter/material.dart';

class themeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          InkWell(
              onTap: (){},
              child: Text("Light", style: Theme.of(context).textTheme.subtitle2)),
          SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: (){},
              child: Text("Dark" , style: Theme.of(context).textTheme.subtitle2)),
        ],

    );
    ;
  }
}
