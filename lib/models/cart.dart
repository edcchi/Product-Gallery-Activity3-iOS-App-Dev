import 'package:flutter/material.dart';
import 'package:shoe_gallery/models/shoe.dart';

class Cart extends ChangeNotifier{

  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Nike Dunk Low',
      price: '6,895',
      description: 'Our icon, your way',
      imagePath: 'lib/images/Dunk.png',
      ),

      Shoe(
      name: 'Nike Dunk Low Pink',
      price: '7,395',
      description: 'Pretty in Pink',
      imagePath: 'lib/images/Pink.png',
      ),

      Shoe(
      name: 'Nike Dunk Low Red',
      price: '3,699',
      description: 'Vintage Style',
      imagePath: 'lib/images/Red.png',
      ),

      Shoe(
      name: 'G.T. Shoes',
      price: '6,895',
      description: 'Lace up in the G.T Cut Academy',
      imagePath: 'lib/images/GT.png',
      ),
  ];

  // list of items in user cart
  List<Shoe> userCart = [];

  // get list of items for sale
  List<Shoe> getShoeShop(){
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart(){
    return userCart;
  }

  // adding item
  void addItemToCart(Shoe shoe){
    userCart.add(shoe);
    notifyListeners();
  }

  // removing item
  void removeItemFromCart(Shoe shoe){
    userCart.remove(shoe);
    notifyListeners();
  }

}