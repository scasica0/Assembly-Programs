
; Description:      This program uses an improved hashing algorithm on 10 names (arrays) and has 0 collisions.

TITLE Hashing
INCLUDE Irvine32.inc



.data

table_size DWORD 17           ; size of hash table *INCREASED from 11 to 17 to prevent collisions*

str1 DWORD "H","e", "r", "m", "a", "n", " ", "S", "m", "i", "t", "h"
str2 DWORD "L", "o", "u", "i", "e", " ", "J", "o", "n", "e", "s"
str3 DWORD "R", "o", "b", "e", "r", "t", " ", "S", "h", "e", "r", "m", "a", "n"
str4 DWORD "B", "a", "r", "b", "a", "r", "a", " ", "G", "o", "l", "d", "e", "n", "s", "t", "e", "i", "n"
str5 DWORD "J", "o", "h", "n", "n", "y", " ", "U", "n", "i", "t", "a", "s"
str6 DWORD "T", "y", "l", "e", "r", " ", "A", "b", "r", "a", "m", "s"
str7 DWORD "A", "p", "r", "i", "l", " ", "P", "e", "r", "k", "i", "n", "s"
str8 DWORD "W", "i", "l", "l", "i", "a", "m", " ", "J", "o", "n", "e", "s"
str9 DWORD "S", "t", "e", "v", "e", " ", "S", "h", "o", "c", "k", "l", "e", "y"
str10 DWORD "S", "t", "e", "v", "e", " ", "W", "i", "l", "l", "i", "a", "m", "s"

prompt1 BYTE "    Hash Value = ", 0


.code
main PROC

     mov esi, OFFSET str1
     mov ecx, LENGTHOF str1
     call HashFunc
     call DisplayHashValue
   
     mov esi, OFFSET str2
     mov ecx, LENGTHOF str2
     call HashFunc
     call DisplayHashValue

     mov esi, OFFSET str3
     mov ecx, LENGTHOF str3
     call HashFunc
     call DisplayHashValue

     mov esi, OFFSET str4
     mov ecx, LENGTHOF str4
     call HashFunc
     call DisplayHashValue

     mov esi, OFFSET str5
     mov ecx, LENGTHOF str5
     call HashFunc
     call DisplayHashValue

     mov esi, OFFSET str6
     mov ecx, LENGTHOF str6
     call HashFunc
     call DisplayHashValue

     mov esi, OFFSET str7
     mov ecx, LENGTHOF str7
     call HashFunc
     call DisplayHashValue

     mov esi, OFFSET str8
     mov ecx, LENGTHOF str8
     call HashFunc
     call DisplayHashValue

     mov esi, OFFSET str9
     mov ecx, LENGTHOF str9
     call HashFunc
     call DisplayHashValue

     mov esi, OFFSET str10
     mov ecx, LENGTHOF str10
     call HashFunc
     call DisplayHashValue

     call WaitMsg
	exit
main ENDP

;-----------------------------------------------------
HashFunc PROC
;
; Calculates hash value of a string
; Receives: ESI (points to string), ECX (string length)
; Returns: EAX = hash value
;-----------------------------------------------------
     push edx                      ;save edx
     mov eax, 0                    ;set hashvalue to 0
L1: 
     mov edx, esi
     call WriteString
     add eax, [esi]                ;add next character to hash value (EAX)
     shl eax, 3                    ;left bit shift of 3 *ADDED TO PREVENT COLLISIONS*
     add esi, 4                    ;point to next character
     loop L1
                                   
     mov edx,0                     ;perform modulus division on EAX
     div table_size                ;divide hash value by table_size (13)
     mov eax, edx                  ;save remainder in EAX 

     pop edx
     ret
HashFunc ENDP

;-----------------------------------------------------
DisplayHashValue PROC
;
; Displays a message and hash value 
; Receives: EAX = the hash value
; Returns: nothing
;-----------------------------------------------------
     push edx
     mov edx,OFFSET prompt1    
     call WriteString              ;display "   Hash Value = "
     call WriteInt                 ;display hash value
     call Crlf                  
     pop edx
     ret
DisplayHashValue ENDP


END main
