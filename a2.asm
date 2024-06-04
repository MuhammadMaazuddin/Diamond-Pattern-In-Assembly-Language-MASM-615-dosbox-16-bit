.model small
.stack 100h
.data
        enter_size db 'Enter the dimension of diamond and then PRESS / : $'
        n_size db ?
        list_1 db ?
.code
        mov ax,@data
        mov ds,ax
        mov dx,offset enter_size
        mov ah,9
        int 21h
        mov ah,1
        int 21h
        sub al,30h
        mov n_size,al
        mov dl,10
        mov ah,2
        int 21h
        mov si,offset list_1
        mov al,n_size
        mov bl,0
        LIST_A:
        cmp bl,al
        je LIST_B
        inc bl
        mov [si],bl
        inc si
        jmp LIST_A
        mov bl,al
        LIST_B:
        cmp bl,1
        je L1
        mov [si],bl
        inc si
        dec bl
        jmp LIST_B
        L1:
        mov ax,0
        mov al,n_size
        mov cx,ax
        OUTER_A:
        cmp cx,0
        je L8
        mov bl,cl
        dec bl
        SPACE_A:
        cmp  bl,0
        je L2
        mov dl,' '
        mov ah,2
        int 21h
        dec bl
        jmp SPACE_A
        L2:
        mov si,offset list_1
        mov dh,0
        mov dl,n_size
        add si,dx
        mov bl,cl
        mov dl,bl
        dec dx
        add si,dx
        mov bh,n_size
        dec bh
        dec bl
        sub bh,bl
        PRINT_LIST_B:
        cmp bh,0
        je L3
        mov dl,[si]
        add dl,30h
        mov ah,2
        int 21h
        dec bh
        inc si
        jmp PRINT_LIST_B
        L3:
        mov si,offset list_1
        mov bl,n_size
        mov bh,cl
        dec bh
        sub bl,bh
        PRINT_LIST_A:
        cmp bl,0
        je L4
        mov dl,[si]
        add dl,30h
        mov ah,2
        int 21h
        inc si
        dec bl
        jmp PRINT_LIST_A
        L4:
        mov bl,cl
        inc bl
        sub bl,2
        add bl,bl
        SPACE_B:
        cmp bl,0
        je L5
        mov dl,' '
        mov ah,2
        int 21h
        dec bl
        jmp SPACE_B
        L5:
        mov bl,n_size
        mov bh,cl
        sub bl,bh
        inc bl
        STERIC_A:
        cmp bl,0
        je L6
        mov dl,'*'
        mov ah,2
        int 21h
        dec bl
        jmp STERIC_A
        L6:
        mov bl,cl
        mov bh,n_size
        sub bh,bl
        STERIC_B:
        cmp bh,0
        je L7
        mov dl,'*'
        mov ah,2
        int 21h
        dec bh
        jmp STERIC_B
        L7:
        mov dl,10
        mov ah,2
        int 21h
        dec cx
        jmp OUTER_A
        L8:
        mov ch,n_size
        dec ch
        mov cl,ch
        OUTER_B:
        cmp cl,0
        je EXIT
        mov bh,ch
        mov bl,cl
        sub bh,bl
        inc bh
        SPACE_C:
        cmp bh,0
        je L9
        mov dl,' '
        mov ah,2
        int 21h
        dec bh
        jmp SPACE_C
        L9:
        mov si,offset list_1
        mov ah,0
        mov al,ch
        add si,ax
        add si,2
        mov bh,cl
        dec bh
        PRINT_LIST_C:
        cmp bh,0
        je L10
        mov dl,[si]
        add dl,30h
        mov ah,2
        int 21h
        inc si
        dec bh
        jmp PRINT_LIST_C
        L10:
        mov si,offset list_1
        mov bh,cl
        PRINT_LIST_D:
        cmp bh,0
        je L11
        mov dl,[si]
        add dl,30h
        mov ah,2
        int 21h
        inc si
        dec bh
        jmp PRINT_LIST_D
        L11:
        mov bh,ch
        mov bl,cl
        sub bh,bl
        add bh,bh
        add bh,2
        SPACE_D:
        cmp bh,0
        je L12
        mov dl,' '
        mov ah,2
        int 21h
        dec bh
        jmp SPACE_D
        L12:
        mov bl,cl
        add bl,bl
        dec bl
        STERIC_C:
        cmp bl,0
        je LAST
        mov dl,'*'
        mov ah,2
        int 21h
        dec bl
        jmp STERIC_C

        LAST:
        mov dl,10
        mov ah,2
        int 21h
        dec cl
        jmp OUTER_B









        EXIT:
        mov ah,4ch
        int 21h
end
