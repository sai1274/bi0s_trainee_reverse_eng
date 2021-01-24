BITS 32

extern printf
extern scanf

section .data
	in: db "%d",0
	outp1: db "%d is prime",10,0
	outnp1: db "%d is not prime",10,0

section .text
	global main

	main:
	push ebp
	mov ebp,esp

	lea eax,[ebp-0x4]
	push eax
	push in
	call scanf

	mov dword[ebp-0x8],0
	mov dword[ebp+0x4],1
	check:
	mov edx,0
	mov eax,dword[ebp-0x4]
	mov ecx,dword[ebp+0x4]
	div ecx
	cmp edx,0
	je fac
	cmp edx,0
	jne check
	fac:
	add dword[ebp-0x8],1
	mov eax,dword[ebp+0x4]
	cmp eax, dword[ebp-0x4]
	je primeornot
	cmp eax, dword[ebp-0x4]
	jne check
	primeornot:
	cmp dword[ebp-0x8],2
	je outp
	cmp dword[ebp-0x8],2
	jne outnp
	outp:
	push dword[ebp-0x4]
	push outp1
	call printf
	outnp:
	push dword[ebp-0x4]
	push outnp1
	call printf

	leave
	ret

