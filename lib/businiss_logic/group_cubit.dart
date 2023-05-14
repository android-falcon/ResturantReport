import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:report_resturant_flutter/data/models/group_detail.dart';
import 'package:report_resturant_flutter/data/models/pos_info.dart';
import 'package:report_resturant_flutter/data/respository/group_resporitory.dart';

part 'group_state.dart';

class GroupCubit extends Cubit<GroupState> {
  final GroupRespository groupRespository;
   List<Group_Detail> groupDetails=[];
  List<Pos_Info> posInfoList=[];
  GroupCubit(this.groupRespository) : super(GroupInitial());

  List<Group_Detail> getAllGroupDetails(){
    print("GroupCubit");

    groupRespository.getGroupReportReposotery().then((value) {

      emit(GroupLoaded(value));
      groupDetails = value;
      // print("GroupCubit_length"+groupDetails.length.toString());

    }
    );
    return groupDetails;
  }
  List<Pos_Info> getAllPOS(){
    print("GroupCubit");
    groupRespository.getPOSReposotery().then((value) {

      emit(POSLoaded(value));
      posInfoList = value;
     print("posInfoList_length"+groupDetails.length.toString());

    }
    );
    return posInfoList;
  }



}
