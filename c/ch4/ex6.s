
assembly.o:	file format mach-o 64-bit x86-64

Disassembly of section __TEXT,__text:

0000000000000000 <_main>:
       0: 55                           	push	rbp
       1: 48 89 e5                     	mov	rbp, rsp
       4: c7 45 fc 00 00 00 00         	mov	dword ptr [rbp - 4], 0
       b: c7 45 f4 00 00 00 00         	mov	dword ptr [rbp - 12], 0
      12: c7 45 f0 00 00 00 00         	mov	dword ptr [rbp - 16], 0
      19: 83 7d f0 64                  	cmp	dword ptr [rbp - 16], 100
      1d: 0f 8d 17 00 00 00            	jge	0x3a <_main+0x3a>
      23: 8b 45 f0                     	mov	eax, dword ptr [rbp - 16]
      26: 03 45 f4                     	add	eax, dword ptr [rbp - 12]
      29: 89 45 f4                     	mov	dword ptr [rbp - 12], eax
      2c: 8b 45 f0                     	mov	eax, dword ptr [rbp - 16]
      2f: 83 c0 01                     	add	eax, 1
      32: 89 45 f0                     	mov	dword ptr [rbp - 16], eax
      35: e9 df ff ff ff               	jmp	0x19 <_main+0x19>
      3a: 8b 45 fc                     	mov	eax, dword ptr [rbp - 4]
      3d: 5d                           	pop	rbp
      3e: c3                           	ret
