import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider.dart';

class themeBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    provider providerSettings = Provider.of(context);
    return Column(
        children: [
          InkWell(
              onTap: (){
                providerSettings.changeappTheme(ThemeMode.light);
              },
              child: Text("Light", style: Theme.of(context).textTheme.subtitle2)),
          SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: (){
                providerSettings.changeappTheme(ThemeMode.dark);
              },
              child: Text("Dark" , style: Theme.of(context).textTheme.subtitle2)),
        ],

    );
    ;
  }
}
