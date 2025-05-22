import 'package:equatable/equatable.dart';

abstract class AlbumsEvent extends Equatable {
  const AlbumsEvent();

  @override
  List<Object> get props => [];
}

class GetAlbums extends AlbumsEvent {}
