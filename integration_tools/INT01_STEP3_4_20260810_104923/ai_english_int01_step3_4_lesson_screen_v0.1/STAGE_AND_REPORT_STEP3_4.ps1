param(
    [string]$ProjectRoot = 'C:\Server\apps\ai_english'
)

$ErrorActionPreference = 'Stop'

$DeliveryRoot = $PSScriptRoot
$CandidatePath = Join-Path $DeliveryRoot 'payload\lib\screens\lesson_screen.dart'
$ReportDir = Join-Path $ProjectRoot 'integration_reports'
$StageDir = Join-Path $ProjectRoot 'integration_staging\STEP3_4'
$StagePath = Join-Path $StageDir 'lesson_screen.dart'
$GuidePath = Join-Path $ReportDir 'INT01_ADAPTATION_GUIDE.md'
$Timestamp = Get-Date -Format 'yyyyMMdd_HHmmss'
$ResultPath = Join-Path $ReportDir "INT01_INTEGRATION_RESULT_$Timestamp.md"
$Utf8NoBom = New-Object System.Text.UTF8Encoding($false)

if (-not (Test-Path -LiteralPath $ProjectRoot)) {
    throw "Proje klasoru bulunamadi: $ProjectRoot"
}
if (-not (Test-Path -LiteralPath $CandidatePath)) {
    throw "Aday lesson_screen.dart bulunamadi: $CandidatePath"
}

New-Item -ItemType Directory -Path $ReportDir -Force | Out-Null
New-Item -ItemType Directory -Path $StageDir -Force | Out-Null
Copy-Item -LiteralPath $CandidatePath -Destination $StagePath -Force

$CandidateHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $StagePath).Hash
$GeneratedAt = (Get-Date).ToString('s')
$TargetPath = Join-Path $ProjectRoot 'lib\screens\lesson_screen.dart'
$TargetExists = Test-Path -LiteralPath $TargetPath
$TargetStatus = if ($TargetExists) { 'FOUND' } else { 'NOT_FOUND' }

$SectionStart = '<!-- STEP3_4_INT01_START -->'
$SectionEnd = '<!-- STEP3_4_INT01_END -->'
$Section = @"
$SectionStart
## Adim 3-4 — Video ekrani ve state koprusu

- Durum: CODE_READY_FOR_VSCODE_INTEGRATION
- Tarih: $GeneratedAt
- Kesin ekran: lib\screens\lesson_screen.dart
- Video paketi: video_player ^2.13.0
- Controller koprusu: VideoPlayerPort -> Int01SessionController
- Overlay konumu: Stack / Positioned.fill / son katman
- Aday kod: integration_staging\STEP3_4\lesson_screen.dart
- Aday SHA-256: $CandidateHash
- Mevcut hedef dosya: $TargetStatus
- INT-01 v1.0 ve 50000/+50 ms: PRESERVED
- Bulut veri tabani: PRESERVED
- Yerel veri tabani: NOT_ADDED
- Uretim kaynak degisikligi: YOK; VS Code birlestirmesi bekleniyor
$SectionEnd
"@

$GuideContent = if (Test-Path -LiteralPath $GuidePath) {
    [System.IO.File]::ReadAllText($GuidePath)
} else {
    "# INT-01 Adaptasyon Rehberi`r`n"
}

$Pattern = '(?s)\r?\n?<!-- STEP3_4_INT01_START -->.*?<!-- STEP3_4_INT01_END -->\r?\n?'
$GuideContent = [regex]::Replace($GuideContent, $Pattern, "`r`n")
$GuideContent = $GuideContent.TrimEnd() + "`r`n`r`n" + $Section.Trim() + "`r`n"
[System.IO.File]::WriteAllText($GuidePath, $GuideContent, $Utf8NoBom)

$ResultContent = @"
# Flutter INT-01 Windows Entegrasyon Sonucu

- Sonuc: STEP3_COMPLETE_STEP4_CODE_READY
- Tarih: $GeneratedAt
- Proje: $ProjectRoot
- Iletisim rehberi: INT01_ADAPTATION_GUIDE.md
- Aday kod: integration_staging\STEP3_4\lesson_screen.dart
- Aday SHA-256: $CandidateHash
- Uretim kaynak degisikligi: YOK
- Veritabani degisikligi: YOK

| Is | Durum | Kanit |
|---|---|---|
| 1. Paket analiz duzeltmeleri | COMPLETED | No issues found |
| 2. Rapor ve adaptasyon incelemesi | COMPLETED | Lider karari alindi |
| 3. Kesin video ekrani | COMPLETED | lib\screens\lesson_screen.dart |
| 4. State koprusu kodu | CODE_READY | VideoPlayerPort -> Int01SessionController |
| 4. INT-01 overlay | CODE_READY | Stack icinde Positioned.fill |
| INT-01 v1.0 / 50000 / +50 ms | PRESERVED | Locked asset runtime yuklemesi |
| Bulut veri tabani | PRESERVED | InteractionStateStore disaridan enjekte edilir |
| Yerel veri tabani | NOT_ADDED | Yerel saklama uygulamasi cagrilmadi |
| VS Code birlestirme | PENDING | Mevcut ekran ve bulut adapter imzalariyla birlestirilecek |
| Ana uygulama analyze/test | PENDING | Birlestirme sonrasi calistirilacak |

## Guncel 10 Is Plani

1. Paket analiz hatalarini giderme - TAMAMLANDI
2. Sonuc raporlari ve adaptasyon rehberi - TAMAMLANDI
3. Video ekranini kesinlestirme - TAMAMLANDI
4. State yonetimi koprusu - KOD HAZIR / VSCODE BIRLESTIRMESI BEKLENIYOR
5. INT-01 overlay baglantisi - KOD HAZIR / VSCODE BIRLESTIRMESI BEKLENIYOR
6. Ana uygulama testleri - BEKLEMEDE
7. Debug APK - BEKLEMEDE
8. Wi-Fi cihaz eslestirme - BEKLEMEDE
9. Debug islevsel kabul - BEKLEMEDE
10. Profile zamanlama ve yasam dongusu kabul - BEKLEMEDE
"@

[System.IO.File]::WriteAllText($ResultPath, $ResultContent, $Utf8NoBom)

Write-Host ''
Write-Host 'ADIM 3-4 KOD TESLIMI HAZIRLANDI'
Write-Host "Aday kod: $StagePath"
Write-Host "Adaptasyon rehberi: $GuidePath"
Write-Host "Yeni sonuc raporu: $ResultPath"
Write-Host "SHA-256: $CandidateHash"
