import 'dart:convert';

import 'package:schoolapp/util/DataHandler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Student {
  static final Student _data = Student._internal();

  factory Student() {
    return _data;
  }

  Student._internal();
  SharedPreferences sp = Data().getSP();
  static const _keyName = "AlunoInfo_T1";

  late String name;
  late String escola;
  late String media;
  late String? sala;
  late String? ano;

  void init() {
    if (isSaved()) {
      var info = json.decode(sp.getString(_keyName)!);
      name = info["name"];
      escola = info["escola"];
      media = info["media"];
      sala = info["sala"];
      ano = info["ano"];
    }
  }

  void save() {
    sp.setString(_keyName, json.encode(toJson()));
    print("Is Saved: $isSaved()");
  }

  bool isSaved() {
    if (sp.get(_keyName) != null) {
      return true;
    }
    return false;
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "escola": escola,
      "media": media,
      "sala": sala ?? "3°B",
      "ano": ano ?? "3"
    };
  }
}
