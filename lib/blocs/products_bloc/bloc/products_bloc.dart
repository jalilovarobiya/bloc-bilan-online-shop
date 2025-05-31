import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_shop/model/products_model.dart';
import 'package:online_shop/repositories/product_repository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepositoryImpl impl;
  ProductsBloc(this.impl) : super(ProductsLoading()) {
    on<ProductsFetchEvent>((
      ProductsFetchEvent event,
      Emitter<ProductsState> emit,
    ) async {
      try {
        emit(ProductsLoading());
        final list = await impl.fetchProducts();
        emit(ProductsSuccess(list));
      } catch (e) {
        emit(ProductsError(e.toString()));
      }
    });
  }
}
