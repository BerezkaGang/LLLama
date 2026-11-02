	.file "/Users/bogdan/Developer/projects/itmo/vm/lama-jit/examples/Expressions.lama"

	.globl	_main

	.data

_string_1:	.string	"Case-expression: %s\n"

_string_2:	.string	"Expressions.lama"

_string_3:	.string	"If-expression: %s\n"

_string_4:	.string	"Scope-expression: %s\n"

_string_0:	.string	"if, case, for, while etc. are all expressions.\n"

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

# LINE (1)

_.L0:

# STRING ("if, case, for, while etc. are all expressions.\\n")

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

# STRING ("Case-expression: %s\\n")

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
# CONST (2)

	movq	$5,	%r12
# CONST (3)

	movq	$7,	%r13
# SEXP ("A", 3)

	movq	$55,	%r14
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	_filler(%rip)
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r11
	movq	%rsp,	%rdi
	movq	$9,	%rsi
	call	_Bsexp
	addq	$40,	%rsp
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r11
# DUP

	movq	%r11,	%r12
# SLABEL ("18")

_L18:

# DUP

	movq	%r12,	%r13
# TAG ("A", 3)

	movq	$55,	%r14
	movq	$7,	-32(%rbp)
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
# CJMP ("nz", "16")

	sarq	%r13
	cmpq	$0,	%r13
	jnz	_L16
# LABEL ("17")

_L17:

# DROP

# JMP ("11")

	jmp	_L11
# LABEL ("16")

_L16:

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
# ST (Local (2))

	movq	%r12,	-24(%rbp)
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
# ST (Local (1))

	movq	%r12,	-16(%rbp)
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
# ST (Local (0))

	movq	%r12,	-8(%rbp)
# DROP

# DROP

# SLABEL ("20")

_L20:

# LINE (3)

_.L1:

# LD (Local (0))

	movq	-8(%rbp),	%r11
# SLABEL ("21")

_L21:

# SLABEL ("19")

_L19:

# JMP ("10")

	jmp	_L10
# LABEL ("11")

_L11:

# FAIL ((3, 38), true)

	movq	$77,	-32(%rbp)
	movq	$7,	%r14
	leaq	_string_2(%rip),	%r13
	movq	%r11,	%r12
	pushq	%rdi
	pushq	%rsi
	pushq	%r10
	pushq	%r11
	movq	-32(%rbp),	%rcx
	movq	%r14,	%rdx
	movq	%r13,	%rsi
	movq	%r12,	%rdi
	movq	$4,	%r11
	call	_Bmatch_failure
	popq	%r11
	popq	%r10
	popq	%rsi
	popq	%rdi
	movq	%rax,	%r12
# JMP ("10")

	jmp	_L10
# LABEL ("10")

_L10:

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

# STRING ("If-expression: %s\\n")

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
# SLABEL ("27")

_L27:

# CONST (1)

	movq	$3,	%r11
# CJMP ("z", "32")

	sarq	%r11
	cmpq	$0,	%r11
	jz	_L32
# SLABEL ("33")

_L33:

# CONST (2)

	movq	$5,	%r11
# SLABEL ("34")

_L34:

# JMP ("30")

	jmp	_L30
# LABEL ("32")

_L32:

# SLABEL ("35")

_L35:

# CONST (3)

	movq	$7,	%r11
# SLABEL ("36")

_L36:

# JMP ("30")

	jmp	_L30
# LABEL ("30")

_L30:

# CONST (0)

	movq	$1,	%r12
# CJMP ("z", "38")

	sarq	%r12
	cmpq	$0,	%r12
	jz	_L38
# SLABEL ("39")

_L39:

# CONST (6)

	movq	$13,	%r12
# SLABEL ("40")

_L40:

# JMP ("29")

	jmp	_L29
# LABEL ("38")

_L38:

# SLABEL ("41")

_L41:

# CONST (7)

	movq	$15,	%r12
# SLABEL ("42")

_L42:

# JMP ("29")

	jmp	_L29
# LABEL ("29")

_L29:

# BINOP ("+")

	addq	%r12,	%r11
	decq	%r11
# SLABEL ("28")

_L28:

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

# LINE (6)

_.L2:

# STRING ("Scope-expression: %s\\n")

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
# SLABEL ("46")

_L46:

# CONST (0)

	movq	$1,	%r11
# LINE (8)

_.L3:

# ST (Local (0))

	movq	%r11,	-8(%rbp)
# DROP

# SLABEL ("52")

_L52:

# CONST (0)

	movq	$1,	%r11
# LINE (9)

_.L4:

# ST (Local (1))

	movq	%r11,	-16(%rbp)
# DROP

# JMP ("59")

	jmp	_L59
# FLABEL ("58")

_L58:

# SLABEL ("63")

_L63:

# LINE (10)

_.L5:

# LD (Local (0))

	movq	-8(%rbp),	%r11
# LD (Local (1))

	movq	-16(%rbp),	%r12
# BINOP ("+")

	addq	%r12,	%r11
	decq	%r11
# ST (Local (0))

	movq	%r11,	-8(%rbp)
# DROP

# SLABEL ("64")

_L64:

# LD (Local (1))

	movq	-16(%rbp),	%r11
# CONST (1)

	movq	$3,	%r12
# BINOP ("+")

	addq	%r12,	%r11
	decq	%r11
# LINE (9)

_.L6:

# ST (Local (1))

	movq	%r11,	-16(%rbp)
# DROP

# LABEL ("59")

_L59:

# LD (Local (1))

	movq	-16(%rbp),	%r11
# CONST (10)

	movq	$21,	%r12
# BINOP ("<")

	xorq	%rax,	%rax
	cmpq	%r12,	%r11
	setl	%al
	salq	%rax
	orq	$0x0001,	%rax
	movq	%rax,	%r11
# CJMP ("nz", "58")

	sarq	%r11
	cmpq	$0,	%r11
	jnz	_L58
# SLABEL ("53")

_L53:

# LINE (11)

_.L7:

# LD (Local (0))

	movq	-8(%rbp),	%r11
# SLABEL ("47")

_L47:

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

