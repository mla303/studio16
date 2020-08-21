import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studio16/UI/strings.dart';
import 'package:video_player/video_player.dart';



class upload_file extends StatefulWidget {
  upload_file({Key key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<upload_file> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  File videoFile;
  bool _uploaded;
  String _uploadedFileURL;
  FirebaseStorage _storage = FirebaseStorage.instance;

  Future uploadtoServer () async{
    print(videoFile);
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('images/');
    StorageUploadTask uploadTask = storageReference.putFile(videoFile);
    StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
    await uploadTask.onComplete;
    print('File Uploaded');

      setState(() {
        print(taskSnapshot);

      });

    return print(_uploadedFileURL);
  }



  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: <Widget>[

            Container(

              width: width,
              height: height/8,

              decoration: new BoxDecoration(

//                boxShadow: [
////                  BoxShadow(
////                    color: Color(0xffF18220),
////                    blurRadius: 20.0, // soften the shadow
////                    spreadRadius: 0.0, //extend the shadow
////                    offset: Offset(
////                      -2.0, // Move to right 10  horizontally
////                      -10.0, // Move to bottom 10 Vertically
////                    ),
////                  )
//                ],
              ),

              child: Card(
                elevation: 0,
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)
                    )
                ),

                child: Center(
                  child: Text(
                    Strings.splash,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color:  Color(0xffFFFFFF),
                        fontSize: height / 40,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),

            Visibility(
              visible: _controller != null,
              child: Container(
                height: 200,
                width: width,
                child: FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      // If the VideoPlayerController has finished initialization, use
                      // the data it provides to limit the aspect ratio of the video.
                      return AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        // Use the VideoPlayer widget to display the video.
                        child: VideoPlayer(_controller),
                      );
                    } else {
                      // If the VideoPlayerController is still initializing, show a
                      // loading spinner.
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
            RaisedButton(
              child: Text("import Video"),
              onPressed: () {
                getVideo();
              },
            ),
            videoFile == null
                ? Container(child: Text("Kuch b nahi"),)
                :RaisedButton(
              child: Text("Upload to Server"),
              onPressed: (){
                print("helo");
                uploadtoServer();
//                Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: _controller == null
          ? null
          : FloatingActionButton(
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown.
          setState(() {
            // If the video is playing, pause it.
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // If the video is paused, play it.
              _controller.play();
            }
          });
        },
        // Display the correct icon depending on the state of the player.
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future getVideo() async {
    Future<File> _videoFile =
    ImagePicker.pickVideo(source: ImageSource.gallery);
    _videoFile.then((file) async {
      setState(() {
        videoFile = file;
        _controller = VideoPlayerController.file(videoFile);

        // Initialize the controller and store the Future for later use.
        _initializeVideoPlayerFuture = _controller.initialize();

        // Use the controller to loop the video.
        _controller.setLooping(true);
      });
    });
  }
}