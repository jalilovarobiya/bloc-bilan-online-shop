part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}

final class ProductsFetchEvent extends ProductsEvent {}
