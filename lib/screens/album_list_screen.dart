import 'package:beta_acid_challenge/model/album.dart';
import 'package:beta_acid_challenge/viewmodel/album_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class AlbumListScreen extends ConsumerStatefulWidget {
  const AlbumListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AlbumListScreenState();
}

class _AlbumListScreenState extends ConsumerState<AlbumListScreen> {
  @override
  void initState() {
    super.initState();
    final model = ref.read(albumViewModel);
    WidgetsBinding.instance!.addPostFrameCallback((_) => model.init());
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(albumViewModel);

    ref.listen<String>(albumViewModel.select((m) => m.snackbarMessage),
        (previous, next) {
      if (next != "") {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(next)));
      }
    });

    return Scaffold(
        appBar: AppBar(
          title: const Text("Beta Acid"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Liked Albums: " + model.likedAlbums.toString()),
            )
          ],
        ),
        body: model.isLoading
            ? const Center(
                child: Text(
                "Loading...",
                style: TextStyle(fontSize: 15, color: Colors.amber),
              ))
            : ListView.builder(
                itemCount: model.albumList.length,
                itemBuilder: (context, index) {
                  return AlbumCard(album: model.albumList[index]);
                }));
  }
}




class AlbumCard extends ConsumerStatefulWidget {
  const AlbumCard({Key? key, required this.album}) : super(key: key);

  final Album album;

  @override
  ConsumerState<AlbumCard> createState() => _AlbumCardState();
}

class _AlbumCardState extends ConsumerState<AlbumCard> {
  @override
  Widget build(BuildContext context) {
    final format = DateFormat('yyyy-MM-dd – kk:mm');
    final model = ref.read(albumViewModel);

    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListTile(
        leading: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.network(
            widget.album.artworkUrl60,
            fit: BoxFit.fill,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: const EdgeInsets.all(10),
        ),
        title: Text(widget.album.collectionName),
        subtitle: Column(
          children: [
            widget.album.collectionPrice == null
                ? Container()
                : Text("\$${widget.album.collectionPrice}"),
            widget.album.releaseDate == null
                ? Container()
                : Text(format.format(widget.album.releaseDate!))
          ],
        ),
        trailing: IconButton(
          icon: widget.album.like
              ? const Icon(
                  Icons.favorite,
                  color: Colors.amber,
                )
              : const Icon(Icons.favorite_border, color: Colors.amber),
          onPressed: () {
            setState(() {
              widget.album.likeCallback();
              model.getLikedAlbumTotal();
            });
          },
        ),
      ),
    );
  }
}
