import 'package:flutter/material.dart';
import 'package:myapp/Product.dart';
import 'package:myapp/Cart.dart';
import 'package:myapp/views/CartView.dart';

class ProductView extends StatelessWidget {
  final Product product;
  const ProductView({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.lightGreen,
        appBar: AppBar(
            centerTitle: true,
            title: Text("Born To ride"),
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
                padding: EdgeInsets.only(top: 8, right: 30),
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
            ]),
        body: ListView(
          children: <Widget>[
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(product.image),
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                left: 30,
                right: 30,
              ),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "VTT\n",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.lightGreen,
                                  fontStyle: FontStyle.italic)),
                          TextSpan(
                              text: "${product.title}",
                              style: TextStyle(
                                fontSize: 21,
                              ))
                        ])),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Prix\n",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.lightGreen,
                                  fontStyle: FontStyle.italic)),
                          TextSpan(
                              text: "${product.price}\$",
                              style: TextStyle(
                                fontSize: 21,
                              ))
                        ])),
                      ]),
                  Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Text(product.description,
                              style: TextStyle(
                                fontSize: 18,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 100),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                                text: "+ Cadre\n",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.lightGreen,
                                                    fontStyle:
                                                        FontStyle.italic)),
                                            TextSpan(
                                                text:
                                                    "${product.details.cadre}",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ))
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                              text: "+ Couleur\n",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.lightGreen,
                                                  fontStyle: FontStyle.italic)),
                                          TextSpan(
                                              text:
                                                  "${product.details.couleur}",
                                              style: TextStyle(
                                                fontSize: 18,
                                              ))
                                        ])),
                                      ),
                                    ]),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: "+ Fourche\n",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.lightGreen,
                                          fontStyle: FontStyle.italic,
                                        )),
                                    TextSpan(
                                        text: "${product.details.fourche}",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ))
                                  ])),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: "+ Poids\n",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.lightGreen,
                                              fontStyle: FontStyle.italic)),
                                      TextSpan(
                                          text: "${product.details.poids}",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ))
                                    ])),
                                  ),
                                ],
                              ),
                            ]),
                          ),
                        ],
                      )),
                  ButtonCounter(productAdd: product),
                ],
              ),
            )
          ],
        ));
  }
}

class ButtonCounter extends StatefulWidget {

  Product productAdd;
  ButtonCounter({Key key, this.productAdd}) : super(key: key);

  @override
  Counter createState() => Counter();
}

class Counter extends State<ButtonCounter> {
  double counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  void decrement() {
    setState(() {
      if (counter > 0) {
        counter--;
      }
    });
  }

  void addCart() {
    setState(() {
      if(counter > 0){
        if(list.contains(widget.productAdd)) {
          int ind = list.indexOf(widget.productAdd);
          list[ind].quantity += counter;
          showAlertDialog(context, counter);
        }
        else {
          widget.productAdd.quantity = counter;
          list.add(widget.productAdd);
          showAlertDialog(context, counter);
        } 
      }   
      else showAlertDialog2(context, counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        children: <Widget>[
          SizedBox(
              width: 35,
              height: 35,
              child: OutlineButton(
                padding: EdgeInsets.zero,
                onPressed: decrement,
                child: Icon(Icons.remove),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "$counter",
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
              width: 35,
              height: 35,
              child: OutlineButton(
                padding: EdgeInsets.zero,
                onPressed: increment,
                child: Icon(Icons.add),
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: FlatButton(
                  color: Colors.lightGreen,
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: addCart,
                  child: Text('Ajouter au panier'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ))),
            ),
          )
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context, double counter) {

  AlertDialog alert = AlertDialog(
    title: Text(
      "Infos",
      style: TextStyle(color: Colors.lightGreen)
    ),
    content: Text("Produit ajouté en " + "${counter}" + " exemplaires."),
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

showAlertDialog2(BuildContext context, double counter) {

  AlertDialog alert = AlertDialog(
    title: Text(
      "Erreur",
      style: TextStyle(color: Colors.lightGreen)
    ),
    content: Text("Vous ne pouvez pas ajouter " + "${counter}" + " produits."),
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

