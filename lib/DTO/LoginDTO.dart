import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tracklocation/DTO/Location.dart';

class UserDTO{
    String? loginID;
    String? _password;
    String? _username;
    String? _email;
    
    String get getLoginId{
      return this.loginID ?? "";
    }

    void set setLoginID(String ? LoginID){
      this.loginID = LoginID ?? "";
    }
    
    String? get password => _password;
    set password(String? value) => _password = value;

    String? get username => _username;
    set username(String? value) => _username = value;

    String? get email => _email;
    set email(String? value) => _email = value;


    //Firebase link properties
    String? AuthenticationID;
    String? FirstName;
    String? LastName;
    String? Gender;
    String? Address;
    String? Address2;
    
    DateTime? Birthdate;

    Location? location;

    // String? _AuthenticationID;
    // String? _FirstName;
    // String? _LastName;
    // String? _Gender;
    // String? _Address;
    // String? _Address2;
    
    // int? _Age;

    // Location? _location;
    
    // String? get AuthenticationID => _AuthenticationID;
    // set authenticationID(String? value) => _AuthenticationID = value;

    // String? get FirstName => _FirstName;
    // set firstName(String? value) => _FirstName = value;

    // String? get LastName => _LastName;
    // set lastName(String? value) => _LastName = value;

    // String? get Gender => _Gender;
    // set gender(String? value) => _Gender = value;

    // String? get Address => _Address;
    // set address(String? value) => _Address = value;

    // String? get Address2 => _Address2;
    // set address2(String? value) => _Address2 = value;

    // int? get Age => _Age;
    // set age(int? value) => _Age = value;

    // Location? get UserLocation => _location;
    // set userLocation(Location? value) => _location = value;

    UserDTO({ this.AuthenticationID, this.Address, this.Address2, this.Birthdate, this.FirstName, this.LastName, this.Gender, this.location });

    Map<String, dynamic> toJson() => {
      'AuthenticationID': this.AuthenticationID,
      'Address': this.Address,
      'Address2': this.Address2,
      'Birthdate': this.Birthdate,
      'FirstName': this.FirstName,
      'LastName': this.LastName,
      'Gender': this.Gender,
      'location': {
        'Latitude': this.location?.Latitude,
        'Longitude': (this.location?.Longitude)
      },
      
    };

    static UserDTO fromJson(Map<String, dynamic> json) => UserDTO(
      AuthenticationID: json['AuthenticationID'],
      Address: json['Address'],
      Address2: json['Address2'],
      Birthdate: DateTime.fromMillisecondsSinceEpoch((json['Birthdate']).seconds * 1000) ,
      FirstName: json['FirstName'],
      LastName: json['LastName'],
      Gender: json['Gender'],
      location: Location(
        json['location']['Latitude'],
        json['location']['Longitude']
      ),
    );

}




