# AI English — CONTENT-BATCH-C01

**Sürüm:** 1.0.0  
**Tarih:** 2026-08-10  
**Hedef:** Pre-A1–A1 / Türkçe ana dilli 16+ öğrenen  
**Model:** Gör → Çöz → Dönüştür → Kur

Bu paket, AI English içerik hattının ilk toplu üretim teslimidir. İçerikler özgün olarak hazırlanmış; kaynak eğitime özgü adlar, kodlar, tablolar, örnekler, sorular ve açıklamalar kopyalanmamıştır.

## Kapsam

| İçerik | Adet |
|---|---:|
| Mikro ders | 10 |
| Kelime | 100 |
| Özgün örnek cümle | 100 |
| Test sorusu | 50 |
| Diyalog | 10 |
| Günlük görev | 10 |
| Video anlatım taslağı | 20 |
| Yeni altyazı parçası | 72 |
| Kilitli L1 altyazı referans izi | 2 |
| Seslendirme kuyruğu | 230 |
| Gerçek ses dosyası | 0 |

## Dosyalar

- `CONTENT-BATCH-C01.json`: Tüm içeriği tek pakette taşıyan ana entegrasyon dosyası.
- `CONTENT-BATCH-C01.schema.json`: Toplu teknik doğrulama için JSON Schema sözleşmesi.
- `lessons.json`: Ders hedefleri, kapsamları ve kilitli etkileşim bilgileri.
- `vocabulary_pool.json`: 100 kelimelik ID 3 batch çıktısı.
- `example_sentences.json`: Derslerle eşlenmiş 100 özgün cümle.
- `assessments.json`: 50 soru ve cevap anahtarı.
- `dialogues.json`: 10 kısa konuşma senaryosu.
- `daily_tasks.json`: 10 günlük pekiştirme görevi.
- `video_scripts.json`: 10 ders için A/B olmak üzere 20 anlatım taslağı.
- `subtitles.json`: Video segmentleriyle zaman eşlemeli altyazı taslakları.
- `audio_assets_manifest.json`: Gerçek dosya uydurmadan hazırlanmış 230 hedefli seslendirme kuyruğu.
- `VALIDATION_REPORT.json`: Sayım, benzersizlik ve referans bütünlüğü testleri.
- `GEMINI_TECHNICAL_HANDOFF.md`: Toplu doğrulama ve import kapıları.
- `references/CORE-E1-W1-L1_Tam_Video_Paketi_v0.1.md`: İlk dersin kilitli tam video, anlatım ve altyazı kaynağı.
- `manifest.json` ve `SHA256SUMS.txt`: Dosya bütünlüğü.

## Kabul durumu

- İçerik üretim kapsamı: `COMPLETED`
- Paket bütünlük testi: `PASS_WITH_RELEASE_GATES`
- ID 3 nihai durum: `IN_PROGRESS` — bulut importu ve geri okuma kanıtı bekleniyor.
- ID 5 nihai durum: `IN_PROGRESS` — gerçek ses, süre, checksum, hak ve bulut kanıtı bekleniyor.
- Yayın durumu: `NOT_RELEASED`

## Değiştirilemez teknik kararlar

- Yerel veritabanı veya kalıcı yerel state eklenmez.
- İçerik meta verileri mevcut bulut veritabanına toplu aktarılır.
- Çalışma zamanında AI çeviri servisi veya API anahtarı bulunmaz.
- İnsan dil editörü incelemesi olmadan yayın yapılmaz.
- İlk dersteki `CORE-E1-W1-L1`, `two blue books`, merkez isim ve `INT-01 / 50000 ms` sözleşmesi korunur.

## Entegrasyon sırası

1. Ana `CONTENT-BATCH-C01.json` dosyasını şema açısından doğrulayın.
2. Tüm kimlik ve referans kontrollerinin PASS olduğunu doğrulayın.
3. Dry-run import ile tablo eşlemelerini raporlayın.
4. Tek transaction veya geri alınabilir batch ile buluta aktarın.
5. Tablo başına beklenen kayıt sayısını geri okuyun.
6. Uygulamada 10 dersin liste, detay, soru ve günlük görev akışlarını test edin.
7. Gerçek ses dosyaları üretilene kadar recording_queue kayıtlarını audio_assets tablosuna gerçek varlık gibi yazmayın.

## Yayın öncesi kalite kapıları

Dil doğruluğu, doğal kullanım, CEFR uygunluğu ve kültürel tarafsızlık insan editörü tarafından kontrol edilmelidir. Paket B2 garantisi veya resmi kurum onayı iddiası taşımaz.
