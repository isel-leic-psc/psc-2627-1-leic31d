/*
long x1 = 1;
int x2 = 2;
short x3 = 3;
char x4 = -4;
*/
	.data
x1:
	.quad	1
x2:
	.long	2
x3:
	.word	3
x4:
	.byte	-4
/*
long use_func8args() {
    func8args(x1, &x1, x2, &x2, x3, &x3, x4, &x4);
	return (x1 + x2) * (x3 - x4);
}
*/
	.text
	.global use_func8args
use_func8args:
	mov	x1(%rip), %rdi
	lea	x1(%rip), %rsi
	mov	x2(%rip), %edx
	lea	x2(%rip), %rcx
	mov	x3(%rip), %r8w
	lea	x3(%rip), %r9
	lea	x4(%rip), %rax
	push	%rax
	mov	x4(%rip), %al
	push	%rax
	call	func8args
	movsbl	x4(%rip), %eax
	movswl	x4(%rip), %ecx	
	sub	%eax, %ecx
	movslq	x2(%rip), %r10
	add	x1(%rip), %r10
	movslq	%ecx, %rcx
	imul	%r10, %rcx
	mov	%rcx, %rax
/*	pop	%r8
	pop	%r8
*/	add	$16, %rsp
	ret
	
	.section .note.GNU-stack
