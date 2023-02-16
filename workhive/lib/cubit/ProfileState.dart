

import 'package:workHive/data/models/Document.dart';

abstract class ProfileStates{}

class ProfileInitialState extends ProfileStates{}

class ProfileLoadingState extends ProfileStates{}

class ProfileSuccessState extends ProfileStates
{
  final Future<List<Document>> listDoc;
  ProfileSuccessState(this.listDoc);
}

class ProfileErrorState extends ProfileStates
{
  final String error;
  ProfileErrorState(this.error);
}