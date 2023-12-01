import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable //not going to change the properties of the classes
abstract class UserEvent extends Equatable {}

class LoadUserEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}
