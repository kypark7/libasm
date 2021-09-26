	global	_ft_strcpy
	extern ___error

;char	*ft_strcpy(char *dest, char *src) char *dest=rdi char *src=rsi
;	int		i;
;
;	i = 0;
;	while (src[i])
;	{
;		dest[i] = src[i];
;		i++;
;	}
;	dest[i] = 0;
;	return (dest);

section	.text
_ft_strcpy:
			cmp		rdi, 0	;rdi 0 비교
			je		return	;rdi == 0이면 return   dest == \0
			cmp		rsi, 0	;rsi 0 비교
			je		return	;rsi == 0이면 return
			xor		rcx, rcx ;i=0;

;dx 데이터 레지스터 16비트
;dr dl right left
cyrcle:
			mov		dl, byte [rsi + rcx]	;dl에 src[i]대입
			mov		byte [rdi + rcx], dl	;dest[i]에 dl대입  dest[i] = src[i]
			inc		rcx						;i++;
			cmp		dl, 0					;dl 0비교
			jne		cyrcle					;dl != 0일때 cycle로 => src[i] != \0 일때 while

return:
			mov		rax, rdi				;rax에 rdi대입
			ret
