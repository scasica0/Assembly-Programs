; Name:             Stephen Casica
; Due Date:         4 / 7 / 16
; Class			CS 240
; Compiler:         Visual Studio 2015
; Description:      This program sorts a given array in ascending order

TITLE Homework 5 (casica)
INCLUDE Irvine32.inc

.data
Array BYTE 20, 10, 60, 5, 120, 90, 100, 7, 25, 12
prompt1 BYTE "Unsorted Array: ", 0
prompt2 BYTE "Sorted Array: ", 0
count DWORD ?

.code
main PROC
     mov edx, OFFSET prompt1
     call WriteString              ; print "Unsorted Array:"
	mov esi, OFFSET Array
     mov ecx, LENGTHOF Array
     mov ebx, TYPE Array
	call DumpMem                  ; display original array

     mov esi, 0                    ; set index i to 0
     mov ecx, 10                   ; set outer loop count (length of Array - 1)
L1:
     mov edx, 0                    ; set index j to 0
     mov count, ecx                ; save outer loop count
	mov ecx, 10                   ; set inner loop count

     L2:
          mov ah, [Array + esi]    ; move a[i] to ah
          mov bh, [Array + edx]    ; move a[j] to bh

          cmp ah, bh               ; compare ah with bh
          jnl L3                   ; skip to L3
          mov [Array + esi], bh    ; swap elements a[i] and a[j]
          mov [Array + edx], ah
          mov ah, bh
          L3:
          add edx, 1               ; increment index j by 1
          loop L2                  ; end loop 2

          mov ecx, count           ; restore outer loop count
          add esi, 1               ; increment index i by 1
          loop L1                  ; end loop 1

     mov edx, OFFSET prompt2
     call WriteString              ; print "Sorted Array:"

     mov esi, OFFSET Array
     mov ecx, LENGTHOF Array
     mov ebx, TYPE Array
     call DumpMem                  ; display results of array
     call WaitMsg
	exit
main ENDP
END main

    
