import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:grad_project/Screens/DetailsScreen.dart';

import '../Models/ModelProducts.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
              child: FutureBuilder<ModelProducts>(
            future: getProduct(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done)
                return CircularProgressIndicator();
              else if (snapshot.hasData) {
                ModelProducts modelProducts = snapshot.data;
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: GridView.count(
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 2,
                      //physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: List.generate(
                          modelProducts.products.length,
                          (index) => Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Image(
                                    width: 150,
                                    height: 150,
                                    image: NetworkImage(
                                        modelProducts.products[index].avatar),
                                    fit: BoxFit.cover,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailsScreen(
                                                      products: modelProducts
                                                          .products[index])));
                                    },
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 172),

                                    height: double.infinity,
                                    // color: Colors.black,
                                    child: Text(
                                      "${modelProducts.products[index].name}",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              )),
                    ),
                  ),
                );
              } else {
                return Center(child: Text("No Data Found"));
              }
            },
          )),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getProduct();
  }

  Future<ModelProducts> getProduct() async {
    Response response;
    var dio = Dio();
    response = await dio.get('https://retail.amit-learning.com/api/products');
    ModelProducts data = ModelProducts.fromJson(response.data);

    return data;
  }
}
