.code16 /* Instrucciones de 16 bits */
/* Conmuta a modo protegido */
switch_to_pm: 
    /* Definición de constantes */
    .equ   CODE_SEG, gdt_code - gdt_start  /* CODE_SEG = 0x8 */
    .equ   DATA_SEG, gdt_data - gdt_start  /* DATA_SEG = 0x10 */

    cli                     /* Se desactivan las interrupciones hasta que se entre en modo protegido. */
    lgdt gdt_descriptor     /* Se le indica al procesador donde esta la GDT (Global Descriptor Table). */
    mov %cr0, %eax          /* Se setea el bit PE (Protection Enable) en el registro CR0, para pasar a modo protegido. */
    orl $0x1, %eax
    mov %eax, %cr0
    ljmp $CODE_SEG, $protected_mode     /* Salto largo a un segmento de código de 32 bits */


/* Creación de GDT (Global Descriptor Table)
 * Se configura el segmento nulo, el segmento de código, y el segmento de datos (solapados). */
gdt_start:
    /* Null descriptor : 64 bits en 0 */
    gdt_null:       
        .long 0x0          /* 32 bits en 0 */
        .long 0x0          /* 32 bits en 0 */

    /* Code descriptor */
    gdt_code:
        .word 0xffff       /* Segment limiter Bits 15-0 (Size of GDT in bytes) */
        .word 0x0          /* Base address Bits 15-0 */
        .byte 0x0          /* Base address Bits 23-16 */
        .byte 0b10011010   /* Bit 8:     A (Accessed) = 0  
                           /* Bit 9:     R (Readable) = 1
                            * Bit 10:    C (Conforming) = 0
                            * Bit 11:    1 (Code Segment)
                            * Bit 12:    S (Segment Type) = 1 
                            * Bit 14-13: DPL (Descriptor Privilege Level) = 00 (Highest privilege)
                            * Bit 15:    P (Present flag) = 1 (segment present) */
        .byte 0b11001111   /* Segment limiter (Bits 19-16)
                            * Bit 20     AVL (Available to System Programmers) = 0
                            * Bit 21:    Reserved bit = 0 
                            * Bit 22:    D/B (Default operation size) = 1  
                            * Bit 23:    G (Granularity) = 1 (limit *= 0x1000) */
        .byte  0x0         /* Base address (Bits 24-31) */
    
    /* Data descriptor */
    gdt_data:
        .word 0xffff       /* Segment limiter Bits 15-0 */
        .word 0x0          /* Base address Bits 15-0 */
        .byte 0x0          /* Base address Bits 23-16 */
        .byte 0b10010010    /* Bit 8:     A (Accessed) = 0 
                            * Bit 9:     W (Writable)  = 1
                            * Bit 10:    E (Expansion-direction) = 0 
                            * Bit 11:    0 (Data segment)
                            * Bit 12:    S (Segment Type) = 1 
                            * Bit 14-13: DPL (Descriptor Privilege Level) = 00 (Highest privilege)
                            * Bit 15:    P (Present flag) = 1 (segment present) */
        .byte 0b11001111   /* Segment limiter Bits 19-16
                            * Bit 20     AVL (Available to System Programmers) = 0
                            * Bit 21:    Reserved bit = 0 
                            * Bit 22:    D/B (Default operation size) = 1  
                            * Bit 23:    G (Granularity) = 1 (limit *= 0x1000) */
        .byte  0x0         /* Base address Bits 24-31 */
gdt_end:

gdt_descriptor:
    .word  gdt_end - gdt_start - 1   /* Size of GDT (16 bits) */
    .long  gdt_start                   /* Start (32 bits) */
vga_current_line:
    .long 10

.code32  /* Instrucciones de 32 bits */
protected_mode:
    /* Inicialización de los registros de segmento y el stack con descriptor de segmento*/
    mov $DATA_SEG, %ax
    mov %ax, %ds
    mov %ax, %es
    mov %ax, %fs
    mov %ax, %gs
    mov %ax, %ss
    mov $0x7000, %ebp
    mov %ebp, %esp

/* VGA */
/* Imprime un string terminado en NULL en una linea de la pantalla.
 * Recibe un registro de 32 bits que contiene la dirección del string a imprimir.
 * vga_current_line es la linea a imprimir
 */
    mov $message, %ecx
    mov vga_current_line, %eax 
    mov $0, %edx
    mov $25, %ebx           /* Numero de lineas horizontales. */
    div %ebx
    mov %edx, %eax
    mov $160, %edx          /* 160 == 80 * 2 == ancho de la linea * bytes por caracter en pantalla */
    mul %edx
    lea 0xb8000(%eax), %edx /*0xb8000 == direccion de memoria de video.*/
    mov $0x0f, %ah          /* White on black. */
loop:
    mov (%ecx), %al
    cmp $0, %al
    je end              /* Si el último caracter es un null, termina el programa */
    mov %ax, (%edx)
    add $1, %ecx
    add $2, %edx
    jmp loop
end:
    hlt
    
message:
    .asciz "Protected mode enable."

