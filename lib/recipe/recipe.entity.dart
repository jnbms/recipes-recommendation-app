import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore: constant_identifier_names
const API_KEY = '85f53462b2284d0589f5';

Future<List<Recipe>> readRecipes(page) async {
  List<Recipe> recipes = [];
  final response = await http.get(Uri.http('openapi.foodsafetykorea.go.kr',
      '/api/$API_KEY/COOKRCP01/json/1/${page}'));

  if (response.statusCode == 200) {
    final result = await json.decode(response.body)['COOKRCP01']['row'];
    for (dynamic recipe in result) {
      recipes.add(Recipe.fromJson(recipe));
    }
    return recipes;
  } else {
    throw Exception('Fail to load Recipe');
  }
}

class Recipe {
  final String RCP_PARTS_DTLS;
  final String RCP_WAY2;
  final String MANUAL_IMG20;
  final String MANUAL20;
  final String RCP_SEQ;
  final String INFO_NA;
  final String INFO_WGT;
  final String INFO_PRO;
  final String MANUAL_IMG13;
  final String MANUAL_IMG14;
  final String MANUAL_IMG15;
  final String MANUAL_IMG16;
  final String MANUAL_IMG10;
  final String MANUAL_IMG11;
  final String MANUAL_IMG12;
  final String MANUAL_IMG17;
  final String MANUAL_IMG18;
  final String MANUAL_IMG19;
  final String INFO_FAT;
  final String HASH_TAG;
  final String MANUAL_IMG02;
  final String MANUAL_IMG03;
  final String RCP_PAT2;
  final String MANUAL_IMG04;
  final String MANUAL_IMG05;
  final String MANUAL_IMG01;
  final String MANUAL01;
  final String ATT_FILE_NO_MK;
  final String MANUAL_IMG06;
  final String MANUAL_IMG07;
  final String MANUAL_IMG08;
  final String MANUAL_IMG09;
  final String MANUAL08;
  final String MANUAL09;
  final String MANUAL06;
  final String MANUAL07;
  final String MANUAL04;
  final String MANUAL05;
  final String MANUAL02;
  final String MANUAL03;
  final String ATT_FILE_NO_MAIN;
  final String MANUAL11;
  final String MANUAL12;
  final String MANUAL10;
  final String INFO_CAR;
  final String MANUAL19;
  final String INFO_ENG;
  final String MANUAL17;
  final String MANUAL18;
  final String RCP_NM;
  final String MANUAL15;
  final String MANUAL16;
  final String MANUAL13;
  final String MANUAL14;

  Map<String, dynamic> toMap() {
    return {
      'RCP_PARTS_DTLS': RCP_PARTS_DTLS,
      'RCP_WAY2': RCP_WAY2,
      'MANUAL_IMG20': MANUAL_IMG20,
      'MANUAL20': MANUAL20,
      'RCP_SEQ': RCP_SEQ,
      'INFO_NA': INFO_NA,
      'INFO_WGT': INFO_WGT,
      'INFO_PRO': INFO_PRO,
      'MANUAL_IMG13': MANUAL_IMG13,
      'MANUAL_IMG14': MANUAL_IMG14,
      'MANUAL_IMG15': MANUAL_IMG15,
      'MANUAL_IMG16': MANUAL_IMG16,
      'MANUAL_IMG10': MANUAL_IMG10,
      'MANUAL_IMG11': MANUAL_IMG11,
      'MANUAL_IMG12': MANUAL_IMG12,
      'MANUAL_IMG17': MANUAL_IMG17,
      'MANUAL_IMG18': MANUAL_IMG18,
      'MANUAL_IMG19': MANUAL_IMG19,
      'INFO_FAT': INFO_FAT,
      'HASH_TAG': HASH_TAG,
      'MANUAL_IMG02': MANUAL_IMG02,
      'MANUAL_IMG03': MANUAL_IMG03,
      'RCP_PAT2': RCP_PAT2,
      'MANUAL_IMG04': MANUAL_IMG04,
      'MANUAL_IMG05': MANUAL_IMG05,
      'MANUAL_IMG01': MANUAL_IMG01,
      'MANUAL01': MANUAL01,
      'ATT_FILE_NO_MK': ATT_FILE_NO_MK,
      'MANUAL_IMG06': MANUAL_IMG06,
      'MANUAL_IMG07': MANUAL_IMG07,
      'MANUAL_IMG08': MANUAL_IMG08,
      'MANUAL_IMG09': MANUAL_IMG09,
      'MANUAL08': MANUAL08,
      'MANUAL09': MANUAL09,
      'MANUAL06': MANUAL06,
      'MANUAL07': MANUAL07,
      'MANUAL04': MANUAL04,
      'MANUAL05': MANUAL05,
      'MANUAL02': MANUAL02,
      'MANUAL03': MANUAL03,
      'ATT_FILE_NO_MAIN': ATT_FILE_NO_MAIN,
      'MANUAL11': MANUAL11,
      'MANUAL12': MANUAL12,
      'MANUAL10': MANUAL10,
      'INFO_CAR': INFO_CAR,
      'MANUAL19': MANUAL19,
      'INFO_ENG': INFO_ENG,
      'MANUAL17': MANUAL17,
      'MANUAL18': MANUAL18,
      'RCP_NM': RCP_NM,
      'MANUAL15': MANUAL15,
      'MANUAL16': MANUAL16,
      'MANUAL13': MANUAL13,
      'MANUAL14': MANUAL14,
    };
  }

  Recipe(
      {required this.RCP_PARTS_DTLS,
      required this.RCP_WAY2,
      required this.MANUAL_IMG20,
      required this.MANUAL20,
      required this.RCP_SEQ,
      required this.INFO_NA,
      required this.INFO_WGT,
      required this.INFO_PRO,
      required this.MANUAL_IMG13,
      required this.MANUAL_IMG14,
      required this.MANUAL_IMG15,
      required this.MANUAL_IMG16,
      required this.MANUAL_IMG10,
      required this.MANUAL_IMG11,
      required this.MANUAL_IMG12,
      required this.MANUAL_IMG17,
      required this.MANUAL_IMG18,
      required this.MANUAL_IMG19,
      required this.INFO_FAT,
      required this.HASH_TAG,
      required this.MANUAL_IMG02,
      required this.MANUAL_IMG03,
      required this.RCP_PAT2,
      required this.MANUAL_IMG04,
      required this.MANUAL_IMG05,
      required this.MANUAL_IMG01,
      required this.MANUAL01,
      required this.ATT_FILE_NO_MK,
      required this.MANUAL_IMG06,
      required this.MANUAL_IMG07,
      required this.MANUAL_IMG08,
      required this.MANUAL_IMG09,
      required this.MANUAL08,
      required this.MANUAL09,
      required this.MANUAL06,
      required this.MANUAL07,
      required this.MANUAL04,
      required this.MANUAL05,
      required this.MANUAL02,
      required this.MANUAL03,
      required this.ATT_FILE_NO_MAIN,
      required this.MANUAL11,
      required this.MANUAL12,
      required this.MANUAL10,
      required this.INFO_CAR,
      required this.MANUAL19,
      required this.INFO_ENG,
      required this.MANUAL17,
      required this.MANUAL18,
      required this.RCP_NM,
      required this.MANUAL15,
      required this.MANUAL16,
      required this.MANUAL13,
      required this.MANUAL14});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      RCP_PARTS_DTLS: json["RCP_PARTS_DTLS"],
      RCP_WAY2: json["RCP_WAY2"],
      MANUAL_IMG20: json["MANUAL_IMG20"],
      MANUAL20: json["MANUAL20"],
      RCP_SEQ: json["RCP_SEQ"],
      INFO_NA: json["INFO_NA"],
      INFO_WGT: json["INFO_WGT"],
      INFO_PRO: json["INFO_PRO"],
      MANUAL_IMG13: json["MANUAL_IMG13"],
      MANUAL_IMG14: json["MANUAL_IMG14"],
      MANUAL_IMG15: json["MANUAL_IMG15"],
      MANUAL_IMG16: json["MANUAL_IMG16"],
      MANUAL_IMG10: json["MANUAL_IMG10"],
      MANUAL_IMG11: json["MANUAL_IMG11"],
      MANUAL_IMG12: json["MANUAL_IMG12"],
      MANUAL_IMG17: json["MANUAL_IMG17"],
      MANUAL_IMG18: json["MANUAL_IMG18"],
      MANUAL_IMG19: json["MANUAL_IMG19"],
      INFO_FAT: json["INFO_FAT"],
      HASH_TAG: json["HASH_TAG"],
      MANUAL_IMG02: json["MANUAL_IMG02"],
      MANUAL_IMG03: json["MANUAL_IMG03"],
      RCP_PAT2: json["RCP_PAT2"],
      MANUAL_IMG04: json["MANUAL_IMG04"],
      MANUAL_IMG05: json["MANUAL_IMG05"],
      MANUAL_IMG01: json["MANUAL_IMG01"],
      MANUAL01: json["MANUAL01"],
      ATT_FILE_NO_MK: json["ATT_FILE_NO_MK"],
      MANUAL_IMG06: json["MANUAL_IMG06"],
      MANUAL_IMG07: json["MANUAL_IMG07"],
      MANUAL_IMG08: json["MANUAL_IMG08"],
      MANUAL_IMG09: json["MANUAL_IMG09"],
      MANUAL08: json["MANUAL08"],
      MANUAL09: json["MANUAL09"],
      MANUAL06: json["MANUAL06"],
      MANUAL07: json["MANUAL07"],
      MANUAL04: json["MANUAL04"],
      MANUAL05: json["MANUAL05"],
      MANUAL02: json["MANUAL02"],
      MANUAL03: json["MANUAL03"],
      ATT_FILE_NO_MAIN: json["ATT_FILE_NO_MAIN"],
      MANUAL11: json["MANUAL11"],
      MANUAL12: json["MANUAL12"],
      MANUAL10: json["MANUAL10"],
      INFO_CAR: json["INFO_CAR"],
      MANUAL19: json["MANUAL19"],
      INFO_ENG: json["INFO_ENG"],
      MANUAL17: json["MANUAL17"],
      MANUAL18: json["MANUAL18"],
      RCP_NM: json["RCP_NM"],
      MANUAL15: json["MANUAL15"],
      MANUAL16: json["MANUAL16"],
      MANUAL13: json["MANUAL13"],
      MANUAL14: json["MANUAL14"],
    );
  }
}
