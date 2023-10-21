import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tracklocation/Components/DialogPrompt.dart';

class ImageHelper{

  final BuildContext context;
  final String? filePath;
  final String? fileName;

  ImageHelper(this.context, this.filePath, this.fileName);

  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  Future<String> getFileFromFirebase() async {
    String imageRef = (filePath ?? "") + '/' + (fileName ?? "");

    var result = FirebaseStorage.instance
    .ref(filePath)
    .child(fileName ?? "");

    return (await result.getDownloadURL());
  }

  Future selectFile() async {
    await Permission.photos.request();

      if (Platform.isAndroid) {
        String osVersion = Platform.operatingSystemVersion;

        var permissionStatus = (await Permission.storage.status.isGranted ?
        await Permission.storage.status : await Permission.photos.status);

        if(!permissionStatus.isGranted){
          showDialog(
            context: this.context, 
            builder: (context) =>  DialogPrompt(
                titleMessage: "Insufficient Permission"
                , iconType: Icons.error
                , mainMessage: "Permission not granted"
              )
          );
          
          return null;
        }

    }

    final result = await FilePicker.platform.pickFiles(
      type: FileType.image
    );

    if(result == null)
    {
      return null;
    }

    setState() async{
      pickedFile = result.files.first;
      await uploadFile();
    }

    await setState();
  }

  Future uploadFile() async{
    final path = (this.filePath ?? "Misc") + '/' + (this.fileName ?? "Portrait");
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);

    final snapShot = await uploadTask!.whenComplete(() {});
    
  }

}