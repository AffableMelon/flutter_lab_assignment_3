import 'package:equatable/equatable.dart';
import 'package:flutter_lab_assignment_3/domain/entities/album.dart';
import 'package:flutter_lab_assignment_3/domain/entities/photo.dart';

class AlbumDetailState extends Equatable {
  const AlbumDetailState();

  @override
  List<Object?> get props => [];
}

class AlbumDetailInit extends AlbumDetailState {}

class AlbumDetialLoading extends AlbumDetailState {}

class AlbumDetialLoaded extends AlbumDetailState {
  final Album album;

  final List<Photo> photos;

  const AlbumDetialLoaded({required this.album, required this.photos});

  @override
  List<Object?> get props => [album, photos];
}

class AlbumDetailError extends AlbumDetailState {
  final String message;

  const AlbumDetailError({required this.message});

  @override
  List<Object?> get props => [message];
}
