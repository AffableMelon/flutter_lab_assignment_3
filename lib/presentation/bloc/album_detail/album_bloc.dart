import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab_assignment_3/domain/usecases/get_albums_usecase.dart';
import 'package:flutter_lab_assignment_3/domain/usecases/get_photos_usescase.dart';
import 'package:flutter_lab_assignment_3/presentation/bloc/album_detail/album_detail_event.dart';
import 'package:flutter_lab_assignment_3/presentation/bloc/album_detail/album_detail_state.dart';

class AlbumBloc extends Bloc<AlbumDetailEvent, AlbumDetailState> {
  final GetPhotosUsescase getPhotosUsescase;
  final GetAlbumsUsecase getAlbumsUsecase;

  AlbumBloc({required this.getPhotosUsescase, required this.getAlbumsUsecase})
    : super(AlbumDetailInit()) {
    on<GetALbumDetails>(_onGetAlbumDetails);
  }

  void _onGetAlbumDetails(
    GetALbumDetails event,
    Emitter<AlbumDetailState> emit,
  ) async {
    emit(AlbumDetialLoading());
    try {
      final albums = await getAlbumsUsecase();
      final album = albums.firstWhere((a) => a.id == event.albumId);
      final photos = await getPhotosUsescase(event.albumId);

      emit(AlbumDetialLoaded(album: album, photos: photos));
    } catch (e) {
      String errorMessage = 'failed to load details';

      if (e is SocketException) {
        errorMessage = 'No internet connection. Please check your network.';
      } 
      else if (e is http.ClientException) {
          errorMessage =
              'Server Error ${e.message}';
      }
      else {
        errorMessage = 'Unexpected error: ${e.toString()}';
      }
      emit(AlbumDetailError(message: errorMessage));
    }
  }
}
