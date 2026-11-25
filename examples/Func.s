	.file "/repos/LLLama/examples/Func.lama"

	.stabs "/repos/LLLama/examples/Func.lama",100,0,0,.Ltext

	.globl	main

	.data

string_0:	.string	"Function %s called with incorrect arguments count. Expected: %d. Actual: %d\n"

string_1:	.string	"add"

init:	.quad 0

	.section custom_data,"aw",@progbits

filler:	.fill	0, 8, 1

	.stabs "a:S1",40,0,0,global_a

global_a:	.quad	1

	.stabs "b:S1",40,0,0,global_b

global_b:	.quad	1

	.stabs "c:S1",40,0,0,global_c

global_c:	.quad	1

	.text

.Ltext:

	.stabs "data:t1=r1;0;4294967295;",128,0,0,0

# IMPORT ("Std")

# PUBLIC ("main", true)

# EXTERN ("lowercase", true)

# EXTERN ("uppercase", true)

# EXTERN ("tagHash", true)

# EXTERN ("flatCompare", true)

# EXTERN ("compareTags", true)

# EXTERN ("kindOf", true)

# EXTERN ("time", true)

# EXTERN ("random", true)

# EXTERN ("disableGC", true)

# EXTERN ("enableGC", true)

# EXTERN ("s__Infix_37", true)

# EXTERN ("s__Infix_47", true)

# EXTERN ("s__Infix_42", true)

# EXTERN ("s__Infix_45", true)

# EXTERN ("s__Infix_43", true)

# EXTERN ("s__Infix_62", true)

# EXTERN ("s__Infix_6261", true)

# EXTERN ("s__Infix_60", true)

# EXTERN ("s__Infix_6061", true)

# EXTERN ("s__Infix_3361", true)

# EXTERN ("s__Infix_6161", true)

# EXTERN ("s__Infix_3838", true)

# EXTERN ("s__Infix_3333", true)

# EXTERN ("s__Infix_58", true)

# EXTERN ("i__Infix_4343", true)

# EXTERN ("compare", true)

# EXTERN ("write", true)

# EXTERN ("read", true)

# EXTERN ("failure", true)

# EXTERN ("fexists", true)

# EXTERN ("fwrite", true)

# EXTERN ("fread", true)

# EXTERN ("fclose", true)

# EXTERN ("fopen", true)

# EXTERN ("fprintf", true)

# EXTERN ("printf", true)

# EXTERN ("makeString", true)

# EXTERN ("sprintf", true)

# EXTERN ("regexpMatch", true)

# EXTERN ("regexp", true)

# EXTERN ("substring", true)

# EXTERN ("matchSubString", true)

# EXTERN ("stringcat", true)

# EXTERN ("readLine", true)

# EXTERN ("tl", true)

# EXTERN ("hd", true)

# EXTERN ("snd", true)

# EXTERN ("fst", true)

# EXTERN ("hash", true)

# EXTERN ("clone", true)

# EXTERN ("length", true)

# EXTERN ("string", true)

# EXTERN ("makeArray", true)

# EXTERN ("stringInt", true)

# EXTERN ("sysargs", false)

# EXTERN ("system", true)

# EXTERN ("getEnv", true)

# EXTERN ("assert", true)

# LABEL ("main")

main:

# BEGIN ("main", 2, 0, [], [], [])

	.type main, @function

	.cfi_startproc

	movq	init(%rip),	%rax
	test	%rax,	%rax
	jz	continue
	ret
_ERROR:

	call	Lbinoperror
	ret
_ERROR2:

	call	Lbinoperror2
	ret
continue:

	movq	$1,	init(%rip)
	pushq	%rbp
	.cfi_def_cfa_offset	8

	.cfi_offset 5, -8

	movq	%rsp,	%rbp
	.cfi_def_cfa_register	5

	subq	$Lmain_SIZE,	%rsp
	movq	%rdi,	%r12
	movq	%rsi,	%r13
	movq	%rcx,	%r14
	movq	%rsp,	%rdi
	leaq	filler(%rip),	%rsi
	movq	$LSmain_SIZE,	%rcx
	rep movsq	
	movq	%r12,	%rdi
	movq	%r13,	%rsi
	movq	%r14,	%rcx
	movq	$15,	%rax
	test	%rsp,	%rax
	jz	ALIGNED
	pushq	filler(%rip)
ALIGNED:

	pushq	%rdi
	pushq	%rsi
	call	__gc_init
	popq	%rsi
	popq	%rdi
	call	set_args
# SLABEL ("1")

L1:

# CALL ("read", 0, false)

	pushq	%rdi
	pushq	%rsi
	movq	$0,	%r11
	call	Lread
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# LINE (5)

	.stabn 68,0,5,.L0

.L0:

# ST (Global ("a"))

	movq	%r10,	global_a(%rip)
# DROP

# CALL ("read", 0, false)

	pushq	%rdi
	pushq	%rsi
	movq	$0,	%r11
	call	Lread
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# LINE (6)

	.stabn 68,0,6,.L1

.L1:

# ST (Global ("b"))

	movq	%r10,	global_b(%rip)
# DROP

# LD (Global ("a"))

	movq	global_a(%rip),	%r10
# LD (Global ("b"))

	movq	global_b(%rip),	%r11
# CALL ("add", 2, false)

	pushq	%rdi
	pushq	%rsi
	movq	%r11,	%rsi
	movq	%r10,	%rdi
	movq	$2,	%r11
	call	Ladd
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# LINE (7)

	.stabn 68,0,7,.L2

.L2:

# ST (Global ("c"))

	movq	%r10,	global_c(%rip)
# DROP

# LINE (8)

	.stabn 68,0,8,.L3

.L3:

# LD (Global ("c"))

	movq	global_c(%rip),	%r10
# CALL ("write", 1, false)

	pushq	%rdi
	pushq	%rsi
	movq	%r10,	%rdi
	movq	$1,	%r11
	call	Lwrite
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# SLABEL ("2")

L2:

# END

	movq	%r10,	%rax
Lmain_epilogue:

	movq	%rbp,	%rsp
	popq	%rbp
	xorq	%rax,	%rax
	.cfi_restore	rbp

	.cfi_def_cfa	4, 4

	ret
	.cfi_endproc

	.set	Lmain_SIZE,	0

	.set	LSmain_SIZE,	0

	.size main, .-main

# LABEL ("add")

Ladd:

# BEGIN ("add", 2, 0, [], ["x"; "y"], [{ blab="17"; elab="18"; names=[]; subs=[{ blab="20"; elab="21"; names=[]; subs=[]; }]; }])

	.type Ladd, @function

	.stabs "add:F1",36,0,0,Ladd

	.cfi_startproc

	pushq	%rbp
	.cfi_def_cfa_offset	8

	.cfi_offset 5, -8

	movq	%rsp,	%rbp
	.cfi_def_cfa_register	5

	subq	$LLadd_SIZE,	%rsp
	movq	%rdi,	%r12
	movq	%rsi,	%r13
	movq	%rcx,	%r14
	movq	%rsp,	%rdi
	leaq	filler(%rip),	%rsi
	movq	$LSLadd_SIZE,	%rcx
	rep movsq	
	movq	%r12,	%rdi
	movq	%r13,	%rsi
	movq	%r14,	%rcx
# Check arguments count

	cmpq	$2,	%r11
	je	Ladd_argc_correct
	movq	%r11,	%r13
	movq	$2,	%r12
	leaq	string_1(%rip),	%r11
	leaq	string_0(%rip),	%r10
	pushq	%rdi
	pushq	%rsi
	movq	%r13,	%rcx
	movq	%r12,	%rdx
	movq	%r11,	%rsi
	movq	%r10,	%rdi
	movq	$4,	%r11
	call	failure
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
Ladd_argc_correct:

# SLABEL ("17")

L17:

# SLABEL ("20")

L20:

# LINE (1)

	.stabn 68,0,1,0

	.stabn 68,0,1,.L4-Ladd

.L4:

# LD (Arg (0))

	movq	%rdi,	%r10
# LINE (2)

	.stabn 68,0,2,.L5-Ladd

.L5:

# LD (Arg (1))

	movq	%rsi,	%r11
# BINOP ("+")

	addq	%r11,	%r10
	decq	%r10
# SLABEL ("21")

L21:

# LABEL ("19")

L19:

# SLABEL ("18")

L18:

# END

	movq	%r10,	%rax
LLadd_epilogue:

	movq	%rbp,	%rsp
	popq	%rbp
	.cfi_restore	rbp

	.cfi_def_cfa	4, 4

	ret
	.cfi_endproc

	.set	LLadd_SIZE,	0

	.set	LSLadd_SIZE,	0

	.size Ladd, .-Ladd

