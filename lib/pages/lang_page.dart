import "package:flutter/material.dart";
import 'package:ksynonyms/lang_data.dart';
import "../provider.dart";
import "package:provider/provider.dart";
import "../theme.dart";
import "../widgets/search_bar.dart";

class LangPage extends StatelessWidget {
  const LangPage({
    Key? key,
    required this.translateFrom,
  }) : super(key: key);
  final bool translateFrom;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color.fromRGBO(59, 67, 112, 1),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          "Language",
          style: TextStyle(
            color: Color.fromRGBO(60, 69, 114, 1),
            fontFamily: "Aromatica",
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          const SearchBar(),
          Expanded(
            child: Consumer<Providertest>(builder: (context, bigData, _) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  if (languages_data[index].langname.toLowerCase().contains(
                        bigData.searchValue.toLowerCase(),
                      )) {
                    return Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: MediaQuery.of(context).size.height * 0.15,
                          padding: const EdgeInsets.all(10),
                          child: Consumer<Providertest>(
                              builder: (context, data, _) {
                            return ElevatedButton(
                              onPressed: () {
                                translateFrom == true
                                    ? Provider.of<Providertest>(context,
                                            listen: false)
                                        .transFromData(
                                        languages_data[index].langname,
                                        languages_data[index].langcode,
                                      )
                                    : Provider.of<Providertest>(context,
                                            listen: false)
                                        .transToData(
                                        languages_data[index].langname,
                                        languages_data[index].langcode,
                                      );
                                Navigator.of(context).pop();
                                Provider.of<Providertest>(context,
                                        listen: false)
                                    .setInstance();
                                Provider.of<Providertest>(context,
                                        listen: false)
                                    .saveInput;
                              },
                              style: ElevatedButton.styleFrom(
                                primary: translateFrom == true
                                    ? (data.fromLangCode ==
                                            languages_data[index].langcode
                                        ? Colors.amberAccent
                                        : textFieldColor)
                                    : (data.toLangCode ==
                                            languages_data[index].langcode
                                        ? Colors.amberAccent
                                        : textFieldColor),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13.85)),
                                ),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    languages_data[index].langname,
                                    style: const TextStyle(
                                      fontFamily: "Aromatica",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox();
                  }
                },
                itemCount: languages_data.length,
              );
            }),
          ),
        ],
      ),
    );
  }
}
