program liloFifo;

uses crt;

procedure FIFO;

type
  point = ^recPoint;
  recPoint = record
    isi : string;
    lanjut : point;
  end;
  var
    nilai, nilaiawal, nilaiakhir : point;
    lagi : char;

    begin
      clrscr;
      new(nilai);
      nilaiawal  := nilai;
      nilaiakhir := nilai;
      lagi := 'Y';

      while upcase (lagi) = 'Y' do
      begin
      new(nilai);
      write ('Masukan Nilai = '); readln(nilai^.isi);
      nilaiakhir^.lanjut := nilai;
      nilai^.lanjut := nil;
      nilaiakhir := nilai;

      write('Tambah data (Y/T)');readln(lagi);
      writeln;
      end;

      writeln('Isi data dengan FIFO');
      writeln('--------------------');
      nilai := nilaiawal;
      while nilai <> nil do
      begin
      writeln(nilai^.isi);
      nilai := nilai^.lanjut;
      end;

readln;
end;

procedure LIFO;

type
  point = ^recPoint;
  recPoint = record
    isi : string;
    lanjut : point;
  end;
  var
    nilai, nilaiawal : point;
    lagi : char;

    begin
      clrscr;
      nilaiawal  := nil;
      lagi := 'Y';

      while upcase (lagi) = 'Y' do
      begin
      new(nilai);
      write ('Masukan Nilai = '); readln(nilai^.isi);

      nilai^.lanjut := nilaiawal;
      nilaiawal := nilai;

      write('Tambah data (Y/T)');readln(lagi);
      writeln;
      end;

      writeln('Isi data dengan LIFO');
      writeln('--------------------');
      nilai := nilaiawal;
      while nilai <> nil do begin
      writeln(nilai^.isi);
      nilai := nilai^.lanjut;
      end;

readln;
end;

procedure NilaiAkhirMahasiswa;

const maks = 100;
type
  recdata = record
    nama : String[15];
    nim  : string[12];
    Kuis,UTS,UAS, NA : real;
  end;
var
  A : array [1..maks] of recdata;
  N,i : integer;

  begin
    clrscr;
    write  ('Masukan Jumlah Mahasiswa yang akan diinputkan = ');readln(N);
    writeln('Masukan Data');
    writeln('-----------------------------------------------');
    for i := 1 to N do begin
      writeln ('Data Mahasiswa ke -', i);
      with A[i] do begin
        write  ('NIM                  = ');readln(NIM);
        write  ('Nama                 = ');readln(nama);
        writeln('Nilai');
        write  ('   Nilai ke-1 (Kuis) = ');readln(kuis);
        write  ('   Nilai ke-2 (UTS)  = ');readln(uts);
        write  ('   Nilai ke-3 (UAS)  = ');readln(uas);

        NA := (0.2*kuis)+(0.3*UTS)+(0.5*UAS);
    end;
    writeln;
    end;

    clrscr;
    gotoxy(1,1); write ('DAFTAR NILAI MAHASISWA');
    gotoxy(1,2); write ('----------------------------------------');
    gotoxy(1,3); write ('NIM           Nama           Nilai Akhir');
    gotoxy(1,4); write ('----------------------------------------');
    for i := 1 to N do begin
      with A[i] do begin
        gotoxy(1,4+i);write(NIM);
        gotoxy(15,4+i);write(Nama);
        gotoxy(30,4+i);write(NA:0:2);
      end;
    end;
    writeln;
    readln
    end;

procedure menu;
  var option : integer;
    begin
  writeln('Pilih program yang ingin dijalankan');
  writeln('1. Program FIFO');
  writeln('2. Program LIFO');
  writeln('3. Program Nilai Akhir Mahasiswa');
  writeln('4. Keluar');
  writeln;
  write  ('Masukan Pilihan = ');readln(option);
  case option of
  1 : FIFO;
  2 : LIFO;
  3 : NilaiAkhirMahasiswa;
  4 : exit;
  end;
  menu
  end;


begin
  clrscr;
    menu
  end.
