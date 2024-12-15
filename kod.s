.extern my_counter              # Test EXTERN
.global handler                 # Test GLOBAL
.section my_code_handler        # Test SECTION

handler:                         # Test SYMBOL
    push %r1                     # Test PUSH instruction
    push %r2                     # Test PUSH instruction
    csrrd %cause, %r1            # Test CSRRD instruction
    ld $2, %r2                   # Test LD with a literal value (hex)
    beq %r1, %r2, my_isr_timer   # Test BEQ with registers
    ld $3, %r2                   # Test LD with a literal value (hex)
    beq %r1, %r2, my_isr_terminal # Test BEQ with registers

# Interrupt handler for timer
my_isr_timer: 
    ld $ascii_code, %r1          # Test LD with a symbol
    st %r1, term_out             # Test ST with a symbol
    jmp finish                   # Test JMP instruction

# Interrupt handler for terminal
my_isr_terminal:
    ld term_in, %r1              # Test LD with a symbol
    st %r1, term_out             # Test ST with a symbol
    ld my_counter, %r1           # Test LD with a symbol
    ld $1, %r2                   # Test LD with a decimal literal
    add %r2, %r1                 # Test ADD instruction
    st %r1, my_counter           # Test ST with a symbol

finish:
    pop %r2                      # Test POP instruction
    pop %r1                      # Test POP instruction
    iret                         # Test IRET instruction

# Testing string literal
my_string_test:
    .ascii "Hello, world!"        # Test string literal (ASCII)
    .ascii "Test123"               # Test string literal (ASCII)

# Testing symbol
symbol_test:
    my_label:                     # Test LABEL (symbol as a label)
        .word 1234                # Test word value

# Testing comments
# This is a comment and should be ignored by the lexer

# Testing the syntax with registers
test_registers:
    push %r1                     # Test PUSH with register
    push %r2                     # Test PUSH with register
    csrrd %cause, %r1            # Test CSRRD with register
    ld $2, %r2                   # Test LD with register
    st %r1, term_out             # Test ST with register

# End of tests
.end