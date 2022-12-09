import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:store/utils/small_utils.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(children: [
                  header(),
                  verticalSpacer(25),
                  carousel(),
                  verticalSpacer(25),
                ]),
              ),
              //bottom sheet
              dragableBottomSheet(),
            ],
          ),
        ),
      ),
    );
  }

  dragableBottomSheet() {
    return DraggableScrollableSheet(
        maxChildSize: .9,
        initialChildSize: .52,
        minChildSize: .52,
        builder: (context, scrollController) => Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 221, 223, 224),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: ListView(
                controller: scrollController,
                children: [
                  infoTitles(),
                  ListTile(
                    title: Text(
                      "NAME",
                    ),
                    subtitle: Text(
                      "sdfjksef",
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "FAMILY",
                    ),
                    subtitle: Text(
                      "asdsdn",
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "LIFESPAN",
                    ),
                    subtitle: Text(
                      "Sfsd",
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "WEIGHT",
                    ),
                    subtitle: Text("DFdsnd"),
                  ),
                ],
              ),
            ));
  }

  infoTitles() {
    return Column(
      children: [
        verticalSpacer(8),
        // Container(
        //   margin: EdgeInsets.symmetric(vertical: 8),
        //   width: 100,
        //   height: 10,
        //   decoration: BoxDecoration(
        //       color: Color.fromARGB(0, 0, 0, 0),
        //       border: Border.all(
        //           color: Color.fromARGB(209, 255, 255, 255), width: 3),
        //       borderRadius: BorderRadius.circular(10)),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Nike Air Max 200",
              style: Theme.of(context).textTheme.headline4,
            ),
            Text("⭐ (4.5)", style: Theme.of(context).textTheme.headline6)
          ],
        )
      ],
    );
  }

  carousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        onPageChanged: (int, CarouselPageChangedReason) {},
        scrollDirection: Axis.horizontal,
      ),
      items: [1, 2, 3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15)),
                child: Image.network(
                    fit: BoxFit.fitHeight,
                    "https://images.squarespace-cdn.com/content/v1/597bae35f14aa186dde25e1f/1574486517683-UX2OCLL5Z5B5PJMPWR8C/Project-Still---Shoe-Shot-2.png?format=1500w"));
          },
        );
      }).toList(),
    );
  }

  header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () => Navigator.pop(context),
            icon: LineIcon(
              LineIcons.arrowLeft,
              size: 35,
            )),
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.pinkAccent,
          child: Icon(
            Icons.favorite,
            size: 18,
          ),
        )
      ],
    );
  }
}
