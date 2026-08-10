# Flutter INT-01 Windows Entegrasyon Sonucu

- Sonuc: **BLOCKED**
- Proje: `C:\Server\apps\ai_english`
- Baslangic: 2026-08-09T21:42:30
- Bitis: 2026-08-09T21:42:47

| Is | Durum | Kanit |
|---|---|---|
| 3a. Flutter surumu | PASS | C:\flutter\bin\flutter.bat --version |
| 3b. Dart surumu | PASS | C:\flutter\bin\dart.bat --version |
| 1. Paket butunlugu | PASS | C:\Server\apps\ai_english\packages\ai_english_int01 |
| 2. Ana pubspec path dependency | PASS | ai_english_int01 eklendi/guncellendi. Yedek: C:\Server\apps\ai_english\integration_backups\pubspec.yaml.20260809_214230.bak |
| 5a. Paket pub get | PASS | C:\flutter\bin\flutter.bat pub get |
| 5b. Paket l10n uretimi | PASS | C:\flutter\bin\flutter.bat gen-l10n |
| 5c. ARB dogrulamasi | PASS | C:\flutter\bin\dart.bat run tool\validate_arb.dart |
| Entegrasyon kapisi | BLOCKED | 5d. Paket analyze basarisiz oldu. Cikis kodu: 1 |

## Hata

    5d. Paket analyze basarisiz oldu. Cikis kodu: 1

## Durum yorumu

`PASS`, komutun bu Windows ortaminda basariyla calistigini gosterir. Ana uygulama
video ekranina kod baglantisi, `INT01_ADAPTATION_GUIDE.md` icindeki kesin aday dosya
incelendikten sonra tamamlanir. Fiziksel telefon testi bu otomasyonun kapsami disindadir.