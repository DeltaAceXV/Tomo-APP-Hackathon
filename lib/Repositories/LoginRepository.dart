import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tracklocation/Components/DialogPrompt.dart';
import '../DTO/LoginDTO.dart';


class LoginRepository {

  LoginRepository();
  
  String uniqueId = FirebaseAuth.instance.currentUser?.uid ?? "";

  Future addUserDetails(UserDTO userDetails) async {
    try{
      final docStore = FirebaseFirestore.instance.collection('user_details')
      .doc(uniqueId);
      
      userDetails.AuthenticationID = uniqueId;
      await docStore.set(userDetails.toJson());
    }
    catch(Exception){
      DialogPrompt(
        titleMessage: 'Error',
        mainMessage: 'System error encountered',
        iconType: Icons.warning,
      );
    }

  }

  Future updateUserDetails(UserDTO userDetails) async {
    try{
      final docStore = FirebaseFirestore.instance.collection('user_details')
      .doc('IKXAb9ex4o2LDGlqCHNY');

      userDetails.AuthenticationID = uniqueId;
      await docStore.update(userDetails.toJson());
    }
    catch(Exception)
    {

    }

  }
  
  Future<List<UserDTO>> getLoginUser() async{
    Stream<List<UserDTO>> userList = FirebaseFirestore.instance
    .collection('user_details').snapshots()
    .map((snapshot) => 
    snapshot.docs.map((doc) => UserDTO.fromJson(doc.data())).toList()
    );

    try{
       var list = await userList;

      //  list.firstWhere((element) => 
      //   (element.where((items) => items.AuthenticationID == uniqueId)
      // ).first.AuthenticationID == uniqueId);
      
      var filteredList = (await list.first).firstWhere((userDTO) => 
        userDTO.AuthenticationID == uniqueId);
      
      return Future.value([filteredList]);
      
    }catch(Exception){
      return await Future<List<UserDTO>>(() {
        var emptyList = FutureOr<List<UserDTO>>;

        return Future.value([UserDTO()]);
      });
    }

    // return (await userList
    //   .firstWhere((element) {
    //     return element.contains(uniqueId);
    //   },)
    // );
  }
  // return new UserDTO();
}

