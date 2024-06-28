import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MasterEntity extends Equatable {
  final DocumentReference? ref;
  final int? masterId;
  final String? value;
  final String? description;
  final String? image;
  final bool? status;
  final int? slaTime;

  const MasterEntity({
    this.ref,
    this.masterId,
    this.value,
    this.description,
    this.image,
    this.status,
    this.slaTime,
  });

  @override
  List<Object?> get props => [masterId];
}
