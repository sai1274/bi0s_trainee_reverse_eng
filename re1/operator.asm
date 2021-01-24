BITS 32

extern scanf
extern printf

section .data
	in: db "%d",0
	sum: db "sum is %d",10,0
	sub: db "subtraction is %d",10,0
	mult: db "multiplication is %d",10,0
	div: db "remainder is %d",10,0
	quo: db "quotient is %d",10,0

section .text
	global main

	main:
	push ebp
	mov ebp,esp

	lea eax,[ebp-0x4]
	push eax
	push in
	call scanf

	lea eax,[ebp-0x8]
	push eax
	push in
	call scanf

	mov ebx,dword[ebp-0x4]
	mov eax,dword[ebp-0x8]
	add eax, ebx

	mov dword[ebp+0x8],eax
	push dword[ebp+0x8]
	push sum
	call printf

	mov ebx,dword[ebp-0x4]
	mov eax,dword[ebp-0x8]
	sub ebx,eax
	
	mov dword[ebp+0x8],ebx
	push dword[ebp+0x8]
	push sub
	call printf
	
	mov ebx,dword[ebp-0x4]
	mov eax,dword[ebp-0x8]
	mul ebx
	mov dword[ebp+0x8],eax
	push dword[ebp+0x8]
	push mult
	call printf	
	
	mov edx,0
	mov eax, dword[ebp-0x4]
	mov ecx,dword[ebp-0x8]
	div ecx
	mov dword[ebp+0x4],eax
	mov dword[ebp+0x8],edx
	push dword[ebp+0x8]
	push div
	call printf

	push dword[ebp+0x4]
	push quo 
	call printf
	
	leave
	ret
