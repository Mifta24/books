# Tugas Flutter Books

## Deskripsi Proyek

Proyek Flutter yang mendemonstrasikan operasi asynchronous dan integrasi API.

## Laporan Praktikum

### Soal no 1

```dart
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Miftah',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: const FuturePage(),
  );
}
```

### Soal no 2

Implementasi pencarian buku menggunakan Google Books API.
[Lihat Contoh Buku Spider-Man](https://www.google.co.id/books/edition/SpiderMan/RYI0DwAAQBAJ)

![Hasil Pencarian Buku](/images/soal-2.png)

### Soal no 3

```dart
setState(() {
  getData().then((value) {
    result = value.body
        .toString()
        .substring(0, 450);
    setState(() {});
  }).catchError((_) {
    result = 'An error occurred';
    setState(() {});
  });
});
```

#### Penjelasan:

- **Implementasi Substring**: Mengambil 450 karakter pertama dari respons
- **Catch Error**: Menangani kegagalan API dengan baik
- **Set State**: Memperbarui UI secara tepat

#### Demo

![Capture no 3](/images/capture%20no%203.gif)

### Soal no 4

#### Langkah 1

```dart
Future<int> returnOneAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 1;
}

Future<int> returnTwoAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 2;
}

Future<int> returnThreeAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 3;
}
```

#### Langkah 2

```dart
Future count() async {
  int total = 0;
  total += await returnOneAsync();
  total += await returnTwoAsync();
  total += await returnThreeAsync();
  setState(() {
    result = total.toString();
  });
}
```

#### Penjelasan:

- **Fungsi returnOneAsync()**: untuk mengembalikan nilai 1 setelah 3 detik
- **Fungsi returnTwoAsync()**: untuk mengembalikan nilai 2 setelah 3 detik
- **Fungsi returnThreeAsync()**: untuk mengembalikan nilai 3 setelah 3 detik
- **Future count() async**: Fungsi count() untuk menjumlahkan nilai yang dikembalikan oleh fungsi returnOneAsync(), returnTwoAsync(), dan returnThreeAsync(). Menggunakan setState() untuk memperbarui UI dengan hasil total
  Hasil akhir dikonversi ke string dan disimpan dalam variabel result

#### Demo

![Capture no 4](/images/capture%20no%204.gif)

### Soal No 5

#### Langkah 2

```dart
late Completer completer;

Future getNumber() {
  completer = Completer<int>();
  calculate();
  return completer.future;
}

Future calculate() async {
  await Future.delayed(const Duration(seconds : 5));
  completer.complete(42);
}
```

#### Penjelasan:

- **late Completer**: Menggunakan keyword late karena akan diinisialisasi nanti. Completer adalah class untuk mengelola Future secara manual
- **Fungsi getNumber()**: Membuat Completer baru yang akan menghasilkan nilai integer. Memanggil fungsi calculate() secara async. Mengembalikan Future yang akan selesai ketika Completer complete
- **Fungsi calculate()**: Fungsi async dengan delay 5 detik
  Setelah delay, menyelesaikan Completer dengan nilai 42

#### Demo

![Capture no 5](/images/capture%20no%205.gif)

### Soal No 6

#### Langkah 5-6

```dart
calculate() async {
  try {
    await Future.delayed(const Duration(seconds: 5));
    completer.complete(42);
  } catch (_) {
    completer.completeError({});
  }
}

getNumber().then((value) {
  setState(() {
    result = value.toString();
  });
}).catchError((e) {
  result = 'An error occurred';
});
```

#### Penjelasan:

- **Perbedaan**:

1. Penanganan Error

- Sebelumnya: Tidak ada penanganan error secara eksplisit
- Sekarang: Menggunakan try-catch untuk menangkap error yang mungkin terjadi

2. Complete Error

- Sebelumnya: Hanya bisa complete dengan nilai sukses (42)
- Sekarang: Bisa complete dengan:
  - Sukses: completer.complete(42)
  - Error: completer.completeError({})
- **Fungsi getNumber()**:
- Dapat menangkap error yang di-propagate dari calculate()
- Menampilkan pesan error ke UI jika terjadi kesalahan

#### Demo

![Capture no 6](/images/capture%20no%206.gif)

### Soal No 7

#### Demo

![Capture no 7](/images/capture%20no%207.gif)

### Soal No 8

#### Perbedaan Langkah 1 & 4

```dart
// Langkah 1
void returnFG() {
    FutureGroup<int> futureGroup = FutureGroup<int>();
    futureGroup.add(returnOneAsync());
    futureGroup.add(returnTwoAsync());
    futureGroup.add(returnThreeAsync());
    futureGroup.close();
    futureGroup.future.then((List<int> value) {
      int total = 0;
      for (var element in value) {
        total += element;
      }
      setState(() {
        result = total.toString();
      });
    });
}

// Langkah 4
final futures = Future.wait<int>([
  returnOneAsync(),
  returnTwoAsync(),
  returnThreeAsync(),
]);


```

#### Penjelasan:

- **Perbedaan**:

1. Fleksibilitas:

- FutureGroup: Bisa menambah Future secara dinamis
- Future.wait: Future harus ditentukan saat deklarasi

2. Sintaks:

- FutureGroup: Perlu inisialisasi, penambahan, dan penutupan (close)
- Future.wait: Lebih ringkas dengan satu baris kode

3. Use Case:

- FutureGroup: Cocok untuk skenario dinamis
- Future.wait: Cocok untuk skenario statis

### Soal No 9

#### Demo
![Capture no 9](/images/capture%20no%209.gif)

