import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpaceProvider with ChangeNotifier {

  List planets = [];
  SharedPreferences? sharedPreferences;

  Future<List<dynamic>> loadPlanets() async {
    String data = await rootBundle.loadString('assets/json/data.json');
    return planets = json.decode(data);
  }

  List<Map<String, dynamic>> likedPlanets = [];

  Future<void> _loadLikedPlanets() async {
    // Retrieve liked planets from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final likedPlanetsString = prefs.getString('likedPlanets') ?? '[]';
    likedPlanets = List<Map<String, dynamic>>.from(
      json.decode(likedPlanetsString),
    );
  }

  Future<void> _saveLikedPlanets() async {
    // Save liked planets to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('likedPlanets', json.encode(likedPlanets));
  }

  void toggleLike(Map<String, dynamic> planet) async {
    if (isLiked(planet)) {
      likedPlanets.removeWhere((p) => p['name'] == planet['name']);
      notifyListeners();
    } else {
      likedPlanets.add(planet);
      notifyListeners();
    }
    await _saveLikedPlanets();
  }

  bool isLiked(Map<String, dynamic> planet) {
    return likedPlanets.any((p) => p['name'] == planet['name']);
  }

  SpaceProvider(){
    loadPlanets();
    _loadLikedPlanets();
  }
}
