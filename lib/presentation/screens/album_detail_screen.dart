import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab_assignment_3/domain/entities/album.dart';
import 'package:flutter_lab_assignment_3/presentation/bloc/album_detail/album_bloc.dart';
import 'package:flutter_lab_assignment_3/presentation/bloc/album_detail/album_detail_event.dart';
import 'package:flutter_lab_assignment_3/presentation/bloc/album_detail/album_detail_state.dart';

class AlbumDetailScreen extends StatefulWidget {
  final int albumId;
  final Album? album;

  const AlbumDetailScreen({super.key, required this.albumId, this.album});

  @override
  State<AlbumDetailScreen> createState() => _AlbumDetailScreenState();
}

class _AlbumDetailScreenState extends State<AlbumDetailScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AlbumBloc>(
      context,
    ).add(GetALbumDetails(albumId: widget.albumId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.album?.title ?? 'Album Details'),
        centerTitle: true,
      ),
      body: BlocBuilder<AlbumBloc, AlbumDetailState>(
        builder: (context, state) {
          if (state is AlbumDetialLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AlbumDetialLoaded) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.album.title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 8),
                    Text('Album ID: ${state.album.id}'),
                    Text('User ID: ${state.album.userId}'),
                    const SizedBox(height: 16),
                    Text(
                      'Photos in this album:',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    if (state.photos.isEmpty)
                      const Center(
                        child: Text('No photos found for this album.'),
                      )
                    else
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                        itemCount: state.photos.length,
                        itemBuilder: (context, index) {
                          final photo = state.photos[index];
                          return Card(
                            elevation: 2,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Image.network(
                                    photo.thumbnailUrl,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(Icons.broken_image),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    photo.title,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
            );
          } else if (state is AlbumDetailError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${state.message}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AlbumBloc>(
                        context,
                      ).add(GetALbumDetails(albumId: widget.albumId));
                    },
                    child: const Text('Retry'),
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
