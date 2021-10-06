import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui';
import 'package:permission_handler/permission_handler.dart';

enum SlidableAction { archive, share, more, delete }

class SlidableWidget<T> extends StatelessWidget {
  final Widget child;
  final Function(SlidableAction action) onDismissed;

  const SlidableWidget({
    required this.child,
    required this.onDismissed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(
        actionPane: SlidableDrawerActionPane(),
        child: child,

        /// left side
        actions: <Widget>[
          Expanded(
            child: Container(
              height: 220,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                color: Colors.deepPurple[900],
              ),
              child: Icon(
                Icons.archive,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: 220,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              color: Colors.deepPurple[800],
            ),
            child: Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
        ],

        /// right side
        secondaryActions: <Widget>[
          Expanded(
            child: Container(
              height: 220,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Colors.deepPurple[800],
              ),
              child: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: 220,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: Colors.deepPurple[900],
            ),
            child: IconButton(
              color: Colors.white,
              icon: const Icon(Icons.download),
              onPressed: () async {
                final status = await Permission.storage.request();

                if (status.isGranted) {
                  final externalDir = await getExternalStorageDirectory();

                  final id = await FlutterDownloader.enqueue(
                    url:
                        "https://firebasestorage.googleapis.com/v0/b/storage-3cff8.appspot.com/o/2020-05-29%2007-18-34.mp4?alt=media&token=841fffde-2b83-430c-87c3-2d2fd658fd41",
                    savedDir: externalDir!.path,
                    fileName: "download",
                    showNotification: true,
                    openFileFromNotification: true,
                  );
                } else {
                  print("Permission deined");
                }
              },
            ),
          ),
        ],
      );
}
