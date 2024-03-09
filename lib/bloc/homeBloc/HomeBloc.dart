import 'package:digikala/bloc/homeBloc/HomeEvent.dart';
import 'package:digikala/bloc/homeBloc/HomeState.dart';
import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/repository/BannerRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final bannerRepository = locator.get<IBannerRepository>();
  HomeBloc() : super(LoadingBannerState()) {
    on<HomeRequestEvent>(
      (event, emit) async {
        var banners = await bannerRepository.getBanners();
        return emit(ResponseBannerState(banners));
      },
    );
  }
}
