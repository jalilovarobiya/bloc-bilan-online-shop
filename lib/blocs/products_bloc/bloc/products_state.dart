part of 'products_bloc.dart';

@immutable
sealed class ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final List<ProductsModel> data;

  ProductsSuccess(this.data);
}

final class ProductsError extends ProductsState {
  final String error;

  ProductsError(this.error);
}
