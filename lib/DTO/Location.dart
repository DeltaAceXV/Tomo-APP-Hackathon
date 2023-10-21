class Location{
  double? __Latitude;
  double? __Longitude;

   double? get Latitude => this.__Latitude;
  set latitude(double? value) => this.__Latitude = value;

   double? get Longitude => this.__Longitude;
   set longitude(double? value) => this.__Longitude = value;

  Location(
    double _Latitude, double _Longitude
  )
  { 
    this.__Latitude = _Latitude;
    this.__Longitude = _Longitude; 
  }

}