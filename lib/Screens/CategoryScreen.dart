import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:grad_project/Models/ModelProducts.dart';
import 'package:grad_project/Screens/ProductsScreen.dart';
import 'LogIn.dart';
import '../Models/ModelCategory.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
        ),
        body: SafeArea(
          child: Center(
            child: Container(
                child: FutureBuilder<ModelCategory>(
              future: getCategory(),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done)
                  return CircularProgressIndicator();
                else if (snapshot.hasData) {
                  ModelCategory modelCategory = snapshot.data;
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: GridView.count(
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 2.0,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: List.generate(
                            modelCategory.categories.length,
                            (index) => Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Image(
                                      image: NetworkImage(modelCategory
                                          .categories[index].avatar),
                                      fit: BoxFit.cover,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      color: Colors.black38,
                                      child: Text(
                                        "${modelCategory.categories[index].name}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
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
        ));
  }

  @override
  void initState() {
    super.initState();
    getCategory();
  }

  Future<ModelCategory> getCategory() async {
    Response response;
    var dio = Dio();
    response = await dio.get('https://retail.amit-learning.com/api/categories');
    ModelCategory data = ModelCategory.fromJson(response.data);

    return data;
  }
}
