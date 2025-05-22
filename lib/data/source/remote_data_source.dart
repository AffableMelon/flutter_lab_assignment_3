import 'package:flutter_lab_assignment_3/data/api/jsonplaceholder_api_service.dart';
import 'package:flutter_lab_assignment_3/data/models/album_model.dart';
import 'package:flutter_lab_assignment_3/data/models/photo_model.dart';

abstract class RemoteDataSource {
  Future<List<AlbumModel>> getAlbums();
  Future<List<PhotoModel>> getPhotos();
  Future<List<PhotoModel>> getPhotosByAlbumId(int albumId);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final JsonplaceholderApiService _apiService;

  RemoteDataSourceImpl(this._apiService);

  @override
  Future<List<AlbumModel>> getAlbums() {
    return _apiService.getAlbums();
  }

  @override
  Future<List<PhotoModel>> getPhotos() {
    return _apiService.getPhotos();
  }

  @override
  Future<List<PhotoModel>> getPhotosByAlbumId(int albumId) {
    return _apiService.getPhotosByAlbumId(albumId);
  }
}
