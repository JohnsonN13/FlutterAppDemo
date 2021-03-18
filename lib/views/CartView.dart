import 'package:flutter/material.dart';
import 'package:myapp/Cart.dart';
import 'package:myapp/Product.dart';
import 'package:myapp/views/CheckoutView.dart';

class CartView extends StatefulWidget {

  @override
  CartBody createState() => CartBody();
}

class CartBody extends State<CartView> {

  double sum = 0;

  String sumCart() {
    setState(() {
      for(Product p in list) {
        sum+= p.quantity * p.price;
      }
    });
    return sum.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.lightGreen,
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Born To ride",
          ),
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
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Text(
              "Votre panier",
              style: TextStyle(fontSize: 20),
            ),
          )
        ),
        if(list.length > 0) 
        Expanded(
          child: ListView.separated(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Card(
                  child: ListTile(
                    leading: Image.asset(list[index].image,
                        width: 75, fit: BoxFit.fitWidth, height: 100),
                    title: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(list[index].title,
                          style: TextStyle(fontSize: 18)),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: Row(
                        children: [
                          Text("Prix : ", style: TextStyle(fontSize: 16)),
                          Text(list[index].price.toString() + "\$",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.lightGreen)),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Text("Couleur : ",
                                    style: TextStyle(fontSize: 16)),
                                Text(list[index].details.couleur),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    trailing: Column(
                      children: [
                        Text("Qte : ", style: TextStyle(fontSize: 16)),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                              list[index].quantity.toString(),
                              style: TextStyle(
                                  fontSize: 16, color: Colors.lightGreen)),
                        )
                      ],
                    ),
                    isThreeLine: true,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ))
        else Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Votre panier est vide.", style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
        ),
      ]),
      bottomNavigationBar: Container(
          color: Colors.green,
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text("Prix : ", style: TextStyle(fontSize: 20)),
                    Text(sumCart()+"\$", style: TextStyle(fontSize: 20, color: Colors.white))
                  ],
                ),
              )),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 10, bottom: 10, right: 20),
                  child: FlatButton(
                      color: Colors.white,
                      height: 50,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CheckoutView()),
                        );
                      },
                      child: Text('Valider'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ))),
                ),
              )
            ],
          )),
    );
  }
}
