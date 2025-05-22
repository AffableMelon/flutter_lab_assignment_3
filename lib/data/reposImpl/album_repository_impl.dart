
import 'package:flutter_lab_assignment_3/data/source/remote_data_source.dart';
import 'package:flutter_lab_assignment_3/domain/repos/album_repository.dart';
import 'package:flutter_lab_assignment_3/domain/entities/album.dart';
import 'package:flutter_lab_assignment_3/domain/entities/photo.dart';

class AlbumRepositoryImpl implements AlbumRepository{
  final RemoteDataSource _remoteDataSource;

  AlbumRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Album>> getAlbums() async {
    final albumModels = await _remoteDataSource.getAlbums();

    return albumModels.map((model) => Album(
      userId: model.userId,
      id: model.id,
      title: model.title,
      thumbnailUrl: ''
    )).toList();
  }

  @override
  Future<List<Photo>> getPhotosForAlbum(int albumId) async {
    final photoModels = await _remoteDataSource.getPhotosByAlbumId(albumId);

    return photoModels.map((m) => Photo(
      albumId: m.albumId, 
      id: m.id,
      title: m.title,
      url: m.url,
      thumbnailUrl:m.thumbnailUrl)).toList();
  }
}