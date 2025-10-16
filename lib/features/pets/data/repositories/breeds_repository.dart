import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pet_finder/core/helpers/errors.dart';
import 'package:pet_finder/core/networking/api_constants.dart';
import 'package:pet_finder/core/networking/api_service.dart';
import 'package:pet_finder/features/pets/data/models/breeds_model/breeds_model.dart';

abstract class BreedsRepository {
  Future<Either<Failure, List<BreedsModel>>> getBreeds({int limit = 10});
}

class BreedsRepositoryImpl implements BreedsRepository {
  final ApiService _apiService;

  BreedsRepositoryImpl(this._apiService);

  @override
  Future<Either<Failure, List<BreedsModel>>> getBreeds({int limit = 10}) async {
    try {
      final response = await _apiService.get(
        endPoints: ApiConstants.breeds,
        queryParams: {'limit': limit},
      );

      if (response is List) {
        final breeds = response
            .map((json) => BreedsModel.fromJson(json as Map<String, dynamic>))
            .toList();
        return Right(breeds);
      }

      return Left(ServerFailure(errorMessage: 'Invalid response format'));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(
        ServerFailure(errorMessage: 'Unexpected error: ${e.toString()}'),
      );
    }
  }
}
