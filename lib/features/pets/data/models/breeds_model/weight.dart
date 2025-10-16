class Weight {
  String? imperial;
  String? metric;

  Weight({this.imperial, this.metric});

  factory Weight.fromJson(Map<String, dynamic> json) => Weight(
    imperial: json['imperial'] as String?,
    metric: json['metric'] as String?,
  );

  Map<String, dynamic> toJson() => {'imperial': imperial, 'metric': metric};
}
