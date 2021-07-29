import 'package:barcode_scan/barcode_scan.dart';
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
//import 'package:qrscan/qrscan.dart' as scanner;

class ScanView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ScanViewPageState();
}

class _ScanViewPageState extends State<ScanView> {
  String cameraScanResult = "";
  String barcode = "";
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
                   FlatButton(
                     color: Colors.white,
                     child: Text(
                       'Scan',
                       style: TextStyle(color: Colors.black),
                     ),
                     onPressed: ()   {
                       scan();
//                      String result = await scanner.scan();
//                      setState(() {
//                        cameraScanResult = result;
//                      });
                     },
                   ),
                   Container(
                     padding: const EdgeInsets.all(10),
                     child:  Text(
                       'Result : $barcode',
                       style: TextStyle(fontFamily: 'Dancing Script',fontSize: 25),
                     ),

                   ),
                ],
              )

      ),
      backgroundColor: backgroundColor,
    );
  }
  
  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    }  catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException{
      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }

}