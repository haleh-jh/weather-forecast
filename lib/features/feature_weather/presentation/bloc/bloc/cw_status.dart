import 'package:equatable/equatable.dart';
import 'package:feature_weather/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CwStatus extends Equatable{
}

class CwLoading extends CwStatus{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class CwCompleted  extends CwStatus{
  final CurrentCityEntity currentCityEntity;
  CwCompleted (this.currentCityEntity);
  
  @override
  // TODO: implement props
  List<Object?> get props => [currentCityEntity];

}

class CwError extends CwStatus{
  final String error;
  CwError(this.error);
  
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}