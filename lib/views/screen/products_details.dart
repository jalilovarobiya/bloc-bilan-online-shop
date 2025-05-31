import 'package:flutter/material.dart';
import 'package:online_shop/model/products_model.dart';

class ProductsDetails extends StatelessWidget {
  final ProductsModel product;
  const ProductsDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            flexibleSpace: Image.network(product.image ?? ""),
            floating: true,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 15,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title ?? "",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Text(
                        "\$ ${product.price ?? 0.0}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),

                      Text("(${product.rating?.count ?? 0} people by this)"),
                    ],
                  ),
                  Text(
                    "Description of the product",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(product.description ?? ""),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {},
              child: Text("Add to cart"),
            ),
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {},
              child: Text("Buy now", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
