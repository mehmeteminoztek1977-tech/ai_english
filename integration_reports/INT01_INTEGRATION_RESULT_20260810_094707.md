# Flutter INT-01 Windows Entegrasyon Sonucu

- Sonuc: **BLOCKED**
- Proje: `C:\Server\apps\ai_english`
- Baslangic: 2026-08-10T09:47:07
- Bitis: 2026-08-10T09:47:21

| Is | Durum | Kanit |
|---|---|---|
| 3a. Flutter surumu | PASS | C:\flutter\bin\flutter.bat --version |
| 3b. Dart surumu | PASS | C:\flutter\bin\dart.bat --version |
| 1. Paket aktarimi | PASS | Onceki paket geri alinabilir bicimde tasindi: C:\Server\apps\ai_english\integration_backups\ai_english_int01_20260810_094707 |
| 1. Paket butunlugu | PASS | C:\Server\apps\ai_english\packages\ai_english_int01 |
| 2. Ana pubspec path dependency | PASS | Mevcut tanim zaten dogru. |
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