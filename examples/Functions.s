	.file "/Users/bogdan/Developer/projects/itmo/vm/lama-jit/examples/Functions.lama"

	.globl	_main

	.data

_string_1:	.string	"Factorial: %d\n"

_string_3:	.string	"Function %s called with incorrect arguments count. Expected: %d. Actual: %d\n"

_string_2:	.string	"Function composition: %d\n"

_string_0:	.string	"Functions are first-class, higher-order.\n"

_string_6:	.string	"lambda_0"

_string_4:	.string	"lambda_1"

_string_5:	.string	"lambda_2_3"

_string_7:	.string	"lambda_3_7"

_init:	.quad 0

	.section __DATA, custom_data, regular, no_dead_strip

_filler:	.fill	4, 8, 1

	.text

_.Ltext:

# IMPORT ("Std")

# IMPORT ("Fun")

# IMPORT ("List")

# PUBLIC ("main", true)

# EXTERN ("filter", true)

# EXTERN ("remove", true)

# EXTERN ("unzip", true)

# EXTERN ("zip", true)

# EXTERN ("deepFlatten", true)

# EXTERN ("flatten", true)

# EXTERN ("find", true)

# EXTERN ("assoc", true)

# EXTERN ("reverse", true)

# EXTERN ("i__Infix_434343", true)

# EXTERN ("map", true)

# EXTERN ("iter", true)

# EXTERN ("foldr", true)

# EXTERN ("foldl", true)

# EXTERN ("size", true)

# EXTERN ("fix", true)

# EXTERN ("i__Infix_35", true)

# EXTERN ("i__Infix_36", true)

# EXTERN ("id", true)

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

_main:

# BEGIN ("main", 2, 0, [], [], [])

	movq	_init(%rip),	%rax
	test	%rax,	%rax
	jz	_continue
	ret
__ERROR:

	call	_Lbinoperror
	ret
__ERROR2:

	call	_Lbinoperror2
	ret
_continue:

	movq	$1,	_init(%rip)
	pushq	%rbp
	movq	%rsp,	%rbp
	subq	$_Lmain_SIZE,	%rsp
	movq	%rdi,	%r12
	movq	%rsi,	%r13
	movq	%rcx,	%r14
	movq	%rsp,	%rdi
	leaq	_filler(%rip),	%rsi
	movq	$_LSmain_SIZE,	%rcx
	rep movsq	
	movq	%r12,	%rdi
	movq	%r13,	%rsi
	movq	%r14,	%rcx
	movq	$15,	%rax
	test	%rsp,	%rax
	jz	_ALIGNED
	pushq	_filler(%rip)
_ALIGNED:

	pushq	%rdi
	pushq	%rsi
	call	___gc_init
	popq	%rsi
	popq	%rdi
	call	_set_args
	call	_InitFun
	call	_InitList
# SLABEL ("1")

_L1:

# LINE (2)

_.L0:

# STRING ("Functions are first-class, higher-order.\\n")

	leaq	_string_0(%rip),	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	_filler(%rip)
	pushq	%r10
	movq	%rsp,	%rdi
	call	_Bstring
	addq	$16,	%rsp
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# CALL ("printf", 1, false)

	pushq	%rdi
	pushq	%rsi
	movq	%r10,	%rdi
	movq	$0,	%r11
	call	_Lprintf
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# DROP

# LINE (4)

_.L1:

# STRING ("Factorial: %d\\n")

	leaq	_string_1(%rip),	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	_filler(%rip)
	pushq	%r10
	movq	%rsp,	%rdi
	call	_Bstring
	addq	$16,	%rsp
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# LINE (6)

_.L2:

# CLOSURE ("lambda_0", [])

	leaq	_Llambda_0(%rip),	%r11
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%rsp,	%rdi
	movq	$1,	%rsi
	call	_Bclosure
	addq	$8,	%rsp
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r11
# CALL ("fix", 1, false)

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	_filler(%rip)
	movq	%r11,	%rdi
	movq	$1,	%r11
	call	_Lfix
	addq	$8,	%rsp
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r11
# CONST (5)

	movq	$11,	%r12
# CALLC (1, false)

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%r12,	%rdi
	movq	%r11,	%r15
	movq	$1,	%r11
	call	*(%r15)
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r11
# CALL ("printf", 2, false)

	pushq	%rdi
	pushq	%rsi
	movq	%r11,	%rsi
	movq	%r10,	%rdi
	movq	$1,	%r11
	call	_Lprintf
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# DROP

# STRING ("Function composition: %d\\n")

	leaq	_string_2(%rip),	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	_filler(%rip)
	pushq	%r10
	movq	%rsp,	%rdi
	call	_Bstring
	addq	$16,	%rsp
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# LINE (7)

_.L3:

# CLOSURE ("i__Infix_35", [])

	leaq	_Li__Infix_35(%rip),	%r11
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%rsp,	%rdi
	movq	$1,	%rsi
	call	_Bclosure
	addq	$8,	%rsp
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r11
# CLOSURE ("id", [])

	leaq	_Lid(%rip),	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	pushq	_filler(%rip)
	pushq	%r12
	movq	%rsp,	%rdi
	movq	$1,	%rsi
	call	_Bclosure
	addq	$16,	%rsp
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r12
# CLOSURE ("lambda_1", [])

	leaq	_Llambda_1(%rip),	%r13
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	pushq	%r12
	pushq	%r13
	movq	%rsp,	%rdi
	movq	$1,	%rsi
	call	_Bclosure
	addq	$8,	%rsp
	popq	%r12
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r13
# CONST (1)

	movq	$3,	%r14
# CONST (2)

	movq	$5,	-8(%rbp)
# CONST (3)

	movq	$7,	-16(%rbp)
# CONST (0)

	movq	$1,	-24(%rbp)
# SEXP ("cons", 2)

	movq	$1697575,	-32(%rbp)
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	-32(%rbp)
	pushq	-24(%rbp)
	pushq	-16(%rbp)
	movq	%rsp,	%rdi
	movq	$7,	%rsi
	call	_Bsexp
	addq	$24,	%rsp
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	-16(%rbp)
# SEXP ("cons", 2)

	movq	$1697575,	-24(%rbp)
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	-24(%rbp)
	pushq	-16(%rbp)
	pushq	-8(%rbp)
	movq	%rsp,	%rdi
	movq	$7,	%rsi
	call	_Bsexp
	addq	$24,	%rsp
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	-8(%rbp)
# SEXP ("cons", 2)

	movq	$1697575,	-16(%rbp)
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	pushq	%r12
	pushq	%r13
	pushq	_filler(%rip)
	pushq	-16(%rbp)
	pushq	-8(%rbp)
	pushq	%r14
	movq	%rsp,	%rdi
	movq	$7,	%rsi
	call	_Bsexp
	addq	$32,	%rsp
	popq	%r13
	popq	%r12
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r14
# CALL ("map", 2, false)

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	pushq	%r12
	pushq	_filler(%rip)
	movq	%r14,	%rsi
	movq	%r13,	%rdi
	movq	$2,	%r11
	call	_Lmap
	addq	$8,	%rsp
	popq	%r12
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r13
# CALL ("foldl", 3, false)

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	_filler(%rip)
	movq	%r13,	%rdx
	movq	%r12,	%rsi
	movq	%r11,	%rdi
	movq	$3,	%r11
	call	_Lfoldl
	addq	$8,	%rsp
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r11
# CONST (10)

	movq	$21,	%r12
# CALL ("i__Infix_36", 2, false)

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	_filler(%rip)
	movq	%r12,	%rsi
	movq	%r11,	%rdi
	movq	$2,	%r11
	call	_Li__Infix_36
	addq	$8,	%rsp
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r11
# CALL ("printf", 2, false)

	pushq	%rdi
	pushq	%rsi
	movq	%r11,	%rsi
	movq	%r10,	%rdi
	movq	$1,	%r11
	call	_Lprintf
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# SLABEL ("2")

_L2:

# END

	movq	%r10,	%rax
_Lmain_epilogue:

	movq	%rbp,	%rsp
	popq	%rbp
	xorq	%rax,	%rax
	ret
	.set	_Lmain_SIZE,	32

	.set	_LSmain_SIZE,	4

# LABEL ("lambda_1")

_Llambda_1:

# BEGIN ("lambda_1", 1, 0, [], ["i"], [{ blab="28"; elab="29"; names=[]; subs=[{ blab="31"; elab="32"; names=[]; subs=[]; }]; }])

	pushq	%rbp
	movq	%rsp,	%rbp
	subq	$_LLlambda_1_SIZE,	%rsp
	movq	%rdi,	%r12
	movq	%rsi,	%r13
	movq	%rcx,	%r14
	movq	%rsp,	%rdi
	leaq	_filler(%rip),	%rsi
	movq	$_LSLlambda_1_SIZE,	%rcx
	rep movsq	
	movq	%r12,	%rdi
	movq	%r13,	%rsi
	movq	%r14,	%rcx
# Check arguments count

	cmpq	$1,	%r11
	je	_Llambda_1_argc_correct
	movq	%r11,	%r13
	movq	$1,	%r12
	leaq	_string_4(%rip),	%r11
	leaq	_string_3(%rip),	%r10
	pushq	%rdi
	pushq	%rsi
	movq	%r13,	%rcx
	movq	%r12,	%rdx
	movq	%r11,	%rsi
	movq	%r10,	%rdi
	movq	$4,	%r11
	call	_failure
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
_Llambda_1_argc_correct:

# SLABEL ("28")

_L28:

# SLABEL ("31")

_L31:

# CLOSURE ("lambda_2_3", [Arg (0)])

	movq	%rdi,	%r11
	leaq	_Llambda_2_3(%rip),	%r10
	pushq	%rdi
	pushq	_filler(%rip)
	pushq	%r11
	pushq	%r10
	movq	%rsp,	%rdi
	movq	$3,	%rsi
	call	_Bclosure
	addq	$24,	%rsp
	popq	%rdi
	movq	%rax,	%r10
# SLABEL ("32")

_L32:

# LABEL ("30")

_L30:

# SLABEL ("29")

_L29:

# END

	movq	%r10,	%rax
_LLlambda_1_epilogue:

	movq	%rbp,	%rsp
	popq	%rbp
	ret
	.set	_LLlambda_1_SIZE,	0

	.set	_LSLlambda_1_SIZE,	0

# LABEL ("lambda_2_3")

_Llambda_2_3:

# BEGIN ("lambda_2_3", 1, 0, [Arg (0)], ["x"], [{ blab="33"; elab="34"; names=[]; subs=[{ blab="36"; elab="37"; names=[]; subs=[]; }]; }])

	pushq	%rbp
	movq	%rsp,	%rbp
	subq	$_LLlambda_2_3_SIZE,	%rsp
	movq	%rdi,	%r12
	movq	%rsi,	%r13
	movq	%rcx,	%r14
	movq	%rsp,	%rdi
	leaq	_filler(%rip),	%rsi
	movq	$_LSLlambda_2_3_SIZE,	%rcx
	rep movsq	
	movq	%r12,	%rdi
	movq	%r13,	%rsi
	movq	%r14,	%rcx
# Check arguments count

	cmpq	$1,	%r11
	je	_Llambda_2_3_argc_correct
	movq	%r11,	%r13
	movq	$1,	%r12
	leaq	_string_5(%rip),	%r11
	leaq	_string_3(%rip),	%r10
	pushq	%rdi
	pushq	_filler(%rip)
	movq	%r13,	%rcx
	movq	%r12,	%rdx
	movq	%r11,	%rsi
	movq	%r10,	%rdi
	movq	$4,	%r11
	call	_failure
	addq	$8,	%rsp
	popq	%rdi
	movq	%rax,	%r10
_Llambda_2_3_argc_correct:

# SLABEL ("33")

_L33:

# SLABEL ("36")

_L36:

# LD (Arg (0))

	movq	%rdi,	%r10
# LD (Access (0))

	movq	8(%r15),	%r11
# BINOP ("+")

	addq	%r11,	%r10
	decq	%r10
# SLABEL ("37")

_L37:

# LABEL ("35")

_L35:

# SLABEL ("34")

_L34:

# END

	movq	%r10,	%rax
_LLlambda_2_3_epilogue:

	movq	%rbp,	%rsp
	popq	%rbp
	ret
	.set	_LLlambda_2_3_SIZE,	0

	.set	_LSLlambda_2_3_SIZE,	0

# LABEL ("lambda_0")

_Llambda_0:

# BEGIN ("lambda_0", 1, 0, [], ["f"], [{ blab="40"; elab="41"; names=[]; subs=[{ blab="43"; elab="44"; names=[]; subs=[]; }]; }])

	pushq	%rbp
	movq	%rsp,	%rbp
	subq	$_LLlambda_0_SIZE,	%rsp
	movq	%rdi,	%r12
	movq	%rsi,	%r13
	movq	%rcx,	%r14
	movq	%rsp,	%rdi
	leaq	_filler(%rip),	%rsi
	movq	$_LSLlambda_0_SIZE,	%rcx
	rep movsq	
	movq	%r12,	%rdi
	movq	%r13,	%rsi
	movq	%r14,	%rcx
# Check arguments count

	cmpq	$1,	%r11
	je	_Llambda_0_argc_correct
	movq	%r11,	%r13
	movq	$1,	%r12
	leaq	_string_6(%rip),	%r11
	leaq	_string_3(%rip),	%r10
	pushq	%r15
	pushq	%rdi
	movq	%r13,	%rcx
	movq	%r12,	%rdx
	movq	%r11,	%rsi
	movq	%r10,	%rdi
	movq	$4,	%r11
	call	_failure
	popq	%rdi
	popq	%r15
	movq	%rax,	%r10
_Llambda_0_argc_correct:

# SLABEL ("40")

_L40:

# SLABEL ("43")

_L43:

# LINE (6)

_.L4:

# CLOSURE ("lambda_3_7", [Arg (0)])

	movq	%rdi,	%r11
	leaq	_Llambda_3_7(%rip),	%r10
	pushq	%rdi
	pushq	_filler(%rip)
	pushq	%r11
	pushq	%r10
	movq	%rsp,	%rdi
	movq	$3,	%rsi
	call	_Bclosure
	addq	$24,	%rsp
	popq	%rdi
	movq	%rax,	%r10
# SLABEL ("44")

_L44:

# LABEL ("42")

_L42:

# SLABEL ("41")

_L41:

# END

	movq	%r10,	%rax
_LLlambda_0_epilogue:

	movq	%rbp,	%rsp
	popq	%rbp
	ret
	.set	_LLlambda_0_SIZE,	0

	.set	_LSLlambda_0_SIZE,	0

# LABEL ("lambda_3_7")

_Llambda_3_7:

# BEGIN ("lambda_3_7", 1, 0, [Arg (0)], ["n"], [{ blab="45"; elab="46"; names=[]; subs=[{ blab="48"; elab="49"; names=[]; subs=[{ blab="56"; elab="57"; names=[]; subs=[]; }; { blab="54"; elab="55"; names=[]; subs=[]; }]; }]; }])

	pushq	%rbp
	movq	%rsp,	%rbp
	subq	$_LLlambda_3_7_SIZE,	%rsp
	movq	%rdi,	%r12
	movq	%rsi,	%r13
	movq	%rcx,	%r14
	movq	%rsp,	%rdi
	leaq	_filler(%rip),	%rsi
	movq	$_LSLlambda_3_7_SIZE,	%rcx
	rep movsq	
	movq	%r12,	%rdi
	movq	%r13,	%rsi
	movq	%r14,	%rcx
# Check arguments count

	cmpq	$1,	%r11
	je	_Llambda_3_7_argc_correct
	movq	%r11,	%r13
	movq	$1,	%r12
	leaq	_string_7(%rip),	%r11
	leaq	_string_3(%rip),	%r10
	pushq	%rdi
	pushq	_filler(%rip)
	movq	%r13,	%rcx
	movq	%r12,	%rdx
	movq	%r11,	%rsi
	movq	%r10,	%rdi
	movq	$4,	%r11
	call	_failure
	addq	$8,	%rsp
	popq	%rdi
	movq	%rax,	%r10
_Llambda_3_7_argc_correct:

# SLABEL ("45")

_L45:

# SLABEL ("48")

_L48:

# LD (Arg (0))

	movq	%rdi,	%r10
# CONST (1)

	movq	$3,	%r11
# BINOP ("==")

	xorq	%rax,	%rax
	cmpq	%r11,	%r10
	sete	%al
	salq	%rax
	orq	$0x0001,	%rax
	movq	%rax,	%r10
# CJMP ("z", "51")

	sarq	%r10
	cmpq	$0,	%r10
	jz	_L51
# SLABEL ("54")

_L54:

# CONST (1)

	movq	$3,	%r10
# SLABEL ("55")

_L55:

# JMP ("47")

	jmp	_L47
# LABEL ("51")

_L51:

# SLABEL ("56")

_L56:

# LD (Arg (0))

	movq	%rdi,	%r10
# LD (Access (0))

	movq	8(%r15),	%r11
# LD (Arg (0))

	movq	%rdi,	%r12
# CONST (1)

	movq	$3,	%r13
# BINOP ("-")

	subq	%r13,	%r12
	orq	$0x0001,	%r12
# CALLC (1, false)

	pushq	%r15
	pushq	%rdi
	pushq	%r10
	pushq	%r11
	movq	%r12,	%rdi
	movq	%r11,	%r15
	movq	$1,	%r11
	call	*(%r15)
	popq	%r11
	popq	%r10
	popq	%rdi
	popq	%r15
	movq	%rax,	%r11
# BINOP ("*")

	decq	%r10
	movq	%r11,	%rax
	sarq	%rax
	imulq	%rax,	%r10
	orq	$0x0001,	%r10
# SLABEL ("57")

_L57:

# JMP ("47")

	jmp	_L47
# SLABEL ("49")

_L49:

# LABEL ("47")

_L47:

# SLABEL ("46")

_L46:

# END

	movq	%r10,	%rax
_LLlambda_3_7_epilogue:

	movq	%rbp,	%rsp
	popq	%rbp
	ret
	.set	_LLlambda_3_7_SIZE,	0

	.set	_LSLlambda_3_7_SIZE,	0

