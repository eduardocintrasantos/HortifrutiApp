import 'package:flutter/material.dart';
import 'package:hortifruti_app/src/models/item_model.dart';
import 'package:hortifruti_app/src/pages/common_widgets/quantity_widget.dart';
import 'package:hortifruti_app/src/services/utils_services.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({super.key, required this.item});

  final ItemModel item;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final UtilsServices utilsServices = UtilsServices();

  int cardItemQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),

      body: Stack(
        children: [

          //Conteudo
          Column(
            children: [
              Expanded(
                child: Hero(
                  tag: widget.item.imgUrl,
                  child: Image.asset(widget.item.imgUrl)
                )
              ),
          
              Expanded(child: 
                Container(
                  padding: EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                    boxShadow:[BoxShadow(color: Colors.grey.shade600, offset: Offset(0, 2))]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //Nome - Qtde
                      Row(
                        children: [
                          Expanded(
                            child: Text(widget.item.itemName, 
                            maxLines: 2,
                            style: 
                              TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          QuantityWidget(
                            value: cardItemQuantity,
                            suffixText: widget.item.unit,
                            result: (quantity) {
                              
                              setState(() {
                                cardItemQuantity = quantity;
                              });
                              
                            },
                          )
                        ],
                      ),
          
                      //Preço
                      Text(utilsServices.priceToCurrency(widget.item.price),
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.green
                        ),
                      ),
          
                      //Descrição
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SingleChildScrollView(
                            child: Text(widget.item.description, style: TextStyle(
                              height: 1.5
                            ),),
                          ),
                        ),
                      ),
          
                      //Botão
                      SizedBox(
                        height: 55,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                            )
                          ),
                          onPressed: (){}, 
                          label: Text('Add no carrinho', style: 
                            TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                            ),
                          ),
                          icon: Icon(
                            Icons.shopping_cart_checkout_outlined,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              )
            ],
          ),
        
        
          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
              child: IconButton(
                onPressed: (){
                  Navigator.of(context).pop();
                }, 
                icon: Icon(Icons.arrow_back_ios)
              )
            ),
          )
        ],
      ),
    );
  }
}