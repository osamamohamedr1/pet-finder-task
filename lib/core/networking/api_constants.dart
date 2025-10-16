/// API Constants for The Cat API
class ApiConstants {
  ApiConstants._();

  // Base URL
  static const String baseUrl = 'https://api.thecatapi.com/v1';

  // API Key
  static const String apiKey = 'ylX4blBYT9FaoVd6OhvR';

  // Endpoints
  static const String breeds = '/breeds';
  static const String imagesSearch = '/images/search';
  static const String images = '/images';
  static const String favourites = '/favourites';

  // Query Parameters
  static const String limitParam = 'limit';
  static const String pageParam = 'page';
  static const String orderParam = 'order';
  static const String hasBreedsParam = 'has_breeds';
  static const String breedIdsParam = 'breed_ids';
  static const String sizeParam = 'size';
  static const String subIdParam = 'sub_id';

  // Order Values
  static const String orderRandom = 'RANDOM';
  static const String orderAsc = 'ASC';
  static const String orderDesc = 'DESC';

  // Size Values
  static const String sizeThumb = 'thumb';
  static const String sizeSmall = 'small';
  static const String sizeMed = 'med';
  static const String sizeFull = 'full';

  // Default Values
  static const int defaultLimit = 20;
  static const int defaultPage = 0;
  static const String defaultOrder = orderRandom;

  // Headers
  static const String apiKeyHeader = 'x-api-key';
  static const String contentTypeHeader = 'Content-Type';
  static const String contentTypeJson = 'application/json';

  // Sub ID (User Identifier) - You can generate this or use device ID
  static const String defaultSubId = 'pet-finder-user-001';
}
