
abstract class ProfileStates{}

class ProfileInitialState extends ProfileStates{}

class ProfileLoadingState extends ProfileStates{}

class ProfileSuccessState extends ProfileStates
{
  final String message;
  ProfileSuccessState(this.message);
}


class ProfileErrorState extends ProfileStates
{
  final String error;
  ProfileErrorState(this.error);
}
