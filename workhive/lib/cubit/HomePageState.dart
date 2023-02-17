import '../../../../data/models/Job.dart';

abstract class HomePageStates{}

class HomePageInitialState extends HomePageStates {
}
class HomePageState extends HomePageStates {}

class HomePageLoadingState extends HomePageStates{}

class HomePageSuccessState extends HomePageStates
{
  final List<Job> listJobs;
  HomePageSuccessState(this.listJobs);
}

class HomePageErrorState extends HomePageStates
{
  final String error;
  HomePageErrorState(this.error);
}

