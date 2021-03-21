import 'package:flutter/material.dart';
import 'package:myapp/views/CartView.dart';
import 'package:myapp/Cart.dart';

class CheckoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text("Born To Ride"),
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
                    if (list.length > 0)
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/check.png",
                  height: 300,
                  width: 300,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Commande Validée",
                style: TextStyle(fontSize: 24, color: Colors.lightGreen),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));
  }
}
