import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/blocs/products_bloc/bloc/products_bloc.dart';
import 'package:online_shop/model/products_model.dart';
import 'package:online_shop/views/screen/products_details.dart';
import 'package:online_shop/views/widgets/catergory_widget.dart';
import 'package:online_shop/views/widgets/products_widget.dart';
import 'package:online_shop/views/widgets/search_viewv_delegate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<ProductsBloc>().add(ProductsFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery address"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Badge(child: Icon(Icons.shopping_cart_outlined, size: 30)),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined, size: 30),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is ProductsSuccess) {
                  final productList = state.data;
                  return InkWell(
                    onTap: () async {
                      final result = await showSearch<ProductsModel?>(
                        context: context,
                        delegate: SearchViewDelegete(productList),
                      );
                      if (result != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductsDetails(product: result),
                          ),
                        );
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[200],
                      ),
                      child: Row(
                        spacing: 10,
                        children: [
                          Icon(Icons.search),
                          Text("Search...", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                  );
                }
                return SizedBox(height: 20);
              },
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 20,
                children: [
                  for (int i = 0; i < 3; i++)
                    Container(
                      height: 150,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.amber,
                      ),
                    ),
                ],
              ),
            ),
            Text("Category", style: TextStyle(fontSize: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CatergoryWidget(
                  icon: Icon(Icons.checkroom),
                  name: "Apparel",
                  color: const Color.fromARGB(255, 130, 182, 225),
                ),
                CatergoryWidget(
                  icon: Icon(Icons.school),
                  name: "School",
                  color: const Color.fromARGB(255, 132, 184, 227),
                ),
                CatergoryWidget(
                  icon: Icon(Icons.directions_run),
                  color: const Color.fromARGB(255, 223, 187, 132),
                  name: "Sports",
                ),
                CatergoryWidget(
                  icon: Icon(Icons.devices),
                  name: "Electronic",
                  color: const Color.fromARGB(255, 230, 135, 128),
                ),
                CatergoryWidget(
                  icon: Icon(Icons.menu),
                  name: "All",
                  color: const Color.fromARGB(255, 123, 230, 126),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recent product", style: TextStyle(fontSize: 20)),
                Text("Filters", style: TextStyle(fontSize: 20)),
              ],
            ),
            BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is ProductsError) {
                  return Center(child: Text(state.error));
                }
                if (state is ProductsSuccess) {
                  return Expanded(
                    child: GridView.builder(
                      itemCount: state.data.length,
                      itemBuilder: (ctx, index) {
                        final data = state.data[index];
                        return ProductsWidget(product: data);
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 0.8,
                      ),
                    ),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.home, size: 30)),
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite, size: 30)),
            IconButton(onPressed: () {}, icon: Icon(Icons.history, size: 30)),
            IconButton(onPressed: () {}, icon: Icon(Icons.person, size: 30)),
          ],
        ),
      ),
    );
  }
}
