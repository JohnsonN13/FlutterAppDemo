
import 'Details.dart';

class Product {

final String image, title, description;
final int key;
double quantity;
final double price;
final Details details;

  Product({
    this.key,
    this.quantity,
    this.title,
    this.image,
    this.description,
    this.details,
    this.price,
  });
}

List<Product> data = [
  Product(
    key: 0,
    quantity: 0,
    title: "Cube Elite C:85X",
    image: "assets/images/cube.png",
    description:
      "Muni d'un cadre léger et de freins hydrauliques. Il associe efficacité et confort pour un arfait contrôle de vos mouvements.",    
    details: Details(cadre: "Monocoque fibre de carbone", couleur: "Carbone et bleu", fourche: "110mm", derailleur: "12 vitesses", poids: "9kg"),
    price: 3500
  ),
  Product(
    key: 1,
    quantity: 0,
    title: "Rockrider ST 520",
    image: "assets/images/rockrider.png",
    description: "Pour pouvoir prendre plus de risques et toujours progresser, vous aurez besoin de contrôle. Conçu et approuvé le VTT ST 520 est celui qu'il vous faut.",
    details: Details(cadre: "Mixte aluminium", couleur: "Blanc, vert et noir", fourche: "80mm", derailleur: "24 vitesses", poids: "15.35kg"),
    price: 300
  ),
  Product(
    key: 2,
    quantity: 0,
    title: "Rocky Mountain Sherpa",
    image:"assets/images/rockymoutain.png",
    description: "Le Sherpa permet de s'attaquer à des terrains plus difficiles. Pour une route ambitieuse de l’arrière-pays qui ne vous avait encore jamais traversé l’esprit en termes de possibilités.",
    details: Details(cadre: "Monocoque en fibre de carbone", couleur: "Noir et ocre", fourche: "120mm", derailleur: "10 vitesses", poids: "13.8kg"),
    price: 4990
  ),
  Product(
    key: 3,
    quantity: 0,
    title: "Rocky Moutain Thunderbolt",
    image: "assets/images/rockymoutain2.png",
    description: "Rapide et maniable, le Thunderbolt, c’est le coup de foudre assuré. Que vous aimiez gravir les montées techniques ou vous amuser avec tous les obstacles du sentier, ce vélo sera à la hauteur de votre créativité avec ses roues de 27,5 po et son débattement arrière de 140 mm.",
    details: Details(cadre: "Monocoque en alliage FORM", couleur: "Noir et rouge", fourche: "150mm", derailleur: "11 vitesses", poids: "15.1kg"),
    price: 6490
  ),
];

