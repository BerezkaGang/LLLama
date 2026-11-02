	.file "/Users/bogdan/Developer/projects/itmo/vm/lama-jit/examples/Hello.lama"

	.globl	_main

	.data

_string_11:	.string	"2"

_string_5:	.string	"Arrays/tuples: %s\n"

_string_13:	.string	"Function %s called with incorrect arguments count. Expected: %d. Actual: %d\n"

_string_9:	.string	"Functions: %s\n"

_string_0:	.string	"Hi, this is Lama...\n"

_string_1:	.string	"I can construct values of various shapes,\n"

_string_7:	.string	"Jonh"

_string_4:	.string	"Lists: %s\n"

_string_3:	.string	"Regular integers: %d or even %s\n"

_string_6:	.string	"S-expressions: %s\n"

_string_8:	.string	"Smith"

_string_12:	.string	"That's all for now, bye!\n"

_string_10:	.string	"These structures can be nested and heterogeneous: %s\n"

_string_2:	.string	"convert them into strings and print. Here you are:\n"

_string_15:	.string	"lambda_0"

_string_14:	.string	"lambda_1"

_init:	.quad 0

	.section __DATA, custom_data, regular, no_dead_strip

_filler:	.fill	1, 8, 1

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

# LINE (1)

_.L0:

# STRING ("Hi, this is Lama...\\n")

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

# STRING ("I can construct values of various shapes,\\n")

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

# LINE (2)

_.L1:

# STRING ("convert them into strings and print. Here you are:\\n")

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

# LINE (3)

_.L2:

# STRING ("Regular integers: %d or even %s\\n")

	leaq	_string_3(%rip),	%r10
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
# CONST (3)

	movq	$7,	%r11
# CONST (4611686018427387903)

	movq	$-1,	%r12
# CALL ("string", 1, false)

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	pushq	_filler(%rip)
	pushq	%r12
	movq	%rsp,	%rdi
	call	_Lstring
	addq	$16,	%rsp
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r12
# CALL ("printf", 3, false)

	pushq	%rdi
	pushq	%rsi
	movq	%r12,	%rdx
	movq	%r11,	%rsi
	movq	%r10,	%rdi
	movq	$2,	%r11
	call	_Lprintf
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# DROP

# LINE (5)

_.L3:

# STRING ("Regular integers: %d or even %s\\n")

	leaq	_string_3(%rip),	%r10
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
# CONST (3)

	movq	$7,	%r11
# CONST (2305843009213693951)

	movq	$4611686018427387903,	%r12
# CALL ("string", 1, false)

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	pushq	_filler(%rip)
	pushq	%r12
	movq	%rsp,	%rdi
	call	_Lstring
	addq	$16,	%rsp
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r12
# CALL ("printf", 3, false)

	pushq	%rdi
	pushq	%rsi
	movq	%r12,	%rdx
	movq	%r11,	%rsi
	movq	%r10,	%rdi
	movq	$2,	%r11
	call	_Lprintf
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# DROP

# LINE (6)

_.L4:

# STRING ("Lists: %s\\n")

	leaq	_string_4(%rip),	%r10
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
# CONST (1)

	movq	$3,	%r11
# CONST (2)

	movq	$5,	%r12
# CONST (3)

	movq	$7,	%r13
# CONST (0)

	movq	$1,	%r14
# SEXP ("cons", 2)

	movq	$1697575,	-8(%rbp)
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	pushq	%r12
	pushq	-8(%rbp)
	pushq	%r14
	pushq	%r13
	movq	%rsp,	%rdi
	movq	$7,	%rsi
	call	_Bsexp
	addq	$24,	%rsp
	popq	%r12
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r13
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
# CALL ("string", 1, false)

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%rsp,	%rdi
	call	_Lstring
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
# DROP

# LINE (7)

_.L5:

# STRING ("Arrays/tuples: %s\\n")

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
# CONST (1)

	movq	$3,	%r11
# CONST (2)

	movq	$5,	%r12
# CONST (3)

	movq	$7,	%r13
# CALL (".array", 3, false)

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r13
	pushq	%r12
	pushq	%r11
	movq	%rsp,	%rdi
	movq	$7,	%rsi
	call	_Barray
	addq	$24,	%rsp
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r11
# CALL ("string", 1, false)

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%rsp,	%rdi
	call	_Lstring
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
# DROP

# LINE (8)

_.L6:

# STRING ("S-expressions: %s\\n")

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
# STRING ("Jonh")

	leaq	_string_7(%rip),	%r11
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
# STRING ("Smith")

	leaq	_string_8(%rip),	%r12
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
# SEXP ("Man", 2)

	movq	$319645,	%r13
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
# CALL ("string", 1, false)

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%rsp,	%rdi
	call	_Lstring
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
# DROP

# LINE (9)

_.L7:

# STRING ("Functions: %s\\n")

	leaq	_string_9(%rip),	%r10
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
# LINE (10)

_.L8:

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
# CALL ("string", 1, false)

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%rsp,	%rdi
	call	_Lstring
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
# DROP

# STRING ("These structures can be nested and heterogeneous: %s\\n")

	leaq	_string_10(%rip),	%r10
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
# CONST (1)

	movq	$3,	%r11
# STRING ("2")

	leaq	_string_11(%rip),	%r12
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
# CALL (".array", 2, false)

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	_filler(%rip)
	pushq	%r12
	pushq	%r11
	movq	%rsp,	%rdi
	movq	$5,	%rsi
	call	_Barray
	addq	$24,	%rsp
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r11
# SEXP ("Apple", 0)

	movq	$914490891,	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	pushq	_filler(%rip)
	pushq	%r12
	movq	%rsp,	%rdi
	movq	$3,	%rsi
	call	_Bsexp
	addq	$16,	%rsp
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r12
# LINE (11)

_.L9:

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
# CONST (0)

	movq	$1,	%r14
# SEXP ("cons", 2)

	movq	$1697575,	-8(%rbp)
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	pushq	%r12
	pushq	-8(%rbp)
	pushq	%r14
	pushq	%r13
	movq	%rsp,	%rdi
	movq	$7,	%rsi
	call	_Bsexp
	addq	$24,	%rsp
	popq	%r12
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r13
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
# CALL ("string", 1, false)

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%rsp,	%rdi
	call	_Lstring
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
# DROP

# STRING ("That's all for now, bye!\\n")

	leaq	_string_12(%rip),	%r10
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
# SLABEL ("2")

_L2:

# END

	movq	%r10,	%rax
_Lmain_epilogue:

	movq	%rbp,	%rsp
	popq	%rbp
	xorq	%rax,	%rax
	ret
	.set	_Lmain_SIZE,	16

	.set	_LSmain_SIZE,	1

# LABEL ("lambda_1")

_Llambda_1:

# BEGIN ("lambda_1", 1, 0, [], ["x"], [{ blab="70"; elab="71"; names=[]; subs=[{ blab="73"; elab="74"; names=[]; subs=[]; }]; }])

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
	leaq	_string_14(%rip),	%r11
	leaq	_string_13(%rip),	%r10
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

# SLABEL ("70")

_L70:

# SLABEL ("73")

_L73:

# CONST (3)

	movq	$7,	%r10
# SEXP ("Melon", 1)

	movq	$1311344541,	%r11
	pushq	%rdi
	pushq	_filler(%rip)
	pushq	%r11
	pushq	%r10
	movq	%rsp,	%rdi
	movq	$5,	%rsi
	call	_Bsexp
	addq	$24,	%rsp
	popq	%rdi
	movq	%rax,	%r10
# SLABEL ("74")

_L74:

# LABEL ("72")

_L72:

# SLABEL ("71")

_L71:

# END

	movq	%r10,	%rax
_LLlambda_1_epilogue:

	movq	%rbp,	%rsp
	popq	%rbp
	ret
	.set	_LLlambda_1_SIZE,	0

	.set	_LSLlambda_1_SIZE,	0

# LABEL ("lambda_0")

_Llambda_0:

# BEGIN ("lambda_0", 2, 0, [], ["x"; "y"], [{ blab="76"; elab="77"; names=[]; subs=[{ blab="79"; elab="80"; names=[]; subs=[]; }]; }])

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

	cmpq	$2,	%r11
	je	_Llambda_0_argc_correct
	movq	%r11,	%r13
	movq	$2,	%r12
	leaq	_string_15(%rip),	%r11
	leaq	_string_13(%rip),	%r10
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
_Llambda_0_argc_correct:

# SLABEL ("76")

_L76:

# SLABEL ("79")

_L79:

# LINE (10)

_.L10:

# LD (Arg (0))

	movq	%rdi,	%r10
# LD (Arg (1))

	movq	%rsi,	%r11
# BINOP ("+")

	addq	%r11,	%r10
	decq	%r10
# SLABEL ("80")

_L80:

# LABEL ("78")

_L78:

# SLABEL ("77")

_L77:

# END

	movq	%r10,	%rax
_LLlambda_0_epilogue:

	movq	%rbp,	%rsp
	popq	%rbp
	ret
	.set	_LLlambda_0_SIZE,	0

	.set	_LSLlambda_0_SIZE,	0

