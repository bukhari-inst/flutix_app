part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnLoginPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMianPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnRegistrationPage extends PageState {
  final RegistrationData registrationData;

  OnRegistrationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class OnpreferencePage extends PageState {
  final RegistrationData registrationData;

  OnpreferencePage(this.registrationData);

  @override
  List<Object> get props => [];
}

class OnAccountConfirmationPage extends PageState {
  final RegistrationData registrationData;

  OnAccountConfirmationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class OnMovieDetailPage extends PageState {
  final Movie movie;

  OnMovieDetailPage(this.movie);

  @override
  List<Object> get props => [movie];
}

class OnSelectSchedulePage extends PageState {
  final MovieDetail movieDetail;

  OnSelectSchedulePage(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}

class OnSelectSeatPage extends PageState {
  final Ticket ticket;

  OnSelectSeatPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class OnCheckoutPage extends PageState {
  final Ticket ticket;

  OnCheckoutPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}
