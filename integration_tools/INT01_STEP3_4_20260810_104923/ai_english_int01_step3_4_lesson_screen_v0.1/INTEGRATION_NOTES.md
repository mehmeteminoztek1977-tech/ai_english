# AI English INT-01 — Adım 3–4 Kod Teslimi

## Durum

- Kesin video ekranı: `lib/screens/lesson_screen.dart`
- Video paketi: `video_player: ^2.13.0`
- Köprü: `VideoPlayerPort(videoController)` → `Int01SessionController`
- Overlay: `Stack` içinde son katmanda `Positioned.fill`
- INT-01 sözleşmesi: `v1.0 / APPROVED_LOCKED`, değişmedi
- Duraklatma: `50000 ms`, pozitif tolerans: `+50 ms`, değişmedi
- Yerel veri tabanı: eklenmedi

## Zorunlu bağlantı

Ekran, mevcut uygulamanın oluşturduğu `VideoPlayerController` ile mevcut bulut
katmanını uygulayan `InteractionStateStore` örneğini constructor üzerinden
alır. Bu ekran hiçbir yerel saklama uygulamasını oluşturmaz veya çağırmaz.

```dart
LessonScreen(
  videoController: lessonVideoController,
  cloudStateStore: cloudInteractionStateStore,
  onInt01FlowAction: handleLessonFlowAction,
)
```

`cloudInteractionStateStore`, uygulamadaki mevcut bulut veri tabanı servisinin
`InteractionStateStore` sözleşmesine bağlanan adaptörüdür. Bu teslim, mevcut
servisin sınıf adı ve API imzası paylaşılmadığı için yeni bir veri katmanı
uydurmaz.

## Uygulama güvenliği

PowerShell çalıştırıcısı üretim `lesson_screen.dart` dosyasını otomatik olarak
ezmez. Aday kodu `integration_staging/STEP3_4` altında hazırlar ve iki iletişim
raporunu günceller. VS Code İşleyici, mevcut ekranın constructor ve bulut servis
imzalarını koruyarak aday kodu hedef dosyayla birleştirmelidir.
