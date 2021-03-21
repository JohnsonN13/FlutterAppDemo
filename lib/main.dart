import 'package:flutter/material.dart';
import 'package:myapp/Product.dart';
import 'package:myapp/views/CartView.dart';
import 'package:myapp/views/ProductView.dart';
import 'package:myapp/Cart.dart';
import 'package:badges/badges.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo - Born To Ride',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Born To ride'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void addCart(Product product) {
    setState(() {
      if (list.contains(product)) {
        int ind = list.indexOf(product);
        list[ind].quantity++;
        showAlertDialog(context);
      } else {
        product.quantity = 1;
        list.add(product);
        showAlertDialog(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Tous nos produits",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Container(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 10),
                        child: Card(
                          child: Column(
                            children: [
                              Image.asset(
                                data[index].image,
                                width: double.infinity,
                                fit: BoxFit.fitWidth,
                                height: 200,
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          data[index].title,
                                          style: TextStyle(fontSize: 18),
                                          textAlign: TextAlign.start,
                                        ),
                                        Text(
                                          data[index].price.toString() + '\$',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.lightGreen),
                                          textAlign: TextAlign.end,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Row(
                                        children: [
                                          Flexible(
                                              child: Text(
                                            data[index].description,
                                          ))
                                        ],
                                      ),
                                    )
                                  ])),
                              ButtonBar(
                                children: <Widget>[
                                  TextButton(
                                      onPressed: () => addCart(data[index]),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Text(
                                          "Ajouter au panier",
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ),
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: Colors.green,
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ProductView(
                                                  product: data[index])),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Text(
                                          "Voir en détails",
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ),
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: Colors.green,
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ));
                  }),
            ),
          ],
        ));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
          centerTitle: true,
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {},
              padding: EdgeInsets.all(15.0),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, right: 30),
              child: Stack(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartView()),
                      );
                    },
                  ),
                  if(list.length > 0)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      alignment: Alignment.center,
                      child: Text('${list.length}'),
                    ),
                  ),
                ],
              ),
            )
          ]);
  }
}

showAlertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    title: Text("Infos", style: TextStyle(color: Colors.lightGreen)),
    content: Text("Produit ajouté au panier"),
    actions: [
      FlatButton(
        onPressed: () => Navigator.pop(context, true),
        child: Text("OK"),
      )
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
