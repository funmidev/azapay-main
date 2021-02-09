import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/resources/resources.dart';
import 'package:isolate_bloc/isolate_bloc.dart';

void isolateInitialization() {
  // IsolateBloc.observer = SimpleBlocObserver();

  register(create: () => ActivityIsolateBloc(repository: Repository()));
}
