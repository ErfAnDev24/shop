import 'package:digikala/bloc/homeBloc/HomeEvent.dart';
import 'package:digikala/bloc/homeBloc/HomeState.dart';
import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/repository/BannerRepository.dart';
import 'package:digikala/repository/CategoryRepository.dart';
import 'package:digikala/repository/ProductRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final bannerRepository = locator.get<IBannerRepository>();
  final categoryRepository = locator.get<ICategoryRepository>();
  final productRepository = locator.get<IProductRepository>();
  HomeBloc() : super(InitState()) {
    on<HomeRequestEvent>(
      (event, emit) async {
        emit(LoadingHomeState());
        var banners = await bannerRepository.getBanners();
        var categoryList = await categoryRepository.getCategoryList();
        var productList = await productRepository.productList();
        var bestSellerList = await productRepository.bestSellerList();
        var mostViewedList = await productRepository.mostViewedList();

        emit(
          HomeResponseState(categoryList, banners, productList, mostViewedList,
              bestSellerList),
        );
      },
    );
  }
}
