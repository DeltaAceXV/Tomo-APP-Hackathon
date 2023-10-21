import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

import 'package:tracklocation/Components/square_tile.dart';
import 'package:tracklocation/Repositories/LoginRepository.dart';
import 'package:tracklocation/DTO/LoginDTO.dart';

import '../../DTO/Location.dart';
import '../../Helpers/ImageHelper.dart';
import '../../Helpers/GeolocationHelper.dart';

class UserProfile extends StatefulWidget{
  @override
  State<UserProfile> createState() {
    return _UserProfile();
  }
}

class _UserProfile extends State<UserProfile>{
  late Future<String> userProfilePicPath;
  late Future<List<UserDTO>> userDTOInfo;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();

  final address1Controller = TextEditingController();
  final address2Controller = TextEditingController();

  final geoLocationHelper = GeolocationHelper();

  String gender = "Male";
  DateTime selectedDate = DateTime.now();
  Location addressLocation = Location(0,0);

  bool isNetworkPath = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(
          DateTime.now().year
          , DateTime.now().month
          , DateTime.now().day
          )
        );
        
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
  }

  @override
  void initState(){
    super.initState();
    userProfilePicPath = ImageHelper(
        context, 
        "UserProfile", 
        (FirebaseAuth.instance.currentUser?.uid ?? "")
      ).getFileFromFirebase();

    userDTOInfo = LoginRepository().getLoginUser();
    userDTOInfo.then((value) {
      firstNameController.text = value.first.FirstName ?? "";
      lastNameController.text = value.first.LastName ?? "";
      ageController.text = (DateTime.now().difference(
          (value.first.Birthdate ?? DateTime.now())
      ).inDays / 365).toString();

      gender = value.first.Gender ?? gender;

      selectedDate = value.first.Birthdate ?? selectedDate;
      addressLocation = value.first.location ?? addressLocation;

      var placemark = geoLocationHelper.GetAddressFromCoordinates(
        Position(
          latitude: addressLocation.Latitude ?? 0
        , longitude: addressLocation.Longitude ?? 0
        , accuracy: 5
        , altitude: 0
        , speed: 0
        , heading: 0
        , timestamp: DateTime.now()
        , speedAccuracy: 10
        )
      );

      placemark.then((address) {
        List<String> listAddress = [];
        List<String> listAddress2 = [];

        listAddress.add(address.street ?? "");
        listAddress.add(address.subLocality ?? "");
        listAddress.add(address.thoroughfare ?? "");

        listAddress2.add(address.administrativeArea ?? "");
        listAddress2.add(address.postalCode ?? "");

        address1Controller.text = '${listAddress.join(',')} ';
        address2Controller.text = '${listAddress2.join(',')}';
        
      });


      setState(() {
      });
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {

    String pathFile = "lib/images/Profile_Pic_Placeholder.png";

    Widget profilePicBody = FutureBuilder<String>(
      future: userProfilePicPath,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if(snapshot.hasData){
          pathFile = snapshot.data ?? "";
          isNetworkPath = true;
        }
          
        return GestureDetector(
          child: SquareTile(
            height: 120,
            width: 120,
            borderRadius: 120,
            padding: 0,
            imagePath: pathFile,
            isNetworkPath: isNetworkPath,
          ),
          onTap: () async {
            await ImageHelper(
              context
              , "UserProfile"
              , (FirebaseAuth.instance.currentUser?.uid ?? "")
            ).selectFile();
            
            userProfilePicPath = ImageHelper(
              context
              , "UserProfile"
              , (FirebaseAuth.instance.currentUser?.uid ?? "")
            ).getFileFromFirebase();

            setState(() {
            });
          },
        );
      },
    );
    
    return 
      Stack(
        children: [
          Scaffold(
          body: 
          CustomScrollView(
            physics: NeverScrollableScrollPhysics(),
            slivers: [
              SliverAppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: (){
                    return Navigator.pop(context);
                  },
                ),

                expandedHeight: 250,
                flexibleSpace: FlexibleSpaceBar(
                  
                  title: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        
                        Padding(
                          padding: const EdgeInsets.only(right: 50, top: 100),
                          child: profilePicBody,
                        ),
                        
                      ],
                    ),
                ),

                actions: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () async{
                          var userDetails = UserDTO(
                            FirstName: firstNameController.text,
                            LastName: lastNameController.text,
                            Address: address1Controller.text,
                            Address2: address2Controller.text,
                            Birthdate: selectedDate,
                            Gender: gender,
                            location: addressLocation
                          );

                        await LoginRepository().addUserDetails(
                          userDetails
                        );
                      }, 
                      icon: Icon(
                        Icons.save,
                      )
                    ),
                  )
                ],
              ),
              
              SliverFillRemaining(
                
                child: 
                Scrollbar(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          SizedBox(
                            height: 10.0,
                          ),

                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              start: 10.0,
                              end: 10.0
                            ),
                            child: TextFormField(
                              controller: firstNameController,
                              decoration: const InputDecoration(
                                
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(width: 0)
                                ),
                                labelText: 'First Name',
                                hintText: 'Enter your family name',
                                hintStyle: TextStyle(color: Colors.grey)
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 10.0,
                          ),

                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              start: 10.0,
                              end: 10.0
                            ),
                            child: TextFormField(
                              controller: lastNameController,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(width: 0)
                                ),
                                labelText: 'Last Name',
                                hintText: 'Enter your given name',
                                hintStyle: TextStyle(color: Colors.grey)
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              start: 10.0,
                              end: 10.0
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    geoLocationHelper.DetermineGeoPosition().then((value) {
                                      addressLocation.latitude = value.latitude;
                                      addressLocation.longitude = value.longitude;
                                     
                                      geoLocationHelper.GetAddressFromCoordinates(value).then((address) {
                                        List<String> listAddress = [];
                                        List<String> listAddress2 = [];

                                        listAddress.add(address.street ?? "");
                                        listAddress.add(address.subLocality ?? "");
                                        listAddress.add(address.thoroughfare ?? "");

                                        listAddress2.add(address.administrativeArea ?? "");
                                        listAddress2.add(address.postalCode ?? "");

                                        address1Controller.text = '${listAddress.join(',')} ';
                                        address2Controller.text = '${listAddress2.join(',')}';
                                      });

                                    });
                                  });

                                  return;
                                },
                                child: Icon(Icons.location_city),
                              ),
                          ),

                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              start: 10.0,
                              end: 10.0
                            ),
                            child: TextFormField(
                              controller: address1Controller,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(width: 0)
                                ),
                                labelText: 'Street Address',
                                hintText: 'Enter your street name',
                                hintStyle: TextStyle(color: Colors.grey)
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              start: 10.0,
                              end: 10.0
                            ),
                            child: TextFormField(
                              controller: address2Controller,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(width: 0)
                                ),
                                labelText: 'City Address',
                                hintText: 'Enter your city / state',
                                hintStyle: TextStyle(color: Colors.grey)
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              start: 10.0,
                              end: 10.0
                            ),
                            child: ElevatedButton.icon(
                                icon: Icon(Icons.edit_calendar),
                                onPressed: () {
                                  _selectDate(context);
                                },
                                label: Text(DateFormat("dd/MM/yyyy").format(selectedDate)),
                              )
                            
                            // DatePickerDialog(

                            //   lastDate: DateTime.now(),
                            //   firstDate: DateTime(1900),
                            //   initialDate: DateTime.now(),
                            //   fieldHintText: 'Birthday',
                            //   fieldLabelText: 'DD/MM/YYYY',
                            //   helpText: 'Select Birthdate',
                            // ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Radio<String>(
                                  value: "Male",
                                  groupValue: gender,
                                  onChanged: (value){
                                    setState(() {
                                      gender = value ?? "Male";
                                    });
                                  },
                              )
                              , Icon(Icons.male)
                              , Text('Male')
                              
                              , Radio<String>(
                                  value: "Female",
                                  groupValue: gender,
                                  onChanged: (value){
                                    setState(() {
                                      gender = value ?? "Female";
                                    });
                                  },
                              )
                              , Icon(Icons.female)
                              , Text('Female')
                              
                              , Radio<String>(
                                  value: "Non-binary",
                                  groupValue: gender,
                                  onChanged: (value){
                                    setState(() {
                                      gender = value ?? "Non-binary";
                                    });
                                  },
                              )
                              , Icon(Icons.transgender)
                              , Text('Non-binary')
                            ],
                          ),
                          
                          SizedBox(
                            height: 10,
                          ),

                          ElevatedButton.icon(
                            onPressed: (){
                              FirebaseAuth.instance.signOut();
                              Navigator.pop(context);
                            }
                            , icon: const Icon(
                              Icons.logout
                            )
                            , label: const Text('Logout'))

                        ],
                      ),
                    ),
                  )
                ),
              )
            ],
          ),
            
        )
      ],
    );
      
  }

}







