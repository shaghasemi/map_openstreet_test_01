class GeoReverseModelResponse {
  GeoReverseModelResponse({
    this.status,
    this.neighbourhood,
    this.municipalityZone,
    this.state,
    this.city,
    this.inTrafficZone,
    this.inOddEvenZone,
    this.routeName,
    this.routeType,
    this.district,
    this.formattedAddress,
  });

  GeoReverseModelResponse.fromJson(dynamic json) {
    status = json['status'];
    neighbourhood = json['neighbourhood'];
    municipalityZone = json['municipality_zone'];
    state = json['state'];
    city = json['city'];
    inTrafficZone = json['in_traffic_zone'];
    inOddEvenZone = json['in_odd_even_zone'];
    routeName = json['route_name'];
    routeType = json['route_type'];
    district = json['district'];
    formattedAddress = json['formatted_address'];
  }

  String? status;
  String? neighbourhood;
  String? municipalityZone;
  String? state;
  String? city;
  bool? inTrafficZone;
  bool? inOddEvenZone;
  String? routeName;
  String? routeType;
  String? district;
  String? formattedAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['neighbourhood'] = neighbourhood;
    map['municipality_zone'] = municipalityZone;
    map['state'] = state;
    map['city'] = city;
    map['in_traffic_zone'] = inTrafficZone;
    map['in_odd_even_zone'] = inOddEvenZone;
    map['route_name'] = routeName;
    map['route_type'] = routeType;
    map['district'] = district;
    map['formatted_address'] = formattedAddress;
    return map;
  }
}

class GeoReverseModelRequest {
  GeoReverseModelRequest({
    this.lat,
    this.lng,
  });

  GeoReverseModelRequest.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  double? lat;
  double? lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }
}
