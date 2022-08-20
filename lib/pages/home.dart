import "package:flutter/material.dart";

import "../theme.dart";
import "../widgets/top_bar.dart";
import "../widgets/pad.dart";

class KSynonymsHome extends StatelessWidget {
  const KSynonymsHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          const Center(
            child: TopBar(),
          ),
          MediaQuery.of(context).orientation == Orientation.portrait
              ? Column(
                  children: const <Widget>[
                    Pad(readOnly: false),
                    Pad(readOnly: true),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Pad(readOnly: false),
                    Pad(readOnly: true),
                  ],
                ),
        ],
      ),
    );
  }
}
