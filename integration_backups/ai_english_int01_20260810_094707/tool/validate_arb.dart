import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  final File sourceFile = File('lib/l10n/app_tr.arb');
  final File targetFile = File('lib/l10n/app_en.arb');
  final Map<String, Object?> source = _readArb(sourceFile);
  final Map<String, Object?> target = _readArb(targetFile);

  final Set<String> sourceKeys = source.keys
      .where((String key) => !key.startsWith('@'))
      .toSet();
  final Set<String> targetKeys = target.keys
      .where((String key) => !key.startsWith('@'))
      .toSet();

  final Set<String> missing = sourceKeys.difference(targetKeys);
  final Set<String> unexpected = targetKeys.difference(sourceKeys);
  if (missing.isNotEmpty || unexpected.isNotEmpty) {
    stderr.writeln('ARB key mismatch. Missing: $missing; unexpected: $unexpected');
    exitCode = 1;
    return;
  }
  stdout.writeln('ARB validation PASS: ${sourceKeys.length} translated keys.');
}

Map<String, Object?> _readArb(File file) {
  final Object? decoded = jsonDecode(file.readAsStringSync());
  if (decoded is! Map<String, Object?>) {
    throw FormatException('${file.path} must contain a JSON object');
  }
  return decoded;
}
