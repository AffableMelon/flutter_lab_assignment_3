import 'package:flutter_lab_assignment_3/domain/repos/album_repository.dart';
import 'package:flutter_lab_assignment_3/domain/entities/photo.dart';

class GetPhotosUsescase {
  final AlbumRepository repository;

  GetPhotosUsescase(this.repository);

  Future<List<Photo>> call(int albumId) {
    return repository.getPhotosForAlbum(albumId);
  }
}
