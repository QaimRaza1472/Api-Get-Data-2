// To parse this JSON data, do
//
//     final cocktailModel = cocktailModelFromJson(jsonString);

import 'dart:convert';

CocktailModel cocktailModelFromJson(String str) => CocktailModel.fromJson(json.decode(str));

String cocktailModelToJson(CocktailModel data) => json.encode(data.toJson());

class CocktailModel {
  CocktailModel({
    this.created,
    this.d1,
    this.d2,
    this.dir,
    this.files,
    this.filesCount,
    this.itemLastUpdated,
    this.itemSize,
    this.metadata,
    this.reviews,
    this.server,
    this.uniq,
    this.workableServers,
  });

  int created;
  String d1;
  String d2;
  String dir;
  List<FileElement> files;
  int filesCount;
  int itemLastUpdated;
  int itemSize;
  Metadata metadata;
  List<Review> reviews;
  String server;
  int uniq;
  List<String> workableServers;

  factory CocktailModel.fromJson(Map<String, dynamic> json) => CocktailModel(
    created: json["created"],
    d1: json["d1"],
    d2: json["d2"],
    dir: json["dir"],
    files: List<FileElement>.from(json["files"].map((x) => FileElement.fromJson(x))),
    filesCount: json["files_count"],
    itemLastUpdated: json["item_last_updated"],
    itemSize: json["item_size"],
    metadata: Metadata.fromJson(json["metadata"]),
    reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
    server: json["server"],
    uniq: json["uniq"],
    workableServers: List<String>.from(json["workable_servers"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "created": created,
    "d1": d1,
    "d2": d2,
    "dir": dir,
    "files": List<dynamic>.from(files.map((x) => x.toJson())),
    "files_count": filesCount,
    "item_last_updated": itemLastUpdated,
    "item_size": itemSize,
    "metadata": metadata.toJson(),
    "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
    "server": server,
    "uniq": uniq,
    "workable_servers": List<dynamic>.from(workableServers.map((x) => x)),
  };
}

class FileElement {
  FileElement({
    this.name,
    this.source,
    this.format,
    this.original,
    this.mtime,
    this.size,
    this.md5,
    this.crc32,
    this.sha1,
    this.btih,
    this.summation,
    this.rotation,
  });

  String name;
  Source source;
  String format;
  String original;
  String mtime;
  String size;
  String md5;
  String crc32;
  String sha1;
  String btih;
  String summation;
  String rotation;

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
    name: json["name"],
    source: sourceValues.map[json["source"]],
    format: json["format"],
    original: json["original"] == null ? null : json["original"],
    mtime: json["mtime"] == null ? null : json["mtime"],
    size: json["size"] == null ? null : json["size"],
    md5: json["md5"],
    crc32: json["crc32"] == null ? null : json["crc32"],
    sha1: json["sha1"] == null ? null : json["sha1"],
    btih: json["btih"] == null ? null : json["btih"],
    summation: json["summation"] == null ? null : json["summation"],
    rotation: json["rotation"] == null ? null : json["rotation"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "source": sourceValues.reverse[source],
    "format": format,
    "original": original == null ? null : original,
    "mtime": mtime == null ? null : mtime,
    "size": size == null ? null : size,
    "md5": md5,
    "crc32": crc32 == null ? null : crc32,
    "sha1": sha1 == null ? null : sha1,
    "btih": btih == null ? null : btih,
    "summation": summation == null ? null : summation,
    "rotation": rotation == null ? null : rotation,
  };
}

enum Source { DERIVATIVE, ORIGINAL, METADATA }

final sourceValues = EnumValues({
  "derivative": Source.DERIVATIVE,
  "metadata": Source.METADATA,
  "original": Source.ORIGINAL
});

class Metadata {
  Metadata({
    this.identifier,
    this.mediatype,
    this.description,
    this.language,
    this.scanner,
    this.title,
    this.publicdate,
    this.uploader,
    this.addeddate,
    this.identifierAccess,
    this.identifierArk,
    this.ppi,
    this.ocr,
    this.repubState,
    this.creator,
    this.subject,
    this.curation,
    this.collection,
    this.backupLocation,
    this.openlibraryEdition,
    this.openlibraryWork,
  });

  String identifier;
  String mediatype;
  String description;
  String language;
  String scanner;
  String title;
  DateTime publicdate;
  String uploader;
  DateTime addeddate;
  String identifierAccess;
  String identifierArk;
  String ppi;
  String ocr;
  String repubState;
  String creator;
  List<String> subject;
  String curation;
  List<String> collection;
  String backupLocation;
  String openlibraryEdition;
  String openlibraryWork;

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    identifier: json["identifier"],
    mediatype: json["mediatype"],
    description: json["description"],
    language: json["language"],
    scanner: json["scanner"],
    title: json["title"],
    publicdate: DateTime.parse(json["publicdate"]),
    uploader: json["uploader"],
    addeddate: DateTime.parse(json["addeddate"]),
    identifierAccess: json["identifier-access"],
    identifierArk: json["identifier-ark"],
    ppi: json["ppi"],
    ocr: json["ocr"],
    repubState: json["repub_state"],
    creator: json["creator"],
    subject: List<String>.from(json["subject"].map((x) => x)),
    curation: json["curation"],
    collection: List<String>.from(json["collection"].map((x) => x)),
    backupLocation: json["backup_location"],
    openlibraryEdition: json["openlibrary_edition"],
    openlibraryWork: json["openlibrary_work"],
  );

  Map<String, dynamic> toJson() => {
    "identifier": identifier,
    "mediatype": mediatype,
    "description": description,
    "language": language,
    "scanner": scanner,
    "title": title,
    "publicdate": publicdate.toIso8601String(),
    "uploader": uploader,
    "addeddate": addeddate.toIso8601String(),
    "identifier-access": identifierAccess,
    "identifier-ark": identifierArk,
    "ppi": ppi,
    "ocr": ocr,
    "repub_state": repubState,
    "creator": creator,
    "subject": List<dynamic>.from(subject.map((x) => x)),
    "curation": curation,
    "collection": List<dynamic>.from(collection.map((x) => x)),
    "backup_location": backupLocation,
    "openlibrary_edition": openlibraryEdition,
    "openlibrary_work": openlibraryWork,
  };
}

class Review {
  Review({
    this.reviewtitle,
    this.reviewbody,
    this.stars,
    this.reviewer,
    this.reviewdate,
    this.createdate,
    this.reviewerItemname,
  });

  String reviewtitle;
  String reviewbody;
  String stars;
  String reviewer;
  DateTime reviewdate;
  DateTime createdate;
  String reviewerItemname;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    reviewtitle: json["reviewtitle"],
    reviewbody: json["reviewbody"],
    stars: json["stars"],
    reviewer: json["reviewer"],
    reviewdate: DateTime.parse(json["reviewdate"]),
    createdate: DateTime.parse(json["createdate"]),
    reviewerItemname: json["reviewer_itemname"],
  );

  Map<String, dynamic> toJson() => {
    "reviewtitle": reviewtitle,
    "reviewbody": reviewbody,
    "stars": stars,
    "reviewer": reviewer,
    "reviewdate": reviewdate.toIso8601String(),
    "createdate": createdate.toIso8601String(),
    "reviewer_itemname": reviewerItemname,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
