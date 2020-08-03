part of 'home_bloc.dart';

class HomeState extends Equatable {

  final List<bool> bloqueoJuego;
  
  HomeState({this.bloqueoJuego});

  factory HomeState.initial()=>
          HomeState(bloqueoJuego: [false,false,true]);
  
  HomeState copyWith({List<bool> bloqueoJuego})=>
            HomeState(
            bloqueoJuego: bloqueoJuego ?? this.bloqueoJuego
            );


  @override
  List<Object> get props => [bloqueoJuego];

}
