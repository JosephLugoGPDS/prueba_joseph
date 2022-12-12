part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object?> get props => [];
}

class LoginInitialState extends LoginState {
  const LoginInitialState();
}

class AuthValidateState extends LoginState { 
  const AuthValidateState({required this.validated, required this.nameMessage, required this.lastNameMessage, required this.isFocusName, required this.isFocusLastName, required this.isFocusImage});
  final bool validated;
  final String nameMessage;
  final String lastNameMessage;
  final bool isFocusName;
  final bool isFocusLastName;
  final bool isFocusImage;

  @override
  List<Object?> get props => [validated, nameMessage, lastNameMessage, isFocusName, isFocusLastName, isFocusImage];

}

class AuthLoadingState extends LoginState {
  const AuthLoadingState();
}

class AuthenticatedState extends LoginState {
  const AuthenticatedState({required this.name, required this.lastName});
  final String name;
  final String lastName;
}
