import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? iD;
  final String? userName;
  final String? code;
  final String? emailId;
  final String? password;
  final int? branchId;
  final int? channel;
  final int? organizationId;
  final String? dOB;
  final String? phoneCode;
  final String? mobileNumber;
  final String? altMobileNumber;
  final bool? isActive;
  final bool? isDeleted;
  final int? isAdmin;
  final int? agentId;
  final String? tTAgentId;
  final String? tTEAgentId;
  final int? isAgent;
  final int? hospitalUserId;
  final int? departmentCount;
  final int? roleCount;
  final String? organizationName;
  final String? departmentNames;
  final String? roleNames;

  const UserEntity({
    this.iD,
    this.userName,
    this.code,
    this.emailId,
    this.password,
    this.branchId,
    this.channel,
    this.organizationId,
    this.dOB,
    this.phoneCode,
    this.mobileNumber,
    this.altMobileNumber,
    this.isActive,
    this.isDeleted,
    this.isAdmin,
    this.agentId,
    this.tTAgentId,
    this.tTEAgentId,
    this.isAgent,
    this.hospitalUserId,
    this.departmentCount,
    this.roleCount,
    this.organizationName,
    this.departmentNames,
    this.roleNames,
  });

  @override
  List<Object?> get props => [iD, code];
}
