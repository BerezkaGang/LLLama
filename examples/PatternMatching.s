	.file "/Users/bogdan/Developer/projects/itmo/vm/lama-jit/examples/PatternMatching.lama"

	.globl	_main

	.data

_string_18:	.string	" "

_string_2:	.string	"But the main designation of pattern matching is to deal with S-expressions.\n"

_string_14:	.string	"Function %s called with incorrect arguments count. Expected: %d. Actual: %d\n"

_string_4:	.string	"Nope.\n"

_string_0:	.string	"Pattern matching is a better way to deal with the structure of a value:\n"

_string_6:	.string	"PatternMatching.lama"

_string_22:	.string	"S-expression\n"

_string_8:	.string	"This is A with no subvalues.\n"

_string_5:	.string	"Yes, this is E.\n"

_string_7:	.string	"You can discriminate the scrutinee on the number of arguments as well:\n"

_string_3:	.string	"You can discriminate the scrutinee on the tag:\n"

_string_9:	.string	"You may also use composite patterns:\n"

_string_13:	.string	"a=%s, z=%s, tl=%s\n"

_string_1:	.string	"abc"

_string_20:	.string	"array\n"

_string_23:	.string	"closure 0x%x\n"

_string_19:	.string	"integer %d\n"

_string_15:	.string	"lambda_0"

_string_16:	.string	"show"

_string_17:	.string	"show_25"

_string_21:	.string	"string\n"

_string_10:	.string	"x"

_string_11:	.string	"y"

_string_12:	.string	"z"

_init:	.quad 0

	.section __DATA, custom_data, regular, no_dead_strip

_filler:	.fill	4, 8, 1

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

# BEGIN ("main", 2, 3, [], [], [])

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

# LINE (24)

_.L0:

# STRING ("Pattern matching is a better way to deal with the structure of a value:\\n")

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

# LINE (26)

_.L1:

# CONST (3)

	movq	$7,	%r10
# CALL ("show", 1, false)

	pushq	%rdi
	pushq	%rsi
	movq	%r10,	%rdi
	movq	$1,	%r11
	call	_Lshow
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# DROP

# LINE (27)

_.L2:

# CONST (3)

	movq	$7,	%r10
# CALL (".array", 1, false)

	pushq	%rdi
	pushq	%rsi
	pushq	_filler(%rip)
	pushq	%r10
	movq	%rsp,	%rdi
	movq	$3,	%rsi
	call	_Barray
	addq	$16,	%rsp
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# CALL ("show", 1, false)

	pushq	%rdi
	pushq	%rsi
	movq	%r10,	%rdi
	movq	$1,	%r11
	call	_Lshow
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# DROP

# LINE (28)

_.L3:

# CONST (1)

	movq	$3,	%r10
# CONST (2)

	movq	$5,	%r11
# CONST (0)

	movq	$1,	%r12
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
# CALL ("show", 1, false)

	pushq	%rdi
	pushq	%rsi
	movq	%r10,	%rdi
	movq	$1,	%r11
	call	_Lshow
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# DROP

# LINE (29)

_.L4:

# STRING ("abc")

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
# CONST (1)

	movq	$3,	%r11
# LINE (30)

_.L5:

# CLOSURE ("lambda_0", [])

	leaq	_Llambda_0(%rip),	%r12
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
# CONST (3)

	movq	$7,	%r12
# CONST (4)

	movq	$9,	%r13
# CONST (0)

	movq	$1,	%r14
# SEXP ("cons", 2)

	movq	$1697575,	-32(%rbp)
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	pushq	%r12
	pushq	-32(%rbp)
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
# CALL (".array", 3, false)

	pushq	%rdi
	pushq	%rsi
	pushq	_filler(%rip)
	pushq	%r12
	pushq	%r11
	pushq	%r10
	movq	%rsp,	%rdi
	movq	$7,	%rsi
	call	_Barray
	addq	$32,	%rsp
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# CALL ("show", 1, false)

	pushq	%rdi
	pushq	%rsi
	movq	%r10,	%rdi
	movq	$1,	%r11
	call	_Lshow
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# DROP

# STRING ("But the main designation of pattern matching is to deal with S-expressions.\\n")

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

# LINE (32)

_.L6:

# STRING ("You can discriminate the scrutinee on the tag:\\n")

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

# SEXP ("E", 0)

	movq	$63,	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	_filler(%rip)
	pushq	%r10
	movq	%rsp,	%rdi
	movq	$3,	%rsi
	call	_Bsexp
	addq	$16,	%rsp
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# DUP

	movq	%r10,	%r11
# SLABEL ("45")

_L45:

# DUP

	movq	%r11,	%r12
# TAG ("A", 0)

	movq	$55,	%r13
	movq	$1,	%r14
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%r14,	%rdx
	movq	%r13,	%rsi
	movq	%r12,	%rdi
	movq	$3,	%r11
	call	_Btag
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r12
# CJMP ("nz", "43")

	sarq	%r12
	cmpq	$0,	%r12
	jnz	_L43
# LABEL ("44")

_L44:

# DROP

# JMP ("42")

	jmp	_L42
# LABEL ("43")

_L43:

# DROP

# DROP

# SLABEL ("47")

_L47:

# LINE (36)

_.L7:

# STRING ("Nope.\\n")

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

# SLABEL ("48")

_L48:

# JMP ("38")

	jmp	_L38
# SLABEL ("46")

_L46:

# SLABEL ("54")

_L54:

# LABEL ("42")

_L42:

# DUP

	movq	%r10,	%r11
# DUP

	movq	%r11,	%r12
# TAG ("B", 0)

	movq	$57,	%r13
	movq	$1,	%r14
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%r14,	%rdx
	movq	%r13,	%rsi
	movq	%r12,	%rdi
	movq	$3,	%r11
	call	_Btag
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r12
# CJMP ("nz", "52")

	sarq	%r12
	cmpq	$0,	%r12
	jnz	_L52
# LABEL ("53")

_L53:

# DROP

# JMP ("51")

	jmp	_L51
# LABEL ("52")

_L52:

# DROP

# DROP

# SLABEL ("56")

_L56:

# LINE (37)

_.L8:

# STRING ("Nope.\\n")

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

# SLABEL ("57")

_L57:

# JMP ("38")

	jmp	_L38
# SLABEL ("55")

_L55:

# SLABEL ("63")

_L63:

# LABEL ("51")

_L51:

# DUP

	movq	%r10,	%r11
# DUP

	movq	%r11,	%r12
# TAG ("C", 0)

	movq	$59,	%r13
	movq	$1,	%r14
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%r14,	%rdx
	movq	%r13,	%rsi
	movq	%r12,	%rdi
	movq	$3,	%r11
	call	_Btag
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r12
# CJMP ("nz", "61")

	sarq	%r12
	cmpq	$0,	%r12
	jnz	_L61
# LABEL ("62")

_L62:

# DROP

# JMP ("60")

	jmp	_L60
# LABEL ("61")

_L61:

# DROP

# DROP

# SLABEL ("65")

_L65:

# LINE (38)

_.L9:

# STRING ("Nope.\\n")

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

# SLABEL ("66")

_L66:

# JMP ("38")

	jmp	_L38
# SLABEL ("64")

_L64:

# SLABEL ("72")

_L72:

# LABEL ("60")

_L60:

# DUP

	movq	%r10,	%r11
# DUP

	movq	%r11,	%r12
# TAG ("D", 0)

	movq	$61,	%r13
	movq	$1,	%r14
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%r14,	%rdx
	movq	%r13,	%rsi
	movq	%r12,	%rdi
	movq	$3,	%r11
	call	_Btag
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r12
# CJMP ("nz", "70")

	sarq	%r12
	cmpq	$0,	%r12
	jnz	_L70
# LABEL ("71")

_L71:

# DROP

# JMP ("69")

	jmp	_L69
# LABEL ("70")

_L70:

# DROP

# DROP

# SLABEL ("74")

_L74:

# LINE (39)

_.L10:

# STRING ("Nope.\\n")

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

# SLABEL ("75")

_L75:

# JMP ("38")

	jmp	_L38
# SLABEL ("73")

_L73:

# SLABEL ("80")

_L80:

# LABEL ("69")

_L69:

# DUP

	movq	%r10,	%r11
# DUP

	movq	%r11,	%r12
# TAG ("E", 0)

	movq	$63,	%r13
	movq	$1,	%r14
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%r14,	%rdx
	movq	%r13,	%rsi
	movq	%r12,	%rdi
	movq	$3,	%r11
	call	_Btag
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r12
# CJMP ("nz", "78")

	sarq	%r12
	cmpq	$0,	%r12
	jnz	_L78
# LABEL ("79")

_L79:

# DROP

# JMP ("39")

	jmp	_L39
# LABEL ("78")

_L78:

# DROP

# DROP

# SLABEL ("82")

_L82:

# LINE (40)

_.L11:

# STRING ("Yes, this is E.\\n")

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

# SLABEL ("83")

_L83:

# SLABEL ("81")

_L81:

# JMP ("38")

	jmp	_L38
# LABEL ("39")

_L39:

# FAIL ((35, 5), false)

	movq	$11,	%r13
	movq	$71,	%r12
	leaq	_string_6(%rip),	%r11
	pushq	%rdi
	pushq	%rsi
	movq	%r13,	%rcx
	movq	%r12,	%rdx
	movq	%r11,	%rsi
	movq	%r10,	%rdi
	movq	$4,	%r11
	call	_Bmatch_failure
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# JMP ("38")

	jmp	_L38
# LABEL ("38")

_L38:

# LINE (41)

_.L12:

# STRING ("You can discriminate the scrutinee on the number of arguments as well:\\n")

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

# SEXP ("A", 0)

	movq	$55,	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	_filler(%rip)
	pushq	%r10
	movq	%rsp,	%rdi
	movq	$3,	%rsi
	call	_Bsexp
	addq	$16,	%rsp
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# DUP

	movq	%r10,	%r11
# SLABEL ("96")

_L96:

# DUP

	movq	%r11,	%r12
# TAG ("A", 1)

	movq	$55,	%r13
	movq	$3,	%r14
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%r14,	%rdx
	movq	%r13,	%rsi
	movq	%r12,	%rdi
	movq	$3,	%r11
	call	_Btag
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r12
# CJMP ("nz", "94")

	sarq	%r12
	cmpq	$0,	%r12
	jnz	_L94
# LABEL ("95")

_L95:

# DROP

# JMP ("93")

	jmp	_L93
# LABEL ("94")

_L94:

# DUP

	movq	%r11,	%r12
# CONST (0)

	movq	$1,	%r13
# ELEM

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%r13,	%rsi
	movq	%r12,	%rdi
	movq	$2,	%r11
	call	_Belem
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r12
# DROP

# DROP

# DROP

# SLABEL ("98")

_L98:

# LINE (46)

_.L13:

# STRING ("Nope.\\n")

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

# SLABEL ("99")

_L99:

# JMP ("89")

	jmp	_L89
# SLABEL ("97")

_L97:

# SLABEL ("105")

_L105:

# LABEL ("93")

_L93:

# DUP

	movq	%r10,	%r11
# DUP

	movq	%r11,	%r12
# TAG ("A", 2)

	movq	$55,	%r13
	movq	$5,	%r14
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%r14,	%rdx
	movq	%r13,	%rsi
	movq	%r12,	%rdi
	movq	$3,	%r11
	call	_Btag
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r12
# CJMP ("nz", "103")

	sarq	%r12
	cmpq	$0,	%r12
	jnz	_L103
# LABEL ("104")

_L104:

# DROP

# JMP ("102")

	jmp	_L102
# LABEL ("103")

_L103:

# DUP

	movq	%r11,	%r12
# CONST (0)

	movq	$1,	%r13
# ELEM

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%r13,	%rsi
	movq	%r12,	%rdi
	movq	$2,	%r11
	call	_Belem
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r12
# DROP

# DUP

	movq	%r11,	%r12
# CONST (1)

	movq	$3,	%r13
# ELEM

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%r13,	%rsi
	movq	%r12,	%rdi
	movq	$2,	%r11
	call	_Belem
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r12
# DROP

# DROP

# DROP

# SLABEL ("107")

_L107:

# LINE (47)

_.L14:

# STRING ("Nope.\\n")

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

# SLABEL ("108")

_L108:

# JMP ("89")

	jmp	_L89
# SLABEL ("106")

_L106:

# SLABEL ("114")

_L114:

# LABEL ("102")

_L102:

# DUP

	movq	%r10,	%r11
# DUP

	movq	%r11,	%r12
# TAG ("A", 0)

	movq	$55,	%r13
	movq	$1,	%r14
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%r14,	%rdx
	movq	%r13,	%rsi
	movq	%r12,	%rdi
	movq	$3,	%r11
	call	_Btag
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r12
# CJMP ("nz", "112")

	sarq	%r12
	cmpq	$0,	%r12
	jnz	_L112
# LABEL ("113")

_L113:

# DROP

# JMP ("111")

	jmp	_L111
# LABEL ("112")

_L112:

# DROP

# DROP

# SLABEL ("116")

_L116:

# LINE (48)

_.L15:

# STRING ("This is A with no subvalues.\\n")

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

# SLABEL ("117")

_L117:

# JMP ("89")

	jmp	_L89
# SLABEL ("115")

_L115:

# SLABEL ("122")

_L122:

# LABEL ("111")

_L111:

# DUP

	movq	%r10,	%r11
# DUP

	movq	%r11,	%r12
# TAG ("A", 3)

	movq	$55,	%r13
	movq	$7,	%r14
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%r14,	%rdx
	movq	%r13,	%rsi
	movq	%r12,	%rdi
	movq	$3,	%r11
	call	_Btag
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r12
# CJMP ("nz", "120")

	sarq	%r12
	cmpq	$0,	%r12
	jnz	_L120
# LABEL ("121")

_L121:

# DROP

# JMP ("90")

	jmp	_L90
# LABEL ("120")

_L120:

# DUP

	movq	%r11,	%r12
# CONST (0)

	movq	$1,	%r13
# ELEM

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%r13,	%rsi
	movq	%r12,	%rdi
	movq	$2,	%r11
	call	_Belem
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r12
# DROP

# DUP

	movq	%r11,	%r12
# CONST (1)

	movq	$3,	%r13
# ELEM

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%r13,	%rsi
	movq	%r12,	%rdi
	movq	$2,	%r11
	call	_Belem
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r12
# DROP

# DUP

	movq	%r11,	%r12
# CONST (2)

	movq	$5,	%r13
# ELEM

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%r13,	%rsi
	movq	%r12,	%rdi
	movq	$2,	%r11
	call	_Belem
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r12
# DROP

# DROP

# DROP

# SLABEL ("124")

_L124:

# LINE (49)

_.L16:

# STRING ("Nope.\\n")

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

# SLABEL ("125")

_L125:

# SLABEL ("123")

_L123:

# JMP ("89")

	jmp	_L89
# LABEL ("90")

_L90:

# FAIL ((45, 5), false)

	movq	$11,	%r13
	movq	$91,	%r12
	leaq	_string_6(%rip),	%r11
	pushq	%rdi
	pushq	%rsi
	movq	%r13,	%rcx
	movq	%r12,	%rdx
	movq	%r11,	%rsi
	movq	%r10,	%rdi
	movq	$4,	%r11
	call	_Bmatch_failure
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# JMP ("89")

	jmp	_L89
# LABEL ("89")

_L89:

# LINE (50)

_.L17:

# STRING ("You may also use composite patterns:\\n")

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

# STRING ("x")

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
# STRING ("y")

	leaq	_string_11(%rip),	%r11
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
# STRING ("z")

	leaq	_string_12(%rip),	%r12
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
# CALL (".array", 3, false)

	pushq	%rdi
	pushq	%rsi
	pushq	_filler(%rip)
	pushq	%r12
	pushq	%r11
	pushq	%r10
	movq	%rsp,	%rdi
	movq	$7,	%rsi
	call	_Barray
	addq	$32,	%rsp
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

	movq	$1697575,	-32(%rbp)
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	pushq	%r12
	pushq	-32(%rbp)
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
# SEXP ("A", 2)

	movq	$55,	%r12
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
# DUP

	movq	%r10,	%r11
# SLABEL ("150")

_L150:

# DUP

	movq	%r11,	%r12
# TAG ("A", 2)

	movq	$55,	%r13
	movq	$5,	%r14
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%r14,	%rdx
	movq	%r13,	%rsi
	movq	%r12,	%rdi
	movq	$3,	%r11
	call	_Btag
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r12
# CJMP ("nz", "144")

	sarq	%r12
	cmpq	$0,	%r12
	jnz	_L144
# LABEL ("145")

_L145:

# DROP

# JMP ("131")

	jmp	_L131
# LABEL ("144")

_L144:

# DUP

	movq	%r11,	%r12
# CONST (0)

	movq	$1,	%r13
# ELEM

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%r13,	%rsi
	movq	%r12,	%rdi
	movq	$2,	%r11
	call	_Belem
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r12
# DUP

	movq	%r12,	%r13
# ARRAY (3)

	movq	$7,	%r14
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	pushq	%r12
	pushq	_filler(%rip)
	movq	%r14,	%rsi
	movq	%r13,	%rdi
	movq	$2,	%r11
	call	_Barray_patt
	addq	$8,	%rsp
	popq	%r12
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r13
# CJMP ("nz", "146")

	sarq	%r13
	cmpq	$0,	%r13
	jnz	_L146
# LABEL ("147")

_L147:

# DROP

# JMP ("145")

	jmp	_L145
# LABEL ("146")

_L146:

# DUP

	movq	%r12,	%r13
# CONST (0)

	movq	$1,	%r14
# ELEM

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	pushq	%r12
	pushq	_filler(%rip)
	movq	%r14,	%rsi
	movq	%r13,	%rdi
	movq	$2,	%r11
	call	_Belem
	addq	$8,	%rsp
	popq	%r12
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r13
# DROP

# DUP

	movq	%r12,	%r13
# CONST (1)

	movq	$3,	%r14
# ELEM

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	pushq	%r12
	pushq	_filler(%rip)
	movq	%r14,	%rsi
	movq	%r13,	%rdi
	movq	$2,	%r11
	call	_Belem
	addq	$8,	%rsp
	popq	%r12
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r13
# DROP

# DUP

	movq	%r12,	%r13
# CONST (2)

	movq	$5,	%r14
# ELEM

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	pushq	%r12
	pushq	_filler(%rip)
	movq	%r14,	%rsi
	movq	%r13,	%rdi
	movq	$2,	%r11
	call	_Belem
	addq	$8,	%rsp
	popq	%r12
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r13
# DROP

# DROP

# DUP

	movq	%r11,	%r12
# CONST (1)

	movq	$3,	%r13
# ELEM

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	%r13,	%rsi
	movq	%r12,	%rdi
	movq	$2,	%r11
	call	_Belem
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r12
# DUP

	movq	%r12,	%r13
# TAG ("cons", 2)

	movq	$1697575,	%r14
	movq	$5,	-32(%rbp)
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	pushq	%r12
	pushq	_filler(%rip)
	movq	-32(%rbp),	%rdx
	movq	%r14,	%rsi
	movq	%r13,	%rdi
	movq	$3,	%r11
	call	_Btag
	addq	$8,	%rsp
	popq	%r12
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r13
# CJMP ("nz", "148")

	sarq	%r13
	cmpq	$0,	%r13
	jnz	_L148
# LABEL ("149")

_L149:

# DROP

# JMP ("145")

	jmp	_L145
# LABEL ("148")

_L148:

# DUP

	movq	%r12,	%r13
# CONST (0)

	movq	$1,	%r14
# ELEM

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	pushq	%r12
	pushq	_filler(%rip)
	movq	%r14,	%rsi
	movq	%r13,	%rdi
	movq	$2,	%r11
	call	_Belem
	addq	$8,	%rsp
	popq	%r12
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r13
# DROP

# DUP

	movq	%r12,	%r13
# CONST (1)

	movq	$3,	%r14
# ELEM

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	pushq	%r12
	pushq	_filler(%rip)
	movq	%r14,	%rsi
	movq	%r13,	%rdi
	movq	$2,	%r11
	call	_Belem
	addq	$8,	%rsp
	popq	%r12
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r13
# DROP

# DROP

# DROP

# DUP

	movq	%r10,	%r11
# CONST (0)

	movq	$1,	%r12
# ELEM

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	_filler(%rip)
	movq	%r12,	%rsi
	movq	%r11,	%rdi
	movq	$2,	%r11
	call	_Belem
	addq	$8,	%rsp
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r11
# ST (Local (2))

	movq	%r11,	-24(%rbp)
# DROP

# DUP

	movq	%r10,	%r11
# CONST (0)

	movq	$1,	%r12
# ELEM

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	_filler(%rip)
	movq	%r12,	%rsi
	movq	%r11,	%rdi
	movq	$2,	%r11
	call	_Belem
	addq	$8,	%rsp
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r11
# CONST (2)

	movq	$5,	%r12
# ELEM

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	_filler(%rip)
	movq	%r12,	%rsi
	movq	%r11,	%rdi
	movq	$2,	%r11
	call	_Belem
	addq	$8,	%rsp
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r11
# ST (Local (1))

	movq	%r11,	-16(%rbp)
# DROP

# DUP

	movq	%r10,	%r11
# CONST (1)

	movq	$3,	%r12
# ELEM

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	_filler(%rip)
	movq	%r12,	%rsi
	movq	%r11,	%rdi
	movq	$2,	%r11
	call	_Belem
	addq	$8,	%rsp
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r11
# CONST (1)

	movq	$3,	%r12
# ELEM

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	_filler(%rip)
	movq	%r12,	%rsi
	movq	%r11,	%rdi
	movq	$2,	%r11
	call	_Belem
	addq	$8,	%rsp
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r11
# ST (Local (0))

	movq	%r11,	-8(%rbp)
# DROP

# DROP

# SLABEL ("152")

_L152:

# LINE (55)

_.L18:

# STRING ("a=%s, z=%s, tl=%s\\n")

	leaq	_string_13(%rip),	%r10
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
# LD (Local (2))

	movq	-24(%rbp),	%r11
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
# LD (Local (1))

	movq	-16(%rbp),	%r12
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
# LD (Local (0))

	movq	-8(%rbp),	%r13
# CALL ("string", 1, false)

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	pushq	%r12
	pushq	%r13
	movq	%rsp,	%rdi
	call	_Lstring
	addq	$8,	%rsp
	popq	%r12
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r13
# CALL ("printf", 4, false)

	pushq	%rdi
	pushq	%rsi
	movq	%r13,	%rcx
	movq	%r12,	%rdx
	movq	%r11,	%rsi
	movq	%r10,	%rdi
	movq	$3,	%r11
	call	_Lprintf
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# SLABEL ("153")

_L153:

# SLABEL ("151")

_L151:

# JMP ("0")

	jmp	_L0
# LABEL ("131")

_L131:

# FAIL ((54, 5), true)

	movq	$11,	%r14
	movq	$109,	%r13
	leaq	_string_6(%rip),	%r12
	movq	%r10,	%r11
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	_filler(%rip)
	movq	%r14,	%rcx
	movq	%r13,	%rdx
	movq	%r12,	%rsi
	movq	%r11,	%rdi
	movq	$4,	%r11
	call	_Bmatch_failure
	addq	$8,	%rsp
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r11
# JMP ("0")

	jmp	_L0
# SLABEL ("2")

_L2:

# LABEL ("0")

_L0:

# END

	movq	%r10,	%rax
_Lmain_epilogue:

	movq	%rbp,	%rsp
	popq	%rbp
	xorq	%rax,	%rax
	ret
	.set	_Lmain_SIZE,	32

	.set	_LSmain_SIZE,	4

# LABEL ("lambda_0")

_Llambda_0:

# BEGIN ("lambda_0", 1, 0, [], ["x"], [{ blab="161"; elab="162"; names=[]; subs=[{ blab="164"; elab="165"; names=[]; subs=[]; }]; }])

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
	leaq	_string_15(%rip),	%r11
	leaq	_string_14(%rip),	%r10
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

# SLABEL ("161")

_L161:

# SLABEL ("164")

_L164:

# LINE (30)

_.L19:

# LD (Arg (0))

	movq	%rdi,	%r10
# CONST (1)

	movq	$3,	%r11
# BINOP ("+")

	addq	%r11,	%r10
	decq	%r10
# SLABEL ("165")

_L165:

# LABEL ("163")

_L163:

# SLABEL ("162")

_L162:

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

# BEGIN ("show", 1, 0, [], ["x"], [{ blab="168"; elab="169"; names=[]; subs=[{ blab="171"; elab="172"; names=[]; subs=[]; }]; }])

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

	cmpq	$1,	%r11
	je	_Lshow_argc_correct
	movq	%r11,	%r13
	movq	$1,	%r12
	leaq	_string_16(%rip),	%r11
	leaq	_string_14(%rip),	%r10
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
_Lshow_argc_correct:

# SLABEL ("168")

_L168:

# SLABEL ("171")

_L171:

# LINE (21)

_.L20:

# CONST (0)

	movq	$1,	%r10
# LINE (23)

_.L21:

# LD (Arg (0))

	movq	%rdi,	%r11
# CALL ("show_25", 2, true)

	pushq	%rdi
	pushq	_filler(%rip)
	movq	%r11,	%rsi
	movq	%r10,	%rdi
	movq	$2,	%r11
	call	_Lshow_25
	addq	$8,	%rsp
	popq	%rdi
	movq	%rax,	%r10
# SLABEL ("172")

_L172:

# LABEL ("170")

_L170:

# SLABEL ("169")

_L169:

# END

	movq	%r10,	%rax
_LLshow_epilogue:

	movq	%rbp,	%rsp
	popq	%rbp
	ret
	.set	_LLshow_SIZE,	0

	.set	_LSLshow_SIZE,	0

# LABEL ("show_25")

_Lshow_25:

# BEGIN ("show_25", 2, 1, [], ["level"; "x"], [{ blab="175"; elab="176"; names=[]; subs=[{ blab="178"; elab="179"; names=[]; subs=[{ blab="249"; elab="250"; names=[]; subs=[{ blab="251"; elab="252"; names=[]; subs=[{ blab="254"; elab="255"; names=[("i", 0)]; subs=[{ blab="277"; elab="278"; names=[]; subs=[]; }; { blab="266"; elab="267"; names=[]; subs=[{ blab="268"; elab="269"; names=[]; subs=[]; }]; }; { blab="262"; elab="263"; names=[]; subs=[{ blab="264"; elab="265"; names=[]; subs=[]; }]; }]; }]; }]; }; { blab="244"; elab="245"; names=[]; subs=[{ blab="246"; elab="247"; names=[]; subs=[]; }]; }; { blab="232"; elab="233"; names=[]; subs=[{ blab="234"; elab="235"; names=[]; subs=[]; }]; }; { blab="226"; elab="227"; names=[]; subs=[{ blab="228"; elab="229"; names=[]; subs=[]; }]; }; { blab="219"; elab="220"; names=[]; subs=[{ blab="221"; elab="222"; names=[]; subs=[]; }]; }; { blab="212"; elab="213"; names=[]; subs=[{ blab="214"; elab="215"; names=[]; subs=[]; }]; }; { blab="204"; elab="205"; names=[]; subs=[{ blab="206"; elab="207"; names=[]; subs=[]; }]; }; { blab="181"; elab="182"; names=[("i", 0)]; subs=[{ blab="192"; elab="193"; names=[]; subs=[]; }]; }]; }]; }])

	pushq	%rbp
	movq	%rsp,	%rbp
	subq	$_LLshow_25_SIZE,	%rsp
	movq	%rdi,	%r12
	movq	%rsi,	%r13
	movq	%rcx,	%r14
	movq	%rsp,	%rdi
	leaq	_filler(%rip),	%rsi
	movq	$_LSLshow_25_SIZE,	%rcx
	rep movsq	
	movq	%r12,	%rdi
	movq	%r13,	%rsi
	movq	%r14,	%rcx
# Check arguments count

	cmpq	$2,	%r11
	je	_Lshow_25_argc_correct
	movq	%r11,	%r13
	movq	$2,	%r12
	leaq	_string_17(%rip),	%r11
	leaq	_string_14(%rip),	%r10
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
_Lshow_25_argc_correct:

# SLABEL ("175")

_L175:

# SLABEL ("178")

_L178:

# SLABEL ("181")

_L181:

# CONST (0)

	movq	$1,	%r10
# LINE (3)

_.L22:

# ST (Local (0))

	movq	%r10,	-8(%rbp)
# DROP

# JMP ("188")

	jmp	_L188
# FLABEL ("187")

_L187:

# SLABEL ("192")

_L192:

# STRING (" ")

	leaq	_string_18(%rip),	%r10
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

# SLABEL ("193")

_L193:

# LD (Local (0))

	movq	-8(%rbp),	%r10
# CONST (1)

	movq	$3,	%r11
# BINOP ("+")

	addq	%r11,	%r10
	decq	%r10
# ST (Local (0))

	movq	%r10,	-8(%rbp)
# DROP

# LABEL ("188")

_L188:

# LD (Local (0))

	movq	-8(%rbp),	%r10
# LD (Arg (0))

	movq	%rdi,	%r11
# BINOP ("<")

	xorq	%rax,	%rax
	cmpq	%r11,	%r10
	setl	%al
	salq	%rax
	orq	$0x0001,	%rax
	movq	%rax,	%r10
# CJMP ("nz", "187")

	sarq	%r10
	cmpq	$0,	%r10
	jnz	_L187
# SLABEL ("182")

_L182:

# LINE (7)

_.L23:

# LD (Arg (1))

	movq	%rsi,	%r10
# DUP

	movq	%r10,	%r11
# SLABEL ("204")

_L204:

# PATT (UnBoxed)

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	_filler(%rip)
	movq	%r11,	%rdi
	movq	$1,	%r11
	call	_Bunboxed_patt
	addq	$8,	%rsp
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r11
# CJMP ("z", "203")

	sarq	%r11
	cmpq	$0,	%r11
	jz	_L203
# DROP

# SLABEL ("206")

_L206:

# LINE (8)

_.L24:

# STRING ("integer %d\\n")

	leaq	_string_19(%rip),	%r10
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
# LD (Arg (1))

	movq	%rsi,	%r11
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

# SLABEL ("207")

_L207:

# JMP ("200")

	jmp	_L200
# SLABEL ("205")

_L205:

# SLABEL ("212")

_L212:

# LABEL ("203")

_L203:

# DUP

	movq	%r10,	%r11
# PATT (Array)

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	_filler(%rip)
	movq	%r11,	%rdi
	movq	$1,	%r11
	call	_Barray_tag_patt
	addq	$8,	%rsp
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r11
# CJMP ("z", "211")

	sarq	%r11
	cmpq	$0,	%r11
	jz	_L211
# DROP

# SLABEL ("214")

_L214:

# LINE (9)

_.L25:

# STRING ("array\\n")

	leaq	_string_20(%rip),	%r10
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

# SLABEL ("215")

_L215:

# JMP ("200")

	jmp	_L200
# SLABEL ("213")

_L213:

# SLABEL ("219")

_L219:

# LABEL ("211")

_L211:

# DUP

	movq	%r10,	%r11
# PATT (String)

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	_filler(%rip)
	movq	%r11,	%rdi
	movq	$1,	%r11
	call	_Bstring_tag_patt
	addq	$8,	%rsp
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r11
# CJMP ("z", "218")

	sarq	%r11
	cmpq	$0,	%r11
	jz	_L218
# DROP

# SLABEL ("221")

_L221:

# LINE (10)

_.L26:

# STRING ("string\\n")

	leaq	_string_21(%rip),	%r10
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

# SLABEL ("222")

_L222:

# JMP ("200")

	jmp	_L200
# SLABEL ("220")

_L220:

# SLABEL ("226")

_L226:

# LABEL ("218")

_L218:

# DUP

	movq	%r10,	%r11
# PATT (Sexp)

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	_filler(%rip)
	movq	%r11,	%rdi
	movq	$1,	%r11
	call	_Bsexp_tag_patt
	addq	$8,	%rsp
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r11
# CJMP ("z", "225")

	sarq	%r11
	cmpq	$0,	%r11
	jz	_L225
# DROP

# SLABEL ("228")

_L228:

# LINE (11)

_.L27:

# STRING ("S-expression\\n")

	leaq	_string_22(%rip),	%r10
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

# SLABEL ("229")

_L229:

# JMP ("200")

	jmp	_L200
# SLABEL ("227")

_L227:

# SLABEL ("232")

_L232:

# LABEL ("225")

_L225:

# DUP

	movq	%r10,	%r11
# PATT (Closure)

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	_filler(%rip)
	movq	%r11,	%rdi
	movq	$1,	%r11
	call	_Bclosure_tag_patt
	addq	$8,	%rsp
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r11
# CJMP ("z", "201")

	sarq	%r11
	cmpq	$0,	%r11
	jz	_L201
# DROP

# SLABEL ("234")

_L234:

# LINE (12)

_.L28:

# STRING ("closure 0x%x\\n")

	leaq	_string_23(%rip),	%r10
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
# LD (Arg (1))

	movq	%rsi,	%r11
# CONST (0)

	movq	$1,	%r12
# ELEM

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	_filler(%rip)
	movq	%r12,	%rsi
	movq	%r11,	%rdi
	movq	$2,	%r11
	call	_Belem
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

# SLABEL ("235")

_L235:

# SLABEL ("233")

_L233:

# JMP ("200")

	jmp	_L200
# LABEL ("201")

_L201:

# FAIL ((7, 9), false)

	movq	$19,	%r13
	movq	$15,	%r12
	leaq	_string_6(%rip),	%r11
	pushq	%rdi
	pushq	%rsi
	movq	%r13,	%rcx
	movq	%r12,	%rdx
	movq	%r11,	%rsi
	movq	%r10,	%rdi
	movq	$4,	%r11
	call	_Bmatch_failure
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# JMP ("200")

	jmp	_L200
# LABEL ("200")

_L200:

# LINE (15)

_.L29:

# LD (Arg (1))

	movq	%rsi,	%r10
# DUP

	movq	%r10,	%r11
# SLABEL ("244")

_L244:

# PATT (UnBoxed)

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	_filler(%rip)
	movq	%r11,	%rdi
	movq	$1,	%r11
	call	_Bunboxed_patt
	addq	$8,	%rsp
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r11
# CJMP ("z", "243")

	sarq	%r11
	cmpq	$0,	%r11
	jz	_L243
# DROP

# SLABEL ("246")

_L246:

# CONST (0)

	movq	$1,	%r10
# SLABEL ("247")

_L247:

# JMP ("177")

	jmp	_L177
# SLABEL ("245")

_L245:

# SLABEL ("249")

_L249:

# LABEL ("243")

_L243:

# DUP

	movq	%r10,	%r11
# DROP

# DROP

# SLABEL ("251")

_L251:

# SLABEL ("254")

_L254:

# LD (Arg (1))

	movq	%rsi,	%r10
# DUP

	movq	%r10,	%r11
# SLABEL ("262")

_L262:

# PATT (Closure)

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	_filler(%rip)
	movq	%r11,	%rdi
	movq	$1,	%r11
	call	_Bclosure_tag_patt
	addq	$8,	%rsp
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r11
# CJMP ("z", "261")

	sarq	%r11
	cmpq	$0,	%r11
	jz	_L261
# DROP

# SLABEL ("264")

_L264:

# CONST (1)

	movq	$3,	%r10
# SLABEL ("265")

_L265:

# JMP ("258")

	jmp	_L258
# SLABEL ("263")

_L263:

# SLABEL ("266")

_L266:

# LABEL ("261")

_L261:

# DUP

	movq	%r10,	%r11
# DROP

# DROP

# SLABEL ("268")

_L268:

# CONST (0)

	movq	$1,	%r10
# SLABEL ("269")

_L269:

# SLABEL ("267")

_L267:

# JMP ("258")

	jmp	_L258
# LABEL ("258")

_L258:

# LINE (17)

_.L30:

# ST (Local (0))

	movq	%r10,	-8(%rbp)
# DROP

# JMP ("272")

	jmp	_L272
# FLABEL ("271")

_L271:

# SLABEL ("277")

_L277:

# LINE (18)

_.L31:

# LD (Arg (0))

	movq	%rdi,	%r10
# CONST (2)

	movq	$5,	%r11
# BINOP ("+")

	addq	%r11,	%r10
	decq	%r10
# LD (Arg (1))

	movq	%rsi,	%r11
# LD (Local (0))

	movq	-8(%rbp),	%r12
# ELEM

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	_filler(%rip)
	movq	%r12,	%rsi
	movq	%r11,	%rdi
	movq	$2,	%r11
	call	_Belem
	addq	$8,	%rsp
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r11
# CALL ("show_25", 2, false)

	pushq	%rdi
	pushq	%rsi
	movq	%r11,	%rsi
	movq	%r10,	%rdi
	movq	$2,	%r11
	call	_Lshow_25
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r10
# DROP

# SLABEL ("278")

_L278:

# LD (Local (0))

	movq	-8(%rbp),	%r10
# CONST (1)

	movq	$3,	%r11
# BINOP ("+")

	addq	%r11,	%r10
	decq	%r10
# LINE (17)

_.L32:

# ST (Local (0))

	movq	%r10,	-8(%rbp)
# DROP

# LABEL ("272")

_L272:

# LD (Local (0))

	movq	-8(%rbp),	%r10
# LD (Arg (1))

	movq	%rsi,	%r11
# CALL ("length", 1, false)

	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	_filler(%rip)
	movq	%r11,	%rdi
	movq	$1,	%r11
	call	_Llength
	addq	$8,	%rsp
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r11
# BINOP ("<")

	xorq	%rax,	%rax
	cmpq	%r11,	%r10
	setl	%al
	salq	%rax
	orq	$0x0001,	%rax
	movq	%rax,	%r10
# CJMP ("nz", "271")

	sarq	%r10
	cmpq	$0,	%r10
	jnz	_L271
# SLABEL ("255")

_L255:

# CONST (0)

	movq	$1,	%r10
# SLABEL ("252")

_L252:

# SLABEL ("250")

_L250:

# JMP ("177")

	jmp	_L177
# SLABEL ("179")

_L179:

# LABEL ("177")

_L177:

# SLABEL ("176")

_L176:

# END

	movq	%r10,	%rax
_LLshow_25_epilogue:

	movq	%rbp,	%rsp
	popq	%rbp
	ret
	.set	_LLshow_25_SIZE,	16

	.set	_LSLshow_25_SIZE,	1

