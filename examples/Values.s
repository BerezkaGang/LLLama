	.file "/Users/bogdan/Developer/projects/itmo/vm/lama-jit/examples/Values.lama"

	.globl	_main

	.data

_string_13:	.string	"    subvalue [%d] = %s\n"

_string_12:	.string	"  %s has %d subvalue(s):\n"

_string_5:	.string	"And now we look at accessing/modifying/analyzing the values.\n"

_string_8:	.string	"And the subvalues of a composite value can be reassigned.\n"

_string_6:	.string	"Any composite value can be asked on the number of its immediate subvalues,\n"

_string_9:	.string	"Function %s called with incorrect arguments count. Expected: %d. Actual: %d\n"

_string_0:	.string	"a"

_string_7:	.string	"and these subvalues can be accessed:\n"

_string_4:	.string	"apple"

_string_1:	.string	"b"

_string_2:	.string	"c"

_string_10:	.string	"lambda_0"

_string_11:	.string	"show"

_string_3:	.string	"string"

_init:	.quad 0

	.section __DATA, custom_data, regular, no_dead_strip

_filler:	.fill	2, 8, 1

_global_samples:	.quad	1

	.text

_.Ltext:

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
# SLABEL ("1")

_L1:

# STRING ("a")

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
# STRING ("b")

	leaq	_string_1(%rip),	%r11
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%rsp,	%rdi
	call	_Bstring
	addq	$8,	%rsp
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r11
# STRING ("c")

	leaq	_string_2(%rip),	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	pushq	_filler(%rip)
	pushq	%r12
	movq	%rsp,	%rdi
	call	_Bstring
	addq	$16,	%rsp
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r12
# CONST (0)

	movq	$1,	%r13
# SEXP ("cons", 2)

	movq	$1697575,	%r14
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	pushq	_filler(%rip)
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rsp,	%rdi
	movq	$7,	%rsi
	call	_Bsexp
	addq	$32,	%rsp
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r12
# SEXP ("cons", 2)

	movq	$1697575,	%r13
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r13
	pushq	%r12
	pushq	%r11
	movq	%rsp,	%rdi
	movq	$7,	%rsi
	call	_Bsexp
	addq	$24,	%rsp
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r11
# SEXP ("cons", 2)

	movq	$1697575,	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	_filler(%rip)
	pushq	%r12
	pushq	%r11
	pushq	%r10
	movq	%rsp,	%rdi
	movq	$7,	%rsi
	call	_Bsexp
	addq	$32,	%rsp
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# STRING ("string")

	leaq	_string_3(%rip),	%r11
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%rsp,	%rdi
	call	_Bstring
	addq	$8,	%rsp
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r11
# CALL (".array", 0, false)

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%rsp,	%rdi
	movq	$1,	%rsi
	call	_Barray
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r12
# STRING ("apple")

	leaq	_string_4(%rip),	%r13
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	pushq	%r12
	pushq	%r13
	movq	%rsp,	%rdi
	call	_Bstring
	addq	$8,	%rsp
	popq	%r12
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r13
# SEXP ("Fruit", 1)

	movq	$1083352233,	%r14
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	pushq	%r12
	pushq	_filler(%rip)
	pushq	%r14
	pushq	%r13
	movq	%rsp,	%rdi
	movq	$5,	%rsi
	call	_Bsexp
	addq	$24,	%rsp
	popq	%r12
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r13
# CLOSURE ("lambda_0", [])

	leaq	_Llambda_0(%rip),	%r14
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	pushq	%r12
	pushq	%r13
	pushq	_filler(%rip)
	pushq	%r14
	movq	%rsp,	%rdi
	movq	$1,	%rsi
	call	_Bclosure
	addq	$16,	%rsp
	popq	%r13
	popq	%r12
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r14
# CALL (".array", 5, false)

	pushq	%rdi
	pushq	%rsi
	pushq	_filler(%rip)
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r11
	pushq	%r10
	movq	%rsp,	%rdi
	movq	$11,	%rsi
	call	_Barray
	addq	$48,	%rsp
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# LINE (1)

_.L0:

# ST (Global ("samples"))

	movq	%r10,	_global_samples(%rip)
# DROP

# LINE (19)

_.L1:

# STRING ("And now we look at accessing/modifying/analyzing the values.\\n")

	leaq	_string_5(%rip),	%r10
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

# LINE (21)

_.L2:

# STRING ("Any composite value can be asked on the number of its immediate subvalues,\\n")

	leaq	_string_6(%rip),	%r10
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

# LINE (22)

_.L3:

# STRING ("and these subvalues can be accessed:\\n")

	leaq	_string_7(%rip),	%r10
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

# LINE (23)

_.L4:

# CALL ("show", 0, false)

	pushq	%rdi
	pushq	%rsi
	movq	$0,	%r11
	call	_Lshow
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# DROP

# LINE (25)

_.L5:

# STRING ("And the subvalues of a composite value can be reassigned.\\n")

	leaq	_string_8(%rip),	%r10
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

# LINE (27)

_.L6:

# LD (Global ("samples"))

	movq	_global_samples(%rip),	%r10
# CONST (2)

	movq	$5,	%r11
# CONST (1)

	movq	$3,	%r12
# CONST (2)

	movq	$5,	%r13
# CONST (3)

	movq	$7,	%r14
# CALL (".array", 3, false)

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	pushq	_filler(%rip)
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%rsp,	%rdi
	movq	$7,	%rsi
	call	_Barray
	addq	$32,	%rsp
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r12
# STA

	pushq	%rdi
	pushq	%rsi
	movq	%r12,	%rdx
	movq	%r11,	%rsi
	movq	%r10,	%rdi
	movq	$3,	%r11
	call	_Bsta
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# DROP

# LINE (29)

_.L7:

# LD (Global ("samples"))

	movq	_global_samples(%rip),	%r10
# CONST (0)

	movq	$1,	%r11
# ELEM

	pushq	%rdi
	pushq	%rsi
	movq	%r11,	%rsi
	movq	%r10,	%rdi
	movq	$2,	%r11
	call	_Belem
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# CONST (1)

	movq	$3,	%r11
# CONST (0)

	movq	$1,	%r12
# STA

	pushq	%rdi
	pushq	%rsi
	movq	%r12,	%rdx
	movq	%r11,	%rsi
	movq	%r10,	%rdi
	movq	$3,	%r11
	call	_Bsta
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# DROP

# LINE (30)

_.L8:

# CALL ("show", 0, false)

	pushq	%rdi
	pushq	%rsi
	movq	$0,	%r11
	call	_Lshow
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
	.set	_Lmain_SIZE,	0

	.set	_LSmain_SIZE,	0

# LABEL ("lambda_0")

_Llambda_0:

# BEGIN ("lambda_0", 0, 0, [], [], [{ blab="50"; elab="51"; names=[]; subs=[{ blab="53"; elab="54"; names=[]; subs=[]; }]; }])

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

	cmpq	$0,	%r11
	je	_Llambda_0_argc_correct
	movq	%r11,	%r13
	movq	$0,	%r12
	leaq	_string_10(%rip),	%r11
	leaq	_string_9(%rip),	%r10
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
_Llambda_0_argc_correct:

# SLABEL ("50")

_L50:

# SLABEL ("53")

_L53:

# CONST (0)

	movq	$1,	%r10
# SLABEL ("54")

_L54:

# LABEL ("52")

_L52:

# SLABEL ("51")

_L51:

# END

	movq	%r10,	%rax
_LLlambda_0_epilogue:

	movq	%rbp,	%rsp
	popq	%rbp
	ret
	.set	_LLlambda_0_SIZE,	0

	.set	_LSLlambda_0_SIZE,	0

# LABEL ("show")

_Lshow:

# BEGIN ("show", 0, 2, [], [], [{ blab="56"; elab="57"; names=[]; subs=[{ blab="59"; elab="60"; names=[]; subs=[{ blab="62"; elab="63"; names=[("i", 0)]; subs=[{ blab="74"; elab="75"; names=[]; subs=[{ blab="87"; elab="88"; names=[("j", 1)]; subs=[{ blab="101"; elab="102"; names=[]; subs=[]; }]; }]; }]; }]; }]; }])

	pushq	%rbp
	movq	%rsp,	%rbp
	subq	$_LLshow_SIZE,	%rsp
	movq	%rdi,	%r12
	movq	%rsi,	%r13
	movq	%rcx,	%r14
	movq	%rsp,	%rdi
	leaq	_filler(%rip),	%rsi
	movq	$_LSLshow_SIZE,	%rcx
	rep movsq	
	movq	%r12,	%rdi
	movq	%r13,	%rsi
	movq	%r14,	%rcx
# Check arguments count

	cmpq	$0,	%r11
	je	_Lshow_argc_correct
	movq	%r11,	%r13
	movq	$0,	%r12
	leaq	_string_11(%rip),	%r11
	leaq	_string_9(%rip),	%r10
	movq	%r13,	%rcx
	movq	%r12,	%rdx
	movq	%r11,	%rsi
	movq	%r10,	%rdi
	movq	$4,	%r11
	call	_failure
	movq	%rax,	%r10
_Lshow_argc_correct:

# SLABEL ("56")

_L56:

# SLABEL ("59")

_L59:

# SLABEL ("62")

_L62:

# CONST (0)

	movq	$1,	%r10
# LINE (13)

_.L9:

# ST (Local (0))

	movq	%r10,	-8(%rbp)
# DROP

# JMP ("69")

	jmp	_L69
# FLABEL ("68")

_L68:

# SLABEL ("74")

_L74:

# STRING ("  %s has %d subvalue(s):\\n")

	leaq	_string_12(%rip),	%r10
	pushq	_filler(%rip)
	pushq	%r10
	movq	%rsp,	%rdi
	call	_Bstring
	addq	$16,	%rsp
	movq	%rax,	%r10
# LINE (14)

_.L10:

# LD (Global ("samples"))

	movq	_global_samples(%rip),	%r11
# LD (Local (0))

	movq	-8(%rbp),	%r12
# ELEM

	pushq	%r10
	pushq	_filler(%rip)
	movq	%r12,	%rsi
	movq	%r11,	%rdi
	movq	$2,	%r11
	call	_Belem
	addq	$8,	%rsp
	popq	%r10
	movq	%rax,	%r11
# CALL ("string", 1, false)

	pushq	%r10
	pushq	%r11
	movq	%rsp,	%rdi
	call	_Lstring
	addq	$8,	%rsp
	popq	%r10
	movq	%rax,	%r11
# LD (Global ("samples"))

	movq	_global_samples(%rip),	%r12
# LD (Local (0))

	movq	-8(%rbp),	%r13
# ELEM

	pushq	%r10
	pushq	%r11
	movq	%r13,	%rsi
	movq	%r12,	%rdi
	movq	$2,	%r11
	call	_Belem
	popq	%r11
	popq	%r10
	movq	%rax,	%r12
# CALL ("length", 1, false)

	pushq	%r10
	pushq	%r11
	movq	%r12,	%rdi
	movq	$1,	%r11
	call	_Llength
	popq	%r11
	popq	%r10
	movq	%rax,	%r12
# CALL ("printf", 3, false)

	movq	%r12,	%rdx
	movq	%r11,	%rsi
	movq	%r10,	%rdi
	movq	$2,	%r11
	call	_Lprintf
	movq	%rax,	%r10
# DROP

# SLABEL ("87")

_L87:

# CONST (0)

	movq	$1,	%r10
# LINE (15)

_.L11:

# ST (Local (1))

	movq	%r10,	-16(%rbp)
# DROP

# JMP ("94")

	jmp	_L94
# FLABEL ("93")

_L93:

# SLABEL ("101")

_L101:

# STRING ("    subvalue [%d] = %s\\n")

	leaq	_string_13(%rip),	%r10
	pushq	_filler(%rip)
	pushq	%r10
	movq	%rsp,	%rdi
	call	_Bstring
	addq	$16,	%rsp
	movq	%rax,	%r10
# LINE (16)

_.L12:

# LD (Local (1))

	movq	-16(%rbp),	%r11
# LD (Global ("samples"))

	movq	_global_samples(%rip),	%r12
# LD (Local (0))

	movq	-8(%rbp),	%r13
# ELEM

	pushq	%r10
	pushq	%r11
	movq	%r13,	%rsi
	movq	%r12,	%rdi
	movq	$2,	%r11
	call	_Belem
	popq	%r11
	popq	%r10
	movq	%rax,	%r12
# LD (Local (1))

	movq	-16(%rbp),	%r13
# ELEM

	pushq	%r10
	pushq	%r11
	movq	%r13,	%rsi
	movq	%r12,	%rdi
	movq	$2,	%r11
	call	_Belem
	popq	%r11
	popq	%r10
	movq	%rax,	%r12
# CALL ("string", 1, false)

	pushq	%r10
	pushq	%r11
	pushq	_filler(%rip)
	pushq	%r12
	movq	%rsp,	%rdi
	call	_Lstring
	addq	$16,	%rsp
	popq	%r11
	popq	%r10
	movq	%rax,	%r12
# CALL ("printf", 3, false)

	movq	%r12,	%rdx
	movq	%r11,	%rsi
	movq	%r10,	%rdi
	movq	$2,	%r11
	call	_Lprintf
	movq	%rax,	%r10
# DROP

# SLABEL ("102")

_L102:

# LD (Local (1))

	movq	-16(%rbp),	%r10
# CONST (1)

	movq	$3,	%r11
# BINOP ("+")

	addq	%r11,	%r10
	decq	%r10
# LINE (15)

_.L13:

# ST (Local (1))

	movq	%r10,	-16(%rbp)
# DROP

# LABEL ("94")

_L94:

# LD (Local (1))

	movq	-16(%rbp),	%r10
# LD (Global ("samples"))

	movq	_global_samples(%rip),	%r11
# LD (Local (0))

	movq	-8(%rbp),	%r12
# ELEM

	pushq	%r10
	pushq	_filler(%rip)
	movq	%r12,	%rsi
	movq	%r11,	%rdi
	movq	$2,	%r11
	call	_Belem
	addq	$8,	%rsp
	popq	%r10
	movq	%rax,	%r11
# CALL ("length", 1, false)

	pushq	%r10
	pushq	_filler(%rip)
	movq	%r11,	%rdi
	movq	$1,	%r11
	call	_Llength
	addq	$8,	%rsp
	popq	%r10
	movq	%rax,	%r11
# BINOP ("<")

	xorq	%rax,	%rax
	cmpq	%r11,	%r10
	setl	%al
	salq	%rax
	orq	$0x0001,	%rax
	movq	%rax,	%r10
# CJMP ("nz", "93")

	sarq	%r10
	cmpq	$0,	%r10
	jnz	_L93
# SLABEL ("88")

_L88:

# SLABEL ("75")

_L75:

# LD (Local (0))

	movq	-8(%rbp),	%r10
# CONST (1)

	movq	$3,	%r11
# BINOP ("+")

	addq	%r11,	%r10
	decq	%r10
# LINE (13)

_.L14:

# ST (Local (0))

	movq	%r10,	-8(%rbp)
# DROP

# LABEL ("69")

_L69:

# LD (Local (0))

	movq	-8(%rbp),	%r10
# LD (Global ("samples"))

	movq	_global_samples(%rip),	%r11
# CALL ("length", 1, false)

	pushq	%r10
	pushq	_filler(%rip)
	movq	%r11,	%rdi
	movq	$1,	%r11
	call	_Llength
	addq	$8,	%rsp
	popq	%r10
	movq	%rax,	%r11
# BINOP ("<")

	xorq	%rax,	%rax
	cmpq	%r11,	%r10
	setl	%al
	salq	%rax
	orq	$0x0001,	%rax
	movq	%rax,	%r10
# CJMP ("nz", "68")

	sarq	%r10
	cmpq	$0,	%r10
	jnz	_L68
# SLABEL ("63")

_L63:

# CONST (0)

	movq	$1,	%r10
# SLABEL ("60")

_L60:

# LABEL ("58")

_L58:

# SLABEL ("57")

_L57:

# END

	movq	%r10,	%rax
_LLshow_epilogue:

	movq	%rbp,	%rsp
	popq	%rbp
	ret
	.set	_LLshow_SIZE,	16

	.set	_LSLshow_SIZE,	2

