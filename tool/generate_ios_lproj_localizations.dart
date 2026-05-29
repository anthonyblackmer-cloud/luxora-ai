// Creates ios/Runner/<locale>.lproj/InfoPlist.strings and wires them into the Xcode
// project so App Store Connect sees native localization bundles (not only ARB).
//
// Run: dart run tool/generate_ios_lproj_localizations.dart
//
// Keep in sync with ios/Runner/Info.plist CFBundleLocalizations and
// lib/l10n supported locales (zh → zh-Hans for iOS).
import 'dart:io';

/// iOS .lproj folder name → localized display name (brand stays Latin).
const _locales = <String, String>{
  'de': 'Luxora AI',
  'en': 'Luxora AI',
  'es': 'Luxora AI',
  'fr': 'Luxora AI',
  'hi': 'Luxora AI',
  'it': 'Luxora AI',
  'ja': 'Luxora AI',
  'ko': 'Luxora AI',
  'pt': 'Luxora AI',
  'ru': 'Luxora AI',
  'tr': 'Luxora AI',
  'zh-Hans': 'Luxora AI',
};

String _id(String seed) {
  var h = 0;
  for (final c in seed.codeUnits) {
    h = (h * 31 + c) & 0xFFFFFF;
  }
  return h.toRadixString(16).padLeft(8, '0').toUpperCase() + '1CF9000F007C1190';
}

void _writeInfoPlistStrings(String lprojName, String displayName) {
  final dir = Directory('ios/Runner/$lprojName.lproj');
  dir.createSync(recursive: true);
  final content = '''
/* Native iOS localization bundle for App Store language detection.
   In-app UI strings come from Flutter ARB (lib/l10n). */
"CFBundleDisplayName" = "$displayName";
"CFBundleName" = "$displayName";
''';
  File('ios/Runner/$lprojName.lproj/InfoPlist.strings').writeAsStringSync(content);
}

void _patchPbxproj() {
  final pbxPath = 'ios/Runner.xcodeproj/project.pbxproj';
  var pbx = File(pbxPath).readAsStringSync();
  if (pbx.contains('InfoPlist.strings')) {
    stdout.writeln('project.pbxproj already references InfoPlist.strings — skip patch');
    return;
  }

  final variantGroupId = _id('InfoPlistVariantGroup');
  final buildFileId = _id('InfoPlistBuildFile');
  final childRefs = <String>[];
  final fileRefLines = StringBuffer();
  final childLines = StringBuffer();

  for (final entry in _locales.entries) {
    final lproj = entry.key;
    final fileId = _id('InfoPlist_$lproj');
    childRefs.add(fileId);
    fileRefLines.writeln(
      '\t\t$fileId /* $lproj */ = {isa = PBXFileReference; lastKnownFileType = text.plist.strings; name = $lproj; path = $lproj.lproj/InfoPlist.strings; sourceTree = "<group>"; };',
    );
    childLines.writeln('\t\t\t\t$fileId /* $lproj */,');
  }

  final buildFileLine =
      '\t\t$buildFileId /* InfoPlist.strings in Resources */ = {isa = PBXBuildFile; fileRef = $variantGroupId /* InfoPlist.strings */; };';
  final variantGroup = '''
\t\t$variantGroupId /* InfoPlist.strings */ = {
\t\t\tisa = PBXVariantGroup;
\t\t\tchildren = (
${childLines.toString().trimRight()}
\t\t\t);
\t\t\tname = InfoPlist.strings;
\t\t\tsourceTree = "<group>";
\t\t};
''';

  pbx = pbx.replaceFirst(
    '/* End PBXBuildFile section */',
    '$buildFileLine\n/* End PBXBuildFile section */',
  );
  pbx = pbx.replaceFirst(
    '/* End PBXFileReference section */',
    '${fileRefLines.toString().trimRight()}\n/* End PBXFileReference section */',
  );
  pbx = pbx.replaceFirst(
    '\t\t\t\t97C146FC1CF9000F007C117D /* Main.storyboard in Resources */,',
    '\t\t\t\t$buildFileId /* InfoPlist.strings in Resources */,\n\t\t\t\t97C146FC1CF9000F007C117D /* Main.storyboard in Resources */,',
  );
  pbx = pbx.replaceFirst(
    '\t\t\t\t97C147021CF9000F007C117D /* Info.plist */,',
    '\t\t\t\t$variantGroupId /* InfoPlist.strings */,\n\t\t\t\t97C147021CF9000F007C117D /* Info.plist */,',
  );
  pbx = pbx.replaceFirst(
    '/* End PBXVariantGroup section */',
    '$variantGroup/* End PBXVariantGroup section */',
  );

  File(pbxPath).writeAsStringSync(pbx);
  stdout.writeln('Patched $pbxPath (InfoPlist.strings × ${_locales.length})');
}

void main() {
  for (final e in _locales.entries) {
    _writeInfoPlistStrings(e.key, e.value);
    stdout.writeln('wrote ${e.key}.lproj/InfoPlist.strings');
  }
  _patchPbxproj();

  // Sanity: list created dirs
  final dirs = Directory('ios/Runner')
      .listSync()
      .whereType<Directory>()
      .where((d) => d.path.endsWith('.lproj'))
      .map((d) => d.uri.pathSegments.last)
      .toList()
    ..sort();
  stdout.writeln('lproj folders: ${dirs.join(', ')}');
}
