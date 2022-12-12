part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginFromEmailAndPasswordEvent extends LoginEvent {
  const LoginFromEmailAndPasswordEvent({
    required this.name,
    required this.lastName,
    this.focusName = false,
    this.focusImage = false,
    this.focusLastName = false,
  });
  final String name;
  final String lastName;
  final bool focusName;
  final bool focusImage;
  final bool focusLastName;
}

class LoginValidateEvent extends LoginEvent {
  const LoginValidateEvent({
    required this.name,
    required this.lastName,
    this.focusName = false,
    this.focusImage = false,
    this.focusLastName = false,
  });
  final String name;
  final String lastName;
  final bool focusName;
  final bool focusImage;
  final bool focusLastName;
}
class CleanErrorEvent extends LoginEvent {
  const CleanErrorEvent({
    required this.name,
    required this.lastName,
    this.focusName = false,
    this.focusLastName = false,
  });
  final String name;
  final String lastName;
  final bool focusName;
  final bool focusLastName;
}
