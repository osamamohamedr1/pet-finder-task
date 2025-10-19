import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pet_finder/core/helpers/errors.dart';
import 'package:pet_finder/core/networking/api_service.dart';
import 'package:pet_finder/features/pets/data/repositories/breeds_repository.dart';

// Generate mocks by running: flutter pub run build_runner build
@GenerateMocks([ApiService])
import 'breeds_repository_test.mocks.dart';

void main() {
  late BreedsRepositoryImpl repository;
  late MockApiService mockApiService;

  setUp(() {
    // Initialize mocks before each test
    mockApiService = MockApiService();
    repository = BreedsRepositoryImpl(mockApiService);
  });

  group('BreedsRepository Tests', () {
    // Test data - sample breed response
    final mockBreedsJson = [
      {
        'id': 'abys',
        'name': 'Abyssinian',
        'temperament': 'Active, Energetic, Independent, Intelligent, Gentle',
        'origin': 'Egypt',
        'description':
            'The Abyssinian is easy to care for, and a joy to have in your home.',
        'life_span': '14 - 15',
        'reference_image_id': '0XYvRd7oD',
      },
      {
        'id': 'aege',
        'name': 'Aegean',
        'temperament': 'Affectionate, Social, Intelligent, Playful, Active',
        'origin': 'Greece',
        'description': 'Native to the Greek islands known as the Cyclades.',
        'life_span': '9 - 12',
        'reference_image_id': 'ozEvzdVM-',
      },
    ];

    test('should return list of breeds when API call is successful', () async {
      // Arrange - Setup mock behavior
      when(
        mockApiService.get(
          endPoints: anyNamed('endPoints'),
          queryParams: anyNamed('queryParams'),
        ),
      ).thenAnswer((_) async => mockBreedsJson);

      // Act - Call the method
      final result = await repository.getBreeds(limit: 20);

      // Assert - Verify the results
      expect(result.isRight(), true);
      result.fold((failure) => fail('Should return success'), (breeds) {
        expect(breeds.length, 2);
        expect(breeds[0].id, 'abys');
        expect(breeds[0].name, 'Abyssinian');
        expect(breeds[1].id, 'aege');
        expect(breeds[1].name, 'Aegean');
      });

      // Verify API was called with correct parameters
      verify(
        mockApiService.get(
          endPoints: anyNamed('endPoints'),
          queryParams: {'limit': 20},
        ),
      ).called(1);
    });

    test('should return empty list when API returns empty array', () async {
      // Arrange
      when(
        mockApiService.get(
          endPoints: anyNamed('endPoints'),
          queryParams: anyNamed('queryParams'),
        ),
      ).thenAnswer((_) async => []);

      // Act
      final result = await repository.getBreeds(limit: 10);

      // Assert
      expect(result.isRight(), true);
      result.fold((failure) => fail('Should return success'), (breeds) {
        expect(breeds.isEmpty, true);
        expect(breeds.length, 0);
      });
    });

    test(
      'should return ServerFailure when API call fails with DioException',
      () async {
        // Arrange - Simulate connection timeout error
        when(
          mockApiService.get(
            endPoints: anyNamed('endPoints'),
            queryParams: anyNamed('queryParams'),
          ),
        ).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: ''),
            type: DioExceptionType.connectionTimeout,
            message: 'Connection timeout',
          ),
        );

        // Act
        final result = await repository.getBreeds(limit: 10);

        // Assert
        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<ServerFailure>());
          expect(failure.errorMessage, contains('Connection timed out'));
        }, (breeds) => fail('Should return failure'));
      },
    );

    test(
      'should return ServerFailure when API returns connection error',
      () async {
        // Arrange
        when(
          mockApiService.get(
            endPoints: anyNamed('endPoints'),
            queryParams: anyNamed('queryParams'),
          ),
        ).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: ''),
            type: DioExceptionType.connectionError,
            message: 'No internet connection',
          ),
        );

        // Act
        final result = await repository.getBreeds(limit: 10);

        // Assert
        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<ServerFailure>());
          expect(failure.errorMessage, 'No internet connection.');
        }, (breeds) => fail('Should return failure'));
      },
    );

    test(
      'should return ServerFailure when response format is invalid',
      () async {
        // Arrange - Return invalid data format (object instead of array)
        when(
          mockApiService.get(
            endPoints: anyNamed('endPoints'),
            queryParams: anyNamed('queryParams'),
          ),
        ).thenAnswer((_) async => {'invalid': 'format'});

        // Act
        final result = await repository.getBreeds(limit: 10);

        // Assert
        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<ServerFailure>());
          expect(failure.errorMessage, 'Invalid response format');
        }, (breeds) => fail('Should return failure'));
      },
    );

    test('should return ServerFailure on unexpected exception', () async {
      // Arrange
      when(
        mockApiService.get(
          endPoints: anyNamed('endPoints'),
          queryParams: anyNamed('queryParams'),
        ),
      ).thenThrow(Exception('Unexpected error'));

      // Act
      final result = await repository.getBreeds(limit: 10);

      // Assert
      expect(result.isLeft(), true);
      result.fold((failure) {
        expect(failure, isA<ServerFailure>());
        expect(failure.errorMessage, contains('Unexpected error'));
      }, (breeds) => fail('Should return failure'));
    });

    test('should use default limit of 10 when not specified', () async {
      // Arrange
      when(
        mockApiService.get(
          endPoints: anyNamed('endPoints'),
          queryParams: anyNamed('queryParams'),
        ),
      ).thenAnswer((_) async => []);

      // Act
      await repository.getBreeds(); // No limit specified

      // Assert
      verify(
        mockApiService.get(
          endPoints: anyNamed('endPoints'),
          queryParams: {'limit': 10}, // Should use default limit
        ),
      ).called(1);
    });
  });
}
