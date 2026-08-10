# Gemini Teknik Teslim — CONTENT-BATCH-C01 v1.0.0

## Beklenen işlem

Bu paket tek tek kayıt onayı için değil, toplu şema doğrulama ve kontrollü bulut importu için hazırlanmıştır. Teknik çalışma, içerik üretim hattını bekletmeden sürdürülmelidir.

## Beklenen kayıt sayıları

| Hedef | Beklenen |
|---|---:|
| lessons | 10 |
| vocabulary_pool | 100 |
| example_sentences | 100 |
| assessments | 50 |
| dialogues | 10 |
| daily_tasks | 10 |
| video_scripts | 20 |
| subtitle_tracks | 20 |
| audio recording_queue | 230 |
| gerçek audio_assets | 0 |

## Zorunlu kapılar

1. Paket sürümü ve SHA-256 değerlerini doğrula.
2. Kimlik benzersizliği ve foreign-key eşlemelerini doğrula.
3. Mevcut bulut şemasıyla alan eşleme raporu üret.
4. Dry-run sonucu PASS olmadan yazma işlemi yapma.
5. Import işlemini geri alınabilir batch/transaction ile yürüt.
6. Import sonrası tablo başına kayıt sayısını buluttan geri oku.
7. Örnek olarak her tablodan ilk ve son kaydı geri okuyup içerik hash karşılaştırması yap.
8. Yerel veritabanı, kalıcı yerel state veya çevrimdışı kalıcı cache ekleme.
9. recording_queue satırlarını gerçek audio_assets kaydı sayma; dosya yolu ve süre uydurma.
10. INT-01 için 50000 ms kilitli sözleşmeyi ve mevcut bulut state yaklaşımını koru.

## Durum mühürleri

- İçerik üretimi: `COMPLETED`
- Şema/içerik bütünlüğü: `PASS_WITH_RELEASE_GATES`
- ID 3: `IN_PROGRESS` — cloud import + count + readback kanıtı bekleniyor.
- ID 5: `IN_PROGRESS` — gerçek audio + süre + checksum + hak + readback kanıtı bekleniyor.
- Debug APK kabulü: `PENDING`

## Geri bildirim formatı

Gemini sonucu tek bir raporda şu alanlarla dönmelidir: package_id, version, input SHA-256, schema result, dry-run result, imported table counts, readback samples, failed record ids, rollback status, local persistence confirmation, ID 3 status, ID 5 status ve next action.
