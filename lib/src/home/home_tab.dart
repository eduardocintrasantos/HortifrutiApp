import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:hortifruti_app/src/home/components/category_title.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List categories = [
    'Frutas',
    'Grãos',
    'Verduras',
    'Temperos',
    'Cereais'
  ];

  String selectedCategory = 'Frutas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        // Logo app
        title: Text.rich(
          TextSpan(
            style: TextStyle(fontSize: 30),
            children: [
              TextSpan(text: 'Green', style: TextStyle(color: Colors.green)),
              TextSpan(text: 'grocer', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        // Carrinho e quantidade
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 20),
            child: GestureDetector(
              onTap: () {},
              child: badges.Badge(
                badgeContent: Text(
                  '0',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ), 
                child: Icon(Icons.shopping_cart, 
                  color: Colors.green
                ),
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          //Campo Pesquisa
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                hintText: 'Pesquise aqui...',
                hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.red,
                  size: 21,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
          ),
        
      

          //Categorias
          Container(
            padding: EdgeInsets.only(left: 25),
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_,index){
                return CategoryTitle(
                  onPressed: () {
                    setState((){
                      selectedCategory = categories[index];
                    });
                  },
                  category: categories[index],
                  isSelected: categories[index] == selectedCategory,
                );
              },
              separatorBuilder: (_,index){
                return SizedBox(width: 10);
              },
              itemCount: categories.length,
            ),
          ),

          //Grid

        ],
      ),
    );
  }
}
