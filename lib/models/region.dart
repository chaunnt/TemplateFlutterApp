
import 'latlng.dart';

class Region {
  Region({
    this.coords,
    this.id,
    this.name,
    this.zoom,
  });


   LatLng coords;
   String id;
   String name;
   double zoom;

  Region.fromJson(Map<String, dynamic> json) {
    coords = LatLng.fromJson(json['coords']);
    id = json['id'];
    name = json['name'];
    zoom = json['zoom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coords'] = this.coords.toJson();
    data['id'] = this.id;
    data['name'] = this.name;
    data['zoom'] = this.zoom;

    return data;
  }
}
