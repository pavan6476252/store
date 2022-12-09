import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:store/utils/app_bar.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: myAppBar(context, "My Cart",
            IconButton(onPressed: () {}, icon: Icon(Icons.delete))),
        body: SafeArea(
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  color: Theme.of(context).colorScheme.background,
                  // color: Colors.grey
                ),
                child: Expanded(
                    child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    List li = [];
                    if (li.length == 0) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Theme.of(context).colorScheme.secondary),
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: CircleAvatar(
                                radius: 40,
                                child: Icon(
                                  Icons.shop,
                                  size: 35,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nike Air Max 200",
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  Text("\$ 260.00",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.minimize_rounded)),
                                  Text("1",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6),
                                  IconButton(
                                      onPressed: () {}, icon: Icon(Icons.add))
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Container(
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: Icon(Icons.shop),
                          )
                        ],
                      ),
                    );
                  },
                )))),
      ),
    );
  }
}
