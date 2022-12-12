import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitialState()) {
    on<LoginValidateEvent>(_onLoginValidateEvent);
    on<LoginFromEmailAndPasswordEvent>(_onLoginFromEmailAndPasswordEvent);
  }

  void _onLoginValidateEvent(LoginValidateEvent event, Emitter<LoginState> emit) {
    emit(const AuthLoadingState());
    event.name.isEmpty ? nameMessage = '[NAME EMPTY]' : nameMessage = '[CHECK]';
    event.lastName.isEmpty ? lastNameMessage = '[LAST_NAME EMPTY]' : lastNameMessage = '[CHECK]';
    // event.image.isEmpty
    //     ? imageMessage = '[LAST_NAME EMPTY]'
    //     : imageMessage = '[CHECK]';
    focusLastName = event.focusLastName;
    focusName = event.focusName;

    emit(
            AuthValidateState(
              validated: nameMessage == '[CHECK]' && lastNameMessage == '[CHECK]' && imageMessage == '[CHECK]',
              nameMessage: nameMessage,
              lastNameMessage: lastNameMessage,
              isFocusName: event.focusName,
              isFocusLastName: focusLastName,
              isFocusImage: event.focusImage,
            ),
          );
  }
  void _onLoginFromEmailAndPasswordEvent(LoginFromEmailAndPasswordEvent event, Emitter<LoginState> emit) {
    emit(const AuthLoadingState());
    event.name.isEmpty ? nameMessage = '[NAME EMPTY]' : nameMessage = '[CHECK]';
    event.lastName.isEmpty ? lastNameMessage = '[LAST_NAME EMPTY]' : lastNameMessage = '[CHECK]';
    // event.image.isEmpty
    //     ? imageMessage = '[LAST_NAME EMPTY]'
    //     : imageMessage = '[CHECK]';
    focusLastName = event.focusLastName;
    focusName = event.focusName;

    nameMessage == '[CHECK]' && lastNameMessage == '[CHECK]'
        ? emit(AuthenticatedState(name: event.name, lastName: event.lastName))
        : emit(
            AuthValidateState(
              validated: nameMessage == '[CHECK]' && lastNameMessage == '[CHECK]' && imageMessage == '[CHECK]',
              nameMessage: nameMessage,
              lastNameMessage: lastNameMessage,
              isFocusName: event.focusName,
              isFocusLastName: focusLastName,
              isFocusImage: event.focusImage,
            ),
          );
  }

  String nameMessage = '';
  String lastNameMessage = '';
  String imageMessage = '';
  bool focusLastName = false;
  bool focusName = false;
}
