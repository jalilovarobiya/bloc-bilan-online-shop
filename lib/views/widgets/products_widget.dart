import 'package:flutter/material.dart';
import 'package:online_shop/model/products_model.dart';
import 'package:online_shop/views/screen/products_details.dart';

class ProductsWidget extends StatelessWidget {
  final ProductsModel product;
  const ProductsWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) {
              return ProductsDetails(product: product);
            },
          ),
        );
      },
      child: Container(
        width: 185,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(product.image ?? "", height: 100)),
            SizedBox(height: 8),
            Text(
              product.title ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(
              "${product.price ?? 0.0}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {},
              child: Text("Add to cart"),
            ),
          ],
        ),
      ),
    );
  }
}
