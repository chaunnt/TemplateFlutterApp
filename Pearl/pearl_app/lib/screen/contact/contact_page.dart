import 'package:flutter/material.dart';
import 'package:pearl_app/resource/values.dart';
import 'package:rxdart/rxdart.dart';

class ContactScreen extends StatefulWidget {
  final BehaviorSubject<int> streamCurrentTab;

  ContactScreen({this.streamCurrentTab});

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return _buildBodyView();
  }

  _buildBodyView() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildHeader(),
          SizedBox(height: 20.0),
          _buildRow(ResourceIcons.ic_facebook, 'Khu phố Cầu Xéo, Xã Hậu Thành \n Huyện Cái Bè, Tỉnh Tiền Giang'),
          _buildRow(ResourceIcons.ic_facebook, '+84 2733 819 528  \n +84 2733 819 528'),
          _buildRow(ResourceIcons.ic_facebook, '48 Đặng Đứ Thuật, \n phường Tân Phong, quận 7, Tp.HCM'),
          _buildRow(ResourceIcons.ic_line, 'info@viethungfood.com.vn \n viethungfood@gmail.com'),
          _buildRow(ResourceIcons.ic_line, ' www.viethungfood.com.vn \n www.viethungfood.com.vn'),
          _buildRow(ResourceIcons.ic_line, ' www.viethungfood.com.vn \n www.viethungfood.com.vn'),
          _buildRow(ResourceIcons.ic_line, ' www.viethungfood.com.vn \n www.viethungfood.com.vn'),

        ],
      ),
    );
  }

  _buildHeader() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 4,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Gạo Việt',
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Chuyên buôn bán sỉ lẻ gạo Viet Nam chất lượng cao. Hỗ trợ giao hàng tận nơi. Giá cả phải chăng.',
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(),
          ),
          Expanded(
              flex: 3,
              child:  Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage(ResourceImages.LogoApp)),
                ),
              )
          )
        ],
      ),
    );
  }

  _buildRow(String pathIcon, String text) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: <Widget>[
          Divider(thickness: 1,),
          SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              Container(
                width: 24.0,
                height: 24.0,
                child: Image.asset(pathIcon),
              ),
              SizedBox(width: 20.0),
              Container(
                child: Text(
                    text
                ),
              )
            ],
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
