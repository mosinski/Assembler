; Program witający się z użytkownikiem po imieniu
	;
	; Autor: Bogdan D.
	; kontakt: bogdandr (at) op (dot) pl
	;
	; kompilacja:
	; nasm -f elf czesc.asm
	; ld -s -o czesc czesc.o
	;
	; kompilacja FASM:
	; fasm czesc.asm czesc

	; dla FASMa:
	;format ELF executable
	;entry _start

	;segment readable executable		; początek sekcji kodu

	; dla NASMa:
	section .text		; początek sekcji kodu
	global _start	; _start będzie symbolem globalnym,
			; od którego zacznie się wykonywanie programu

	_start:
		mov	eax, 4		; zapis do pliku
		mov	ebx, 1		; na ekran
		mov	ecx, jak_masz	; napis do wyświetlenia: pytanie
		mov	edx, jak_masz_dl	; długość napisu
		int	80h		; wyświetlamy

		mov	eax, 3		; czytanie z pliku
		mov	ebx, 0		; z klawiatury
		mov	ecx, imie	; dokąd czytać?
		mov	edx, imie_dl	; ile bajtów czytać?
		int	80h		; wczytujemy


		mov	eax, 4		; zapis do pliku
		mov	ebx, 1		; na ekran
		mov	ecx, czesc	; napis do wyświetlenia: "cześć"
		mov	edx, czesc_dl	; długość napisu
		int	80h		; wyświetlamy

		mov	eax, 4		; zapis do pliku
		mov	ebx, 1		; na ekran
		mov	ecx, imie	; napis do wyświetlenia: imię
		mov	edx, imie_dl	; długość napisu
		int	80h		; wyświetlamy

		mov	eax, 1
		xor	ebx, ebx
		int	80h

	; dla FASMa:
	;segment readable writeable		; początek sekcji danych

	section .data		; początek sekcji danych

	jak_masz	db	"Jak masz na imie? "
	; FASM: znak równości zamiast EQU
	jak_masz_dl	equ	$ - jak_masz

	; rezerwuj 20 bajtów o wartości początkowej zero, na imię
	imie:		times 20 db 0
	; FASM: znak równości zamiast EQU
	imie_dl		equ	$ - imie

	czesc		db	"Czesc "
	; FASM: znak równości zamiast EQU
	czesc_dl	equ	$ - czesc
