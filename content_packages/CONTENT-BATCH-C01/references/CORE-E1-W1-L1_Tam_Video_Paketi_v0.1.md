# CORE-E1-W1-L1 — İsmin Merkezini Bul

## Tam Video Üretim Paketi

**Paket sürümü:** 0.1  
**Tarih:** 9 Ağustos 2026  
**Üst görev:** `AI-ENGLISH-CONTENT-001`  
**İçerik ID:** `CORE-E1-W1-L1`  
**Modül:** İsmin Notası  
**Etap/Hafta:** 1. Etap / 1. Hafta  
**Ön seviye:** Pre-A1–A1  
**Hedef kullanıcı:** Türkçe ana dilli, 16+ yaş, İngilizceye yeni başlayan veya temeli dağınık öğrenci  
**Paket durumu:** Üretim taslağı tamamlandı — dil uzmanı ve prototip kullanıcı doğrulaması bekliyor  
**Kaynak belge:** `AI_English_Icerik_Mimarisi_ve_Ilk_Iki_Ders_v0.2.md`

---

## 1. Paket kararı

Bu paket, ilk ders için üretilecek iki bağlantılı videonun eksiksiz içerik ve yapım tarifidir:

1. **Video A — Konuyu Gör ve Çöz:** yaklaşık `06:40`
2. **Video B — Dönüştür ve Kur:** yaklaşık `05:30`

Toplam planlanan video süresi yaklaşık `12:10` olacaktır. Videolar, 18 dakikalık ana dersin içinde kısa etkileşimler, kontrollü alıştırmalar ve çıkış göreviyle birlikte kullanılacaktır. Kullanıcı videoları tek parça izlemek zorunda bırakılmayacak; uygulama kaldığı noktayı koruyacaktır.

Bu sürümde gerçek video, ses kaydı veya animasyon üretilmiş değildir. Paket; üretime aktarılabilir anlatım metni, sahne planı, ekran metinleri, etkileşimler, altyazı metni, varlık listesi ve kabul kapısını içerir.

### Değiştirilemeyecek içerik ilkeleri

- Öğretim dili Türkçe, hedef üretim dili İngilizcedir.
- Öğrenme döngüsü `Gör → Çöz → Dönüştür → Kur` olarak korunur.
- Ana terim **merkez isim**dir.
- İlk örnek `two blue books` ve merkez isim `books` olacaktır.
- Evrensel dilbilgisi, tamamen özgün anlatım ve örneklerle öğretilir.
- Resmî onay olmadan “MEB onaylı” ifadesi kullanılmaz.
- Pilot verisi olmadan seviye veya öğrenme başarısı garantisi verilmez.
- İçerik insan dil editörü kontrolünden geçmeden yayımlanmaz.

---

## 2. Öğrenme sözleşmesi

### Ana hedef

Öğrenci bir İngilizce isim grubunun ne hakkında olduğunu söyleyen merkez ismi bulur; temel ayrıntıları doğru sıraya yerleştirir ve çevresinden en az üç özgün isim grubu kurar.

### Video sonunda beklenen davranışlar

Öğrenci:

1. `two blue books`, `my old phone on the desk` ve benzeri gruplarda merkez ismi seçer.
2. Başlangıç modelini tanır:  
   `Belirleyici → Sayı/Miktar → Sıfat → İsim → Sonraki ayrıntı`
3. `masanın üzerindeki iki temiz fincan` ifadesini `the two clean cups on the table` biçiminde çözümler.
4. Sıfatı temel örneklerde isimden önce; yer ayrıntısını çoğunlukla isimden sonra kullanır.
5. Sayıdan sonra gereken çoğul biçimi fark eder.
6. Çevresindeki üç nesne için anlaşılır İngilizce isim grubu üretir.

### Bu videoda öğretilmeyecekler

- Bütün sıfat sırası kategorileri
- Bütün artikel kuralları ve istisnaları
- Sayılabilir–sayılamayan isimlerin ayrıntılı sistemi
- Relative clause yapıları
- İleri düzey edat ve tamlama istisnaları

Bu konular sonraki derslere bırakılır. İlk videonun amacı güvenli ve sık kullanılan başlangıç düzenini kurmaktır.

---

## 3. Video mimarisi

| Kod | Video | Amaç | Süre | Döngü adımı |
|---|---|---|---:|---|
| `V-A` | Konuyu Gör ve Çöz | Merkez isim ve temel sırayı fark ettirmek | 06:40 | Gör + Çöz |
| `V-B` | Dönüştür ve Kur | Türkçeden İngilizceye dönüşüm ve hata onarımı | 05:30 | Dönüştür + Kur |
| `END-TASK` | Çıkış görevi | Üç özgün isim grubu üretmek | 01:30–02:00 | Kur |

### Uygulama içindeki önerilen sıra

1. Bağlam kartı
2. Video A
3. İki soruluk hızlı kontrol
4. Video B
5. Üç soruluk hızlı kontrol
6. Sesli çıkış görevi
7. Beş soruluk ders mini quizi
8. Sonuç ve kişisel tekrar önerisi

Video içindeki beş etkileşim, bu dersin ana 20 soruluk kontrollü alıştırmasının yerine geçmez. Bunlar izleme sırasında anlam kontrolüdür.

---

## 4. Görsel, ses ve erişilebilirlik sistemi

### 4.1. Prototip görüntü formatı

- Ana format: `1080 × 1920`, dikey `9:16`
- Kare hızı: `30 fps`
- Ekranın orta yüzde 80’lik bölümü ana içerik güvenli alanıdır.
- Alt yüzde 18’lik bölüm uygulama kontrolleri ve altyazı için boş bırakılır.
- Üst yüzde 8’lik bölüm cihaz çentiği ve uygulama başlığı için güvenli tutulur.
- Metinler küçük telefon ekranında yakınlaştırma gerektirmeden okunmalıdır.

### 4.2. Özgün “İsmin Notası” görsel dili

| Görev | Renk | Renk dışı işaret | Örnek |
|---|---|---|---|
| Belirleyici | Mor | Yuvarlatılmış çerçeve | `the`, `my`, `those` |
| Sayı/miktar | Mavi | Üstte nokta sayacı | `two`, `three` |
| Sıfat | Yeşil | Küçük özellik yıldızı | `blue`, `useful` |
| Merkez isim | Turuncu | Altı kalın çift çizgi | `books`, `phone` |
| Sonraki ayrıntı | Gri | Sağa uzanan bağlantı çizgisi | `on the desk` |

Renk tek başına anlam taşımayacaktır. Şekil, ikon ve metin etiketi birlikte kullanılacaktır.

### 4.3. Tipografi

- Türkçe anlatım metni: sade, yüksek okunabilirlikli sans serif
- İngilizce hedef ifadeler: aynı ailede yarı kalın
- Merkez isim: renk + çift alt çizgi + kısa `MERKEZ` etiketi
- Ekranda aynı anda en fazla 12–14 kelime
- Ana İngilizce örnekler en az 52 px; yardımcı metinler en az 36 px

### 4.4. Ses politikası

- Anlatıcı: sıcak, güven veren, yetişkinlere uygun; çocuklaştırmayan ton
- Türkçe anlatım: yaklaşık 125–135 kelime/dakika
- İngilizce örnek: önce doğal hızda, gerektiğinde ikinci kez yüzde 85 hızda
- İngilizce sözcükler Türkçe ses değerleriyle okunmaz.
- Her etkileşimden önce 0,8 saniye sessizlik bırakılır.
- Kullanıcı cevap verdikten sonra geri bildirim sesi 0,25 saniyeyi aşmaz.
- Arka plan müziği yalnız açılış ve kapanışta düşük seviyede kullanılır; kural anlatımı sırasında kapatılır.
- Seslendirme hedef seviyesi: yaklaşık `-16 LUFS`; tepe değeri `-1 dBTP` üzerine çıkmaz.

### 4.5. Erişilebilirlik

- Türkçe altyazı varsayılan olarak açık sunulur.
- İngilizce hedef ifadeler altyazıdan bağımsız olarak ekranda yazılı görünür.
- Altyazı iki satırı geçmez.
- Metin ve arka plan kontrastı en az `4.5:1` hedefler.
- Hızlı yanıp sönme, yalnız renk üzerinden doğru/yanlış gösterimi ve gereksiz kamera hareketi kullanılmaz.
- Etkileşimler dokunma dışında ekran okuyucu etiketi ve klavye odağı alabilecek şekilde modellenir.

---

# 5. Video A — Konuyu Gör ve Çöz

**Dosya kodu:** `CORE-E1-W1-L1-VA`  
**Hedef süre:** `06:40`  
**Ana amaç:** Merkez ismi ve temel isim grubu sırasını fark ettirmek  
**Video içi etkileşimler:** `INT-01`, `INT-02`, `INT-03`

## 5.1. Sahne ve anlatım senaryosu

### Sahne A01 — Günlük bağlam

**Zaman:** `00:00–00:28`  
**Görüntü:** Üstten görülen sade bir çalışma masası. Kırmızı çanta, iki mavi kitap, eski telefon ve bir fincan sırayla hafifçe belirir.  
**Ekran metni:** `Bir nesne mi, bir grup mu?`  
**Seslendirme:**

> Etrafınıza bakın. Bir çanta, kitaplar, telefon… Ama günlük hayatta çoğu zaman yalnız “kitap” demeyiz. Kaç kitap olduğunu, rengini ya da nerede durduğunu da söyleriz. İngilizcede bu ayrıntıları doğru kurmanın ilk adımı, grubun merkezini bulmaktır.

**Kurgu notu:** Nesneler gerçekçi fakat markasız ve özgün illüstrasyon olmalıdır.

### Sahne A02 — İlk keşif

**Zaman:** `00:28–01:08`  
**Görüntü:** İki mavi kitap yakınlaşır. Kelimeler ayrı kartlarla gelir: `two` / `blue` / `books`.  
**Ekran metni:** `two blue books`  
**Seslendirme:**

> Bu gruba bakın: “two blue books”. “Two” bize sayıyı söyler. “Blue” kitapların özelliğini söyler. Peki grubun hangi nesne hakkında olduğunu hangi kelime anlatır?

`00:50` anında video durur ve `INT-01` açılır. Öğrenci yanıtından sonra:

> Doğru cevap “books”. Çünkü sayıyı ve rengi kaldırsak bile elimizde hâlâ kitaplar kalır. Bu yüzden “books”, grubun merkez ismidir.

### Sahne A03 — Merkez isim nedir?

**Zaman:** `01:08–01:58`  
**Görüntü:** `phone` kelimesi turuncu çift çizgiyle gösterilir. Ardından katmanlar eklenir: `old` → `an old phone` → `my old phone on the desk`. Her aşamada `phone` sabit kalır.  
**Ekran metni:** `Merkez isim = grubun ana nesnesi/kişisi`  
**Seslendirme:**

> Bir kelime grubunun ne hakkında olduğunu söyleyen ana kelimeye merkez isim diyeceğiz. Tek başına “phone” bir isimdir. “An old phone” dediğimizde eski olma ayrıntısını ekleriz. “My old phone on the desk” dediğimizde kime ait olduğunu ve nerede bulunduğunu da söyleriz. Ayrıntılar artar, fakat grubun merkezinde “phone” kalır.

> Merkez ismi bulmak için küçük bir yöntem kullanabilirsiniz: Sayıyı, rengi, sahibi ve yeri geçici olarak çıkarın. Geriye hangi kişi ya da nesne kalıyorsa merkez odur.

### Sahne A04 — Ayrıntıları çıkarma testi

**Zaman:** `01:58–02:43`  
**Görüntü:** `my old phone on the desk` kartı gösterilir. `my`, `old` ve `on the desk` sırayla saydamlaşır; `phone` kalır.  
**Ekran metni:** `Ayrıntıları çıkar → merkezi gör`  
**Seslendirme:**

> Şimdi birlikte deneyelim: “my old phone on the desk”. “My” sahipliği, “old” özelliği, “on the desk” yeri anlatıyor. Hepsini geçici olarak çıkarınca hangi kelime kalıyor?

`02:19` anında video durur ve `INT-02` açılır. Öğrenci yanıtından sonra:

> Merkez “phone”. Bu yöntem, daha uzun gruplarda da işinizi kolaylaştırır. Önce ana nesneyi bulun, sonra ayrıntıları onun çevresine yerleştirin.

### Sahne A05 — Temel sıra

**Zaman:** `02:43–03:45`  
**Görüntü:** Beş görev kartı soldan sağa ray üzerine gelir. Her kart renk ve ikonla ayrılır.  
**Ekran metni:**

`Belirleyici → Sayı/Miktar → Sıfat → İsim → Sonraki ayrıntı`

**Seslendirme:**

> Başlangıçta güvenle kullanacağımız sıra şu: belirleyici, sayı ya da miktar, sıfat, isim ve varsa isimden sonraki ayrıntı.

> Örneği birlikte kuralım. “Those” hangi nesnelerden söz ettiğimizi gösterir. “Two” sayıyı verir. “Useful” özelliği söyler. “Books” merkez isimdir. “On the desk” ise yeri açıklar. Sonuç: “those two useful books on the desk”.

> Her bölümün bulunması gerekmez. “A book”, “two books” ya da “useful books” da doğru olabilir. Model, kullanmadığınız bir bölümü zorla eklemenizi istemez; yalnız kullandığınız parçaların yerini gösterir.

### Sahne A06 — Sırayı kur

**Zaman:** `03:45–04:30`  
**Görüntü:** `comfortable`, `chairs`, `those`, `three` kartları karışık görünür. Alt kısımda dört boş yuva vardır.  
**Ekran metni:** `Doğru sırayı kur.`  
**Seslendirme:**

> Şimdi bu dört kelimeyi güvenli başlangıç sırasına yerleştirin: “comfortable”, “chairs”, “those”, “three”. Önce hangi sandalyeler, sonra kaç tane, ardından özellik ve en sonunda merkez isim gelir.

`04:02` anında video durur ve `INT-03` açılır. Öğrenci yanıtından sonra:

> Doğru sıra: “those three comfortable chairs”. “Those” belirleyici, “three” sayı, “comfortable” sıfat ve “chairs” merkez isimdir.

### Sahne A07 — Türkçe ve İngilizce arasındaki yön

**Zaman:** `04:30–05:48`  
**Görüntü:** Üst satırda Türkçe ifade, alt satırda İngilizce ifade gösterilir. Renkli görev eşleşmeleri dikey çizgilerle bağlanır.  
**Ekran metni:**

`masanın üzerindeki iki temiz fincan`  
`the two clean cups on the table`

**Seslendirme:**

> Türkçede bazı uzun ayrıntıları ismin önünde görürüz: “masanın üzerindeki iki temiz fincan”. İngilizcede temel parçaları önce merkez ismin çevresine yerleştiririz. “The” belirleyici, “two” sayı, “clean” sıfat ve “cups” merkez isimdir. Yer ayrıntısı olan “on the table” ise çoğunlukla merkez isimden sonra gelir.

> Bu yüzden doğal başlangıç ifadesi “the two clean cups on the table” olur. Kelimeleri tek tek çevirmek yetmez; parçaların görevini görüp İngilizce sıraya dönüştürmek gerekir.

> Bu derste bütün istisnaları öğrenmeye çalışmıyoruz. Amacımız, günlük örneklerde çalışan güvenli bir temel kurmak: temel sıfat isimden önce, yer ayrıntısı çoğunlukla isimden sonra.

### Sahne A08 — Gör ve çöz özeti

**Zaman:** `05:48–06:40`  
**Görüntü:** Dört adımlı Nota Yolu görünür. İlk iki adım aydınlanır: `Gör` ve `Çöz`. `two blue books`, `my old phone`, `the two clean cups on the table` örnekleri kısa kartlarla geri gelir.  
**Ekran metni:**

- `1. Ana nesneyi bul.`
- `2. Ayrıntıların görevini gör.`
- `3. Parçaları doğru yere koy.`

**Seslendirme:**

> Kısaca toparlayalım. Önce grubun hangi nesne ya da kişi hakkında olduğunu bulun. Bu, merkez isimdir. Sonra sayıyı, özelliği, sahipliği ve yer bilgisini ayırın. İngilizcede başlangıç için belirleyici, sayı, sıfat ve isim sırasını kullanın; yer gibi sonraki ayrıntıları merkez isimden sonra yerleştirin.

> Artık yapıyı gördünüz ve çözdünüz. Sıradaki videoda Türkçe grupları İngilizce sıraya dönüştürecek, hataları onaracak ve kendi örneklerinizi kuracaksınız.

**Kapanış ekranı:** `Sıradaki adım: Dönüştür ve Kur`

---

# 6. Video B — Dönüştür ve Kur

**Dosya kodu:** `CORE-E1-W1-L1-VB`  
**Hedef süre:** `05:30`  
**Ana amaç:** Türkçe–İngilizce dönüşümü uygulamak ve sık hataları onarmak  
**Video içi etkileşimler:** `INT-04`, `INT-05`

## 6.1. Sahne ve anlatım senaryosu

### Sahne B01 — Hızlı hatırlama

**Zaman:** `00:00–00:32`  
**Görüntü:** Beş görev kartı yeniden görünür. Merkez isim kartı kısa bir vuruşla belirginleşir.  
**Ekran metni:** `Gör → Çöz → Dönüştür → Kur`  
**Seslendirme:**

> İlk videoda merkez ismi ve temel sırayı gördük. Şimdi bilgiyi kullanacağız. Her örnekte önce merkezi bulacak, sonra ayrıntıların görevini çözecek, İngilizce sıraya dönüştürecek ve doğru grubu kuracağız.

### Sahne B02 — Örnek 1: Merkez ve yer ayrıntısı

**Zaman:** `00:32–01:25`  
**Görüntü:** Bir odadaki insanları gösteren sade sahne. Kelime kartları: `the people in the room`.  
**Ekran metni:** `the people in the room`  
**Seslendirme:**

> Birinci örnek: “the people in the room”. Grup insanlardan söz ediyor; merkez isim “people”. “The”, hangi insanları kastettiğimizi gösteriyor. “In the room” ise nerede olduklarını açıklıyor ve merkez isimden sonra geliyor.

> Şimdi aynı mantıkla “duvardaki resim” ifadesini kurun. Elinizde “the”, “picture” ve “on the wall” parçaları var. Yer ayrıntısını nereye koymalısınız?

`01:02` anında video durur ve `INT-04` açılır. Öğrenci yanıtından sonra:

> Doğru ifade “the picture on the wall”. Merkez isim “picture”; yer ayrıntısı onun ardından gelir.

### Sahne B03 — Örnek 2: Türkçeden İngilizceye

**Zaman:** `01:25–02:37`  
**Görüntü:** Kırmızı çanta bir odada görünür. Türkçe ifade görev kartlarına ayrılır.  
**Ekran metni:** `odadaki kırmızı çanta`  
**Seslendirme:**

> İkinci örnek: “odadaki kırmızı çanta”. İlk olarak ana nesneyi bulalım: çanta. İngilizce merkez isim “bag”. Özelliği “red”; temel sıfat isimden önce gelir. Hangi çanta olduğunu bildiğimiz bu sahnede “the” kullanıyoruz. Yer ayrıntısı “in the room” ve isimden sonra geliyor. Sonuç: “the red bag in the room”.

> Dönüşümü kelime kelime değil, görev görev yaptık: belirleyici “the”, sıfat “red”, merkez isim “bag”, sonraki ayrıntı “in the room”.

> Şimdi daha uzun bir örneği sesli düşünelim: “masanın üzerindeki üç mavi kitap”. Merkez “books”. Sayı “three”, özellik “blue”, yer “on the table”. Doğal sıra: “the three blue books on the table”.

### Sahne B04 — Örnek 3: Sayı ve çoğul

**Zaman:** `02:37–03:28`  
**Görüntü:** Önce tek kitap, sonra iki kitap gösterilir. `book` sözcüğüne ikinci kitap gelince `s` eklenir.  
**Ekran metni:** `one book → two books`  
**Seslendirme:**

> Sayı birden fazlaysa, sayılabilen isim çoğul olmalıdır. “One book”, ama “two books”. “One meeting”, ama “three meetings”. Bu yüzden “two useful book” ifadesinde bir uyumsuzluk vardır.

> Sadece kelime sırasına değil, sayı ile merkez ismin biçimine de bakın. Sayı “two” ise merkez isim “books” olmalıdır.

### Sahne B05 — Hatayı onar

**Zaman:** `03:28–04:12`  
**Görüntü:** `two useful book` ekranda görünür. Kelimeler sürüklenebilir kartlardır; `book` kartının yanında `s` seçeneği belirir.  
**Ekran metni:** `Hatayı bul ve düzelt.`  
**Seslendirme:**

> Şimdi hatayı siz onarın: “two useful book”. Sıra doğru görünüyor; peki sayı ile isim uyumlu mu?

`03:45` anında video durur ve `INT-05` açılır. Öğrenci yanıtından sonra:

> Doğru ifade “two useful books”. “Two” birden fazla nesne gösterdiği için sayılabilen merkez isim çoğul olur.

### Sahne B06 — Birlikte üç kısa kurulum

**Zaman:** `04:12–05:00`  
**Görüntü:** Üç kart sırayla kurulur; her birinde görev renkleri belirir.  
**Ekran metinleri:**

1. `a small table`
2. `my first English lesson`
3. `those three blue chairs`

**Seslendirme:**

> Üç kısa örnekle tamamlayalım. “Küçük bir masa”: “a small table”. “Benim ilk İngilizce dersim”: “my first English lesson”. “Şu üç mavi sandalye”: “those three blue chairs”.

> Her grupta aynı soruyu sorun: Ana nesne hangisi? Hangi ayrıntılar onu açıklıyor? Bu ayrıntılar İngilizcede merkezden önce mi, sonra mı gelmeli?

### Sahne B07 — Çıkış görevi

**Zaman:** `05:00–05:30`  
**Görüntü:** Kamera tekrar çalışma masasına döner. Üç boş kayıt kartı belirir.  
**Ekran metni:** `Çevrenden 3 nesne seç. Her birine en az 2 ayrıntı ekle.`  
**Seslendirme:**

> Şimdi sıra sizde. Bulunduğunuz yerde üç nesne seçin. Her nesneyi en az iki ayrıntıyla İngilizce söyleyin. Örneğin “my black phone” ya da “two small cups on the table”. Hazır olduğunuzda kayıt düğmesine dokunun. Önce merkezi bulun, sonra notaları doğru sıraya yerleştirin.

**Kapanış:** Video biter; uygulama doğrudan `END-TASK` kayıt ekranına geçer.

---

## 7. Video içi etkileşim paketi

| ID | Zaman | Tür | Soru/görev | Doğru cevap | Hata etiketi |
|---|---:|---|---|---|---|
| `INT-01` | VA `00:50` | Çoktan seçmeli | `two blue books` grubunda merkez hangisi? | `books` | `WORD_ORDER` |
| `INT-02` | VA `02:19` | Kelimeye dokun | `my old phone on the desk` grubunun merkezi | `phone` | `WORD_ORDER` |
| `INT-03` | VA `04:02` | Sürükle–sırala | `comfortable / chairs / those / three` | `those three comfortable chairs` | `WORD_ORDER` |
| `INT-04` | VB `01:02` | Sürükle–sırala | `the / on the wall / picture` | `the picture on the wall` | `WORD_ORDER` |
| `INT-05` | VB `03:45` | Hatayı düzelt | `two useful book` | `two useful books` | `PLURAL_MISMATCH` |

### 7.1. Etkileşim davranışı

- Video soruda otomatik durur.
- Öğrenci yanıt vermeden “devam” düğmesi açılmaz.
- İlk yanlışta doğru cevap gösterilmez; kısa ipucu verilir.
- İkinci yanlışta parçaların görevleri görünür ve öğrenci tekrar dener.
- Üçüncü denemede doğru yanıt, neden açıklamasıyla gösterilir.
- Yanlış sayısı öğrencinin kişisel tekrar planına gönderilir.
- Kullanıcı altyazıyı veya anlatımı yeniden oynatabilir.

### 7.2. Geri bildirim metinleri

#### `INT-01`

- **Doğru:** “Evet. `books` grubun hangi nesne hakkında olduğunu söyler.”
- **İlk yanlış:** “Sayıyı ve rengi çıkar. Geriye hangi nesne kalıyor?”
- **Çözüm:** “`two` sayıyı, `blue` özelliği anlatır; merkez `books` olur.”

#### `INT-02`

- **Doğru:** “Doğru. Sahiplik, özellik ve yer değişse de merkez `phone` kalır.”
- **İlk yanlış:** “`my`, `old` ve `on the desk` ayrıntılarını geçici olarak çıkar.”
- **Çözüm:** “Geriye `phone` kaldığı için merkez isim budur.”

#### `INT-03`

- **Doğru:** “Harika: belirleyici, sayı, sıfat ve merkez isim.”
- **İlk yanlış:** “Önce hangi sandalyeler, sonra kaç tane, ardından özellik.”
- **Çözüm:** “`those → three → comfortable → chairs`.”

#### `INT-04`

- **Doğru:** “Evet. Yer ayrıntısı merkez isimden sonra geldi.”
- **İlk yanlış:** “Önce merkez ismi kur; `on the wall` parçasını ardından dene.”
- **Çözüm:** “`the picture on the wall`.”

#### `INT-05`

- **Doğru:** “Doğru. `two`, çoğul `books` biçimini ister.”
- **İlk yanlış:** “Sıra doğru. Sayı ile merkez ismin biçimine yeniden bak.”
- **Çözüm:** “`two useful books`.”

---

## 8. Çıkış görevi ve ölçme

### Görev

Öğrenci çevresinden üç nesne seçer ve her birini en az iki ayrıntıyla İngilizce söyler. Sistem her kayıt için metin düzeltme ekranı da sunar; konuşma tanıma başarısız olursa öğrenci yanıtı yazabilir.

### Örnekler

- `my black phone`
- `two small cups on the table`
- `a useful book about English`

### Değerlendirme ölçütleri

| Ölçüt | Puan |
|---|---:|
| Merkez isim doğru | 0–2 |
| Sıfat/ayrıntı sırası anlaşılır | 0–2 |
| Tekil–çoğul uyumu doğru | 0–2 |
| En az iki ayrıntı kullanılmış | 0–2 |
| Söyleyiş iletişim açısından anlaşılır | 0–2 |

**Geçiş ölçütü:** Üç yanıttan en az ikisi anlaşılır olmalı ve toplam puan en az `7/10` olmalıdır. Telaffuz ilk derste ikincil ölçüttür; aksan benzerliği puanlanmaz.

### Onarım yönlendirmesi

- Merkez seçim hatası → “Ayrıntıları çıkar” üç soruluk paketi
- Sıfat sırası hatası → `a red bag / a small table / a useful app`
- Çoğul hatası → `one book / two books / three meetings`
- Yer ayrıntısı hatası → `the bag in the room / the book on the table / the picture on the wall`

---

## 9. Ekran grafikleri ve varlık listesi

| Kod | Varlık | Teknik istek | Kullanıldığı sahne |
|---|---|---|---|
| `BG-DESK-01` | Çalışma masası | Özgün, markasız, dikey illüstrasyon | A01, A02, B07 |
| `OBJ-BAG-RED` | Kırmızı çanta | Şeffaf arka plan | A01, B03 |
| `OBJ-BOOK-BLUE-X2` | İki mavi kitap | Tek ve çift durum | A01, A02, B03 |
| `OBJ-PHONE-OLD` | Eski telefon | Marka/logosuz | A01, A03, A04 |
| `OBJ-CUP-CLEAN-X2` | İki temiz fincan | Masa üstü sahneyle uyumlu | A07 |
| `OBJ-CHAIR-BLUE-X3` | Üç mavi sandalye | Tekil/çoğul animasyonuna uygun | A06, B06 |
| `SCENE-ROOM-PEOPLE` | Odadaki insanlar | Farklı yetişkinleri sade biçimde gösteren özgün sahne | B02 |
| `UI-NOTE-CARDS` | Beş görev kartı | Renk + ikon + metin etiketi | A05–A08, B01–B06 |
| `UI-ANSWER-SLOTS` | Sıralama yuvaları | Dört ve beş kartlık varyant | A06, B02, B05 |
| `UI-RECORDER` | Ses kaydı ekranı | Duraklat, yeniden dinle, yeniden kaydet | B07 |

### Dosya adlandırma

- `CORE-E1-W1-L1_VA_master_9x16_v001.mp4`
- `CORE-E1-W1-L1_VB_master_9x16_v001.mp4`
- `CORE-E1-W1-L1_VA_tr-TR_v001.srt`
- `CORE-E1-W1-L1_VB_tr-TR_v001.srt`
- `CORE-E1-W1-L1_interactions_v001.json`
- `CORE-E1-W1-L1_assets_v001/`

---

## 10. Altyazı ana metni — Video A

Aşağıdaki blok üretimde `.srt` dosyasına ayrılacaktır. Zamanlar ilk ses kaydından sonra kare hassasiyetinde yeniden senkronlanmalıdır.

```srt
1
00:00:00,000 --> 00:00:07,500
Etrafınıza bakın. Bir çanta, kitaplar, telefon…

2
00:00:07,500 --> 00:00:15,500
Ama günlük hayatta çoğu zaman yalnız “kitap” demeyiz.

3
00:00:15,500 --> 00:00:28,000
Kaç kitap olduğunu, rengini ya da nerede durduğunu da söyleriz. İlk adım, grubun merkezini bulmaktır.

4
00:00:28,000 --> 00:00:37,500
Bu gruba bakın: “two blue books”.

5
00:00:37,500 --> 00:00:50,000
“Two” sayıyı, “blue” özelliği söyler. Peki ana nesneyi hangi kelime anlatır?

6
00:00:50,000 --> 00:01:08,000
Doğru cevap “books”. Sayıyı ve rengi kaldırsak bile kitaplar kalır. “Books”, merkez isimdir.

7
00:01:08,000 --> 00:01:19,000
Grubun ne hakkında olduğunu söyleyen ana kelimeye merkez isim diyeceğiz.

8
00:01:19,000 --> 00:01:31,500
“Phone”. “An old phone”. “My old phone on the desk”.

9
00:01:31,500 --> 00:01:45,000
Ayrıntılar artar, fakat grubun merkezinde “phone” kalır.

10
00:01:45,000 --> 00:01:58,000
Sayıyı, rengi, sahibi ve yeri çıkarın. Geriye kalan kişi ya da nesne merkezdir.

11
00:01:58,000 --> 00:02:10,000
Şimdi deneyelim: “my old phone on the desk”.

12
00:02:10,000 --> 00:02:19,000
“My” sahipliği, “old” özelliği, “on the desk” yeri anlatıyor.

13
00:02:19,000 --> 00:02:31,000
Merkez “phone”. Önce ana nesneyi bulun, sonra ayrıntıları çevresine yerleştirin.

14
00:02:31,000 --> 00:02:43,000
Bu yöntem daha uzun gruplarda da işinizi kolaylaştırır.

15
00:02:43,000 --> 00:02:54,000
Başlangıç sırası: belirleyici, sayı ya da miktar, sıfat, isim ve sonraki ayrıntı.

16
00:02:54,000 --> 00:03:08,000
“Those” hangi nesneler; “two” sayı; “useful” özellik; “books” merkez isimdir.

17
00:03:08,000 --> 00:03:21,500
“On the desk” yeri açıklar: “those two useful books on the desk”.

18
00:03:21,500 --> 00:03:34,500
Her bölüm bulunmak zorunda değildir. “A book”, “two books” ve “useful books” doğrudur.

19
00:03:34,500 --> 00:03:45,000
Model yalnız kullandığınız parçaların yerini gösterir.

20
00:03:45,000 --> 00:04:02,000
Şimdi “comfortable”, “chairs”, “those”, “three” kelimelerini doğru sıraya yerleştirin.

21
00:04:02,000 --> 00:04:17,000
Doğru sıra: “those three comfortable chairs”.

22
00:04:17,000 --> 00:04:30,000
Belirleyici, sayı, sıfat ve merkez isim.

23
00:04:30,000 --> 00:04:43,000
Türkçede bazı uzun ayrıntıları ismin önünde görürüz.

24
00:04:43,000 --> 00:04:54,500
“Masanın üzerindeki iki temiz fincan.”

25
00:04:54,500 --> 00:05:08,500
İngilizcede “the” belirleyici, “two” sayı, “clean” sıfat ve “cups” merkez isimdir.

26
00:05:08,500 --> 00:05:21,000
“On the table” yer ayrıntısıdır ve merkez isimden sonra gelir.

27
00:05:21,000 --> 00:05:34,000
Doğal ifade: “the two clean cups on the table”.

28
00:05:34,000 --> 00:05:48,000
Kelimeleri tek tek değil, görevlerini görerek İngilizce sıraya dönüştürürüz.

29
00:05:48,000 --> 00:06:01,000
Önce grubun hangi kişi ya da nesne hakkında olduğunu bulun. Bu, merkez isimdir.

30
00:06:01,000 --> 00:06:15,000
Sonra sayıyı, özelliği, sahipliği ve yer bilgisini ayırın.

31
00:06:15,000 --> 00:06:28,000
Belirleyici, sayı, sıfat ve isim sırasını kullanın; yer ayrıntısını isimden sonra koyun.

32
00:06:28,000 --> 00:06:40,000
Artık yapıyı gördünüz ve çözdünüz. Sırada “Dönüştür ve Kur” var.
```

---

## 11. Altyazı ana metni — Video B

```srt
1
00:00:00,000 --> 00:00:12,000
İlk videoda merkez ismi ve temel sırayı gördük. Şimdi bilgiyi kullanacağız.

2
00:00:12,000 --> 00:00:23,000
Önce merkezi bulacak, sonra ayrıntıların görevini çözeceğiz.

3
00:00:23,000 --> 00:00:32,000
Ardından İngilizce sıraya dönüştürüp doğru grubu kuracağız.

4
00:00:32,000 --> 00:00:43,000
Birinci örnek: “the people in the room”.

5
00:00:43,000 --> 00:00:54,000
Grup insanlardan söz ediyor; merkez isim “people”.

6
00:00:54,000 --> 00:01:02,000
“In the room” nerede olduklarını açıklıyor.

7
00:01:02,000 --> 00:01:13,000
“Duvardaki resim” ifadesinin doğru biçimi “the picture on the wall”.

8
00:01:13,000 --> 00:01:25,000
Merkez “picture”; yer ayrıntısı onun ardından gelir.

9
00:01:25,000 --> 00:01:36,000
İkinci örnek: “odadaki kırmızı çanta”. Ana nesne çantadır.

10
00:01:36,000 --> 00:01:49,000
İngilizce merkez isim “bag”. Özelliği “red”; sıfat isimden önce gelir.

11
00:01:49,000 --> 00:02:02,000
Bu sahnede “the” kullanıyoruz. Yer ayrıntısı “in the room”dur.

12
00:02:02,000 --> 00:02:14,000
Sonuç: “the red bag in the room”.

13
00:02:14,000 --> 00:02:25,500
Dönüşümü kelime kelime değil, görev görev yaptık.

14
00:02:25,500 --> 00:02:37,000
“Masanın üzerindeki üç mavi kitap”: “the three blue books on the table”.

15
00:02:37,000 --> 00:02:49,000
Sayı birden fazlaysa sayılabilen isim çoğul olmalıdır.

16
00:02:49,000 --> 00:03:01,000
“One book”, ama “two books”. “One meeting”, ama “three meetings”.

17
00:03:01,000 --> 00:03:15,000
“Two useful book” ifadesinde sayı ile isim uyumsuzdur.

18
00:03:15,000 --> 00:03:28,000
Sayı “two” ise merkez isim “books” olmalıdır.

19
00:03:28,000 --> 00:03:45,000
Şimdi hatayı siz onarın: “two useful book”. Sayı ile isim uyumlu mu?

20
00:03:45,000 --> 00:03:57,000
Doğru ifade “two useful books”.

21
00:03:57,000 --> 00:04:12,000
“Two” birden fazla nesne gösterdiği için merkez isim çoğul olur.

22
00:04:12,000 --> 00:04:25,000
Üç kısa örnek: “a small table”.

23
00:04:25,000 --> 00:04:36,000
“My first English lesson”.

24
00:04:36,000 --> 00:04:48,000
“Those three blue chairs”.

25
00:04:48,000 --> 00:05:00,000
Ana nesneyi bulun ve ayrıntıların merkezden önce mi, sonra mı geleceğini düşünün.

26
00:05:00,000 --> 00:05:12,000
Şimdi çevrenizden üç nesne seçin. Her birini en az iki ayrıntıyla söyleyin.

27
00:05:12,000 --> 00:05:21,000
Örneğin “my black phone” ya da “two small cups on the table”.

28
00:05:21,000 --> 00:05:30,000
Önce merkezi bulun, sonra notaları doğru sıraya yerleştirin.
```

---

## 12. Üretim teslim listesi

### Ön üretim

- [x] Öğrenme hedefleri tanımlandı.
- [x] İki videolu yapı ve süre hedefleri tanımlandı.
- [x] Tam Türkçe seslendirme metni yazıldı.
- [x] İngilizce örnekler kaynak dersle eşleştirildi.
- [x] Sahne ve ekran metinleri yazıldı.
- [x] Beş etkileşim ve geri bildirim dalları yazıldı.
- [x] Altyazı ana metinleri yazıldı.
- [x] Varlık listesi ve adlandırma standardı yazıldı.
- [ ] İngilizce doğal kullanım/dil uzmanı kontrolü tamamlanacak.
- [ ] Türkçe anlatım editörü kontrolü tamamlanacak.
- [ ] Özgünlük kontrolü tamamlanacak.

### Üretim

- [ ] Stil karesi hazırlanacak.
- [ ] Masa sahnesi ve nesne çizimleri üretilecek.
- [ ] Nota kartı bileşenleri üretilecek.
- [ ] Türkçe ses kaydı alınacak.
- [ ] İngilizce örneklerin telaffuz kontrolü yapılacak.
- [ ] Video A animasyon ve kurgusu tamamlanacak.
- [ ] Video B animasyon ve kurgusu tamamlanacak.
- [ ] Etkileşim zaman kodları uygulamaya işlenecek.
- [ ] İlk ses kaydına göre SRT zamanları kesinleştirilecek.

### Son üretim

- [ ] Ses yüksekliği ve gürültü kontrolü yapılacak.
- [ ] Altyazı–ses senkronu kontrol edilecek.
- [ ] 360×640 eşdeğer küçük ekran okunabilirliği test edilecek.
- [ ] Android ve iOS video oynatma testi yapılacak.
- [ ] Çevrimdışı/yarım kalan video devam davranışı test edilecek.
- [ ] Ana kullanıcı denemesi tamamlanacak.
- [ ] Bulgularla `v0.2` revizyonu hazırlanacak.

---

## 13. Kabul kapısı

Bu paket aşağıdaki koşulların tamamı sağlanmadan **“uygulamaya hazır video”** sayılmaz:

| Kapı | Kabul ölçütü | Mevcut durum |
|---|---|---|
| Pedagojik kapsam | Kazanımlar, video içi sorular ve çıkış görevi birbiriyle uyumlu | Taslak PASS |
| Dil doğruluğu | Bütün İngilizce örnekler uzman dil editöründen geçer | Bekliyor |
| Doğal Türkçe | Anlatım açık, kısa ve yetişkin kullanıcıya uygun bulunur | Bekliyor |
| Özgünlük | Metin, görseller, sahne düzeni ve örnekler bağımsızdır | Kontrol bekliyor |
| Süre | VA 5–7 dk; VB 4–6 dk aralığında kalır | Metin üstünden PASS |
| Etkileşim | Beş soru durur, yanıt alır, hata dalını kaydeder ve devam eder | Uygulama testi bekliyor |
| Ses | Konuşma anlaşılır; İngilizce telaffuz doğrulanmış; seviye uygun | Kayıt bekliyor |
| Altyazı | Metin eksiksiz; iki satırı aşmaz; zaman kayması en fazla 250 ms | Kayıt bekliyor |
| Mobil görünüm | Küçük ekranda metin, dokunma alanı ve güvenli alan sorunsuz | Prototip bekliyor |
| Öğrenen testi | Ana kullanıcı, merkez ismi bulup iki özgün doğru grup kurar | Bekliyor |

### Pilot başarı göstergeleri

İlk ana kullanıcı denemesinde:

- `INT-01` ve `INT-02` merkez isim sorularında en az `%80` başarı
- Beş video içi soruda en az `4/5`
- Çıkış görevinde en az iki anlaşılır isim grubu
- “Merkez isim nedir?” sorusuna kendi cümlesiyle açıklama
- Video A’yı terk etmeden bitirme veya kaldığı yerden sorunsuz devam etme

Bu göstergeler ürün başarısı garantisi değildir; prototipin anlaşılabilirliğini ölçmek için başlangıç eşiğidir.

---

## 14. Sürüm kararı ve değişiklik kaydı

### `v0.1`

- İki videolu prototip mimarisi oluşturuldu.
- Toplam yaklaşık 12 dakika 10 saniyelik anlatım ve uygulama akışı yazıldı.
- Beş video içi etkileşim tanımlandı.
- Mobil dikey görsel sistem ve erişilebilirlik kuralları belirlendi.
- İki altyazı ana metni hazırlandı.
- Üretim ve kabul kapıları oluşturuldu.

### Sonraki sürümün koşulu

`v0.2`, yalnız dil editörü incelemesi, ilk ses denemesi ve zamanlama provası sonucunda hazırlanacaktır. Görsel üretim ve video kurgu, dil metni onayından sonra başlayacaktır.

---

## 15. Öncelikli sonraki 10 iş

1. Paket içindeki İngilizce örneklerin dil uzmanı kontrolünü tamamlamak.
2. Türkçe anlatımın doğal konuşma ve süre provasını yapmak.
3. Video A ve B için birer stil karesi hazırlamak.
4. Özgün “İsmin Notası” kart bileşenlerini kesinleştirmek.
5. Masa, nesne ve oda görsellerini üretmek.
6. Geçici Türkçe ses kaydıyla animatik oluşturmak.
7. Altyazı zamanlarını gerçek ses kaydına göre düzeltmek.
8. Beş etkileşimi mobil prototipe bağlamak.
9. Ana kullanıcıyla ilk anlaşılabilirlik testini yapmak.
10. Test bulgularına göre paketi `v0.2` olarak revize etmek; ardından ikinci dersin video paketine geçmek.

