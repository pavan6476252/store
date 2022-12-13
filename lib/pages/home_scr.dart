import 'package:flutter/material.dart';
import 'package:store/utils/app_bar.dart';
import 'package:store/utils/small_utils.dart';

import '../utils/rating_bar.dart';

class HomeScr extends StatefulWidget {
  const HomeScr({super.key});

  @override
  State<HomeScr> createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
  String _selectedDropVal = "All";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 220) / 2;
    final double itemWidth = size.width / 2;
    return SafeArea(
      child: Scaffold(
        appBar: myAppBar(context, "Store", null),
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                verticalSpacer(25),
                titleCustom(),
                verticalSpacer(25),
                Expanded(
                  child: GridView.count(
                    childAspectRatio: (itemWidth / itemHeight),
                    controller: new ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    crossAxisCount: 2,
                    children: [mainContent(), mainContent(), mainContent()],
                  ),
                )
              ],
            )),
      ),
    );
  }

  mainContent() {
    var url = "";
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 235, 234, 234),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          //top
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "30%",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
              ),
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.pinkAccent,
                child: Icon(
                  Icons.favorite,
                  size: 18,
                ),
              )
            ],
          ),
          //image
          Expanded(
              flex: 3,
              child: Image.network(
                url,
              )),
          Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/product_page'),
                    child: Text(
                      "Nike Air Max 20",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Text(
                    "\$ 240.00",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  StarRating(
                    rating: 4.5,
                    onRatingChanged: (rating) => setState(() {}),
                    color: Color.fromARGB(255, 228, 30, 4),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  titleCustom() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        "Our Products",
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      DropdownButton<String>(
        hint: _selectedDropVal == null
            ? Text("All")
            : Text(
                _selectedDropVal,
                style: TextStyle(color: Colors.blue),
              ),
        items: <String>['All', 'Amp', 'Wires', 'Connector'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (_v) {
          setState(() {
            _selectedDropVal = _v!;
          });
        },
      )
    ]);
  }
}
