import 'package:equatable/equatable.dart';

import 'volume_info.dart';

class BookModel extends Equatable {
  final String? kind;
  final String? id;
  final VolumeInfo volumeInfo;

  const BookModel({
    this.kind,
    this.id,
    required this.volumeInfo,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        kind: json['kind'] as String?,
        id: json['id'] as String?,
        volumeInfo:
            VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'id': id,
        'volumeInfo': volumeInfo.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      kind,
      id,
      volumeInfo,
    ];
  }
}
