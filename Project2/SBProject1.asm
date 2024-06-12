; XYProject1.asm
; Example file name for John L. Smith would be JSProject1.asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
left        DWORD  3799              ; 4 most significant digits of student ID
right       DWORD  078                ; 3 least significant digits of student ID
message     db    'Hello World!',0  ; Character string
numbers     DWORD  1, 2, 4, 8, 16, 32, 64 ; Array of DWORDs
arrayLength DWORD  7                 ; Length of the numbers array

.data?
total       DWORD ?
diff        DWORD ?

.code
main PROC
    ; Calculate total = left + right
    mov     eax, left          ; Move left into EAX
    add     eax, right         ; Add right to EAX
    mov     total, eax         ; Store the result in total

    ; Calculate diff = |left - right|
    mov     eax, left          ; Move left into EAX
    sub     eax, right         ; Subtract right from EAX
    jns     positive           ; If result is non-negative, jump to positive
    neg     eax                ; Otherwise, negate EAX to get positive difference
positive:
    mov     diff, eax          ; Store the result in diff
    ; Move variables into registers
    mov     eax, total         ; Move total into EAX
    mov     ebx, diff          ; Move diff into EBX
    mov     ecx, total         ; Move total into ECX
    mov     edx, diff          ; Move diff into EDX
    mov     esi, arrayLength   ; Move arrayLength into ESI

    ; Exit program
    invoke ExitProcess, 0

main ENDP
END main
