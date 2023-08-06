part of 'home_bloc.dart';

class HomeState extends Equatable{

  final CwStatus cwStatus;
  final FwStatus fwStatus;

  const HomeState({required this.fwStatus, required this.cwStatus});

  HomeState copyWith({CwStatus? newCwStatus, FwStatus? newFwStatus}){
    return HomeState(cwStatus: newCwStatus ?? cwStatus, fwStatus: newFwStatus ?? fwStatus);
  }
  
  @override
  List<Object?> get props => [cwStatus, fwStatus];

}