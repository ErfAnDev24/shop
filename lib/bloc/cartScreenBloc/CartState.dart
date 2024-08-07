import 'package:digikala/models/SelectedCartItem.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';

class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartLoadingState extends CartState {}

class ResponseCartState extends CartState {
  Either<String, List<SelectedCartItem>> selectedCartItemList;
  int totalAmount;
  ResponseCartState(this.selectedCartItemList, this.totalAmount);

  @override
  List<Object?> get props => [selectedCartItemList, totalAmount];
}
