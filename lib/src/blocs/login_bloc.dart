import 'dart:async';

import 'package:flutter_firebase_with_bloc/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final _repository = Repository();

  //TODO 1: create stream controller
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _isSignedIn = BehaviorSubject<bool>();

  //TODO 2: getting stream
  Stream<String> get email => _email.stream;
  Stream<String> get password => _password.stream;
  Stream<bool> get isSignedIn => _isSignedIn.stream;

  //TODO 3: change data add via sink to stream - tap of the pipe
  StreamSink<String> get changeEmail {
    print('########### Email');
    return _email.sink;
  }

  StreamSink<String> get changePassword => _password.sink;
  StreamSink<bool> get showProgressBar => _isSignedIn.sink;

  //TODO 4: core method implementation
  Future<int> submit() {
    return _repository.authenticateUsers(_email.value, _password.value);
  }

  Future<void> registerUser() =>
      _repository.registerUser(_email.value, _password.value);

  //TODO 5: dispose
  void dispose() async {
    await _email.drain();
    _email.close();
    await _password.drain();
    _password.close();
    await _isSignedIn.drain();
    _isSignedIn.close();
  }
}
