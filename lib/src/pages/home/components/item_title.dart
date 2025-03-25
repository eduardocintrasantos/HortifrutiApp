import 'package:flutter/material.dart';
import 'package:hortifruti_app/src/models/item_model.dart';
import 'package:hortifruti_app/src/services/utils_services.dart';

class ItemTitle extends StatelessWidget {

  final ItemModel item;

  ItemTitle({super.key, required this.item});

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 1,
          shadowColor: Colors.grey.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //Imagem
                Expanded(child: Image.asset(item.imgUrl)),
                //Nome
                Text(item.itemName, style: 
                  TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.bold
                  ),
                ),
                //Preço
                Row(
                  children: [
                    Text(utilsServices.priceToCurrency(item.price), style: 
                      TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.green
                      ),
                    ),
        
                    Text(' / ${item.unit}', style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                    ),)
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
        
          child: GestureDetector(
            onTap: (){},
            child: Container(
              height: 40,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  topRight:Radius.circular(10), 
                  bottomLeft: Radius.circular(10)
                )
              ),
              child: const Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          )
        )
      ],
    );
  }
}