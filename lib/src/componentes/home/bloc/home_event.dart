part of 'home_bloc.dart';


 class HomeEvent  extends Equatable {
  @override
  List<Object> get props => [];

 }

 class DesbloquearJuegoEvent extends HomeEvent{
   
   final int index;
   DesbloquearJuegoEvent({this.index});
   @override
   List<Object> get props => [];
 } 