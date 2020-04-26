import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class ProductDetailScreen extends StatefulWidget {
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  final _items = [
    "https://highlandelephantcoffee.com/wp-content/uploads/2019/09/gao-600-trai-tim-1-510x510.jpg",
    "https://i.pinimg.com/236x/a6/18/b3/a618b32169d0f33c6ca245ae8058685a.jpg",
    "https://cafefcdn.com/thumb_w/650/2017/gao-ngon-1511834830411-crop-1511834843921-1511856704508.jpg",
    "https://highlandelephantcoffee.com/wp-content/uploads/2019/09/gao-600-trai-tim-1-510x510.jpg",
  ];

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height - 50,
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: _buildMediaPageView(),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 40, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  Container(
                    child: InkWell(
                      onTap: null,
                      child: Icon(Icons.more_vert),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(30.0),
                      topRight: const Radius.circular(30.0)),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    color: Colors.white,
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 20.0, right: 20.0),
                    child: _buildInfoDetails(),
                  ),
                ))
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBuyButton(),
    );
  }

  _buildMediaPageView() {
    return Stack(
      children: <Widget>[
        _buildPageView(),
        _buildCircleIndicator(),
      ],
    );
  }

  _buildPageView() {
    return Container(
      child: PageView.builder(
          itemCount: _items.length,
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Image.network(
                _items[index],
                fit: BoxFit.fill,
              ),
            );
          },
          onPageChanged: (int index) {
            _currentPageNotifier.value = index;
          }),
    );
  }

  _buildCircleIndicator() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: CirclePageIndicator(
          itemCount: _items.length,
          selectedDotColor: Colors.orange,
          dotColor: Colors.grey,
          currentPageNotifier: _currentPageNotifier,
        ),
      ),
    );
  }

  _buildInfoDetails() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Text('Gạo Nàng Hoa',
                  style: Theme.of(context)
                      .textTheme
                      .headline
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
            Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text('23.000 đ',
                        style: Theme.of(context).textTheme.headline.copyWith(
                            color: Colors.orange, fontWeight: FontWeight.bold)),
                    Text('1kg', style: Theme.of(context).textTheme.bodyText1),
                  ],
                ))
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 15, bottom: 15.0),
          height: 1.0,
          color: Colors.grey,
        ),
        Container(
          child: Text(
            'Thông tin sản phẩm',
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Expanded(
            child: SingleChildScrollView(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Text(
            textContent,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ))
      ],
    );
  }

  _buildBottomBuyButton() {
    return Container(
      color: Colors.grey[100],
      height: 50.0,
      padding:
          const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 20, right: 20.0),
      child: InkWell(
        onTap: null,
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xFFFFBB00),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
          child: Center(
            child: Text("Mua ngay",
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(color: Colors.white)),
          ),
        ),
      ),
    );
  }

  final textContent =
      "Gạo lứt, còn gọi là gạo rằn, gạo lật là loại gạo chỉ xay bỏ vỏ trấu, chưa được xát bỏ lớp cám gạo. Đây là loại gạo rất giàu dinh dưỡng đặc biệt là các sinh tố và nguyên tố vi lượng. Do trong phương ngôn tiếng Việt Nam Bộ lứt và lức đồng âm, đều được đọc là /lɨk/ nên gạo lứt còn được viết là gạo lức.Thành phần của gạo lứt gồm chất tinh bột, chất đạm, chất béo, chất xơ cùng các vitamin như B1, B2, B3, B6; các axit như pantothenic (vitamin B5), paraaminobenzoic (PABA), folic (vitamin M), phytic; các nguyên tố vi lượng như canxi, sắt, magiê, selen, glutathion (GSH), kali và natri.Các chuyên gia dinh dưỡng cũng nhận thấy, một lon gạo lứt khi nấu thành cơm chứa 84 mg magiê, trong khi đó ở gạo trắng chỉ có 19 mg. Lớp cám của gạo lứt cũng chứa một chất dầu đặc biệt có tác dụng điều hòa huyết áp, làm giảm cholesterol xấu, giúp ngăn ngừa qua các bệnh tim mạch.";
}
