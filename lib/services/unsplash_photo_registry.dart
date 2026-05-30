import 'dart:async';

import 'package:flutter/services.dart';
import 'package:luxora_ai/models/unsplash_photo.dart';
import 'package:luxora_ai/services/unsplash_api_client.dart';
import 'package:luxora_ai/services/unsplash_config.dart';

/// In-memory registry of Unsplash metadata (not image bytes).
class UnsplashPhotoRegistry {
  UnsplashPhotoRegistry._();
  static final UnsplashPhotoRegistry instance = UnsplashPhotoRegistry._();

  final Map<String, UnsplashPhoto> _byId = {};
  bool _loaded = false;

  UnsplashPhoto? byId(String? id) {
    if (id == null || id.isEmpty) {
      return null;
    }
    return _byId[id];
  }

  Future<void> ensureLoaded() async {
    if (_loaded) {
      return;
    }
    final raw = await rootBundle.loadString('assets/unsplash/curated.json');
    final list = UnsplashPhoto.listFromJsonString(raw);
    for (final photo in list) {
      _byId[photo.id] = photo;
    }
    _loaded = true;

    if (UnsplashConfig.hasAccessKey) {
      unawaited(_refreshFromApi(list.map((p) => p.id)));
    }
  }

  Future<void> _refreshFromApi(Iterable<String> ids) async {
    try {
      final client = UnsplashApiClient();
      for (final id in ids) {
        final fresh = await client.getPhoto(id);
        _byId[id] = fresh;
      }
    } catch (_) {
      // Keep bundled metadata when refresh fails.
    }
  }
}
