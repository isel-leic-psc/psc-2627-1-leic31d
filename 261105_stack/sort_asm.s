/*
void sort(void *array, size_t elem_size, size_t array_size,
                rdi, r12      rsi, r13          rdx, r14
		int (*cmp)(void *, void *));
			  rcx, r15
{
	for (size_t i = 0; i < array_size - 1; ++i)
	            rbx
		for (size_t j = 0; j < array_size - 1 - i; ++j)
					rbp
			if (cmp((char *)array + j * elem_size, (char *)array + (j + 1) * elem_size) > 0)
				swap((char *)array + j * elem_size, (char *)array + (j + 1) * elem_size, elem_size);
}

callee saved - r12, r13, r14, r15, rbx, rbp
*/
	.text
	.global	sort
sort:
	push	%r12
	push	%r13
	push	%r14
	push	%r15
	push	%rbx
	push	%rbp
	
	mov	%rdi, %r12
	mov	%rsi, %r13
	mov	%rdx, %r14
	mov	%rcx, %r15
	
	mov	$0, %rbx
	sub	$1, %r14
for1:
	cmp	%rbx, %r14
	jbe	for1_end
	mov	$0, %rbp
for2:
	mov	%r14, %rax
	sub	%rbx, %rax
	cmp	%rbp, %rax
	jbe	for2_end
	
	mov	%rbp, %rax
	mul 	%r13
	lea	(%r12, %rax), %rdi
	lea	(%rdi, %r13), %rsi
	call	*%r15
	cmp	$0, %eax	/*	%eax	*/
	jle	if_end

	mov	%rbp, %rax
	mul 	%r13
	lea	(%r12, %rax), %rdi
	lea	(%rdi, %r13), %rsi
	mov	%r13, %rdx
	call	swap
if_end:
	inc	%rbp
	jmp	for2
for2_end:
	inc	%rbx
	jmp	for1
for1_end:
	pop	%rbp
	pop	%rbx
	pop	%r15
	pop	%r14
	pop	%r13
	pop	%r12
	ret
/*
void person_swap(struct person *a, struct person *b)
 {
	struct person tmp = *a;
	*a = *b;
	*b = tmp;
}
*/
	.global person_swap
person_swap:
	push	%r12
	push	%r13
	mov	%rdi, %r12
	mov	%rsi, %r13
	sub	$48, %rsp
/*	
	mov	(%rdi), %rax
	mov	%rax, (%rsp)
	mov	8(%rdi), %rax
	mov	%rax, 8(%rsp)
	mov	16(%rdi), %rax
	mov	%rax, 16(%rsp)
	mov	24(%rdi), %rax
	mov	%rax, 24(%rsp)	
	mov	32(%rdi), %rax
	mov	%rax, 32(%rsp)
	mov	40(%rdi), %eax
	mov	%eax, 40(%rsp)
*/
	mov	$44, %rdx
	mov	%r12, %rsi
	mov	%rsp, %rdi
	call	memcpy

	mov	$44, %rdx
	mov	%r13, %rsi
	mov	%r12, %rdi
	call	memcpy
	
	mov	$44, %rdx
	mov	%rsp, %rsi
	mov	%r12, %rdi
	call	memcpy

	add	$48, %rsp
	pop	%r13
	pop	%r12
	ret
/*
void swap(void *a, void *b, size_t elem_size)
{
	char tmp[elem_size];
	memcpy(tmp, a, elem_size);
	memcpy(a, b, elem_size);
	memcpy(b, tmp, elem_size);
}
*/
	.global swap
swap:
	push	%r12
	push	%r13
	push	%r14
	push	%rbp
	
	mov	%rsp, %rbp
	
	mov	%rdi, %r12
	mov	%rsi, %r13
	mov	%rdx, %r14
	
	add	$7, %rdx
	and	$~7, %rdx
	sub	%rdx, %rsp

	mov	%r14, %rdx
	mov	%rsp, %rdi
	mov	%r12, %rsi
	call	memcpy

	mov	%r14, %rdx
	mov	%r12, %rdi
	mov	%r13, %rsi
	call	memcpy
	
	mov	%r14, %rdx
	mov	%rsp, %rsi
	mov	%r13, %rdi
	call	memcpy

	mov	%rbp, %rsp
	
	pop	%rbp
	pop	%r14
	pop	%r13
	pop	%r12
	ret
	
	.section .note.GNU-stack




