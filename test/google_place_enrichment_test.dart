import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:luxora_ai/models/google_place_enrichment.dart';
import 'package:luxora_ai/services/google_places_api_client.dart';

void main() {
  group('GooglePlaceEnrichment.isUsableHeroPhotoUrl', () {
    test('rejects API media URLs that need auth headers', () {
      expect(
        GooglePlaceEnrichment.isUsableHeroPhotoUrl(
          'https://places.googleapis.com/v1/places/ChIJabc/photos/xyz/media'
              '?maxWidthPx=1200',
        ),
        isFalse,
      );
    });

    test('accepts Places media URL when key is embedded', () {
      expect(
        GooglePlaceEnrichment.isUsableHeroPhotoUrl(
          'https://places.googleapis.com/v1/places/ChIJabc/photos/xyz/media'
          '?maxWidthPx=1200&key=AIzaSyDummy',
        ),
        isTrue,
      );
    });

    test('accepts googleusercontent CDN redirects', () {
      expect(
        GooglePlaceEnrichment.isUsableHeroPhotoUrl(
          'https://lh3.googleusercontent.com/places/ANX9q25abc=s1200',
        ),
        isTrue,
      );
    });
  });

  group('GooglePlacesApiClient.photoUri', () {
    test('reads Location header without following redirect', () async {
      final client = GooglePlacesApiClient(
        client: _RedirectMockClient(
          redirectLocation:
              'https://lh3.googleusercontent.com/places/ANX9q25abc=s1200',
        ),
      );

      final uri = await client.photoUri('places/ChIJabc/photos/xyz');
      expect(uri.host, 'lh3.googleusercontent.com');
    });
  });
}

class _RedirectMockClient extends http.BaseClient {
  _RedirectMockClient({required this.redirectLocation});

  final String redirectLocation;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    expect(request.followRedirects, isFalse);
    return http.StreamedResponse(
      Stream<List<int>>.empty(),
      302,
      headers: {'location': redirectLocation},
      request: request,
    );
  }
}
