import 'package:flutter_lab_assignment_3/domain/repos/album_repository.dart';
import 'package:flutter_lab_assignment_3/domain/entities/album.dart';

class GetAlbumsUsecase {
  final AlbumRepository repository;

  GetAlbumsUsecase(this.repository);

  Future<List<Album>> call() async {
    final albums = await repository.getAlbums();

    final List<Album> albumsWithTumbnails = [];

    for (var album in albums){
      final photos = await repository.getPhotosForAlbum(album.id);

      if (photos.isNotEmpty){
        albumsWithTumbnails.add(
          Album(
            userId: album.userId,
            id: album.id, 
            title: album.title, 
            thumbnailUrl: photos.first.thumbnailUrl
            )
        );

      }else{
        albumsWithTumbnails.add(album);
      }
    }
    
    return albumsWithTumbnails;
  }
}
