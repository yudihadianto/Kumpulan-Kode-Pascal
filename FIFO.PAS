program fifo2;
uses crt;
Type

	PoinData=^RecData ;
	RecData= record
	nama :string;
	next :PoinData;
	end;
	Var
	Data, Awal,Ahir : PoinData;
	lg:char;
	x :byte;
	Begin
	new(data);
	awal:=data;
	ahir:=data;
	lg:='Y';
	While Upcase(lg)='Y' Do
	begin
	Clrscr;
	New(Data);
	Write('Nama Mahasiswa : ');Readln(Data^.nama);
	ahir^.next:=data;
	data^.next:=nil;
	ahir:=data;
	Writeln;
	Write('Isi Data Lagi Y/T : ');Readln(lg);
	end;
	Writeln('Tekan Enter..!!');Readln;
	Clrscr;
	writeln('------------------------');
	writeln('| No | Nama Mahasiswa |');
	writeln('|----|-----------------|');
	x:=1;
	Data:=Awal;
	Data:=data^.next;
	While Data<> nil Do
	begin
	writeln('|',X:2,' |',Data^.nama:15,' |');
	Data:=Data^.next;
	X:=X+1
	end;
	writeln('------------------------');
	readln;
	end.
