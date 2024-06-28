import 'package:ticket_raising_management/core/common/domain/entity/user.entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.iD,
    super.userName,
    super.code,
    super.emailId,
    super.password,
    super.branchId,
    super.organizationId,
    super.dOB,
    super.phoneCode,
    super.mobileNumber,
    super.altMobileNumber,
    super.isActive,
    super.isDeleted,
    super.isAdmin,
    super.agentId,
    super.tTAgentId,
    super.tTEAgentId,
    super.isAgent,
    super.hospitalUserId,
    super.departmentCount,
    super.roleCount,
    super.organizationName,
    super.departmentNames,
    super.roleNames,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      iD: json['ID'],
      userName: json['UserName'],
      code: json['Code'],
      emailId: json['EmailId'],
      password: json['Password'],
      branchId: json['BranchId'],
      organizationId: json['OrganizationId'],
      dOB: json['DOB'],
      phoneCode: json['PhoneCode'],
      mobileNumber: json['MobileNumber'],
      altMobileNumber: json['AltMobileNumber'],
      isActive: json['IsActive'],
      isDeleted: json['IsDeleted'],
      isAdmin: json['IsAdmin'],
      agentId: json['AgentId'],
      tTAgentId: json['TTAgentId'],
      tTEAgentId: json['TTEAgentId'],
      isAgent: json['IsAgent'],
      hospitalUserId: json['HospitalUserId'],
      departmentCount: json['DepartmentCount'],
      roleCount: json['RoleCount'],
      organizationName: json['OrganizationName'],
      departmentNames: json['DepartmentNames'],
      roleNames: json['RoleNames'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['ID'] = iD;
    data['UserName'] = userName;
    data['Code'] = code;
    data['EmailId'] = emailId;
    data['Password'] = password;
    data['BranchId'] = branchId;
    data['OrganizationId'] = organizationId;
    data['DOB'] = dOB;
    data['PhoneCode'] = phoneCode;
    data['MobileNumber'] = mobileNumber;
    data['AltMobileNumber'] = altMobileNumber;
    data['IsActive'] = isActive;
    data['IsDeleted'] = isDeleted;
    data['IsAdmin'] = isAdmin;
    data['AgentId'] = agentId;
    data['TTAgentId'] = tTAgentId;
    data['TTEAgentId'] = tTEAgentId;
    data['IsAgent'] = isAgent;
    data['HospitalUserId'] = hospitalUserId;
    data['DepartmentCount'] = departmentCount;
    data['RoleCount'] = roleCount;
    data['OrganizationName'] = organizationName;
    data['DepartmentNames'] = departmentNames;
    data['RoleNames'] = roleNames;

    return data;
  }
}
