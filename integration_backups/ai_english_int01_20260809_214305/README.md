# AI English — Flutter INT-01 Entegrasyon Paketi

**Paket sürümü:** `0.1.0`  
**Ders:** `CORE-E1-W1-L1`  
**Etkileşim:** `INT-01`  
**Kaynak sözleşme:** `APPROVED / LOCKED v1.0`  
**Figma:** `READ-ONLY ARCHIVE`

Bu paket, kabul edilmiş `SF-01 v1.0.1` içeriğine dokunmadan `00:28–00:44`
canlı kelime akışını ve `00:50 / 50000 ms` etkileşim kapısını Flutter'a taşır.
Bağımsız bir yerel Flutter paketi olarak hazırlanmıştır; mevcut uygulama
projesine kontrollü biçimde eklenmelidir.

## Uygulanan kapsam

- Tam, tür güvenli `InteractionSpec` ve kilitli sözleşme doğrulaması.
- `two / blue / books` tokenları ve beş görsel durum.
- `00:36 / 00:38 / 00:40` zamanlı gösterim; `30 fps` ve dört kare erken halo.
- `50000 ms` duraklatma, `+50 ms` pozitif tolerans ve kare atlama kurtarması.
- Tekli seçim, seçim iptali, üç deneme, iki ipucu ve çözümü gösterip ilerleme.
- Arka plan, ekran dönüşü ve süreç yeniden kurulumu için kalıcı snapshot.
- Minimum `48×48 dp` hedef, Semantics etiketleri ve renkten bağımsız durumlar.
- Reduced Motion durumunda transform/scale yok; yalnız `200 ms` fade.
- Build-time ARB yerelleştirme temeli; uygulama içinde AI anahtarı veya çağrısı yok.
- Birim, kontrolcü ve widget test iskeletleri.

## Tasarım kararlarının kod eşlemesi

| Kilitli karar | Kod |
|---|---|
| `INT-01 v1.0` | `InteractionSpec`, `LockedLessonContract` |
| `50000 ms / +50 ms` | `InteractiveVideoController` |
| Kare atlama güvenliği | Hedef geçişini yakalar; `>50050 ms` ise `50000 ms`e geri arar |
| Üç deneme | `InteractionStateMachine` |
| Background/rotation | `Int01SessionController` + `InteractionStateStore` |
| `SharedPreferences` | `SharedPreferencesInteractionStateStore` |
| `two / blue / books` | `ShowTokensController`, `ShowTokensRow` |
| Beş kart durumu | `TokenWordCard`, `TokenCardState` |
| Güvenli alan | `Int01Overlay` içinde `154/1920` ve `346/1920` oranları |
| Build-time çeviri | `lib/l10n/*.arb`, `l10n.yaml`, `tool/validate_arb.dart` |

## Neden verilen ilk video denetimi değiştirildi?

Aşağıdaki dar koşul güvenli değildir:

```dart
currentPosition >= 50000 && currentPosition <= 50050
```

Oynatıcı dinleyicisi `49980 ms`den doğrudan `50090 ms`ye geçerse etkileşim hiç
tetiklenmez. Paket hedefin **geçilmesini** algılar, videoyu durdurur ve ölçülen
konum tolerans dışındaysa `50000 ms`e geri arar. Böylece kapı kaybolmaz ve
yeniden başlatmada kabul edilen konum korunur.

## Windows projesine kurulum

Hedef varsayımı:

```text
C:\Server\apps\ai_english
```

1. Bu klasörü şu konuma kopyalayın:

```text
C:\Server\apps\ai_english\packages\ai_english_int01
```

2. Ana uygulamanın `pubspec.yaml` dosyasına ekleyin:

```yaml
dependencies:
  ai_english_int01:
    path: packages/ai_english_int01
```

3. PowerShell'de paket kapılarını çalıştırın:

```powershell
Set-Location C:\Server\apps\ai_english\packages\ai_english_int01
flutter --version
flutter pub get
flutter gen-l10n
dart run tool\validate_arb.dart
flutter analyze
flutter test
```

4. Ana uygulamaya dönüp bağımlılığı çözün:

```powershell
Set-Location C:\Server\apps\ai_english
flutter pub get
```

## Başlatma örneği

```dart
final LockedLessonContract contract =
    await LockedLessonContract.loadFromAsset();
final VideoPlayerPort videoPort = VideoPlayerPort(videoPlayerController);
final SharedPreferences preferences = await SharedPreferences.getInstance();

final Int01SessionController session = Int01SessionController(
  spec: contract.interaction,
  video: videoPort,
  store: SharedPreferencesInteractionStateStore(preferences),
);
await session.start();

final ShowTokensController showTokens = ShowTokensController(
  video: videoPort,
  motion: contract.motion,
)..attach();
```

Ekranda video ve canlı Flutter katmanlarını aynı `Stack` içinde kullanın:

```dart
Stack(
  fit: StackFit.expand,
  children: <Widget>[
    VideoPlayer(videoPlayerController),
    Align(
      alignment: Alignment.center,
      child: ShowTokensRow(
        controller: showTokens,
        tokens: contract.interaction.tokens,
        defaultStateLabel: localizations.tokenStateDefault,
      ),
    ),
    Int01Overlay(
      session: session,
      layoutContract: contract.flutter,
      onFlowAction: handleLessonFlowAction,
    ),
  ],
)
```

Ana `MaterialApp` için üretilen yerelleştirme delegelerini ve tema uzantısını
ekleyin:

```dart
MaterialApp(
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  theme: ThemeData(
    extensions: <ThemeExtension<dynamic>>[
      Int01Theme.standard(),
    ],
  ),
)
```

## Build-time AI çeviri güvenlik kuralı

- Kaynak metin `app_tr.arb` dosyasıdır.
- AI çeviri yalnız geliştirici makinesinde veya CI içinde, derlemeden önce
  çalıştırılabilir.
- Üretilen ARB dosyaları insan incelemesinden geçer ve repoya alınır.
- API anahtarı, prompt veya ağ istemcisi APK'ya eklenmez.
- Uygulama çalışma zamanında çeviri servisine çağrı yapmaz.
- Bu v0.1 pakette `app_en.arb` başlangıç çevirisi vardır; sağlayıcıya bağlı AI
  üretici betiği, API sağlayıcısı kilitlenmeden bilerek eklenmemiştir.

## Entegrasyon kapısı

Bu paket doğrudan Android uygulamasına bağlanmış sayılmaz. Kapanış için gerçek
Windows ortamında şu kanıtlar gereklidir:

1. Ana `pubspec.yaml` ve Flutter sürümü uyumluluğu.
2. Mevcut `video_player`/`chewie` katmanına adaptasyon.
3. `flutter analyze` ve `flutter test` tam PASS.
4. Debug APK üretimi.
5. Fiziksel telefonda `50000–50050 ms` duraklatma ölçümü.
6. Arka plan, dönüş, üç yanlış ve doğru cevap akışlarının cihaz testi.

