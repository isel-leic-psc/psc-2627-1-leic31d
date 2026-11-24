	.file	"calculate.c"
	.text
.Ltext0:
	.file 0 "/home/ezequiel/Dropbox/disciplinas/psc/2627inv/psc-2627-1-leic31d/261124_linking" "calculate.c"
	.section	.rodata
	.align 4
	.type	x, @object
	.size	x, 4
x:
	.long	1000
	.globl	y
	.data
	.align 4
	.type	y, @object
	.size	y, 4
y:
	.long	33
	.section	.data.rel,"aw"
	.align 8
	.type	pa, @object
	.size	pa, 8
pa:
	.quad	a
	.local	pb
	.comm	pb,8,8
	.globl	res
	.bss
	.align 4
	.type	res, @object
	.size	res, 4
res:
	.zero	4
	.globl	array
	.align 32
	.type	array, @object
	.size	array, 200
array:
	.zero	200
	.text
	.type	multiply, @function
multiply:
.LFB0:
	.file 1 "calculate.c"
	.loc 1 18 35
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	.loc 1 19 11
	movl	-4(%rbp), %eax
	imull	-8(%rbp), %eax
	.loc 1 20 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	multiply, .-multiply
	.globl	calculate
	.type	calculate, @function
calculate:
.LFB1:
	.loc 1 22 17
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
	.loc 1 23 5
	leaq	b(%rip), %rax
	movq	%rax, pb(%rip)
	.loc 1 24 8
	movq	pa(%rip), %rax
	movl	(%rax), %edx
	.loc 1 24 14
	movq	pb(%rip), %rax
	movl	(%rax), %eax
	.loc 1 24 12
	leal	(%rdx,%rax), %ebx
	.loc 1 24 20
	movl	y(%rip), %eax
	movl	$1000, %edx
	movl	%eax, %esi
	movl	%edx, %edi
	call	multiply
	.loc 1 24 18 discriminator 1
	addl	%ebx, %eax
	.loc 1 24 42 discriminator 1
	addl	$1200, %eax
	.loc 1 24 6 discriminator 1
	movl	%eax, res(%rip)
	.loc 1 25 4
	movl	$50, a(%rip)
	.loc 1 26 9
	movl	res(%rip), %eax
	.loc 1 27 1
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	calculate, .-calculate
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x13a
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x6
	.long	.LASF5
	.byte	0x1d
	.byte	0x3
	.long	0x31647
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.string	"a"
	.byte	0xc
	.long	0x3b
	.uleb128 0x7
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x8
	.long	0x3b
	.uleb128 0x2
	.string	"b"
	.byte	0xf
	.long	0x3b
	.uleb128 0x1
	.string	"x"
	.byte	0xa
	.byte	0x12
	.long	0x42
	.uleb128 0x9
	.byte	0x3
	.quad	x
	.uleb128 0x3
	.string	"y"
	.byte	0xb
	.long	0x3b
	.uleb128 0x9
	.byte	0x3
	.quad	y
	.uleb128 0x1
	.string	"pa"
	.byte	0xc
	.byte	0xd
	.long	0x88
	.uleb128 0x9
	.byte	0x3
	.quad	pa
	.uleb128 0x9
	.byte	0x8
	.long	0x3b
	.uleb128 0x1
	.string	"pb"
	.byte	0xd
	.byte	0xd
	.long	0x88
	.uleb128 0x9
	.byte	0x3
	.quad	pb
	.uleb128 0x3
	.string	"res"
	.byte	0xe
	.long	0x3b
	.uleb128 0x9
	.byte	0x3
	.quad	res
	.uleb128 0xa
	.long	0xcd
	.long	0xc6
	.uleb128 0xb
	.long	0xc6
	.byte	0xc7
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x4
	.byte	0x1
	.byte	0x6
	.long	.LASF3
	.uleb128 0xc
	.long	.LASF4
	.byte	0x1
	.byte	0x10
	.byte	0x6
	.long	0xb6
	.uleb128 0x9
	.byte	0x3
	.quad	array
	.uleb128 0xd
	.long	.LASF6
	.byte	0x1
	.byte	0x16
	.byte	0x5
	.long	0x3b
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.long	.LASF7
	.byte	0x1
	.byte	0x12
	.byte	0xc
	.long	0x3b
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.string	"a"
	.byte	0x19
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x5
	.string	"b"
	.byte	0x20
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 18
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x90
	.uleb128 0xb
	.uleb128 0x91
	.uleb128 0x6
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF7:
	.string	"multiply"
.LASF4:
	.string	"array"
.LASF2:
	.string	"long unsigned int"
.LASF5:
	.string	"GNU C23 15.2.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection -fzero-init-padding-bits=all"
.LASF6:
	.string	"calculate"
.LASF3:
	.string	"char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"calculate.c"
.LASF1:
	.string	"/home/ezequiel/Dropbox/disciplinas/psc/2627inv/psc-2627-1-leic31d/261124_linking"
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
