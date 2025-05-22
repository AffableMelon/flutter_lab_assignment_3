import 'package:flutter_lab_assignment_3/domain/entities/album.dart';
import 'package:flutter_lab_assignment_3/domain/entities/photo.dart';

abstract class AlbumRepository {
  Future<List<Album>> getAlbums();
  Future<List<Photo>> getPhotosForAlbum(int albumId);
}