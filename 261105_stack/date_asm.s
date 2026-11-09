	.text
/*
uint16_t pack_date(int year, int month, int day)
{
	uint16_t date = year - 2000;
	date = date | month << 7;
	date = date | day << 11;
	return date;
}


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
*/

	.global	pack_date
pack_date:
	sub	$8, %rsp
	sub	$2000, %edi
	mov	%di, 4(%rsp)
	shl	$7, %esi
	or	%si, 4(%rsp)
	shl	$11, %edx
	or	%dx, 4(%rsp)
	mov	4(%rsp), %ax
	add	$8, %rsp
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
	sub	$16, %rsp
	
	mov	year(%rip), %edi
	mov	month(%rip), %esi
	mov	day(%rip), %edx
	call	pack_date

	mov	%ax, %di
	lea	(%rsp), %rsi	/* é equivalente a mov	%rsp, %rsi */
	lea	4(%rsp), %rdx
	lea	8(%rsp), %rcx
	call	unpack_date
	
	mov	(%rsp), %eax
	
	add	$16, %rsp
	ret

	.section .note.GNU-stack

