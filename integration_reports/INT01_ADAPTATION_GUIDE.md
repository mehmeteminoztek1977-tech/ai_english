# INT-01 Adaptasyon Rehberi

- Durum: STEP2_ACTIVE
- Olusturma zamani: 2026-08-10T10:32:22
- Proje: C:\Server\apps\ai_english
- Kaynak kod degisikligi: YOK
- Yerel veritabani kurulumu: YOK

## Kanit uzlastirmasi

- Onceki entegrasyon raporlari: INT01_INTEGRATION_RESULT_20260809_214230.md, INT01_INTEGRATION_RESULT_20260809_214305.md, INT01_INTEGRATION_RESULT_20260810_094707.md, INT01_INTEGRATION_RESULT_20260810_094735.md
- Onceki raporlarin ortak sonucu: 5d Paket analyze BLOCKED
- Guncel bagimsiz analyze sonucu: PASS
- Guncel kanit: No issues found! (8.4s)
- Yorum: Adim 1 tamamlandi; Adim 2 adaptasyon incelemesi aktiftir.

## Mimari kilitler

- Mevcut bulut veritabani mimarisi korunacaktir.
- Yerel veritabani kurulmayacak veya onerilmeyecektir.
- Bu tarama kaynak dosyalari yalnizca okur.
- INT-01 v1.0 sozlesmesi ve zamanlama degerleri degistirilmemistir.
- Kesin video ekrani onaylanmadan otomatik kod enjeksiyonu yapilmayacaktir.

## Tespit edilen ilgili bagimliliklar

- video_player: ^2.13.0

## Video ekrani adaylari

- lib\controllers\interactive_video_controller.dart
- lib\screens\lesson_screen.dart

## State yonetimi adaylari

- lib\screens\lesson_screen.dart

## Overlay yerlestirme adaylari

- lib\screens\lesson_screen.dart

## INT-01 paket baglanti noktalari

- packages\ai_english_int01\lib\src\controller\interactive_video_controller.dart
- packages\ai_english_int01\lib\src\controller\int01_session_controller.dart
- packages\ai_english_int01\lib\src\ui\int01_overlay.dart
- packages\ai_english_int01\lib\src\ui\show_tokens_row.dart

## Karar kapisi

Kesin video ekrani ve state yonetimi koprusu, yukaridaki aday dosyalar
incelendikten sonra Adim 3 kapsaminda secilecektir.

## Beklenen ek kanitlar

- Paket flutter test sonucu
- Ana uygulama flutter analyze sonucu
- Varsa ana uygulama flutter test sonucu
- Secilen kesin video ekraninin dosya yolu
- Kullanilan oynatici controller sinifi

<!-- STEP3_4_INT01_START -->
## Adim 3-4 â€” Video ekrani ve state koprusu

- Durum: CODE_READY_FOR_VSCODE_INTEGRATION
- Tarih: 2026-08-10T10:49:23
- Kesin ekran: lib\screens\lesson_screen.dart
- Video paketi: video_player ^2.13.0
- Controller koprusu: VideoPlayerPort -> Int01SessionController
- Overlay konumu: Stack / Positioned.fill / son katman
- Aday kod: integration_staging\STEP3_4\lesson_screen.dart
- Aday SHA-256: 2EBBE9CA333777B6DA857B290D7505F27EAC45D410847ED96D66E8A8F1E71E07
- Mevcut hedef dosya: FOUND
- INT-01 v1.0 ve 50000/+50 ms: PRESERVED
- Bulut veri tabani: PRESERVED
- Yerel veri tabani: NOT_ADDED
- Uretim kaynak degisikligi: YOK; VS Code birlestirmesi bekleniyor
<!-- STEP3_4_INT01_END -->

<!-- VOCAB_POOL_ID3_START -->
## Master Plan ID 3 — Vocabulary Pool

- Güncelleme: 2026-08-10 12:18:50
- Alt görev ID 3A: COMPLETED
- Genel ID 3 durumu: IN PROGRESS
- İşlem durumu: SCHEMA_VALIDATED_SEED_READY_FOR_CLOUD_IMPORT
- Tablo: vocabulary_pool
- Seed kayıt sayısı: 2
- JSON doğrulaması: PASS
- Benzersiz ID kontrolü: PASS
- Yerel veritabanı: EKLENMEDİ
- Yerel kalıcı saklama: EKLENMEDİ
- Bulut importu: NOT PERFORMED
- Bulut geri okuma testi: NOT PERFORMED
- SHA-256: 41D8D34CA786BEF0F01326FFC6B1B473B40F8F0BF59E528F9A94CF662A7A8C0F

### Kapanış kapıları

1. Tam kaynak kelime listesinin çıkarılması
2. İçerik ve seviye doğrulaması
3. Mevcut bulut tablosuna import
4. Bulut kayıt sayısı ve geri okuma testinin PASS olması
<!-- VOCAB_POOL_ID3_END -->
