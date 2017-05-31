	; rsi - width
	; rdx - height
	; xmm0 - A
	; xmm1 - B

	; xmm2 - a
	; xmm3 - b
	; xmm4 - phase
	; xmm5 - step
	; xmm6 - end

section .text
	global lissajous_curve

lissajous_curve:
	push rbp
	mov rbp, rsp

	; copying width and height
	mov r8, rsi
	mov r9, rdx

	; counting x min
	shr rsi, 1
	neg rsi

	; counting y min
	shr rdx, 1
	neg rdx

	; counting x max
	add r8, rsi
	sub r8, 1

	; counting y max
	add r9, rdx
	sub r9, 1

	mov r10, 0;
	cvtsi2sd xmm8, r10 ; time put into xmm8

loop:
	; counting sine x argument
	movsd xmm11, xmm8
	mulsd xmm11, xmm2
	addsd xmm11, xmm4

	; counting sine x
	movsd [rsp - 64], xmm11
	fld qword [rsp - 64]
	fsin
	fstp qword [rsp- 64]
	movsd xmm7, [rsp - 64]
	mulsd xmm7, xmm0; x coordinate put into xmm7

	; counting sine y argument
	movsd xmm9, xmm8
	mulsd xmm9, xmm3

	; counting sine y
	movsd [rsp - 64], xmm9
	fld qword [rsp - 64]
	fsin
	fstp qword [rsp - 64]
	movsd xmm10, [rsp - 64]
	mulsd xmm10, xmm1; y coordinate	put into xmm10

	; rounding coordinates
	cvtsd2si r11, xmm7
	cvtsd2si r12, xmm10

	; checking if x hits the range
	cmp r11, rsi
	jl case
	cmp r11, r8
	jg case

	; checking if y hits the range
	cmp r12, rdx
	jl case
	cmp r12, r9
	jg case

	; colouring the pixel
	; counting column number
	mov r14, r12
	sub r14, rdx
	shl r14, 3
	mov r15, rdi
	add r15, r14

	; set to appropriate row
	mov rbx, [r15]
	sub r11, rsi
	add rbx, r11
	mov al, 255
	mov [rbx], al

	; increase time count
	addsd xmm8, xmm5

	; checking if the time is exceeded
	comisd xmm8, xmm6
	jae end

	; counting sine x argument
	movsd xmm11, xmm8
	mulsd xmm11, xmm2
	addsd xmm11, xmm4

	; counting sine x
	movsd [rsp - 64], xmm11
	fld qword [rsp - 64]
	fsin
	fstp qword [rsp- 64]
	movsd xmm7, [rsp - 64]
	mulsd xmm7, xmm0; x coordinate put into xmm7

	; counting sine y argument
	movsd xmm9, xmm8
	mulsd xmm9, xmm3

	; counting sine y
	movsd [rsp - 64], xmm9
	fld qword [rsp - 64]
	fsin
	fstp qword [rsp - 64]
	movsd xmm10, [rsp - 64]
	mulsd xmm10, xmm1; y coordinate	put into xmm10

	; rounding coordinates
	cvtsd2si r11, xmm7
	cvtsd2si r12, xmm10

	; checking if x hits the range
	cmp r11, rsi
	jl case
	cmp r11, r8
	jg case

	; checking if y hits the range
	cmp r12, rdx
	jl case
	cmp r12, r9
	jg case

	; colouring the pixel
	; counting column number
	mov r14, r12
	sub r14, rdx
	shl r14, 3
	mov r15, rdi
	add r15, r14

	; set to appropriate row
	mov rbx, [r15]
	sub r11, rsi
	add rbx, r11
	mov al, 255
	mov [rbx], al

	; increase time count
	addsd xmm8, xmm5

	; checking if the time is exceeded
	comisd xmm8, xmm6
	jae end

	; counting sine x argument
	movsd xmm11, xmm8
	mulsd xmm11, xmm2
	addsd xmm11, xmm4

	; counting sine x
	movsd [rsp - 64], xmm11
	fld qword [rsp - 64]
	fsin
	fstp qword [rsp- 64]
	movsd xmm7, [rsp - 64]
	mulsd xmm7, xmm0; x coordinate put into xmm7

	; counting sine y argument
	movsd xmm9, xmm8
	mulsd xmm9, xmm3

	; counting sine y
	movsd [rsp - 64], xmm9
	fld qword [rsp - 64]
	fsin
	fstp qword [rsp - 64]
	movsd xmm10, [rsp - 64]
	mulsd xmm10, xmm1; y coordinate	put into xmm10

	; rounding coordinates
	cvtsd2si r11, xmm7
	cvtsd2si r12, xmm10

	; checking if x hits the range
	cmp r11, rsi
	jl case
	cmp r11, r8
	jg case

	; checking if y hits the range
	cmp r12, rdx
	jl case
	cmp r12, r9
	jg case

	; colouring the pixel
	; counting column number
	mov r14, r12
	sub r14, rdx
	shl r14, 3
	mov r15, rdi
	add r15, r14

	; set to appropriate row
	mov rbx, [r15]
	sub r11, rsi
	add rbx, r11
	mov al, 255
	mov [rbx], al

	; increase time count
	addsd xmm8, xmm5

	; checking if the time is exceeded
	comisd xmm8, xmm6
	jae end

	; counting sine x argument
	movsd xmm11, xmm8
	mulsd xmm11, xmm2
	addsd xmm11, xmm4

	; counting sine x
	movsd [rsp - 64], xmm11
	fld qword [rsp - 64]
	fsin
	fstp qword [rsp- 64]
	movsd xmm7, [rsp - 64]
	mulsd xmm7, xmm0; x coordinate put into xmm7

	; counting sine y argument
	movsd xmm9, xmm8
	mulsd xmm9, xmm3

	; counting sine y
	movsd [rsp - 64], xmm9
	fld qword [rsp - 64]
	fsin
	fstp qword [rsp - 64]
	movsd xmm10, [rsp - 64]
	mulsd xmm10, xmm1; y coordinate	put into xmm10

	; rounding coordinates
	cvtsd2si r11, xmm7
	cvtsd2si r12, xmm10

	; checking if x hits the range
	cmp r11, rsi
	jl case
	cmp r11, r8
	jg case

	; checking if y hits the range
	cmp r12, rdx
	jl case
	cmp r12, r9
	jg case

	; colouring the pixel
	; counting column number
	mov r14, r12
	sub r14, rdx
	shl r14, 3
	mov r15, rdi
	add r15, r14

	; set to appropriate row
	mov rbx, [r15]
	sub r11, rsi
	add rbx, r11
	mov al, 255
	mov [rbx], al

	; increase time count
	addsd xmm8, xmm5

	; checking if the time is exceeded
	comisd xmm8, xmm6
	jae end

	; counting sine x argument
	movsd xmm11, xmm8
	mulsd xmm11, xmm2
	addsd xmm11, xmm4

	; counting sine x
	movsd [rsp - 64], xmm11
	fld qword [rsp - 64]
	fsin
	fstp qword [rsp- 64]
	movsd xmm7, [rsp - 64]
	mulsd xmm7, xmm0; x coordinate put into xmm7

	; counting sine y argument
	movsd xmm9, xmm8
	mulsd xmm9, xmm3

	; counting sine y
	movsd [rsp - 64], xmm9
	fld qword [rsp - 64]
	fsin
	fstp qword [rsp - 64]
	movsd xmm10, [rsp - 64]
	mulsd xmm10, xmm1; y coordinate	put into xmm10

	; rounding coordinates
	cvtsd2si r11, xmm7
	cvtsd2si r12, xmm10

	; checking if x hits the range
	cmp r11, rsi
	jl case
	cmp r11, r8
	jg case

	; checking if y hits the range
	cmp r12, rdx
	jl case
	cmp r12, r9
	jg case

	; colouring the pixel
	; counting column number
	mov r14, r12
	sub r14, rdx
	shl r14, 3
	mov r15, rdi
	add r15, r14

	; set to appropriate row
	mov rbx, [r15]
	sub r11, rsi
	add rbx, r11
	mov al, 255
	mov [rbx], al

	; increase time count
	addsd xmm8, xmm5

	; checking if the time is exceeded
	comisd xmm8, xmm6
	jae end

	; counting sine x argument
	movsd xmm11, xmm8
	mulsd xmm11, xmm2
	addsd xmm11, xmm4

	; counting sine x
	movsd [rsp - 64], xmm11
	fld qword [rsp - 64]
	fsin
	fstp qword [rsp- 64]
	movsd xmm7, [rsp - 64]
	mulsd xmm7, xmm0; x coordinate put into xmm7

	; counting sine y argument
	movsd xmm9, xmm8
	mulsd xmm9, xmm3

	; counting sine y
	movsd [rsp - 64], xmm9
	fld qword [rsp - 64]
	fsin
	fstp qword [rsp - 64]
	movsd xmm10, [rsp - 64]
	mulsd xmm10, xmm1; y coordinate	put into xmm10

	; rounding coordinates
	cvtsd2si r11, xmm7
	cvtsd2si r12, xmm10

	; checking if x hits the range
	cmp r11, rsi
	jl case
	cmp r11, r8
	jg case

	; checking if y hits the range
	cmp r12, rdx
	jl case
	cmp r12, r9
	jg case

	; colouring the pixel
	; counting column number
	mov r14, r12
	sub r14, rdx
	shl r14, 3
	mov r15, rdi
	add r15, r14

	; set to appropriate row
	mov rbx, [r15]
	sub r11, rsi
	add rbx, r11
	mov al, 255
	mov [rbx], al

	; increase time count
	addsd xmm8, xmm5

	; checking if the time is exceeded
	comisd xmm8, xmm6
	jae end

	; counting sine x argument
	movsd xmm11, xmm8
	mulsd xmm11, xmm2
	addsd xmm11, xmm4

	; counting sine x
	movsd [rsp - 64], xmm11
	fld qword [rsp - 64]
	fsin
	fstp qword [rsp- 64]
	movsd xmm7, [rsp - 64]
	mulsd xmm7, xmm0; x coordinate put into xmm7

	; counting sine y argument
	movsd xmm9, xmm8
	mulsd xmm9, xmm3

	; counting sine y
	movsd [rsp - 64], xmm9
	fld qword [rsp - 64]
	fsin
	fstp qword [rsp - 64]
	movsd xmm10, [rsp - 64]
	mulsd xmm10, xmm1; y coordinate	put into xmm10

	; rounding coordinates
	cvtsd2si r11, xmm7
	cvtsd2si r12, xmm10

	; checking if x hits the range
	cmp r11, rsi
	jl case
	cmp r11, r8
	jg case

	; checking if y hits the range
	cmp r12, rdx
	jl case
	cmp r12, r9
	jg case

	; colouring the pixel
	; counting column number
	mov r14, r12
	sub r14, rdx
	shl r14, 3
	mov r15, rdi
	add r15, r14

	; set to appropriate row
	mov rbx, [r15]
	sub r11, rsi
	add rbx, r11
	mov al, 255
	mov [rbx], al

	; increase time count
	addsd xmm8, xmm5

	; checking if the time is exceeded
	comisd xmm8, xmm6
	jae end

	; counting sine x argument
	movsd xmm11, xmm8
	mulsd xmm11, xmm2
	addsd xmm11, xmm4

	; counting sine x
	movsd [rsp - 64], xmm11
	fld qword [rsp - 64]
	fsin
	fstp qword [rsp- 64]
	movsd xmm7, [rsp - 64]
	mulsd xmm7, xmm0; x coordinate put into xmm7

	; counting sine y argument
	movsd xmm9, xmm8
	mulsd xmm9, xmm3

	; counting sine y
	movsd [rsp - 64], xmm9
	fld qword [rsp - 64]
	fsin
	fstp qword [rsp - 64]
	movsd xmm10, [rsp - 64]
	mulsd xmm10, xmm1; y coordinate	put into xmm10

	; rounding coordinates
	cvtsd2si r11, xmm7
	cvtsd2si r12, xmm10

	; checking if x hits the range
	cmp r11, rsi
	jl case
	cmp r11, r8
	jg case

	; checking if y hits the range
	cmp r12, rdx
	jl case
	cmp r12, r9
	jg case

	; colouring the pixel
	; counting column number
	mov r14, r12
	sub r14, rdx
	shl r14, 3
	mov r15, rdi
	add r15, r14

	; set to appropriate row
	mov rbx, [r15]
	sub r11, rsi
	add rbx, r11
	mov al, 255
	mov [rbx], al

	; increase time count
	addsd xmm8, xmm5

	; checking if the time is exceeded
	comisd xmm8, xmm6
	jae end

	; counting sine x argument
	movsd xmm11, xmm8
	mulsd xmm11, xmm2
	addsd xmm11, xmm4

	; counting sine x
	movsd [rsp - 64], xmm11
	fld qword [rsp - 64]
	fsin
	fstp qword [rsp- 64]
	movsd xmm7, [rsp - 64]
	mulsd xmm7, xmm0; x coordinate put into xmm7

	; counting sine y argument
	movsd xmm9, xmm8
	mulsd xmm9, xmm3

	; counting sine y
	movsd [rsp - 64], xmm9
	fld qword [rsp - 64]
	fsin
	fstp qword [rsp - 64]
	movsd xmm10, [rsp - 64]
	mulsd xmm10, xmm1; y coordinate	put into xmm10

	; rounding coordinates
	cvtsd2si r11, xmm7
	cvtsd2si r12, xmm10

	; checking if x hits the range
	cmp r11, rsi
	jl case
	cmp r11, r8
	jg case

	; checking if y hits the range
	cmp r12, rdx
	jl case
	cmp r12, r9
	jg case

	; colouring the pixel
	; counting column number
	mov r14, r12
	sub r14, rdx
	shl r14, 3
	mov r15, rdi
	add r15, r14

	; set to appropriate row
	mov rbx, [r15]
	sub r11, rsi
	add rbx, r11
	mov al, 255
	mov [rbx], al

	; increase time count
	addsd xmm8, xmm5

	; checking if the time is exceeded
	comisd xmm8, xmm6
	jae end

	; counting sine x argument
	movsd xmm11, xmm8
	mulsd xmm11, xmm2
	addsd xmm11, xmm4

	; counting sine x
	movsd [rsp - 64], xmm11
	fld qword [rsp - 64]
	fsin
	fstp qword [rsp- 64]
	movsd xmm7, [rsp - 64]
	mulsd xmm7, xmm0; x coordinate put into xmm7

	; counting sine y argument
	movsd xmm9, xmm8
	mulsd xmm9, xmm3

	; counting sine y
	movsd [rsp - 64], xmm9
	fld qword [rsp - 64]
	fsin
	fstp qword [rsp - 64]
	movsd xmm10, [rsp - 64]
	mulsd xmm10, xmm1; y coordinate	put into xmm10

	; rounding coordinates
	cvtsd2si r11, xmm7
	cvtsd2si r12, xmm10

	; checking if x hits the range
	cmp r11, rsi
	jl case
	cmp r11, r8
	jg case

	; checking if y hits the range
	cmp r12, rdx
	jl case
	cmp r12, r9
	jg case

	; colouring the pixel
 	; counting column number
	mov r14, r12
	sub r14, rdx
	shl r14, 3
	mov r15, rdi
	add r15, r14

	; set to appropriate row
	mov rbx, [r15]
	sub r11, rsi
	add rbx, r11
	mov al, 255
	mov [rbx], al

case:
	; increase time count
	addsd xmm8, xmm5

	; checking if the time is exceeded
	comisd xmm8, xmm6
	jna loop

end:
	mov rsp, rbp
	pop rbp
	ret
