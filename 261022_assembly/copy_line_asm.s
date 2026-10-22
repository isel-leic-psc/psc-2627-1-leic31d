/*
void copy_line(char dst[], char src[])
void copy_line(char *dst, char *src)
		     rdi        rsi
                    
{
	int i = 0;
	edx
	while (src[i] != 0) {
		dst[i] = src[i];
		i++;
	}
}
*/

	.text
	.global copy_line
copy_line:
	mov	$0, %edx
while:
	mov	(%rsi, %rdx), %al
	test	%al, %al
	jz	while_end
	mov	(%rsi, %rdx), %al
	mov	%al, (%rdi, %rdx)
	inc	%edx
	jmp	while

while_end:
	ret


