import 'package:equatable/equatable.dart';
import 'package:feature_weather/features/feature_weather/domain/entities/forcast_days_entity.dart';

abstract class FwStatus extends Equatable{

}

class FwLoading extends FwStatus{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class FwCompleted extends FwStatus{
 final ForecastDaysEntity forecastDaysEntity;

  FwCompleted(this.forecastDaysEntity);
  
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FwError extends FwStatus{
  final String message;

  FwError(this.message);
  
  @override
  // TODO: implement props
  List<Object?> get props => [];
}