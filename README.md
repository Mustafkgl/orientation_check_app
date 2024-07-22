# Oryantasyon Kontrol Sistemi Mobil Uygulaması

Bu mobil uygulama, üniversite oryantasyon programı kapsamında öğrencilerin görevlerini takip etmelerini ve görev tamamlanma durumlarını kontrol etmelerini sağlar. Uygulama, öğrenci numarası ile giriş yapılmasını ve görev durumlarının detaylı bir şekilde görüntülenmesini sağlar.

---

## İçindekiler

1. [Proje Hakkında](#proje-hakkında)
2. [Özellikler](#özellikler)
3. [Kullanılan Teknolojiler](#kullanılan-teknolojiler)
4. [Kurulum ve Çalıştırma](#kurulum-ve-çalıştırma)
5. [Kullanım Kılavuzu](#kullanım-kılavuzu)
6. [Ekran Görüntüleri](#ekran-görüntüleri)
7. [Katkıda Bulunma](#katkıda-bulunma)
8. [Lisans](#lisans)

---

## Proje Hakkında

Oryantasyon Kontrol Sistemi, öğrencilerin oryantasyon programındaki görevlerini tamamlamalarını takip etmelerine ve yönetim biriminin bu durumları kolayca kontrol etmelerine olanak tanıyan bir mobil uygulamadır. Öğrenciler, öğrenci numaralarını girerek görev tamamlama durumlarını görebilir ve yöneticiler, tüm öğrencilerin durumlarını detaylı bir şekilde inceleyebilir.

## Özellikler

- **Öğrenci Girişi:** Öğrenci numarası ile giriş yaparak kişisel görev durumu görüntüleme.
- **Görev Takibi:** Her öğrenci için tamamlanmış ve tamamlanmamış görevleri görüntüleme.
- **Tüm Öğrenciler:** Yönetici panelinde tüm öğrencilerin görev tamamlama durumlarını listeleme.
- **Responsive Tasarım:** Hem mobil hem de web üzerinde kullanıcı dostu arayüz.
- **Uyarı Mesajları:** Hatalı girişlerde veya bulunamayan öğrenci durumlarında kullanıcıyı bilgilendiren mesajlar.

## Kullanılan Teknolojiler

- **Flutter:** Uygulamanın temel yapısı ve arayüz tasarımı için kullanılmıştır.
- **Dart:** Flutter'ın kullandığı programlama dili.
- **JSON:** Öğrenci verilerinin depolanması ve yönetimi için kullanılmıştır.
- **Material Design:** Uygulamanın kullanıcı arayüzü tasarımı için.

## Kurulum ve Çalıştırma

### Gereksinimler

- Flutter SDK
- Dart SDK
- Bir IDE (Önerilen: Visual Studio Code veya Android Studio)

### Adımlar

1. **Proje Depo Kopyalama:**

   ```bash
   git clone https://github.com/kullanici_adi/oryantasyon-kontrol-sistemi.git
   cd oryantasyon-kontrol-sistemi
   ```

2. **Bağımlılıkların Yüklenmesi:**

   ```bash
   flutter pub get
   ```

3. **Uygulamayı Çalıştırma:**

   ```bash
   flutter run
   ```

## Kullanım Kılavuzu

### Ana Sayfa

- **Öğrenci Numarası Girişi:** Öğrenci numarasını girerek "Kontrol Et" butonuna basın.
- **Tüm Öğrencileri Gör:** Tüm öğrencilerin görev durumlarını listelemek için "Tüm Öğrencileri Gör" butonuna basın.

### Görev Durumu Ekranı

- Öğrenci numarası girildikten sonra, görev tamamlama durumu gösterilir.
- Tamamlanmış görevler yeşil tik ile, tamamlanmamış görevler kırmızı çarpı ile gösterilir.

### Tüm Öğrenciler Ekranı

- Tüm öğrencilerin görev tamamlama durumu, numara, ad ve soyad bilgileri ile birlikte listelenir.
- Sayfa başına 10 öğrenci gösterilir ve sayfalar arasında geçiş yapılabilir.

## Katkıda Bulunma

Katkıda bulunmak için:

1. Bu depoyu fork'layın.
2. Kendi branch'inizde değişiklik yapın (`git checkout -b yeni-ozellik`).
3. Değişikliklerinizi commit yapın (`git commit -m 'Yeni özellik ekle'`).
4. Branch'inizi push yapın (`git push origin yeni-ozellik`).
5. Bir pull request oluşturun.
