	.file	"count_ones.c"
	.text
	.globl	count_ones
	.type	count_ones, @function
count_ones:
.LFB0:
	.cfi_startproc
	endbr64
	movl	$0, %eax
	jmp	.L2
	.p2align 4
.L3:
	movl	%edi, %edx
	andl	$1, %edx
	addl	%edx, %eax
	shrl	%edi
.L2:
	testl	%edi, %edi
	jne	.L3
	ret
	.cfi_endproc
.LFE0:
	.size	count_ones, .-count_ones
	.ident	"GCC: (Ubuntu 15.2.0-16ubuntu1) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
