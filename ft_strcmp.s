    global _ft_strcmp

; int ft_strcmp(char *s1, char *s2) char *s1=rdi char *s2=rsi
; int i =0;
; while (s1[i] && s1[i] == s2[i])
; 	i++;
; return (s1[i]-s2[i]);

;ax= 입출력과 산술연산
;ax는 16비트 상위 8비트= ah 하위 8비트 al
;bx= 주소지정을 확장하기 위해 인덱스로 사용
;8비트= bh 하위 8비트 bl
;cx=카운터

section .text
_ft_strcmp:
    mov rax, 0
	mov rbx, 0
	mov rcx, 0		; rcx -> i =0;
	jmp compare		; while

compare:
	mov al, BYTE [rdi + rcx]	; al에 s1[i] 대입
	mov bl, BYTE [rsi + rcx]	; bl에 s2[i] 대입
	cmp al, bl					; al bl 비교
	jne diff					; al != bl 일때 diff로 이동
	je	same					; al == bl 일때 same으로 이동

diff:
	sub rax, rbx 				; rax에서 rbx을 뺀다. --> s1[i]-s2[i]
	ret							; return;

same:
	cmp al, 0		; al 0 비교
	je 	end			; al == 0 이면 end로
	inc rcx			; i++;
	jmp compare		: 다시 while로

end:
	mov rax, 0		; rax 0으로
	ret				; return;
