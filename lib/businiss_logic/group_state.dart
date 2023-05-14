part of 'group_cubit.dart';

@immutable
abstract class GroupState {}

class GroupInitial extends GroupState {

}
class GroupLoaded extends GroupState{
   List<Group_Detail> listDetails;


  GroupLoaded(this.listDetails);

}
class POSLoaded extends GroupState{
  List<Pos_Info>listPos;
  POSLoaded(this.listPos);
}
