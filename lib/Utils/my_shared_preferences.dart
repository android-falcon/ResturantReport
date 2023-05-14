import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static late SharedPreferences _sharedPreferences;

  init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  clearData() {
    baseUrl = '';
    posNo = 0;
    CoNo='';
    TaxType=0;
  }

  // String get language => _sharedPreferences.getString(keyLanguage) ?? "";
  //
  // set language(String value) {
  //   _sharedPreferences.setString(keyLanguage, value);
  // }








  // List<DineInModel> get dineIn => List<DineInModel>.from(jsonDecode(_sharedPreferences.getString(keyDineIn) ?? "[]").map((e) => DineInModel.fromJson(e)));
  //
  // set dineIn(List<DineInModel> value) {
  //   _sharedPreferences.setString(keyDineIn, jsonEncode(List<dynamic>.from(value.map((e) => e.toJson()))));
  // }


  //List<CartModel> get park => List<CartModel>.from(jsonDecode(_sharedPreferences.getString(keyPark) ?? "[]").map((e) => CartModel.fromJson(e)));

  // set park(List<CartModel> value) {
  //   _sharedPreferences.setString(keyPark, jsonEncode(List<dynamic>.from(value.map((e) => e.toJson()))));
  // }



  String get CoNo => _sharedPreferences.getString(keyCoNo) ?? "";

  set CoNo(String value) {
    _sharedPreferences.setString(keyCoNo, value);
  }

  String get baseUrl => _sharedPreferences.getString(keyBaseUrl) ?? "";

  set baseUrl(String value) {
    _sharedPreferences.setString(keyBaseUrl, value);
  }
  int get TaxType => _sharedPreferences.getInt(keyTaxType) ?? 0;

  set TaxType(int value) {
    _sharedPreferences.setInt(keyTaxType, value);
  }


  int get posNo => _sharedPreferences.getInt(keyPosNo) ?? 0;

  set posNo(int value) {
    _sharedPreferences.setInt(keyPosNo, value);
  }


}

final mySharedPreferences = MySharedPreferences();

const String keyCoNo = "keyCoNo";
const String keyTaxType = "keyTaxType";
const String keyBaseUrl = "key_base_url";



const String keyPosNo = "key_pos_no";
const String keyFlrNo = "keyFlrNo";

