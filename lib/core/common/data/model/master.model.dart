import 'package:ticket_raising_management/core/common/domain/entity/master.entity.dart';

class MasterModel extends MasterEntity {
  const MasterModel({
    super.ref,
    super.masterId,
    super.value,
    super.description,
    super.image,
    super.status,
    super.slaTime,
  });

  factory MasterModel.fromJson(data) {
    Map<String, dynamic> json = data.data() as Map<String, dynamic>;

    return MasterModel(
      ref: data.reference,
      masterId: data['id'],
      value: json['value'],
      description: json['description'],
      image: json['image'],
      status: json['status'],
      slaTime: json['slaTime'],
    );
  }

  Map<String, dynamic> toParentJson() {
    Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = masterId;
    data['value'] = value;
    data['description'] = description;
    data['image'] = image;
    data['status'] = status;
    data['slaTime'] = slaTime;

    return data;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = masterId;
    data['value'] = value;
    data['status'] = status;
    data['slaTime'] = slaTime;

    return data;
  }
}
