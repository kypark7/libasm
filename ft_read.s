다른 파일에서도 쓰일 함수 선언;
	extern	___error
	global	_ft_read

ft_read(0, buf, 10);
인자 3개 필요 차레대로 rdi rsi rdx ;
rdi = 0, rsi = buf, rdx = 10;

실행할 코드를 작성하는 공간;

section .text
_ft_read:
		mov		rax, 0x2000003	;read 호출을 위해 rax에 syscall 번호 저장
		syscall					;시스템콜(read) 호출
		jc		err				;Carry Flag가 1일 경우 jmp = 에러처리 구문으로 넘어감
		ret
err:
		push	rax	; errno 스택에 백업
		call	___error	; rax에 errno 포인터 return rax = error();
		pop rdx				; rdx 다른 레지스터를 서포트하는 여분의 레지스터
		mov [rax], rdx		: [rax]에 errno에 해당하는 숫자
		mov		rax, -1		: rax에 음수 리턴값
		ret					:return

