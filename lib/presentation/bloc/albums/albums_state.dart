import 'package:equatable/equatable.dart';
import 'package:flutter_lab_assignment_3/domain/entities/album.dart';

abstract class AlbumsState extends Equatable{
  const AlbumsState();

  @override
  List<Object> get props => [];
}

class AlbumsInitial extends AlbumsState{}

class AlbumsLoading extends AlbumsState{}

class AlbumsLoaded extends AlbumsState{
  final List<Album> albums;

  const AlbumsLoaded({required this.albums});

  @override
  List<Object> get props => [albums];
}

class AlbumsError extends AlbumsState{
  final String message;

  const AlbumsError({required this.message});

  @override
  List<Object> get props => [message];
}