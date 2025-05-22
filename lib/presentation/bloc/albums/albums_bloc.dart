import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab_assignment_3/domain/usecases/get_albums_usecase.dart';
import 'package:flutter_lab_assignment_3/presentation/bloc/albums/albums_event.dart';
import 'package:flutter_lab_assignment_3/presentation/bloc/albums/albums_state.dart';

class AlbumsBloc extends Bloc<AlbumsEvent, AlbumsState> {
  final GetAlbumsUsecase getAlbumsUsecase;

  AlbumsBloc({required this.getAlbumsUsecase}) : super(AlbumsInitial()) {
    on<GetAlbums>(_onGetAlbums);
  }

  void _onGetAlbums(GetAlbums event, Emitter<AlbumsState> emit) async {
    emit(AlbumsLoading());

    try {
      final albums = await getAlbumsUsecase();
      emit(AlbumsLoaded(albums: albums));
    } catch (e) {
      String errorMessage = 'failed to load details';

      if (e is SocketException) {
        errorMessage = 'No internet connection. Please check your network.';
      } else if (e is http.ClientException) {
        errorMessage = 'Server Error ${e.message}';
      } else {
        errorMessage = 'Unexpected error: ${e.toString()}';
      }
      emit(AlbumsError(message: errorMessage));
    }
  }
}
