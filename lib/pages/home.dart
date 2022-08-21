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
        children: <Widget>[
          const Center(
            child: TopBar(),
          ),
          MediaQuery.of(context).orientation == Orientation.portrait
              ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Pad(readOnly: false),
                    SizedBox(height: 10),
                    Pad(readOnly: true),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Pad(readOnly: false),
                    SizedBox(width: 10),
                    Pad(readOnly: true),
                  ],
                ),
        ],
      ),
    );
  }
}
