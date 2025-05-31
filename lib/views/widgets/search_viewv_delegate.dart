import 'package:flutter/material.dart';
import 'package:online_shop/model/products_model.dart';
import 'package:online_shop/views/widgets/products_widget.dart';

class SearchViewDelegete extends SearchDelegate<ProductsModel?> {
  final List<ProductsModel> products;

  SearchViewDelegete(this.products);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      TextButton(
        child: Text("clear"),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results =
        products
            .where((e) => e.title!.toLowerCase().contains(query.toLowerCase()))
            .toList();
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            itemCount: results.length,
            itemBuilder: (ctx, index) {
              final data = results[index];
              return ProductsWidget(product: data);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 0.8,
            ),
          ),
        ),
      ],
    );
  }
}
