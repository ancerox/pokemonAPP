import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  String? name;
  int? height;
  int? weight;
  // String? description;
  late String image;

  Pokemon({required name, required height, required weight, required image});

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        height,
        image,
        // description,
        weight,
      ];
}
