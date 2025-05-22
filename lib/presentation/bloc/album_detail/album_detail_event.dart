import 'package:equatable/equatable.dart';

abstract class AlbumDetailEvent extends Equatable {
  const AlbumDetailEvent();

  @override
  List<Object> get props => [];
}

class GetALbumDetails extends AlbumDetailEvent {
  final int albumId;
  const GetALbumDetails({required this.albumId});

  @override
  List<Object> get props => [albumId];
}
