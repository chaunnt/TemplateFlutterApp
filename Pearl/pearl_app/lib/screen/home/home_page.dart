import 'package:flutter/material.dart';
import 'package:pearl_app/router/router.dart';
import 'package:rxdart/rxdart.dart';

class HomeScreen extends StatefulWidget {
  final BehaviorSubject<int> streamCurrentTab;

  HomeScreen({this.streamCurrentTab});

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: buildBodyView()
      ),
    );
  }

  Widget buildBodyView() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10.0),
          Text(
            'Sản phẩm',
            style: Theme.of(context).textTheme.title.copyWith(fontSize: 24.0),
          ),
          SizedBox(height: 10.0),
          Expanded(
            child: buildGridView()
          ),
        ],
      ),
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.only(bottom: 10.0),
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: 50,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
          childAspectRatio: 2 / 3),
      itemBuilder: (BuildContext context, int index) {
        return buildItemCard();
      },
    );
  }


  Widget buildItemCard() {
    return InkWell(
      onTap: () =>  Navigator.of(context).pushNamed(Router.product_detail_page),
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: 200.0,
              width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: const Radius.circular(30.0), topRight: const Radius.circular(30.0)),
                child: Image.network(
                  'https://highlandelephantcoffee.com/wp-content/uploads/2019/09/gao-600-trai-tim-1-510x510.jpg',
                ),
              ),
            ),
            Positioned(
              top: 160,
              child: Container(
                width: 200,
                color: Colors.transparent,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Gạo lức Thái Lan',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'Gạo dẻo, dai cơm',
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5.0),
                            height: 1.0,
                            color: Colors.grey,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '23.000 đ',
                                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.orange),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    '1 kg',
                                    style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.orange,
                                ),
                                child: Icon(Icons.add, size: 20, color: Colors.white,),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                ),
              ),
            )
          ],
        ),
      )
    );
  }

}

