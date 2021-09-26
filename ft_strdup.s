	global _ft_strdup
	extern _malloc
	extern _ft_strlen
	extern _ft_strcpy

;char	*ft_strdup(char *s) char *s=rdi
;	int		len;
;	char	*ret;
;
;	len = (int)ft_strlen(s);
;	ret = malloc(sizeof(char) * (len + 1));
;	if (ret == 0)
;		return (0);
;	ft_strcpy(ret, s);
;	return (ret);

section .text
_ft_strdup:
    push rdi            ; 스텍에 *s저장
    call _ft_strlen     ;ft_strlen(rdi) 호출 rax = (int)ft_strlen(s)
    inc rax             ;rax값을 1증가 rax + 1
    mov rdi, rax        ;rdi에 rax 저장 rdi = rax
    call _malloc        ;mallc 호출 malloc(rdi)
    cmp rax, 0          ;rax 0 비교
    je exit             ;rax == 0 return (0);
    mov rdi, rax        ;rdi에 rax저장
    pop rsi             ;rsi 가져옴
    call _ft_strcpy     ;ft_strcpy 호출 *ft_strcpy(rdi, rsi) char *dest=rdi char *src=rsi
    ret                 ;return

exit:
	ret
