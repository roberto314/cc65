;
; 2002-07-18, Ullrich von Bassewitz
; 2014-05-26, Greg King
;
; Defines the platform-specific error list.
;
; The table is built as a list of entries:
;
;       .byte   entrylen
;       .byte   errorcode
;       .asciiz errormsg
;
; and, terminated by an entry with length zero that is returned if the
; error code could not be found.
;

        .export         __sys_oserrlist

;----------------------------------------------------------------------------
; Macros used to generate the list (may get moved to an include file?)

; Regular entry
.macro  sys_oserr_entry         code, msg
        .local  Start, End
Start:  .byte   End - Start
        .byte   code
        .asciiz msg
End:
.endmacro

; Sentinel entry
.macro  sys_oserr_sentinel      msg
        .byte   0                       ; Length is always zero
        .byte   0                       ; Code is unused
        .asciiz msg
.endmacro

;----------------------------------------------------------------------------
; The error message table

.rodata

__sys_oserrlist:
        sys_oserr_entry          1, "Too many open files"
        sys_oserr_entry          2, "File is open"
        sys_oserr_entry          3, "File not open"
        sys_oserr_entry          4, "File not found"
        sys_oserr_entry          5, "Device not present"
        sys_oserr_entry          6, "File not input"
        sys_oserr_entry          7, "File not output"
        sys_oserr_entry          8, "Filename missing"
        sys_oserr_entry          9, "Illegal device"
        sys_oserr_entry         20, "No sector header"
        sys_oserr_entry         21, "No sync mark"
        sys_oserr_entry         22, "No sector data"
        sys_oserr_entry         23, "Checksum error"
        sys_oserr_entry         24, "Decode error"
        sys_oserr_entry         25, "Verify error"
        sys_oserr_entry         26, "Write protect on"
        sys_oserr_entry         27, "Checksum error"
        sys_oserr_entry         28, "Write overrun"
        sys_oserr_entry         29, "Disk ID mismatch"
        sys_oserr_entry         30, "Command not recognized"
        sys_oserr_entry         31, "Command not implemented"
        sys_oserr_entry         32, "Command too long"
        sys_oserr_entry         33, "Invalid write filename"
        sys_oserr_entry         34, "No file given"
        sys_oserr_entry         39, "File not found"
        sys_oserr_entry         50, "Record not present"
        sys_oserr_entry         51, "Overflow in record"
        sys_oserr_entry         52, "File too large"
        sys_oserr_entry         60, "Write file open"
        sys_oserr_entry         61, "File not open"
        sys_oserr_entry         62, "File not found"
        sys_oserr_entry         63, "File exists"
        sys_oserr_entry         64, "File type mismatch"
        sys_oserr_entry         65, "No block"
        sys_oserr_entry         66, "Illegal track or sector"
        sys_oserr_entry         67, "Illegal system track or sector"
        sys_oserr_entry         70, "No channel"
        sys_oserr_entry         71, "BAM error"
        sys_oserr_entry         72, "Disk full"
        sys_oserr_entry         73, "DOS version mismatch"
        sys_oserr_entry         74, "Drive not ready"
        sys_oserr_sentinel      "Unknown error"
