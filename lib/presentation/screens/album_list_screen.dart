import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab_assignment_3/presentation/bloc/albums/albums_bloc.dart';
import 'package:flutter_lab_assignment_3/presentation/bloc/albums/albums_event.dart';
import 'package:flutter_lab_assignment_3/presentation/bloc/albums/albums_state.dart';
import 'package:go_router/go_router.dart';

class AlbumListScreen extends StatefulWidget {
  const AlbumListScreen({super.key});

  @override
  State<AlbumListScreen> createState() => _AlbumListScreenState();
}

class _AlbumListScreenState extends State<AlbumListScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AlbumsBloc>(context).add(GetAlbums());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Albums'), centerTitle: true),
      body: BlocBuilder<AlbumsBloc, AlbumsState>(
        builder: (context, state) {
          if (state is AlbumsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AlbumsLoaded) {
            return ListView.builder(
              itemCount: state.albums.length,
              itemBuilder: (context, index) {
                final album = state.albums[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  elevation: 2,
                  child: ListTile(
                    leading:
                        album.thumbnailUrl.isNotEmpty
                            ? Image.network(
                              album.thumbnailUrl,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (context, error, stackTrace) =>
                                      const Icon(Icons.broken_image, size: 60),
                            )
                            : const Icon(Icons.photo_album, size: 60),
                    title: Text(album.title),
                    subtitle: Text('Album ID: ${album.id}'),
                    onTap: () {
                      context.push('/album/${album.id}', extra: album);
                    },
                  ),
                );
              },
            );
          } else if (state is AlbumsError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Error: ${state.message}"),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AlbumsBloc>(context).add(GetAlbums());
                    },
                    child: const Text("Retry"),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
