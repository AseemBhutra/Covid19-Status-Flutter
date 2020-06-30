class DistrictModel {

  String state;
  String statecode;
  List<CityData> districtData;

  DistrictModel(
      this.state,
      this.statecode,
      [this.districtData]
      ) ;

  factory DistrictModel.fromJson(dynamic json) {
    if (json['districtData'] != null) {
      var tagObjsJson = json['districtData'] as List;
      List<CityData> _tags = tagObjsJson.map((tagJson) =>
          CityData.fromJson(tagJson)).toList();
       return DistrictModel(
          json['state'],
          json['statecode'],
          _tags
      );
    }
  }


}

class CityData {
  String district;
  String confirmed;
  String deceased;
  String recovered;
  String active;
  Delta delta;

  CityData({
    this.district,
    this.confirmed,
    this.deceased,
    this.recovered,
    this.active,
    this.delta,

  }) ;

  factory CityData.fromJson(Map<String, dynamic> json){
    return new CityData(
      district:json['district'].toString(),
      confirmed:json['confirmed'].toString(),
      deceased: json['deceased'].toString(),
      recovered: json['recovered'].toString(),
      active: json['active'].toString(),
      delta: Delta.fromJson(json["delta"]),
    );
  }
}


class Delta {
  int confirmed;
  int deceased;
  int recovered;

  Delta({
    this.confirmed,
    this.deceased,
    this.recovered,
  });

  factory Delta.fromJson(Map<String, dynamic> json) => Delta(
        confirmed: json["confirmed"],
        deceased: json["deceased"],
        recovered: json["recovered"],
      );

  Map<String, dynamic> toJson() => {
        "confirmed": confirmed,
        "deceased": deceased,
        "recovered": recovered,
      };
}