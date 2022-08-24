import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import '../provider.dart';
import '../theme.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
        onChanged: (value) {
          Provider.of<Providertest>(context, listen: false).searchBar(value);
        }
      ),
    );
  }
}
