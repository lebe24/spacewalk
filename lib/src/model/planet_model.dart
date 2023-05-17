// To parse this JSON data, do
//
//     final PlanetVideo = PlanetVideoFromJson(jsonString);

import 'dart:convert';

PlanetVideo PlanetVideoFromJson(String str) => PlanetVideo.fromJson(json.decode(str));

String PlanetVideoToJson(PlanetVideo data) => json.encode(data.toJson());

class PlanetVideo {
    List<Content> contents;
    String cursorNext;
    dynamic didYouMean;
    int estimatedResults;
    List<FilterGroup> filterGroups;
    List<String> refinements;

    PlanetVideo({
        required this.contents,
        required this.cursorNext,
        this.didYouMean,
        required this.estimatedResults,
        required this.filterGroups,
        required this.refinements,
    });

    factory PlanetVideo.fromJson(Map<String, dynamic> json) => PlanetVideo(
        contents: List<Content>.from(json["contents"].map((x) => Content.fromJson(x))),
        cursorNext: json["cursorNext"],
        didYouMean: json["didYouMean"],
        estimatedResults: json["estimatedResults"],
        filterGroups: List<FilterGroup>.from(json["filterGroups"].map((x) => FilterGroup.fromJson(x))),
        refinements: List<String>.from(json["refinements"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "contents": List<dynamic>.from(contents.map((x) => x.toJson())),
        "cursorNext": cursorNext,
        "didYouMean": didYouMean,
        "estimatedResults": estimatedResults,
        "filterGroups": List<dynamic>.from(filterGroups.map((x) => x.toJson())),
        "refinements": List<dynamic>.from(refinements.map((x) => x)),
    };
}

class Content {
    ContentType type;
    Video video;

    Content({
        required this.type,
        required this.video,
    });

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        type: contentTypeValues.map[json["type"]]!,
        video: Video.fromJson(json["video"]),
    );

    Map<String, dynamic> toJson() => {
        "type": contentTypeValues.reverse[type],
        "video": video.toJson(),
    };
}

enum ContentType { VIDEO }

final contentTypeValues = EnumValues({
    "video": ContentType.VIDEO
});

class Video {
    Author author;
    List<BadgeEnum> badges;
    String descriptionSnippet;
    bool isLiveNow;
    int lengthSeconds;
    List<Thumbnail>? movingThumbnails;
    String? publishedTimeText;
    Stats stats;
    List<Thumbnail> thumbnails;
    String title;
    String videoId;

    Video({
        required this.author,
        required this.badges,
        required this.descriptionSnippet,
        required this.isLiveNow,
        required this.lengthSeconds,
        this.movingThumbnails,
        this.publishedTimeText,
        required this.stats,
        required this.thumbnails,
        required this.title,
        required this.videoId,
    });

    factory Video.fromJson(Map<String, dynamic> json) => Video(
        author: Author.fromJson(json["author"]),
        badges: List<BadgeEnum>.from(json["badges"].map((x) => badgeEnumValues.map[x]!)),
        descriptionSnippet: json["descriptionSnippet"],
        isLiveNow: json["isLiveNow"],
        lengthSeconds: json["lengthSeconds"],
        movingThumbnails: json["movingThumbnails"] == null ? [] : List<Thumbnail>.from(json["movingThumbnails"]!.map((x) => Thumbnail.fromJson(x))),
        publishedTimeText: json["publishedTimeText"],
        stats: Stats.fromJson(json["stats"]),
        thumbnails: List<Thumbnail>.from(json["thumbnails"].map((x) => Thumbnail.fromJson(x))),
        title: json["title"],
        videoId: json["videoId"],
    );

    Map<String, dynamic> toJson() => {
        "author": author.toJson(),
        "badges": List<dynamic>.from(badges.map((x) => badgeEnumValues.reverse[x])),
        "descriptionSnippet": descriptionSnippet,
        "isLiveNow": isLiveNow,
        "lengthSeconds": lengthSeconds,
        "movingThumbnails": movingThumbnails == null ? [] : List<dynamic>.from(movingThumbnails!.map((x) => x.toJson())),
        "publishedTimeText": publishedTimeText,
        "stats": stats.toJson(),
        "thumbnails": List<dynamic>.from(thumbnails.map((x) => x.toJson())),
        "title": title,
        "videoId": videoId,
    };
}

class Author {
    List<Thumbnail> avatar;
    List<BadgeClass> badges;
    String? canonicalBaseUrl;
    String channelId;
    String title;

    Author({
        required this.avatar,
        required this.badges,
        this.canonicalBaseUrl,
        required this.channelId,
        required this.title,
    });

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        avatar: List<Thumbnail>.from(json["avatar"].map((x) => Thumbnail.fromJson(x))),
        badges: List<BadgeClass>.from(json["badges"].map((x) => BadgeClass.fromJson(x))),
        canonicalBaseUrl: json["canonicalBaseUrl"],
        channelId: json["channelId"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "avatar": List<dynamic>.from(avatar.map((x) => x.toJson())),
        "badges": List<dynamic>.from(badges.map((x) => x.toJson())),
        "canonicalBaseUrl": canonicalBaseUrl,
        "channelId": channelId,
        "title": title,
    };
}

class Thumbnail {
    int height;
    String url;
    int width;

    Thumbnail({
        required this.height,
        required this.url,
        required this.width,
    });

    factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        height: json["height"],
        url: json["url"],
        width: json["width"],
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "url": url,
        "width": width,
    };
}

class BadgeClass {
    Text text;
    BadgeType type;

    BadgeClass({
        required this.text,
        required this.type,
    });

    factory BadgeClass.fromJson(Map<String, dynamic> json) => BadgeClass(
        text: textValues.map[json["text"]]!,
        type: badgeTypeValues.map[json["type"]]!,
    );

    Map<String, dynamic> toJson() => {
        "text": textValues.reverse[text],
        "type": badgeTypeValues.reverse[type],
    };
}

enum Text { OFFICIAL_ARTIST_CHANNEL, VERIFIED }

final textValues = EnumValues({
    "Official Artist Channel": Text.OFFICIAL_ARTIST_CHANNEL,
    "Verified": Text.VERIFIED
});

enum BadgeType { OFFICIAL_ARTIST_CHANNEL, VERIFIED_CHANNEL }

final badgeTypeValues = EnumValues({
    "OFFICIAL_ARTIST_CHANNEL": BadgeType.OFFICIAL_ARTIST_CHANNEL,
    "VERIFIED_CHANNEL": BadgeType.VERIFIED_CHANNEL
});

enum BadgeEnum { CC, NEW, THE_4_K }

final badgeEnumValues = EnumValues({
    "CC": BadgeEnum.CC,
    "New": BadgeEnum.NEW,
    "4K": BadgeEnum.THE_4_K
});

class Stats {
    int views;

    Stats({
        required this.views,
    });

    factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        views: json["views"],
    );

    Map<String, dynamic> toJson() => {
        "views": views,
    };
}

class FilterGroup {
    List<Filter> filters;
    String title;

    FilterGroup({
        required this.filters,
        required this.title,
    });

    factory FilterGroup.fromJson(Map<String, dynamic> json) => FilterGroup(
        filters: List<Filter>.from(json["filters"].map((x) => Filter.fromJson(x))),
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "filters": List<dynamic>.from(filters.map((x) => x.toJson())),
        "title": title,
    };
}

class Filter {
    String? cursorSelect;
    String label;
    bool selected;

    Filter({
        this.cursorSelect,
        required this.label,
        required this.selected,
    });

    factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        cursorSelect: json["cursorSelect"],
        label: json["label"],
        selected: json["selected"],
    );

    Map<String, dynamic> toJson() => {
        "cursorSelect": cursorSelect,
        "label": label,
        "selected": selected,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
