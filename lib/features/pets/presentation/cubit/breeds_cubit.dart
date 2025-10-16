import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder/features/pets/data/repositories/breeds_repository.dart';
import 'package:pet_finder/features/pets/presentation/cubit/breeds_state.dart';

class BreedsCubit extends Cubit<BreedsState> {
  final BreedsRepository _breedsRepository;

  BreedsCubit(this._breedsRepository) : super(BreedsInitial());

  Future<void> fetchBreeds({int limit = 20}) async {
    emit(BreedsLoading());

    final result = await _breedsRepository.getBreeds(limit: limit);

    result.fold(
      (failure) => emit(BreedsError(failure.errorMessage)),
      (breeds) => emit(BreedsSuccess(breeds)),
    );
  }

  void retry({int limit = 20}) {
    fetchBreeds(limit: limit);
  }
}
