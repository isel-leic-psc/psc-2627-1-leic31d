	.text
	.global	pack_date
pack_date:
	sub	$2000, %edi
	mov	%di, %cx
	shl	$7, %esi
	or	%si, %cx
	shl	$11, %edx
	or	%dx, %cx
	mov	%cx, %ax
	ret

	.global	unpack_date
unpack_date:
	mov	%di, %ax
	and	$0b1111111, %ax
	add	$2000, %ax
	mov	%ax, (%rsi)

	mov	%di, %ax
	shr	$7, %ax
	and	$0b1111, %ax
	mov	%ax, (%rdx)

	mov	%di, %ax
	shr	$11, %ax
	and	$0b11111, %ax
	mov	%ax, (%rcx)

	ret

	.data
year:
	.long	2026
month:
	.long	9
day:
	.long	24
	
	.bss
y:
	.long	0
m:
	.long	0
d:
	.long	0


	.text
	.global	main
main:
	mov	year(%rip), %edi
	mov	month(%rip), %esi
	mov	day(%rip), %edx
	call	pack_date

	mov	%ax, %di
	lea	y(%rip), %rsi
	lea	m(%rip), %rdx
	lea	d(%rip), %rcx
	call	unpack_date
	
	ret

	.section .note.GNU-stack

