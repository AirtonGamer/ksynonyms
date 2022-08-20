import "package:flutter/material.dart";
import 'package:ksynonyms/lang_data.dart';
import "../provider.dart";
import "package:provider/provider.dart";
import "../theme.dart";

class LangPage extends StatelessWidget {
  LangPage({
    Key? key,
    required this.translateFrom,
  }) : super(key: key);
  final TextEditingController _controller = TextEditingController();
  final bool translateFrom;
  //var filteredcountries = countries.where(countries.contains(_controller.text));
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
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: textFieldColor,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0.0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  hintText: "Search language here...",
                  hintStyle: TextStyle(
                    fontFamily: "Aromatica",
                    fontWeight: FontWeight.w600,
                  ),
                  contentPadding: EdgeInsets.all(20),
                ),
                controller: _controller,
                onChanged: (value) {
                  Provider.of<Providertest>(context, listen: false)
                      .searchBar(value);
                }),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: MediaQuery.of(context).size.height * 0.15,
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
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
                          Provider.of<Providertest>(context, listen: false)
                              .setInstance();
                          Provider.of<Providertest>(context, listen: false)
                              .saveInput;
                          Provider.of<Providertest>(context, listen: false)
                              .translateFunc();
                        },
                        style: ElevatedButton.styleFrom(
                          //fixedSize: Size(150, 150),
                          primary: textFieldColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
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
                      ),
                    ),
                  ],
                );
              },
              itemCount: languages_data.length,
            ),
          ),
        ],
      ),
    );
  }
}
