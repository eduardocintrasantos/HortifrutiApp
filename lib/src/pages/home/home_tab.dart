import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:hortifruti_app/src/config/app_data.dart' as appData;
import 'package:hortifruti_app/src/pages/home/components/category_title.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

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
                      selectedCategory = appData.categories[index];
                    });
                  },
                  category: appData.categories[index],
                  isSelected: appData.categories[index] == selectedCategory,
                );
              },
              separatorBuilder: (_,index){
                return SizedBox(width: 10);
              },
              itemCount: appData.categories.length,
            ),
          ),

          //Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 9 / 11.5,
              ), 
              itemCount: appData.items.length,
              itemBuilder: (_,index) {
                return Container(
                  color: Colors.red,
                );
              }
            ),
          )
        ],
      ),
    );
  }
}
