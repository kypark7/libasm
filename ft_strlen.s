다른 파일에서도 쓰일 함수 선언;
	global	_ft_strlen

실행할 코드를 작성하는 공간;
section	.text

;ft_strlen(char *s) char *s-> rdi 레지스터에 담김 rdi는 포인터
;	size_t	i;
;
;	i = 0;
;	while (s[i])
;		i++;
;	return (i);

;인덱스로 사용할 레지스터 하나를 0으로 초기화 -> int i = 0;

xor rax rax -> 서로 같은 값을 가질 경우 0으로 ;
jmp cycle-> cycle로 jump!;
_ft_strlen:
			xor		rax, rax	;int i = 0;
			jmp		cyrcle		;while



;cmp [rdi+rax], 0  -> [rdi+rax]와 0을 비교
;c로 생각한다면 &s[i] 랑 0을 비교하는 것
;따라서 byte를 앞에다가 붙여서 s[i]와 0을 비교
;je return -> byte[rdi+rax] == 0 같다면 return 

cyrcle:
			cmp		byte [rdi + rax], 0
			je		return					;byte[rdi+rax] == 0 같다면 return 
			inc		rax						;i++;
			jmp		cyrcle					;while로 다시

;ret -> 종료
return:
			ret
