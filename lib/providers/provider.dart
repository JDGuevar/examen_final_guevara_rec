import 'dart:convert';

import 'package:examen_final_guevara_rec/models/tren_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TrenesProvider extends ChangeNotifier {
  final String _baseUrl = "ca9c5532d0dfd02f9d14.free.beeceptor.com";

  List<TrenModel> TrenesPrincipales = [];
  List<String> fotos = [];

  TrenesProvider() {
    setTrenes();
  }

  // Método para generar la lista principal
  setTrenes() async {
    var url = Uri.https(_baseUrl, "/api/trenes");

    final result = await http.get(url);

    if (result.statusCode == 200) {
      List<dynamic> trains = json.decode(result.body);
      TrenesPrincipales = trains.map((train) => TrenModel.fromMap(train)).toList();
      notifyListeners();
    } else {
      print('Error: ${result.statusCode}');
    }
  }

  // añadir tren
  addTren(
    String id,
    String nom,
    String descripcio,
    String foto,
    String ruedas,
    String vagones,
  ) async {
    var url = Uri.https(_baseUrl, '/api/trenes');
    final result = await http.post(
      url,
      body: {
        'id': id,
        'nom': nom,
        'descripcio': descripcio,
        'foto': foto,
        'ruedas': ruedas,
        'vagones': vagones,
      },
    );
  }

  deleteTren(String id) async {
    var url = Uri.https(_baseUrl, '/api/trenes/$id');
    final result = await http.delete(url);
  }

  updateTren(
    String id,
    String nom,
    String descripcio,
    String foto,
    String ruedas,
    String vagones,
  ) async {
    var url = Uri.https(_baseUrl, '/api/trenes/$id');
    final result = await http.put(
      url,
      body: {
        'id': id,
        'nom': nom,
        'descripcio': descripcio,
        'foto': foto,
        'ruedas': ruedas,
        'vagones': vagones,
      },
    );
  }
}
