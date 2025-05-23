import 'dart:convert';

import 'package:flutter_lab_assignment_3/data/models/album_model.dart';
import 'package:flutter_lab_assignment_3/data/models/photo_model.dart';
import 'package:http/http.dart' as http;


class JsonplaceholderApiService {
  final String _baseUrl = "https://jsonplaceholder.typicode.com/";
  final http.Client _httpClient;

  JsonplaceholderApiService({http.Client? httpClient})
    : _httpClient = httpClient ?? http.Client();

  Future<List<AlbumModel>> getAlbums() async {
    final url = Uri.parse('${_baseUrl}albums');
    final response = await _httpClient.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((j) => AlbumModel.fromJson(j)).toList();
    } else {
      throw Exception("Failed to Get albums : ${response.statusCode}");
    }
  }

  Future<List<PhotoModel>> getPhotos() async {
    final url = Uri.parse('${_baseUrl}photos');
    final resp = await _httpClient.get(url);

    if (resp.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(resp.body);
      return jsonList.map((j) => PhotoModel.fromJson(j)).toList();
    } else {
      throw Exception("Couldn't get Photos: ${resp.statusCode}");
    }
  }

  Future<List<PhotoModel>> getPhotosByAlbumId(int id) async {
    final url = Uri.parse('${_baseUrl}photos?albumId=$id');
    final resp = await _httpClient.get(url);

    if (resp.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(resp.body);
      return jsonList.map((j) => PhotoModel.fromJson(j)).toList();
    } else {
      throw Exception(
        "Couldn't get associated Photos: $id - ${resp.statusCode}",
      );
    }
  }
}
