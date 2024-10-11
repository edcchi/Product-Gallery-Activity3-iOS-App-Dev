import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_gallery/models/shoe.dart';

import '../components/shoe_tile.dart';
import '../models/cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  void addShoetoCart(Shoe shoe){
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
  
  //alert
  showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      title: Text('Item successfully added!'),
      content: Text('Check your cart'),
    ),
  );
  
  }



  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder:(context, value, child) => Column(
      children: [
        //search bar
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Search',style: TextStyle(color: Colors.grey),),
              Icon(
                Icons.search, 
                color: Colors.grey,),
            ],
          ),
        ),

        // message
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: 
          Text('Greatness is not born, it is made',
          style: TextStyle(color: Colors.grey[600]),
          ),
        ),

        //cards
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Top Picks 🔥',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              ),
              Text('See all',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        // list of shoes 
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){

          //create a shoe
          Shoe shoe = value.getShoeShop()[index];
           
            //return the shoe
          return ShoeTile(
            shoe: shoe,
            onTap: () => addShoetoCart(shoe),
          );
        },
      ),
    ),

    const Padding(
      padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
      child: Divider(
        color: Colors.white,
      ),
    )

      ],
    ),);
  }
}