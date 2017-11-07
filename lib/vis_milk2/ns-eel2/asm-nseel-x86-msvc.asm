_text SEGMENT

nseel_asm_1pdd PROC
ifdef TARGET_X64
      movq xmm0, qword ptr [eax]
	  sub rsp, 128
     mov edi, 0xffffffff
ifdef AMD64ABI
     mov r15, rsi
     call edi
     mov rsi, r15
     movq qword ptr [r15], xmm0
else
     call edi
     movq qword ptr [esi], xmm0
endif
     add rsp, 128
else
              sub esp, 8 ;  keep stack aligned 
            push dword ptr [eax+4] ;  push parameter 
					    push dword ptr [eax]    ;  push the rest of the parameter 
              mov edi, 0xffffffff
					    call edi
					    fstp qword ptr [esi] ;  store result 
					    add esp, 16
endif
					    mov eax, esi ;  set return value 
					    add esi, 8 ;  advance worktab ptr 
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
nseel_asm_1pdd ENDP

nseel_asm_1pdd_end PROC
nseel_asm_1pdd_end ENDP

nseel_asm_2pdd PROC
ifdef TARGET_X64
    movq xmm1, qword ptr [eax]
    movq xmm0, qword ptr [edi]
	sub rsp, 128
    mov edi, 0xffffffff
ifdef AMD64ABI
    mov r15, rsi
    call edi
    mov rsi, r15
    movq qword ptr [r15], xmm0
else
    call edi
    movq qword ptr [esi], xmm0
endif
    add rsp, 128
else
					    push dword ptr [eax+4] ;  push parameter 
					    push dword ptr [eax]    ;  push the rest of the parameter 
					    push dword ptr [edi+4] ;  push parameter 
					    push dword ptr [edi]    ;  push the rest of the parameter 
              mov edi, 0xffffffff
					    call edi
					    fstp qword ptr [esi] ;  store result 
					    add esp, 16
endif
					    mov eax, esi ;  set return value 
					    add esi, 8 ;  advance worktab ptr 
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
nseel_asm_2pdd ENDP

nseel_asm_2pdd_end PROC
nseel_asm_2pdd_end ENDP

nseel_asm_2pdds PROC
ifdef TARGET_X64
    movq xmm1, qword ptr [eax]
    movq xmm0, qword ptr [edi]
	sub rsp, 128
    mov eax, 0xffffffff
ifdef AMD64ABI
    mov r15, rsi
    mov r14, rdi
    call eax
    mov rsi, r15
    movq qword ptr [r14], xmm0
    mov rax, r14 ;  set return value 
else
    call eax
    movq qword ptr [edi], xmm0
    mov eax, edi ;  set return value 
endif
    sub rsp, 128
else
					    push dword ptr [eax+4] ;  push parameter 
					    push dword ptr [eax]    ;  push the rest of the parameter 
					    push dword ptr [edi+4] ;  push parameter 
					    push dword ptr [edi]    ;  push the rest of the parameter 
              mov eax, 0xffffffff
					    call eax
					    fstp qword ptr [edi] ;  store result 
					    add esp, 16
    mov eax, edi ;  set return value 
endif
mov DWORD PTR [eax-0x6f6f6f70],edx
nop
nop
nop
nop
nop
nop
nseel_asm_2pdds ENDP

nseel_asm_2pdds_end PROC
nseel_asm_2pdds_end ENDP

nseel_asm_2pp PROC
ifdef TARGET_X64

ifdef AMD64ABI
    mov r15, rsi
    ;  rdi is first parameter 
    mov rsi, rax
    sub rsp, 128
              mov eax, 0xffffffff
					    call eax
    mov rsi, r15
    movq qword ptr [r15], xmm0
else
              mov ecx, edi
              mov edx, eax
              sub rsp, 128
    mov edi, 0xffffffff
    call edi
    movq qword ptr [esi], xmm0
endif
    add rsp, 128
else
              sub esp, 8 ;  keep stack aligned 
              push eax ;  push parameter 
					    push edi    ;  push second parameter 
              mov edi, 0xffffffff
					    call edi
					    fstp EEL_ASM_TYPE [esi] ;  store result 
					    add esp, 16
endif
					    mov eax, esi ;  set return value 
					    add esi, EEL_F_SIZE ;  advance worktab ptr 
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
    nseel_asm_2pp ENDP

nseel_asm_2pp_end PROC
nseel_asm_2pp_end ENDP


nseel_asm_1pp PROC
ifdef TARGET_X64
ifdef AMD64ABI
    mov r15, rsi
    mov edi, eax
    sub rsp, 128
    mov rax, 0xffffffff
    call rax
    mov rsi, r15
    movq qword ptr [r15], xmm0
else
              mov ecx, eax
              sub rsp, 128
    mov edi, 0xffffffff
    call edi
    movq qword ptr [esi], xmm0
endif
    add rsp, 128
else
              sub esp, 12 ;  keep stack aligned 
					    push eax ;  push parameter 
              mov edi, 0xffffffff
              call edi
					    fstp EEL_ASM_TYPE [esi] ;  store result 
					    add esp, 16
endif
					    mov eax, esi ;  set return value 
					    add esi, EEL_F_SIZE ;  advance worktab ptr 
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
nseel_asm_1pp ENDP


nseel_asm_1pp_end PROC
nseel_asm_1pp_end ENDP

nseel_asm_exec2 PROC
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
nseel_asm_exec2 ENDP

nseel_asm_exec2_end PROC
nseel_asm_exec2_end ENDP

nseel_asm_invsqrt PROC
    fld qword ptr [eax]
    mov edx, 0x5f3759df
    fst dword ptr [esi]
ifdef TARGET_X64
    mov rax, 0xffffffff
    sub ecx, ecx
    fmul qword ptr [rax]
else
if EEL_F_SIZE == 8
    fmul qword ptr [0xffffffff]
else
    fmul dword ptr [0xffffffff]
endif
endif
    mov ecx, dword ptr [esi]
    sar ecx, 1
    sub edx, ecx
    mov dword ptr [esi], edx
    fmul dword ptr [esi]
    fmul dword ptr [esi]
ifdef TARGET_X64
    mov rax, 0xffffffff
    fadd EEL_ASM_TYPE [rax]
else
if EEL_F_SIZE == 8
    fadd qword ptr [0xffffffff]
else
    fadd dword ptr [0xffffffff]
endif
endif
    fmul dword ptr [esi]
    mov eax, esi
    fstp EEL_ASM_TYPE [esi]
    add esi, EEL_F_SIZE
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
nseel_asm_invsqrt ENDP

nseel_asm_invsqrt_end PROC
nseel_asm_invsqrt_end ENDP


nseel_asm_sin PROC
    fld EEL_ASM_TYPE [eax]
    fsin
    mov eax, esi
    fstp EEL_ASM_TYPE [esi]
    add esi, EEL_F_SIZE
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
nseel_asm_sin ENDP

nseel_asm_sin_end PROC
nseel_asm_sin_end ENDP

nseel_asm_cos PROC
    fld EEL_ASM_TYPE [eax]
    fcos
    mov eax, esi
    fstp EEL_ASM_TYPE [esi]
    add esi, EEL_F_SIZE
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
nseel_asm_cos ENDP

nseel_asm_cos_end PROC
nseel_asm_cos_end ENDP

nseel_asm_tan PROC
    fld EEL_ASM_TYPE [eax]
    fptan
    mov eax, esi
    fstp st(0)
    fstp EEL_ASM_TYPE [esi]
    add esi, EEL_F_SIZE
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
nseel_asm_tan ENDP

nseel_asm_tan_end PROC
nseel_asm_tan_end ENDP

nseel_asm_sqr PROC
	fld EEL_ASM_TYPE [eax]
    fmul st(0), st(0)
    mov eax, esi
    fstp EEL_ASM_TYPE [esi]
    add esi, EEL_F_SIZE
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
nseel_asm_sqr ENDP

nseel_asm_sqr_end PROC
nseel_asm_sqr_end ENDP

nseel_asm_sqrt PROC
    fld EEL_ASM_TYPE [eax]
    fabs
    fsqrt
    mov eax, esi
    fstp EEL_ASM_TYPE [esi]
    add esi, EEL_F_SIZE
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
nseel_asm_sqrt ENDP

nseel_asm_sqrt_end PROC
nseel_asm_sqrt_end ENDP


nseel_asm_log PROC
    fldln2
    fld EEL_ASM_TYPE [eax]
    mov eax, esi
    fyl2x
    fstp EEL_ASM_TYPE [esi]
    add esi, EEL_F_SIZE

    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
nseel_asm_log ENDP

nseel_asm_log_end PROC
nseel_asm_log_end ENDP

nseel_asm_log10 PROC
    fldlg2
    fld EEL_ASM_TYPE [eax]
    mov eax, esi
    fyl2x
    fstp EEL_ASM_TYPE [esi]
    add esi, EEL_F_SIZE

    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
nseel_asm_log10 ENDP

nseel_asm_log10_end PROC
nseel_asm_log10_end ENDP

nseel_asm_abs PROC
    fld EEL_ASM_TYPE [eax]
    fabs
    mov eax, esi
    fstp EEL_ASM_TYPE [esi]
    add esi, EEL_F_SIZE
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
nseel_asm_abs ENDP

nseel_asm_abs_end PROC
nseel_asm_abs_end ENDP


nseel_asm_assign PROC
ifdef TARGET_X64
    mov rdx, qword ptr [rax]
    mov rcx, rdx
    shr rdx, 32
    and edx, 0x7FF00000
    jz label_0
    cmp edx, 0x7FF00000
    je label_0
    jmp label_1
label_0:
    
    sub rcx, rcx
label_1:
    
    mov qword ptr [edi], rcx
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
else

if EEL_F_SIZE == 8
    mov edx, dword ptr [eax+4]
    mov ecx, dword ptr [eax]
    and edx, 0x7ff00000
    jz label_2   // if exponent=zero, zero
    cmp edx, 0x7ff00000
    je label_2 // if exponent=all 1s, zero
    mov edx, dword ptr [eax+4] // reread
    jmp label_3
label_2:
    
    sub ecx, ecx
    sub edx, edx
label_3:
    
    mov dword ptr [edi], ecx
    mov dword ptr [edi+4], edx
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
else
    mov ecx, dword ptr [eax]
    mov dword ptr [edi], ecx
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
endif

endif
nseel_asm_assign ENDP

nseel_asm_assign_end PROC
nseel_asm_assign_end ENDP

nseel_asm_add PROC
    fld EEL_ASM_TYPE [eax]
    fadd EEL_ASM_TYPE [edi]
    mov eax, esi
    fstp EEL_ASM_TYPE [esi]
    add esi, EEL_F_SIZE
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
nseel_asm_add ENDP

nseel_asm_add_end PROC
nseel_asm_add_end ENDP

nseel_asm_add_op PROC
    fld EEL_ASM_TYPE [eax]
    fadd EEL_ASM_TYPE [edi]
    mov eax, edi
    fstp EEL_ASM_TYPE [edi]
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
nseel_asm_add_op ENDP

nseel_asm_add_op_end PROC
nseel_asm_add_op_end ENDP


nseel_asm_sub PROC
    fld EEL_ASM_TYPE [edi]
    fsub EEL_ASM_TYPE [eax]
    mov eax, esi
    fstp EEL_ASM_TYPE [esi]
    add esi, EEL_F_SIZE
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
nseel_asm_sub ENDP

nseel_asm_sub_end PROC
nseel_asm_sub_end ENDP

nseel_asm_sub_op PROC
    fld EEL_ASM_TYPE [edi]
    fsub EEL_ASM_TYPE [eax]
    mov eax, edi
    fstp EEL_ASM_TYPE [edi]
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
nseel_asm_sub_op ENDP

nseel_asm_sub_op_end PROC
nseel_asm_sub_op_end ENDP

nseel_asm_mul PROC
    fld EEL_ASM_TYPE [edi]
    fmul EEL_ASM_TYPE [eax]
    mov eax, esi
    fstp EEL_ASM_TYPE [esi]
    add esi, EEL_F_SIZE
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
nseel_asm_mul ENDP

nseel_asm_mul_end PROC
nseel_asm_mul_end ENDP

nseel_asm_mul_op PROC
    fld EEL_ASM_TYPE [eax]
    fmul EEL_ASM_TYPE [edi]
    mov eax, edi
    fstp EEL_ASM_TYPE [edi]
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
nseel_asm_mul_op ENDP

nseel_asm_mul_op_end PROC
nseel_asm_mul_op_end ENDP

nseel_asm_div PROC
    fld EEL_ASM_TYPE [edi]
    fdiv EEL_ASM_TYPE [eax]
    mov eax, esi
    fstp EEL_ASM_TYPE [esi]
    add esi, EEL_F_SIZE
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
nseel_asm_div ENDP

nseel_asm_div_end PROC
nseel_asm_div_end ENDP

nseel_asm_div_op PROC
    fld EEL_ASM_TYPE [edi]
    fdiv EEL_ASM_TYPE [eax]
    mov eax, edi
    fstp EEL_ASM_TYPE [edi]
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
nseel_asm_div_op ENDP

nseel_asm_div_op_end PROC
nseel_asm_div_op_end ENDP

nseel_asm_mod PROC
    fld EEL_ASM_TYPE [edi]
    fld EEL_ASM_TYPE [eax]
    fabs
    fistp dword ptr [esi]
    fabs
    fistp dword ptr [esi+4]
    xor edx, edx
ifdef TARGET_X64
    sub eax, eax
endif
    cmp dword ptr [esi], 0
    je label_4 ; skip devide, set return to 0
    mov eax, dword ptr [esi+4]
    div dword ptr [esi]
label_4:
    
    mov dword ptr [esi], edx
    fild dword ptr [esi]
    mov eax, esi
    fstp EEL_ASM_TYPE [esi]
    add esi, EEL_F_SIZE
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
nseel_asm_mod ENDP

nseel_asm_mod_end PROC
nseel_asm_mod_end ENDP

nseel_asm_mod_op PROC
    fld EEL_ASM_TYPE [edi]
    fld EEL_ASM_TYPE [eax]
    fabs
    fistp dword ptr [edi]
    fabs
    fistp dword ptr [esi]
ifdef TARGET_X64
    sub eax, eax
endif
    xor edx, edx
    cmp dword ptr [edi], 0
    je label_5 ; skip devide, set return to 0
    mov eax, dword ptr [esi]
    div dword ptr [edi]
label_5:
    
    mov dword ptr [edi], edx
    fild dword ptr [edi]
    mov eax, edi
    fstp EEL_ASM_TYPE [edi]
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
nseel_asm_mod_op ENDP

nseel_asm_mod_op_end PROC
nseel_asm_mod_op_end ENDP

nseel_asm_or PROC
    fld EEL_ASM_TYPE [edi]
    fld EEL_ASM_TYPE [eax]
    mov eax, esi
    fistp qword ptr [esi]
    fistp qword ptr [esi+8]
ifdef TARGET_X64
    mov rdi, qword ptr [rsi+8]
    or qword ptr [rsi], rdi
else
    mov edi, dword ptr [esi+8]
    mov ecx, dword ptr [esi+12]
    or dword ptr [esi], edi
    or dword ptr [esi+4], ecx
endif
    fild qword ptr [esi]
    fstp EEL_ASM_TYPE [esi]
    add esi, EEL_F_SIZE
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
nseel_asm_or ENDP

nseel_asm_or_end PROC
nseel_asm_or_end ENDP

nseel_asm_or_op PROC
    fld EEL_ASM_TYPE [edi]
    fld EEL_ASM_TYPE [eax]
    fistp qword ptr [edi]
    fistp qword ptr [esi]
ifdef TARGET_X64
    mov rax, qword ptr [rsi]
    or qword ptr [rdi], rax
else
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [esi+4]
    or dword ptr [edi], eax
    or dword ptr [edi+4], ecx
endif
    fild qword ptr [edi]
    mov eax, edi
    fstp EEL_ASM_TYPE [edi]
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
nseel_asm_or_op ENDP

nseel_asm_or_op_end PROC
nseel_asm_or_op_end ENDP

nseel_asm_and PROC
    fld EEL_ASM_TYPE [edi]
    fld EEL_ASM_TYPE [eax]
    mov eax, esi
    fistp qword ptr [esi]
    fistp qword ptr [esi+8]
ifdef TARGET_X64
    mov rdi, qword ptr [rsi+8]
    and qword ptr [rsi], rdi
else
    mov edi, dword ptr [esi+8]
    mov ecx, dword ptr [esi+12]
    and dword ptr [esi], edi
    and dword ptr [esi+4], ecx
endif
    fild qword ptr [esi]
    fstp EEL_ASM_TYPE [esi]
    add esi, EEL_F_SIZE
    mov DWORD PTR [eax-0x6f6f6f70],edx
    nop
    nop
    nop
    nop
    nop
    nop
nseel_asm_and ENDP

nseel_asm_and_end PROC
nseel_asm_and_end ENDP

nseel_asm_and_op PROC
  __asm {
    fld EEL_ASM_TYPE [edi]
    fld EEL_ASM_TYPE [eax]
    fistp qword ptr [edi]
    fistp qword ptr [esi]
ifdef TARGET_X64
    mov rax, qword ptr [rsi]
    and qword ptr [rdi], rax
else
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [esi+4]
    and dword ptr [edi], eax
    and dword ptr [edi+4], ecx
endif
    fild qword ptr [edi]
    mov eax, edi
    fstp EEL_ASM_TYPE [edi]
mov DWORD PTR [eax-0x6f6f6f70],edx
nop
nop
nop
nop
nop
nop
  }
}
nseel_asm_and_op_end PROC
nseel_asm_and_op_end ENDP


//---------------------------------------------------------------------------------------------------------------
__declspec(naked) void nseel_asm_uplus(void) // this is the same as doing nothing, it seems
{
   __asm {
      
mov DWORD PTR [eax-0x6f6f6f70],edx
nop
nop
nop
nop
nop
nop
    }
}
nseel_asm_uplus_end PROC
nseel_asm_uplus_end ENDP

//---------------------------------------------------------------------------------------------------------------
nseel_asm_uminus PROC
  __asm {
if EEL_F_SIZE == 8
    mov ecx, dword ptr [eax]
    mov edi, dword ptr [eax+4]
    mov dword ptr [esi], ecx
    xor edi, 0x80000000
    mov eax, esi
    mov dword ptr [esi+4], edi
    add esi, 8
else
    mov ecx, dword ptr [eax]
    xor ecx, 0x80000000
    mov eax, esi
    mov dword ptr [esi], ecx
    add esi, 4
endif
mov DWORD PTR [eax-0x6f6f6f70],edx
nop
nop
nop
nop
nop
nop
  }
}
nseel_asm_uminus_end PROC
nseel_asm_uminus_end ENDP



//---------------------------------------------------------------------------------------------------------------
nseel_asm_sign PROC
  __asm {

ifdef TARGET_X64


    mov rdi, 0xFFFFFFFF
    mov rcx, qword ptr [rax]
    mov rdx, 0x7FFFFFFFFFFFFFFF
    test rcx, rdx
    jz label_6
    shr rcx, 60
    and rcx, 8
    add rcx, rdi
    mov rax, rsi
    add rsi, 8
    mov rdi, qword ptr [rcx]
    mov qword ptr [rax], rdi
label_6:
	


else

    mov edi, 0xFFFFFFFF
if EEL_F_SIZE == 8
    mov ecx, dword ptr [eax+4]
    mov edx, dword ptr [eax]
    test edx, 0xFFFFFFFF
    jnz label_7
else
    mov ecx, dword ptr [eax]
endif
    // high dword (minus sign bit) is zero
    test ecx, 0x7FFFFFFF
    jz label_8 // zero zero, return the value passed directly
label_7:
    
if EEL_F_SIZE == 8
	shr ecx, 28
else
	shr ecx, 29
endif

    and ecx, EEL_F_SIZE
    add ecx, edi

    mov eax, esi
    add esi, EEL_F_SIZE

    mov edi, dword ptr [ecx]
if EEL_F_SIZE == 8
    mov edx, dword ptr [ecx+4]
endif
    mov dword ptr [eax], edi
if EEL_F_SIZE == 8
    mov dword ptr [eax+4], edx
endif
label_8:
	

endif
mov DWORD PTR [eax-0x6f6f6f70],edx
nop
nop
nop
nop
nop
nop
}
}
nseel_asm_sign_end PROC
nseel_asm_sign_end ENDP



//---------------------------------------------------------------------------------------------------------------
nseel_asm_bnot PROC
  __asm {
    fld EEL_ASM_TYPE [eax]
    fabs
ifdef TARGET_X64
    mov rax, 0xFFFFFFFF
    fcomp EEL_ASM_TYPE [rax] //[g_closefact]
else
if EEL_F_SIZE == 8
_emit 0xDC // fcomp qword ptr [0xffffffff]
_emit 0x1D
_emit 0xFF
_emit 0xFF
_emit 0xFF
_emit 0xFF
else
_emit 0xD8 // fcomp dword ptr [0xffffffff]
_emit 0x1D
_emit 0xFF
_emit 0xFF
_emit 0xFF
_emit 0xFF
endif
endif
    fstsw ax
    test eax, 256
    mov eax, esi
    jz label_9
    fld1
    jmp label_10
label_9:
    
    fldz
label_10:
    
    fstp EEL_ASM_TYPE [esi]
    add esi, EEL_F_SIZE
mov DWORD PTR [eax-0x6f6f6f70],edx
nop
nop
nop
nop
nop
nop
  }
}
nseel_asm_bnot_end PROC
nseel_asm_bnot_end ENDP

//---------------------------------------------------------------------------------------------------------------
nseel_asm_if PROC
  __asm {
    fld EEL_ASM_TYPE [eax]
    fabs
ifdef TARGET_X64
    mov rax, 0xFFFFFFFF
    fcomp EEL_ASM_TYPE [rax] //[g_closefact]
    mov rax, 0xFFFFFFFF
    mov qword ptr [esi], rax // conversion script will extend these out to full len
    mov rax, 0xFFFFFFFF
    mov qword ptr [esi+8], rax
    fstsw ax
    shr rax, 5
    and rax, 8
    mov rax, qword ptr [rax+rsi]
    sub rsp, 8
else
if EEL_F_SIZE == 8
_emit 0xDC // fcomp qword ptr [0xffffffff]
_emit 0x1D
_emit 0xFF
_emit 0xFF
_emit 0xFF
_emit 0xFF
else
_emit 0xD8 // fcomp dword ptr [0xffffffff]
_emit 0x1D
_emit 0xFF
_emit 0xFF
_emit 0xFF
_emit 0xFF
endif
    mov dword ptr [esi], 0xFFFFFFFF
    mov dword ptr [esi+4], 0xFFFFFFFF
    fstsw ax
    shr eax, 6
    and eax, 4
    mov eax, dword ptr [eax+esi]
endif
    call eax
ifdef TARGET_X64
    add rsp, 8
endif

mov DWORD PTR [eax-0x6f6f6f70],edx
nop
nop
nop
nop
nop
nop
  }
}
nseel_asm_if_end PROC
nseel_asm_if_end ENDP

//---------------------------------------------------------------------------------------------------------------
nseel_asm_repeat PROC
  __asm {
    fld EEL_ASM_TYPE [eax]
    fistp dword ptr [esi]
ifdef TARGET_X64 // safe not sure if movl ecx will zero the high word
    xor ecx, ecx
endif
    mov ecx, dword ptr [esi]
    cmp ecx, 1
    jl label_11
    cmp ecx, NSEEL_LOOPFUNC_SUPPORT_MAXLEN
    jl label_12
    mov ecx, NSEEL_LOOPFUNC_SUPPORT_MAXLEN
label_12:

      mov edx, 0xFFFFFFFF
      sub esp, 8 ;  keep stack aligned -- note this is required on x64 too!
      push esi // revert back to last temp workspace
      push ecx
      call edx
      pop ecx
      pop esi
      add esp, 8 ;  keep stack aligned -- also required on x64
    dec ecx
    jnz label_12
label_11:

mov DWORD PTR [eax-0x6f6f6f70],edx
nop
nop
nop
nop
nop
nop
  }
}
nseel_asm_repeat_end PROC
nseel_asm_repeat_end ENDP

nseel_asm_repeatwhile PROC
  __asm {
    mov ecx, NSEEL_LOOPFUNC_SUPPORT_MAXLEN
label_13:

      mov edx, 0xFFFFFFFF
      sub esp, 8 ;  keep stack aligned -- required on x86 and x64
      push esi // revert back to last temp workspace
      push ecx
      call edx
      pop ecx
      pop esi
      add esp, 8 ;  keep stack aligned -- required on x86 and x64 
      fld EEL_ASM_TYPE [eax]
	  fabs
ifdef TARGET_X64
    mov rax, 0xFFFFFFFF
    fcomp EEL_ASM_TYPE [rax] //[g_closefact]
else
if EEL_F_SIZE == 8
_emit 0xDC // fcomp qword ptr [0xffffffff]
_emit 0x1D
_emit 0xFF
_emit 0xFF
_emit 0xFF
_emit 0xFF
else
_emit 0xD8 // fcomp dword ptr [0xffffffff]
_emit 0x1D
_emit 0xFF
_emit 0xFF
_emit 0xFF
_emit 0xFF
endif
endif
      fstsw ax
	  test eax, 256
	  jnz label_14
    dec ecx
    jnz label_13
label_14:
	
	mov eax, esi
mov DWORD PTR [eax-0x6f6f6f70],edx
nop
nop
nop
nop
nop
nop
  }
}
nseel_asm_repeatwhile_end PROC
nseel_asm_repeatwhile_end ENDP


nseel_asm_band PROC
  __asm {
    fld EEL_ASM_TYPE [eax]
    fabs
ifdef TARGET_X64
    mov rax, 0xFFFFFFFF
    fcomp EEL_ASM_TYPE [rax] //[g_closefact]
else
if EEL_F_SIZE == 8
_emit 0xDC // fcomp qword ptr [0xffffffff]
_emit 0x1D
_emit 0xFF
_emit 0xFF
_emit 0xFF
_emit 0xFF
else
_emit 0xD8 // fcomp dword ptr [0xffffffff]
_emit 0x1D
_emit 0xFF
_emit 0xFF
_emit 0xFF
_emit 0xFF
endif
endif
    fstsw ax
    test eax, 256
    jnz label_15 // if Z, then we are nonzero

        mov ecx, 0xFFFFFFFF
ifdef TARGET_X64
    sub rsp, 8
endif
        call ecx
ifdef TARGET_X64
    add rsp, 8
endif
    	fld EEL_ASM_TYPE [eax]
    	fabs
ifdef TARGET_X64
    mov rax, 0xFFFFFFFF
    fcomp EEL_ASM_TYPE [rax] //[g_closefact]
else
if EEL_F_SIZE == 8
_emit 0xDC // fcomp qword ptr [0xffffffff]
_emit 0x1D
_emit 0xFF
_emit 0xFF
_emit 0xFF
_emit 0xFF
else
_emit 0xD8 // fcomp dword ptr [0xffffffff]
_emit 0x1D
_emit 0xFF
_emit 0xFF
_emit 0xFF
_emit 0xFF
endif
endif
    	fstsw ax
        test eax, 256
	jnz label_15
	fld1
	jmp label_16

label_15:

    fldz
label_16:


    mov eax, esi
    fstp EEL_ASM_TYPE [esi]
    add esi, EEL_F_SIZE
mov DWORD PTR [eax-0x6f6f6f70],edx
nop
nop
nop
nop
nop
nop
  }
}
nseel_asm_band_end PROC
nseel_asm_band_end ENDP

nseel_asm_bor PROC
  __asm {
    fld EEL_ASM_TYPE [eax]
    fabs
ifdef TARGET_X64
    mov rax, 0xFFFFFFFF
    fcomp EEL_ASM_TYPE [rax] //[g_closefact]
else
if EEL_F_SIZE == 8
_emit 0xDC // fcomp qword ptr [0xffffffff]
_emit 0x1D
_emit 0xFF
_emit 0xFF
_emit 0xFF
_emit 0xFF
else
_emit 0xD8 // fcomp dword ptr [0xffffffff]
_emit 0x1D
_emit 0xFF
_emit 0xFF
_emit 0xFF
_emit 0xFF
endif
endif
    fstsw ax
    test eax, 256
    jz label_17 // if Z, then we are nonzero

        mov ecx, 0xFFFFFFFF
ifdef TARGET_X64
    sub rsp, 8
endif
        call ecx
ifdef TARGET_X64
    add rsp, 8
endif
    	fld EEL_ASM_TYPE [eax]
    	fabs
ifdef TARGET_X64
    mov rax, 0xFFFFFFFF
    fcomp EEL_ASM_TYPE [rax] //[g_closefact]
else
if EEL_F_SIZE == 8
_emit 0xDC // fcomp qword ptr [0xffffffff]
_emit 0x1D
_emit 0xFF
_emit 0xFF
_emit 0xFF
_emit 0xFF
else
_emit 0xD8 // fcomp dword ptr [0xffffffff]
_emit 0x1D
_emit 0xFF
_emit 0xFF
_emit 0xFF
_emit 0xFF
endif
endif
    	fstsw ax
        test eax, 256
	jz label_17
	fldz
	jmp label_18

label_17:

    fld1
label_18:


    mov eax, esi
    fstp EEL_ASM_TYPE [esi]
    add esi, EEL_F_SIZE
mov DWORD PTR [eax-0x6f6f6f70],edx
nop
nop
nop
nop
nop
nop
  }
}
nseel_asm_bor_end PROC
nseel_asm_bor_end ENDP

//---------------------------------------------------------------------------------------------------------------
nseel_asm_equal PROC
  __asm {
    fld EEL_ASM_TYPE [eax]
    fsub EEL_ASM_TYPE [edi]
    fabs
ifdef TARGET_X64
    mov rax, 0xFFFFFFFF
    fcomp EEL_ASM_TYPE [rax] //[g_closefact]
else
if EEL_F_SIZE == 8
_emit 0xDC // fcomp qword ptr [0xffffffff]
_emit 0x1D
_emit 0xFF
_emit 0xFF
_emit 0xFF
_emit 0xFF
else
_emit 0xD8 // fcomp dword ptr [0xffffffff]
_emit 0x1D
_emit 0xFF
_emit 0xFF
_emit 0xFF
_emit 0xFF
endif
endif
    fstsw ax
    test eax, 256
    mov eax, esi
    jz label_19
    fld1
    jmp label_20
label_19:
    
    fldz
label_20:
    
    fstp EEL_ASM_TYPE [esi]
    add esi, EEL_F_SIZE
mov DWORD PTR [eax-0x6f6f6f70],edx
nop
nop
nop
nop
nop
nop
  }
}
nseel_asm_equal_end PROC
nseel_asm_equal_end ENDP
//
//---------------------------------------------------------------------------------------------------------------
nseel_asm_notequal PROC
  __asm {
    fld EEL_ASM_TYPE [eax]
    fsub EEL_ASM_TYPE [edi]
    fabs
ifdef TARGET_X64
    mov rax, 0xFFFFFFFF
    fcomp EEL_ASM_TYPE [rax] //[g_closefact]
else
if EEL_F_SIZE == 8
_emit 0xDC // fcomp qword ptr [0xffffffff]
_emit 0x1D
_emit 0xFF
_emit 0xFF
_emit 0xFF
_emit 0xFF
else
_emit 0xD8 // fcomp dword ptr [0xffffffff]
_emit 0x1D
_emit 0xFF
_emit 0xFF
_emit 0xFF
_emit 0xFF
endif
endif
    fstsw ax
    test eax, 256
    mov eax, esi
    jnz label_21
    fld1
    jmp label_22
label_21:
    
    fldz
label_22:
    
    fstp EEL_ASM_TYPE [esi]
    add esi, EEL_F_SIZE
mov DWORD PTR [eax-0x6f6f6f70],edx
nop
nop
nop
nop
nop
nop
  }
}
nseel_asm_notequal_end PROC
nseel_asm_notequal_end ENDP


//---------------------------------------------------------------------------------------------------------------
nseel_asm_below PROC
  __asm {
    fld EEL_ASM_TYPE [edi]
    fcomp EEL_ASM_TYPE [eax]
    fstsw ax
    test eax, 256
    mov eax, esi
    jz label_23
    fld1
    jmp label_24
label_23:
    
    fldz
label_24:
    
    fstp EEL_ASM_TYPE [esi]
    add esi, EEL_F_SIZE
mov DWORD PTR [eax-0x6f6f6f70],edx
nop
nop
nop
nop
nop
nop
  }
}
nseel_asm_below_end PROC
nseel_asm_below_end ENDP

//---------------------------------------------------------------------------------------------------------------
nseel_asm_beloweq PROC
  __asm {
    fld EEL_ASM_TYPE [eax]
    fcomp EEL_ASM_TYPE [edi]
    fstsw ax
    test eax, 256
    mov eax, esi
    jnz label_25
    fld1
    jmp label_26
label_25:
    
    fldz
label_26:
    
    fstp EEL_ASM_TYPE [esi]
    add esi, EEL_F_SIZE
mov DWORD PTR [eax-0x6f6f6f70],edx
nop
nop
nop
nop
nop
nop
  }
}
nseel_asm_beloweq_end PROC
nseel_asm_beloweq_end ENDP


//---------------------------------------------------------------------------------------------------------------
nseel_asm_above PROC
  __asm {
    fld EEL_ASM_TYPE [eax]
    fcomp EEL_ASM_TYPE [edi]
    fstsw ax
    test eax, 256
    mov eax, esi
    jz label_27
    fld1
    jmp label_28
label_27:
    
    fldz
label_28:
    
    fstp EEL_ASM_TYPE [esi]
    add esi, EEL_F_SIZE
mov DWORD PTR [eax-0x6f6f6f70],edx
nop
nop
nop
nop
nop
nop
  }
}
nseel_asm_above_end PROC
nseel_asm_above_end ENDP

nseel_asm_aboveeq PROC
  __asm {
    fld EEL_ASM_TYPE [edi]
    fcomp EEL_ASM_TYPE [eax]
    fstsw ax
    test eax, 256
    mov eax, esi
    jnz label_29
    fld1
    jmp label_30
label_29:
    
    fldz
label_30:
    
    fstp EEL_ASM_TYPE [esi]
    add esi, EEL_F_SIZE
mov DWORD PTR [eax-0x6f6f6f70],edx
nop
nop
nop
nop
nop
nop
  }
}
nseel_asm_aboveeq_end PROC
nseel_asm_aboveeq_end ENDP



nseel_asm_min PROC
  __asm {
    fld EEL_ASM_TYPE [edi]
    fcomp EEL_ASM_TYPE [eax]
    push eax
    fstsw ax
    test eax, 256
    pop eax
    jz label_31
    mov eax, edi
label_31:
    
mov DWORD PTR [eax-0x6f6f6f70],edx
nop
nop
nop
nop
nop
nop
    }

}
nseel_asm_min_end PROC
nseel_asm_min_end ENDP

nseel_asm_max PROC
  __asm {
    fld EEL_ASM_TYPE [edi]
    fcomp EEL_ASM_TYPE [eax]
    push eax
    fstsw ax
    test eax, 256
    pop eax
    jnz label_32
    mov eax, edi
label_32:
    
mov DWORD PTR [eax-0x6f6f6f70],edx
nop
nop
nop
nop
nop
nop
    }
}
nseel_asm_max_end PROC
nseel_asm_max_end ENDP





// just generic functions left, yay




_asm_generic3parm PROC
  __asm {
ifdef TARGET_X64

ifdef AMD64ABI

    mov r15, rsi
    mov rdx, rdi // third parameter = parm
    mov rdi, 0xFFFFFFFF // first parameter= context

    mov rsi, ecx // second parameter = parm
    mov rcx, rax // fourth parameter = parm
    mov rax, 0xffffffff // call function
    sub rsp, 128
    call rax

    mov rsi, r15
    add rsp, 128

else
    mov edx, ecx // second parameter = parm
    mov ecx, 0xFFFFFFFF // first parameter= context
    mov r8, rdi // third parameter = parm
    mov r9, rax // fourth parameter = parm
    mov edi, 0xffffffff // call function
    sub rsp, 128
    call edi
    add rsp, 128
endif

else
SAVE_STACK
    mov edx, 0xFFFFFFFF
    push eax // push parameter
    push edi // push parameter
    push ecx // push parameter
    push edx // push context pointer
    mov edi, 0xffffffff
    call edi
    add esp, 16
RESTORE_STACK
endif
mov DWORD PTR [eax-0x6f6f6f70],edx
nop
nop
nop
nop
nop
nop
 }
}
_asm_generic3parm_end PROC
_asm_generic3parm_end ENDP


_asm_generic3parm_retd PROC
  __asm {
ifdef TARGET_X64
ifdef AMD64ABI
    mov r15, rsi
    mov rdx, rdi // third parameter = parm
    mov rdi, 0xFFFFFFFF // first parameter= context
    mov rsi, ecx // second parameter = parm
    mov rcx, rax // fourth parameter = parm
    mov rax, 0xffffffff // call function
    sub rsp, 128
    call rax
    add rsp, 128
    mov rsi, r15
    mov rax, r15
    movq [r15], xmm0
    add rsi, 8
else
    mov edx, ecx // second parameter = parm
    mov ecx, 0xFFFFFFFF // first parameter= context
    mov r8, rdi // third parameter = parm
    mov r9, rax // fourth parameter = parm
    mov edi, 0xffffffff // call function
    sub rsp, 128
    call edi
    add rsp, 128
    movq [rsi], xmm0
    mov rax, rsi
    add rsi, 8
endif
else
SAVE_STACK
    mov edx, 0xFFFFFFFF
    push eax // push parameter
    push edi // push parameter
    push ecx // push parameter
    push edx // push context pointer
    mov edi, 0xffffffff
    call edi
    mov eax, esi
	  fstp EEL_ASM_TYPE [esi]
   	add esi, EEL_F_SIZE
    add esp, 16
RESTORE_STACK
endif
mov DWORD PTR [eax-0x6f6f6f70],edx
nop
nop
nop
nop
nop
nop
 }
}
_asm_generic3parm_retd_end PROC
_asm_generic3parm_retd_end ENDP


__declspec(naked) void _asm_generic2parm(void) // this prob neds to be fixed for ppc
{
  __asm {
ifdef TARGET_X64

ifdef AMD64ABI
    mov r15, rsi
    mov esi, edi // second parameter = parm
    mov edi, 0xFFFFFFFF // first parameter= context
    mov rdx, rax // third parameter = parm
    mov rcx, 0xffffffff // call function
    sub rsp, 128
    call rcx
    mov rsi, r15
    add rsp, 128
else
    mov ecx, 0xFFFFFFFF // first parameter= context
    mov edx, edi // second parameter = parm
    mov r8, rax // third parameter = parm
    mov edi, 0xffffffff // call function
    sub rsp, 128
    call edi
    add rsp, 128
endif
else
SAVE_STACK
    mov edx, 0xFFFFFFFF
    sub esp, 4 // keep stack aligned
    push eax // push parameter
    push edi // push parameter
    push edx // push context pointer
    mov edi, 0xffffffff
    call edi
    add esp, 16
RESTORE_STACK
endif
mov DWORD PTR [eax-0x6f6f6f70],edx
nop
nop
nop
nop
nop
nop
 }
}
_asm_generic2parm_end PROC
_asm_generic2parm_end ENDP


_asm_generic2parm_retd PROC
  __asm {
ifdef TARGET_X64
ifdef AMD64ABI
    mov r15, rsi
    mov rsi, rdi // second parameter = parm
    mov rdi, 0xFFFFFFFF // first parameter= context
    mov rdx, rax // third parameter = parm
    mov rcx, 0xffffffff // call function
    sub rsp, 128
    call rcx
    mov rsi, r15
    add rsp, 128
    movq [r15], xmm0
    mov rax, r15
    add rsi, 8
else
    mov ecx, 0xFFFFFFFF // first parameter= context
    mov edx, edi // second parameter = parm
    mov r8, rax // third parameter = parm
    mov edi, 0xffffffff // call function
    sub rsp, 128
    call edi
    add rsp, 128
    movq [rsi], xmm0
    mov rax, rsi
    add rsi, 8
endif
else
SAVE_STACK
    mov edx, 0xFFFFFFFF
    push eax // push parameter
    push edi // push parameter
    push ecx // push parameter
    push edx // push context pointer
    mov edi, 0xffffffff
    call edi
    mov eax, esi
	  fstp EEL_ASM_TYPE [esi]
   	add esi, EEL_F_SIZE
    add esp, 16
RESTORE_STACK
endif
mov DWORD PTR [eax-0x6f6f6f70],edx
nop
nop
nop
nop
nop
nop
 }
}
_asm_generic2parm_retd_end PROC
_asm_generic2parm_retd_end ENDP





__declspec(naked) void _asm_generic1parm(void) // this prob neds to be fixed for ppc
{
  __asm {
ifdef TARGET_X64
ifdef AMD64ABI
    mov rdi, 0xFFFFFFFF // first parameter= context
    mov r15, rsi
    mov rsi, eax // second parameter = parm
    sub rsp, 128
    mov rcx, 0xffffffff // call function
    call rcx
    mov rsi, r15
    add rsp, 128
else
    mov ecx, 0xFFFFFFFF // first parameter= context
    mov edx, eax // second parameter = parm
    mov edi, 0xffffffff // call function
    sub rsp, 128
    call edi
    add rsp, 128
endif
else
SAVE_STACK
    mov edx, 0xFFFFFFFF
    sub esp, 8 // keep stack aligned
    push eax // push parameter
    push edx // push context pointer
    mov edi, 0xffffffff
    call edi
    add esp, 16
RESTORE_STACK
endif

mov DWORD PTR [eax-0x6f6f6f70],edx
nop
nop
nop
nop
nop
nop
 }
}
_asm_generic1parm_end PROC
_asm_generic1parm_end ENDP


__declspec(naked) void _asm_generic1parm_retd(void) // 1 parameter returning double
{
  __asm {
ifdef TARGET_X64
ifdef AMD64ABI
    mov r15, rsi
    mov rdi, 0xFFFFFFFF // first parameter= context
    mov rsi, rax // second parameter = parm
    mov rcx, 0xffffffff // call function
    sub rsp, 128
    call rcx
    mov rsi, r15
    add rsp, 128
    movq [r15], xmm0
    mov rax, r15
    add rsi, 8
else
    mov ecx, 0xFFFFFFFF // first parameter= context
    mov edx, eax // second parameter = parm
    mov edi, 0xffffffff // call function
    sub rsp, 128
    call edi
    add rsp, 128
    movq [rsi], xmm0
    mov rax, rsi
    add rsi, 8
endif
else
SAVE_STACK
    mov edx, 0xFFFFFFFF
    sub esp, 8 // keep stack aligned
    push eax // push parameter
    push edx // push context pointer
    mov edi, 0xffffffff
    call edi
	  mov eax, esi
	  fstp EEL_ASM_TYPE [esi]
	  add esi, EEL_F_SIZE
    add esp, 16
RESTORE_STACK
endif
mov DWORD PTR [eax-0x6f6f6f70],edx
nop
nop
nop
nop
nop
nop
 }
}
_asm_generic1parm_retd_end PROC
_asm_generic1parm_retd_end ENDP





// this gets its own stub because it's pretty crucial for performance :/

_asm_megabuf PROC
  __asm {
SAVE_STACK

ifdef TARGET_X64


ifdef AMD64ABI

    mov r15, rsi
    mov rdi, 0xFFFFFFFF // first parameter = context pointer
    fld EEL_ASM_TYPE [eax]
    mov rdx, 0xFFFFFFFF
    fadd EEL_ASM_TYPE [rdx]
    fistp dword ptr [r15]
    xor rsi, rsi
    mov esi, dword ptr [r15] // r15 = esi (from above)
    mov edx, 0xffffffff
    sub rsp, 128
    call edx
    mov rsi, r15
    add rsp, 128
    and rax, rax
    jnz label_33
    mov rax, r15
    mov qword ptr [esi], 0
    add rsi, EEL_F_SIZE
label_33:
    

else
    mov ecx, 0xFFFFFFFF // first parameter = context pointer
    fld EEL_ASM_TYPE [eax]
	mov edx, 0xFFFFFFFF
    fadd EEL_ASM_TYPE [rdx]
    fistp dword ptr [esi]
    xor rdx, rdx
    mov edx, dword ptr [esi]
    mov edi, 0xffffffff
	sub rsp, 128
    call edi
	add rsp, 128
    and rax, rax
    jnz label_34
    mov rax, rsi
    mov qword ptr [esi], 0
    add esi, EEL_F_SIZE
label_34:
    
endif


else
    mov edx, 0xFFFFFFFF
    fld EEL_ASM_TYPE [eax]
if EEL_F_SIZE == 8
_emit 0xDC // fadd qword ptr [0xffffffff]
_emit 0x05
_emit 0xFF
_emit 0xFF
_emit 0xFF
_emit 0xFF
else
_emit 0xD8 // fadd dword ptr [0xffffffff]
_emit 0x05
_emit 0xFF
_emit 0xFF
_emit 0xFF
_emit 0xFF
endif
    fistp dword ptr [esi]
    sub esp, 8 // keep stack aligned
    push dword ptr [esi] // parameter
    push edx // push context pointer
    mov edi, 0xffffffff
    call edi
    add esp, 16
    and eax, eax
    jnz label_35
    mov eax, esi
    mov dword ptr [esi], 0
if EEL_F_SIZE == 8
    mov dword ptr [esi+4], 0
endif
    add esi, EEL_F_SIZE
label_35:
    


endif

RESTORE_STACK

mov DWORD PTR [eax-0x6f6f6f70],edx
nop
nop
nop
nop
nop
nop
 }
}

_asm_megabuf_end PROC
_asm_megabuf_end ENDP


ifdef TARGET_X64
__declspec(naked) void win64_callcode()
{
	__asm {
ifdef AMD64ABI
		mov eax, edi
else
		mov eax, ecx
endif

		push rbx
		push rbp
ifndef AMD64ABI
		push rdi
		push rsi
		push r12
		push r13
endif
		push r14 // on AMD64ABI, we'll use r14/r15 to save edi/esi
		push r15
		call eax
		pop r15
		pop r14
ifndef AMD64ABI
		pop r13
		pop r12
		pop rsi
		pop rdi
		fclex
endif
		pop rbp
		pop rbx
		ret
mov DWORD PTR [eax-0x6f6f6f70],edx
nop
nop
nop
nop
nop
nop
	}
}

endif
_text ENDS
END