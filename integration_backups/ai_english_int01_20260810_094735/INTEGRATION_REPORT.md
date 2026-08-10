# CORE-E1-W1-L1 — Ücretsiz Üretim Hattı ve Flutter INT-01 Uygulama Kaydı

**Sürüm:** `v0.1`  
**Tarih:** 9 Ağustos 2026  
**Durum:** `PACKAGE IMPLEMENTED / WINDOWS APP INTEGRATION PENDING`  
**Figma:** `READ-ONLY ARCHIVE`  
**SF-01:** `v1.0.1 — CLOSED / USER ACCEPTED`

## 1. Ortam sonucu

Bu çalışma alanında `C:\Server\apps\ai_english`, bir Flutter `pubspec.yaml`,
Flutter SDK veya Dart SDK bulunmadı. Bu nedenle kullanıcıya ait Windows
projesinde dosya değiştirilmedi ve APK üretilmiş gibi raporlanmadı.

Çözüm olarak ana projeye path dependency ile eklenebilecek bağımsız
`ai_english_int01 v0.1.0` paketi hazırlandı.

## 2. Uygulanan üretim sözleşmesi

| Madde | Sonuç |
|---|---|
| Kilitli JSON | `APPROVED_LOCKED / v1.0` |
| Ders ve etkileşim | `CORE-E1-W1-L1 / INT-01` |
| Zaman | `pauseAt=50000 ms` |
| Pozitif tolerans | `+50 ms` |
| Kelimeler | `t1/two`, `t2/blue`, `t3/books` |
| Doğru cevap | `t3 / books` |
| Deneme | `3` |
| Token görünümü | `36000 / 38000 / 40000 ms` |
| Halo | Karttan `4 kare` önce |
| Reduced Motion | Yalnız `200 ms` opacity |
| Dokunma hedefi | Minimum `48×48 dp` |
| State saklama | `SharedPreferences` snapshot |
| Runtime AI | `YOK` |

## 3. İlk iskelete uygulanan teknik düzeltmeler

1. Zaman kapısı yalnız `50000–50050` aralığına bağlı bırakılmadı; hedef
   geçişi yakalanıyor ve tolerans aşılırsa güvenli geri arama yapılıyor.
2. Kalıcılık yalnız RAM ile sınırlı değil; seçilen token, son cevap, deneme,
   flow action ve video konumu JSON snapshot olarak saklanıyor.
3. `GestureDetector` yerine erişilebilir Material/InkWell yapısı kullanıldı.
4. Doğru/yanlış/seçili/devre dışı durumları ikon ve metinle desteklenerek
   renge bağımlılık kaldırıldı.
5. Reduced Motion açıkken scale ve translate kod yolundan çıkarıldı.
6. `00:36 / 00:38 / 00:40` canlı kelime akışı ayrı kontrolcüye bağlandı.
7. JSON doğrulaması; benzersiz ID, mevcut doğru cevap, zaman birimi, seçim
   modeli ve erişilebilirlik zorunluluklarını denetliyor.

## 4. Dosya envanteri

- Paket ve analiz yapılandırması
- Kilitli sözleşme JSON asset'i
- Model, controller, persistence ve UI kaynakları
- Türkçe/İngilizce ARB dosyaları
- ARB anahtar doğrulayıcısı
- Model, state machine, zaman kapısı, token zamanlayıcı ve widget testleri
- Windows entegrasyon ve kapanış talimatları

## 5. Doğrulama seviyeleri

| Kapı | Bu turdaki durum |
|---|---|
| Kilitli JSON yapısı ve değerleri | `PASS` |
| ARB JSON ve anahtar eşitliği | `PASS` |
| Pubspec/l10n/analyzer YAML sözdizimi | `PASS` |
| Dart sözdizimi | `22/22 PASS` |
| Eksik iskelet/TODO taraması | `PASS — 0 kayıt` |
| Dart format/analyze | `BLOCKED — SDK NOT PRESENT` |
| Flutter test | `BLOCKED — SDK NOT PRESENT` |
| Ana uygulamaya entegrasyon | `PENDING — WINDOWS PROJECT NOT PRESENT` |
| APK | `NOT BUILT` |
| Telefon testi | `NOT RUN` |

## 6. Bir sonraki uygulama kapısı

Paket `C:\Server\apps\ai_english\packages\ai_english_int01` altına alınmalı;
ana uygulamanın gerçek `pubspec.yaml`, Flutter sürümü, video katmanı ve mevcut
state yönetimiyle uyarlanmalıdır. Sonrasında analyze/test/APK/telefon kapıları
sırayla yürütülmelidir.

## 7. Statik doğrulama kanıtı

- Kilitli değerler: `30 fps`, `36000/38000/40000 ms`, `50000 ms`, `+50 ms`,
  `t3/books`, üç deneme, `154/346 px`, `48 dp`, `200 ms` — `PASS`.
- Türkçe ve İngilizce ARB dosyaları aynı `15` çalışma zamanı anahtarına sahiptir.
- `pubspec.yaml`, `l10n.yaml` ve `analysis_options.yaml` parse edilmiştir.
- Kaynak ve testlerde bulunan `22` Dart dosyasının tamamı Dart grammar ile
  parse edilmiştir; syntax error sayısı `0`dır.
- Bu denetim tip çözümleme veya Flutter çalışma testi yerine geçmez; bu iki kapı
  Windows Flutter SDK ortamında ayrıca çalıştırılacaktır.
