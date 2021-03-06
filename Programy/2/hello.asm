	; wersja NASM na system 32-bitowy

	section	.text			; początek sekcji kodu.
	global _start		; linker ld chce mieć ten symbol globalny

	_start:				; punkt startu programu

		mov	eax, 4		; numer funkcji systemowej:
		mov	ebx, 1		; numer pliku, do którego piszemy.
		mov	ecx, czesc	; ECX = adres (offset) tekstu
		mov	edx, czesc_dl	; EDX = długość tekstu
		int	80h		; wywołujemy funkcję systemową
		

		mov	eax, 4		; numer funkcji systemowej:
		mov	ebx, 1		; numer pliku, do którego piszemy.
		mov	ecx, pytanie	; ECX = adres (offset) tekstu
		mov	edx, pytanie_dl	; EDX = długość tekstu
		int	80h		; wywołujemy funkcję systemową

		mov	eax, 3		; czytanie z pliku
		mov	ebx, 0		; z klawiatury
		mov	ecx, imie	; dokąd czytać?
		mov	edx, imie_dl	; ile bajtów czytać?
		int	80h		; wczytujemy


		mov	eax, 4		; numer funkcji systemowej:
		mov	ebx, 1		; numer pliku, do którego piszemy.
		mov	ecx, witaj	; ECX = adres (offset) tekstu
		mov	edx, witaj_dl	; EDX = długość tekstu
		int	80h		; wywołujemy funkcję systemową

		mov	eax, 4		; numer funkcji systemowej:
		mov	ebx, 1		; numer pliku, do którego piszemy.
		mov	ecx, imie	; ECX = adres (offset) tekstu
		mov	edx, imie_dl	; EDX = długość tekstu
		int	80h		; wywołujemy funkcję systemową

		mov	eax, 1		; numer funkcji systemowej
		xor	ebx, ebx	; coś z wczytywaniem z kalwiatury tak myśle xd
		int	80h		; wywołujemy funkcję systemową


	section .data			; początek sekcji danych.

	; nasz napis, który wyświetlimy
	czesc		db	"Cześć",33, 0ah
	czesc_dl 	equ	$ - czesc
	
	; nasz jak masz na imię?
	pytanie		db	"Jak masz na imię? "
	pytanie_dl 	equ 	$ - pytanie

	; rezerwuj 20 bajtów o wartości początkowej zero, na imię
	imie:	times 20 db 0		
	imie_dl	equ	$ - imie
		
	witaj		db	"Witaj, "	;nasz jak masz na imię?
	witaj_dl	equ   	$ - witaj	;dlugosc pytania
	
	
