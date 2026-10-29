/*

callee saved - r12, r13, r14, r15, rbx, rbp

void sort(struct person array[], size_t array_size)
                         rdi, r12        rsi, r13
{
	for (size_t i = 0; i < array_size - 1; ++i)
		    r14
		for (size_t j = 0; j < array_size - 1 - i; ++j)
		            r15
			if (array[j].number > array[j + 1].number)
				person_swap(&array[j], &array[j + 1]);
}
*/
	.equ	STRUCT_PERSON_SIZE, 44
	.equ	number, 40
	
	.text
	.global sort
sort:
	push	%r12
	push	%r13
	push	%r14
	push	%r15
	mov	%rdi, %r12
	mov	%rsi, %r13
	
	mov	$0, %r14
for1:
	sub	$1, %r13
	cmp	%r14, %r13
	jbe	for1_end
	mov	$0, %r15
for2:
	mov	%r13, %rax
	sub	%r14, %rax
	cmp	%r15, %rax
	jbe	for2_end
				/* 44 = 32 + 8 + 4 = (8 + 2 + 1) * 4 */
	mov	%r15, %rax
	shl	$3, %rax
	mov	%rax, %r8	/* r8 = 8 * j */
	mov	%r15, %rax
	shl	$2, %rax
	add	%rax, %r8	/* r8 = (8 + 2) * j */
	
	lea	(%r8, %r15, 4), %r8	/* ((8 + 2) * j + j ) * 4 */

/*	lea	(%rax, %rbx), %rcx	= add %rax, %rbx, %rcx */
		
	mov	number(%r12, %r8), %eax
	cmp	STRUCT_PERSON_SIZE + number(%r12, %r8), %eax
	jle	if_end
	
	lea	number(%r12, %r8), %rdi
	lea	STRUCT_PERSON_SIZE + number(%r12, %r8), %rsi
	call	person_swap
if_end:
	inc	%r15
	jmp	for2
for2_end:
	inc	%r14
	jmp	for1
for1_end:.note.GNU-stack
	pop	%r15
	pop	%r14
	pop	%r13
	pop	%r12
	ret

	.section .note.GNU-stack
