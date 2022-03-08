import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:nuovent/models/models.dart';

class AccommodationService extends ChangeNotifier {
  final String _baseUrl = 'nuovent-d8d5d-default-rtdb.firebaseio.com';
  final List<Accommodation> accommodation = [];
  late Accommodation selectedAccommodation;

  final storage = new FlutterSecureStorage();

  bool isLoading = true;
  bool isSaving = false;

  AccommodationService() {
    this.loadAccommodation();
  }

  Future<List<Accommodation>> loadAccommodation() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'alojamiento.json',
        {'auth': await storage.read(key: 'token') ?? ''});
    final resp = await http.get(url);

      print('============');
      print(url);


    final Map<String, dynamic> accommodationsMap = json.decode(resp.body);

      print('------------');
      print(accommodationsMap);

    accommodationsMap.forEach((key, value) {
      print('************');
      print(accommodationsMap);
            print('####################');
      print(value);
      
    final tempAccommodation = Accommodation.fromMap(accommodationsMap );
      print('####################');
      print(Accommodation.fromMap);
      tempAccommodation.id = key;
      this.accommodation.add( tempAccommodation );
    });

  
    this.isLoading = false;
    notifyListeners();

    return this.accommodation;
  }

  Future saveOrCreateAccommodation(Accommodation accommodation) async {
    isSaving = true;
    notifyListeners();

    if (accommodation.id == null) {
      // Es necesario crear
      await this.createAccommodation(accommodation);
    } else {
      // Actualizar
      await this.updateAccommodation(accommodation);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateAccommodation(Accommodation accommodation) async {
    final url = Uri.https(_baseUrl, 'alojamiento/${accommodation.id}.json',
        {'auth': await storage.read(key: 'token') ?? ''});

    final resp = await http.put(url, body: accommodation.toJson());
    final decodedData = resp.body;

    final index =
        this.accommodation.indexWhere((element) => element.id == accommodation.id);
    this.accommodation[index] = accommodation;

    return accommodation.id!;
  }

  Future<String> createAccommodation(Accommodation accommodation) async {
    final url = Uri.https(_baseUrl, 'alojamiento.json',
        {'auth': await storage.read(key: 'token') ?? ''});

    final resp = await http.post(url, body: accommodation.toJson());
    final decodedData = json.decode(resp.body);

    accommodation.id = decodedData['name'];

    this.accommodation.add(accommodation);

    return accommodation.id!;
  }
}
