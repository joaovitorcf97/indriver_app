import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_app/app/domain/useCases/auth/auth_usecases.dart';
import 'package:indriver_app/app/presentation/pages/client/home/bloc/client_home_event.dart';
import 'package:indriver_app/app/presentation/pages/client/home/bloc/client_home_state.dart';

class ClientHomeBloc extends Bloc<ClientHomeEvent, ClientHomeState> {
  AuthUsecases authUsecases;

  ClientHomeBloc(this.authUsecases) : super(const ClientHomeState()) {
    on<ChangeDrawerPage>(_changePage);
    on<LogoutEvent>(_onLogout);
  }

  void _changePage(ChangeDrawerPage event, Emitter<ClientHomeState> emit) {
    emit(state.copyWith(pageIndex: event.pageIndex));
  }

  Future<void> _onLogout(
      LogoutEvent event, Emitter<ClientHomeState> emit) async {
    await authUsecases.logout.run();
  }
}
