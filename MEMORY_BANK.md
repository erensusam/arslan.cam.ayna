# Memory Bank

## Proje
- Ad: ArslanCamAyna
- Tip: Flutter (Web + Windows + Android)
- Olusturma Tarihi: 2026-05-05

## Hedef
- Baslangic seviyesinde, adim adim yonlendirme ile calisan bir web sitesi/projesi cikarmak.
- Teknik sorumluluk: Codex (asistan)

## Ortam Durumu
- Git: Kurulu
- Flutter: `C:\Users\erens\development\flutter` yolu ile calisiyor
- Not: `Program Files` altindaki Flutter yerine kullanici dizinindeki Flutter kullaniliyor.

## Yapilanlar
1. Proje klasoru kontrol edildi (bos).
2. Flutter ve Git durumu kontrol edildi.
3. Flutter projesi olusturuldu (`flutter create`).
4. Bu Memory Bank dosyasi olusturuldu.
5. Platform dogrulama tamamlandi:
   - `flutter build web` basarili
   - `flutter build windows` basarili
   - `flutter build apk` basarili
6. Git deposu baslatildi ve ilk commit atildi (`main` branch).

## Siradaki Adimlar
1. GitHub remote ekleme.
2. `git push -u origin main` ile uzak depoya gonderme.
3. Ilk ekran (anasayfa) tasarimi ve iceriklerini ekleme.

## Komut Kisa Notlari
- Flutter komutlarinda kullanilan yol:
  - `C:\Users\erens\development\flutter\bin\flutter.bat`

## Hata Kayitlari
- `Program Files` altindaki Flutter komutu timeout verdi.
- Cozum: kullanici dizinindeki Flutter SDK kullanildi.
- `flutter doctor` PATH uyarisi verdi.
- Cozum plani: `C:\Users\erens\development\flutter\bin` yolunu PATH'te en uste almak.
