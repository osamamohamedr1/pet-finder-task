import 'weight.dart';

extension BreedsModelX on BreedsModel {
  String get imageUrl {
    if (referenceImageId == null || referenceImageId!.isEmpty) {
      return '';
    }
    return 'https://cdn2.thecatapi.com/images/$referenceImageId.jpg';
  }
}

class BreedsModel {
  Weight? weight;
  String? id;
  String? name;
  String? cfaUrl;
  String? vetstreetUrl;
  String? vcahospitalsUrl;
  String? temperament;
  String? origin;
  String? countryCodes;
  String? countryCode;
  String? description;
  String? lifeSpan;
  int? indoor;
  int? lap;
  String? altNames;
  int? adaptability;
  int? affectionLevel;
  int? childFriendly;
  int? dogFriendly;
  int? energyLevel;
  int? grooming;
  int? healthIssues;
  int? intelligence;
  int? sheddingLevel;
  int? socialNeeds;
  int? strangerFriendly;
  int? vocalisation;
  int? experimental;
  int? hairless;
  int? natural;
  int? rare;
  int? rex;
  int? suppressedTail;
  int? shortLegs;
  String? wikipediaUrl;
  int? hypoallergenic;
  String? referenceImageId;

  BreedsModel({
    this.weight,
    this.id,
    this.name,
    this.cfaUrl,
    this.vetstreetUrl,
    this.vcahospitalsUrl,
    this.temperament,
    this.origin,
    this.countryCodes,
    this.countryCode,
    this.description,
    this.lifeSpan,
    this.indoor,
    this.lap,
    this.altNames,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.grooming,
    this.healthIssues,
    this.intelligence,
    this.sheddingLevel,
    this.socialNeeds,
    this.strangerFriendly,
    this.vocalisation,
    this.experimental,
    this.hairless,
    this.natural,
    this.rare,
    this.rex,
    this.suppressedTail,
    this.shortLegs,
    this.wikipediaUrl,
    this.hypoallergenic,
    this.referenceImageId,
  });

  factory BreedsModel.fromJson(Map<String, dynamic> json) => BreedsModel(
    weight: json['weight'] == null
        ? null
        : Weight.fromJson(json['weight'] as Map<String, dynamic>),
    id: json['id'] as String?,
    name: json['name'] as String?,
    cfaUrl: json['cfa_url'] as String?,
    vetstreetUrl: json['vetstreet_url'] as String?,
    vcahospitalsUrl: json['vcahospitals_url'] as String?,
    temperament: json['temperament'] as String?,
    origin: json['origin'] as String?,
    countryCodes: json['country_codes'] as String?,
    countryCode: json['country_code'] as String?,
    description: json['description'] as String?,
    lifeSpan: json['life_span'] as String?,
    indoor: json['indoor'] as int?,
    lap: json['lap'] as int?,
    altNames: json['alt_names'] as String?,
    adaptability: json['adaptability'] as int?,
    affectionLevel: json['affection_level'] as int?,
    childFriendly: json['child_friendly'] as int?,
    dogFriendly: json['dog_friendly'] as int?,
    energyLevel: json['energy_level'] as int?,
    grooming: json['grooming'] as int?,
    healthIssues: json['health_issues'] as int?,
    intelligence: json['intelligence'] as int?,
    sheddingLevel: json['shedding_level'] as int?,
    socialNeeds: json['social_needs'] as int?,
    strangerFriendly: json['stranger_friendly'] as int?,
    vocalisation: json['vocalisation'] as int?,
    experimental: json['experimental'] as int?,
    hairless: json['hairless'] as int?,
    natural: json['natural'] as int?,
    rare: json['rare'] as int?,
    rex: json['rex'] as int?,
    suppressedTail: json['suppressed_tail'] as int?,
    shortLegs: json['short_legs'] as int?,
    wikipediaUrl: json['wikipedia_url'] as String?,
    hypoallergenic: json['hypoallergenic'] as int?,
    referenceImageId: json['reference_image_id'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'weight': weight?.toJson(),
    'id': id,
    'name': name,
    'cfa_url': cfaUrl,
    'vetstreet_url': vetstreetUrl,
    'vcahospitals_url': vcahospitalsUrl,
    'temperament': temperament,
    'origin': origin,
    'country_codes': countryCodes,
    'country_code': countryCode,
    'description': description,
    'life_span': lifeSpan,
    'indoor': indoor,
    'lap': lap,
    'alt_names': altNames,
    'adaptability': adaptability,
    'affection_level': affectionLevel,
    'child_friendly': childFriendly,
    'dog_friendly': dogFriendly,
    'energy_level': energyLevel,
    'grooming': grooming,
    'health_issues': healthIssues,
    'intelligence': intelligence,
    'shedding_level': sheddingLevel,
    'social_needs': socialNeeds,
    'stranger_friendly': strangerFriendly,
    'vocalisation': vocalisation,
    'experimental': experimental,
    'hairless': hairless,
    'natural': natural,
    'rare': rare,
    'rex': rex,
    'suppressed_tail': suppressedTail,
    'short_legs': shortLegs,
    'wikipedia_url': wikipediaUrl,
    'hypoallergenic': hypoallergenic,
    'reference_image_id': referenceImageId,
  };
}
