import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/models/user.dart';
import 'package:flutter_template/services/location_service.dart';
import 'package:flutter_template/ui/shared/app_colors.dart';
import 'package:flutter_template/ui/shared/ui_helpers.dart';
import 'package:flutter_template/ui/view_models/home_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../locator.dart';

class AboutView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutView> {
  final LocationService _locationService = locator<LocationService>();
  final Map<String, Marker> _markers = {};
  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller)  async{
    mapController = controller;
    final googleOffices = await _locationService.getLocations();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
          child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
//          Text('Welcome ${Provider.of<HomeModel>(context).posts != null
//              && Provider.of<HomeModel>(context).posts.length > 0 ? Provider.of<HomeModel>(context).posts.first.title : ""}'),
                UIHelper.verticalSpaceLarge(),
                   Container(
                   padding: const EdgeInsets.all(10),
                   child:  Text(
                       'Công nghệ luôn cùng bạn đồng hành và phát triển',
                       style: TextStyle(fontFamily: 'Dancing Script',fontSize: 25),
                     ),

                   ),
                   Container(
                     height: MediaQuery.of(context).size.height - 300,
                     width: MediaQuery.of(context).size.width,
                     child:  GoogleMap(
                       onMapCreated: _onMapCreated,
                       initialCameraPosition: CameraPosition(
                         target: _center,
                         zoom: 3.0,
                       ),
                       markers: _markers.values.toSet(),
                     ),
                   ),

                ],
              )

      ),
      backgroundColor: backgroundColor,
    );
  }

}