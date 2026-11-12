/*
long use_func8args() {
        long x1 = 1;
        int x2 = 2;
        short x3 = 3;
        char x4 = -4;

        func8args(x1, &x1, x2, &x2, x3, &x3, x4, &x4);
                return (x1 + x2) * (x3 - x4);
}
*/
	.equ	x1, 8
	.equ	x2, 4
	.equ	x3, 2
	.equ	x4, 1
	
	.text
	.global use2_func8args
use2_func8args:
	sub	$16, %rsp
	mov	x1(%rsp), %rdi
	lea	x1(%rsp), %rsi
	mov	x2(%rsp), %edx
	lea	x2(%rsp), %rcx
	mov	x3(%rsp), %r8w
	lea	x3(%rsp), %r9
	
	lea	x4(%rsp), %rax
	push	%rax
	mov	x4(%rsp), %al
	push	%rax
	
	call	func8args
	movsbl	x4(%rsp), %eax
	movswl	x4(%rsp), %ecx	
	sub	%eax, %ecx
	movslq	x2(%rsp), %r10
	add	x1(%rsp), %r10
	movslq	%ecx, %rcx
	imul	%r10, %rcx
	mov	%rcx, %rax
/*	pop	%r8
	pop	%r8
*/	add	$32, %rsp	/* 16 + 8 + 8 */
	ret

	.section .note.GNU-stack
