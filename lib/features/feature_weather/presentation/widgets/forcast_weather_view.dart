import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/dot_loading_widget.dart';
import '../../data/models/forcast_days_model.dart';
import '../../domain/entities/forcast_days_entity.dart';
import '../bloc/bloc/fw_status.dart';
import '../bloc/bloc/home_bloc.dart';
import 'day_weather_view.dart';

class ForecastWeatherView extends StatelessWidget {
  const ForecastWeatherView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Center(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (BuildContext context, state) {

                print("1: ${state.cwStatus}");
                print("2: ${state.fwStatus}");
 
                /// show Loading State for Fw
                if (state.fwStatus is FwLoading) {
                  return const DotLoadingWidget();
                }

                /// show Completed State for Fw
                if (state.fwStatus is FwCompleted) {
                  /// casting
                  final FwCompleted fwCompleted = state.fwStatus as FwCompleted;
                  final ForecastDaysEntity forecastDaysEntity = fwCompleted.forecastDaysEntity;
                  final List<Daily> mainDaily = forecastDaysEntity.daily!;

                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (BuildContext context,
                        int index,) {
                      return DaysWeatherView(
                        daily: mainDaily[index],);
                    },);
                }

                /// show Error State for Fw
                if (state.fwStatus is FwError) {
                  final FwError fwError = state.fwStatus as FwError;
                  return Center(
                    child: Text(fwError.message, style: TextStyle(color: Colors.white),),
                  );
                }

                /// show Default State for Fw
                return Container();

              },
            ),
          ),
        ),
      ),
    );
  }
}

