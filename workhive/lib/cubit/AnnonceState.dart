
import '../../../../data/models/Job.dart';
import '../../../../data/models/login_model.dart';

abstract class UserAnnoncesStates{}

class UserAnnoncesInitialState extends UserAnnoncesStates {
}
class UserAnnoncesState extends UserAnnoncesStates {}

class UserAnnoncesLoadingState extends UserAnnoncesStates{}

class UserAnnoncesSuccessState extends UserAnnoncesStates
{
  final Future<List<Job>> listhistorique;
  UserAnnoncesSuccessState(this.listhistorique);
}

class UserAnnoncesErrorState extends UserAnnoncesStates
{
  final String error;
  UserAnnoncesErrorState(this.error);
}

// class HomePageNonStoreState extends VendorNotificationStates
// {
//   final String error;
//   HomePageNonStoreState(this.error);
// }
