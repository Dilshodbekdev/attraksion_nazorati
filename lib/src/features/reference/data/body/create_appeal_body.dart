import 'dart:io';

/// region_id : 1
/// park_id : 1
/// attraction_id : 1
/// offense_types_ids : [1]
/// district_id : 1
/// description : "aerfg"
/// docs : []
/// images : []

class CreateAppealBody {
  CreateAppealBody({
    this.regionId,
    this.parkId,
    this.attractionId,
    this.offenseTypesIds,
    this.districtId,
    this.description,
    this.docs,
    this.images,
  });

  int? regionId;
  int? parkId;
  int? attractionId;
  List<String>? offenseTypesIds;
  int? districtId;
  String? description;
  List<File>? docs;
  List<File>? images;
}
