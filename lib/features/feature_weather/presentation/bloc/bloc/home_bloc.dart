import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:feature_weather/core/resources/data_state.dart';
import 'package:feature_weather/features/feature_weather/data/models/forcast_days_model.dart';
import 'package:feature_weather/features/feature_weather/domain/entities/forcast_days_entity.dart';
import 'package:feature_weather/features/feature_weather/domain/use_cases/get_forcast_weather_usecase.dart';
import 'package:feature_weather/features/feature_weather/domain/use_cases/get_weather_usecase.dart';
import 'package:feature_weather/features/feature_weather/presentation/bloc/bloc/cw_status.dart';

import '../../../../../core/params/forecast_params.dart';
import 'fw_status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetWeatherUseCase getWeatherUseCase;
  final GetForecastWeatherUseCase getForecastWeatherUseCase;

  HomeBloc(
      {required this.getWeatherUseCase,
      required this.getForecastWeatherUseCase})
      : super(HomeState(cwStatus: CwLoading(), fwStatus: FwLoading())) {
    on<LoadCwEvent>((event, emit) async {
      emit(state.copyWith(newCwStatus: CwLoading()));
      DataState dataState = await getWeatherUseCase.call(event.cityName);
      if (dataState is DataSuccess) {
        emit(state.copyWith(newCwStatus: CwCompleted(dataState.data)));
      } else if (dataState is DataFailed) {
        emit(state.copyWith(newCwStatus: CwError(dataState.error!)));
      }
    });

    on<LoadFwEvent>((event, emit) async {
      emit(state.copyWith(newFwStatus: FwLoading()));
      DataState dataState =
          await getForecastWeatherUseCase.call(event.forecastParams);
      if (dataState is DataSuccess) {
        emit(state.copyWith(newFwStatus: FwCompleted(dataState.data)));
      } else if (dataState is DataFailed) {
        emit(state.copyWith(newFwStatus: FwError(dataState.error!)));
      }
    });
  }
}
