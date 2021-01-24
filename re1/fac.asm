BITS 32

extern printf
extern scanf

section .data
	in: db "%d",0
	out: db "factorial is %d",10,0

section .text
	global main

	main:
	push ebp
	mov ebp,esp

	lea eax,dword[ebp-0x4]
	push eax
	push in
	call scanf

	mov ebx,1
	mov dword[ebp-0x8],1
	pro:
	mov eax,dword[ebp-0x8]
	add ebx,1
	mul ebx
	mov dword[ebp-0x8],eax
	push dword[ebp-0x8]
	push out
	call printf
	cmp ebx,dword[ebp-0x4]
	jl pro

	push dword[ebp-0x8]
	push out
	call printf

	leave
	ret
