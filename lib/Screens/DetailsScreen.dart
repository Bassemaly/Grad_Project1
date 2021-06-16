import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:grad_project/Models/ModelProducts.dart';

import '../Models/ModelProducts.dart';

class DetailsScreen extends StatefulWidget {
  Products products;

  DetailsScreen({this.products});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
        ),
        body: Center(
          child: Column(
            // itemCount: widget.modelProducts.products.length,

            children: [
              Flexible(
                flex: 3,
                child: Container(
                    margin: EdgeInsets.only(top: 100),
                    width: 400,
                    height: 400,
                    child: Image.network(widget.products.avatar)),
              ),
              SizedBox(height: 20),
              Text(
                widget.products.name,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(right: 30, left: 30),
                child: Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 30),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        widget.products.price.toString(),
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(widget.products.currency,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.red,
                              fontWeight: FontWeight.bold)),
                      Container(
                        margin: EdgeInsets.only(left: 200),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.add_box_rounded,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _index++;
                                  });
                                }),
                            Container(
                              child: Text(
                                "$_index",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.indeterminate_check_box_rounded,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _index--;
                                  });
                                })
                          ],
                        ),
                      ),
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(right: 30, left: 30),
                child: Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 60,
              ),

              ElevatedButton(
                onPressed: () {},
                child: Text("Add to Card"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    padding:
                        EdgeInsets.symmetric(horizontal: 150, vertical: 20)),
              )
              // Text(widget.modelProducts.products[0].description.toString())
            ],
          ),
        ));
  }
}
