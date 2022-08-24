import "../theme.dart";
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import "package:provider/provider.dart";
import "../provider.dart";

class Pad extends StatelessWidget {
  const Pad({Key? key, required this.readOnly}) : super(key: key);

  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.5)),
        color: textFieldColor,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.width * 0.90
                : MediaQuery.of(context).size.width * 0.45,
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.30
                : MediaQuery.of(context).size.height * 0.45,
            child: Consumer<Providertest>(builder: (context, data, _) {
              return TextField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: textFieldColor,
                  hoverColor: textFieldColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.5)),
                    borderSide: BorderSide(
                      width: 0.0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
                style: const TextStyle(
                  fontFamily: "Aromatica",
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                textAlignVertical: TextAlignVertical.top,
                onChanged: (String value) {
                  Provider.of<Providertest>(context, listen: false)
                      .setInstance();
                  Provider.of<Providertest>(context, listen: false)
                      .saveInput(value);
                },
                expands: true,
                maxLines: null,
                readOnly: readOnly,
                controller: readOnly == false
                    ? data.inputController
                    : TextEditingController(
                        text: data.textResult,
                      ),
                //),
              );
            }),
          ),
          SizedBox(
            width: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.width * 0.80
                : MediaQuery.of(context).size.width * 0.40,
            child: const Divider(),
          ),
          SizedBox(
            width: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.width * 0.90
                : MediaQuery.of(context).size.width * 0.45,
            height: MediaQuery.of(context).size.height * 0.10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Image.asset("assets/icons/copy.png",
                      width: 64, height: 64),
                  iconSize: 32,
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(
                        text: readOnly == false
                            ? Provider.of<Providertest>(context, listen: false)
                                .inputData
                            : Provider.of<Providertest>(context, listen: false)
                                .textResult,
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset("assets/icons/audio.png"),
                  iconSize: 30,
                  onPressed: () {
                    readOnly == false
                        ? Provider.of<Providertest>(context, listen: false)
                            .playAudio(true)
                        : Provider.of<Providertest>(context, listen: false)
                            .playAudio(false);
                  },
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
