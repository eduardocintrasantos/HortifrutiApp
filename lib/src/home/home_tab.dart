import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            style: TextStyle(fontSize: 30),
            children: [
              TextSpan(text: 'Green', style: TextStyle(color: Colors.green)),
              TextSpan(text: 'grocer', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 15),
            child: GestureDetector(
              onTap: () {},
              child: badges.Badge(
                badgeContent: Text(
                  '3',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                child: Icon(Icons.shopping_cart, color: Colors.green),
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
        ],
      ),

      //Categorias

      //Grid
    );
  }
}
