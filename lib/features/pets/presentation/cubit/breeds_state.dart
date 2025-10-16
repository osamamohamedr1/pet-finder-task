import 'package:pet_finder/features/pets/data/models/breeds_model/breeds_model.dart';

abstract class BreedsState {}

class BreedsInitial extends BreedsState {}

class BreedsLoading extends BreedsState {}

class BreedsSuccess extends BreedsState {
  final List<BreedsModel> breeds;

  BreedsSuccess(this.breeds);
}

class BreedsError extends BreedsState {
  final String message;

  BreedsError(this.message);
}
