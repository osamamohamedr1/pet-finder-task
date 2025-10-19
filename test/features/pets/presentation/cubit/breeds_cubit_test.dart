import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pet_finder/core/helpers/errors.dart';
import 'package:pet_finder/features/pets/data/models/breeds_model/breeds_model.dart';
import 'package:pet_finder/features/pets/data/repositories/breeds_repository.dart';
import 'package:pet_finder/features/pets/presentation/cubit/breeds_cubit.dart';
import 'package:pet_finder/features/pets/presentation/cubit/breeds_state.dart';

// Generate mocks by running: flutter pub run build_runner build
@GenerateMocks([BreedsRepository])
import 'breeds_cubit_test.mocks.dart';

void main() {
  late BreedsCubit breedsCubit;
  late MockBreedsRepository mockRepository;

  setUp(() {
    mockRepository = MockBreedsRepository();
    breedsCubit = BreedsCubit(mockRepository);
  });

  tearDown(() {
    breedsCubit.close();
  });

  group('BreedsCubit Tests', () {
    final mockBreeds = [
      BreedsModel(
        id: 'abys',
        name: 'Abyssinian',
        temperament: 'Active, Energetic, Independent, Intelligent, Gentle',
        origin: 'Egypt',
        description: 'The Abyssinian is easy to care for.',
        lifeSpan: '14 - 15',
        referenceImageId: '0XYvRd7oD',
      ),
      BreedsModel(
        id: 'aege',
        name: 'Aegean',
        temperament: 'Affectionate, Social, Intelligent, Playful, Active',
        origin: 'Greece',
        description: 'Native to the Greek islands.',
        lifeSpan: '9 - 12',
        referenceImageId: 'ozEvzdVM-',
      ),
    ];

    test('initial state should be BreedsInitial', () {
      expect(breedsCubit.state, isA<BreedsInitial>());
    });

    blocTest<BreedsCubit, BreedsState>(
      'emits [BreedsLoading, BreedsSuccess] when fetchBreeds succeeds',
      build: () {
        when(
          mockRepository.getBreeds(limit: anyNamed('limit')),
        ).thenAnswer((_) async => Right(mockBreeds));
        return breedsCubit;
      },
      act: (cubit) => cubit.fetchBreeds(limit: 20),
      expect: () => [
        isA<BreedsLoading>(),
        isA<BreedsSuccess>()
            .having((state) => state.breeds.length, 'breeds length', 2)
            .having(
              (state) => state.breeds[0].name,
              'first breed name',
              'Abyssinian',
            )
            .having(
              (state) => state.breeds[1].name,
              'second breed name',
              'Aegean',
            ),
      ],
      verify: (_) {
        verify(mockRepository.getBreeds(limit: 20)).called(1);
      },
    );

    blocTest<BreedsCubit, BreedsState>(
      'emits [BreedsLoading, BreedsError] when fetchBreeds fails',
      build: () {
        when(mockRepository.getBreeds(limit: anyNamed('limit'))).thenAnswer(
          (_) async => Left(
            ServerFailure(
              errorMessage: 'Connection timed out.\nCheck your internet.',
            ),
          ),
        );
        return breedsCubit;
      },
      act: (cubit) => cubit.fetchBreeds(limit: 20),
      expect: () => [
        isA<BreedsLoading>(),
        isA<BreedsError>().having(
          (state) => state.message,
          'error message',
          'Connection timed out.\nCheck your internet.',
        ),
      ],
      verify: (_) {
        verify(mockRepository.getBreeds(limit: 20)).called(1);
      },
    );

    blocTest<BreedsCubit, BreedsState>(
      'retry calls fetchBreeds with correct parameters',
      build: () {
        when(
          mockRepository.getBreeds(limit: anyNamed('limit')),
        ).thenAnswer((_) async => Right(mockBreeds));
        return breedsCubit;
      },
      act: (cubit) => cubit.retry(limit: 15),
      expect: () => [
        isA<BreedsLoading>(),
        isA<BreedsSuccess>().having(
          (state) => state.breeds.length,
          'breeds length',
          2,
        ),
      ],
      verify: (_) {
        verify(mockRepository.getBreeds(limit: 15)).called(1);
      },
    );

    blocTest<BreedsCubit, BreedsState>(
      'emits empty list when repository returns empty list',
      build: () {
        when(
          mockRepository.getBreeds(limit: anyNamed('limit')),
        ).thenAnswer((_) async => const Right([]));
        return breedsCubit;
      },
      act: (cubit) => cubit.fetchBreeds(limit: 20),
      expect: () => [
        isA<BreedsLoading>(),
        isA<BreedsSuccess>()
            .having((state) => state.breeds.isEmpty, 'breeds is empty', true)
            .having((state) => state.breeds.length, 'breeds length', 0),
      ],
    );

    blocTest<BreedsCubit, BreedsState>(
      'emits error with correct message when network error occurs',
      build: () {
        when(mockRepository.getBreeds(limit: anyNamed('limit'))).thenAnswer(
          (_) async =>
              Left(ServerFailure(errorMessage: 'No internet connection.')),
        );
        return breedsCubit;
      },
      act: (cubit) => cubit.fetchBreeds(limit: 10),
      expect: () => [
        isA<BreedsLoading>(),
        isA<BreedsError>().having(
          (state) => state.message,
          'error message',
          'No internet connection.',
        ),
      ],
    );

    blocTest<BreedsCubit, BreedsState>(
      'uses default limit of 20 when not specified in fetchBreeds',
      build: () {
        when(
          mockRepository.getBreeds(limit: anyNamed('limit')),
        ).thenAnswer((_) async => Right(mockBreeds));
        return breedsCubit;
      },
      act: (cubit) => cubit.fetchBreeds(), // No limit specified
      expect: () => [isA<BreedsLoading>(), isA<BreedsSuccess>()],
      verify: (_) {
        verify(mockRepository.getBreeds(limit: 20)).called(1);
      },
    );

    blocTest<BreedsCubit, BreedsState>(
      'multiple consecutive fetchBreeds calls work correctly',
      build: () {
        when(
          mockRepository.getBreeds(limit: anyNamed('limit')),
        ).thenAnswer((_) async => Right(mockBreeds));
        return breedsCubit;
      },
      act: (cubit) async {
        await cubit.fetchBreeds(limit: 10);
        await cubit.fetchBreeds(limit: 20);
      },
      expect: () => [
        // First call
        isA<BreedsLoading>(),
        isA<BreedsSuccess>(),
        // Second call
        isA<BreedsLoading>(),
        isA<BreedsSuccess>(),
      ],
      verify: (_) {
        verify(mockRepository.getBreeds(limit: 10)).called(1);
        verify(mockRepository.getBreeds(limit: 20)).called(1);
      },
    );
  });
}
