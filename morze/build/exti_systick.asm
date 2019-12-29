
build/exti_systick.elf:     file format elf32-littlearm

Sections:
Idx Name              Size      VMA       LMA       File off  Algn  Flags
  0 .isr_vector       000000c0  08000000  08000000  00010000  2**0  CONTENTS, ALLOC, LOAD, READONLY, DATA
  1 .text             000010b8  080000c0  080000c0  000100c0  2**2  CONTENTS, ALLOC, LOAD, READONLY, CODE
  2 .rodata           00000004  08001178  08001178  00011178  2**2  CONTENTS, ALLOC, LOAD, READONLY, DATA
  3 .init_array       00000008  0800117c  0800117c  0001117c  2**2  CONTENTS, ALLOC, LOAD, DATA
  4 .fini_array       00000004  08001184  08001184  00011184  2**2  CONTENTS, ALLOC, LOAD, DATA
  5 .data             00000434  20000000  08001188  00020000  2**3  CONTENTS, ALLOC, LOAD, DATA
  6 .bss              00000260  20000434  080015bc  00020434  2**2  ALLOC
  7 ._user_heap_stack 00000604  20000694  080015bc  00020694  2**0  ALLOC
  8 .ARM.attributes   00000028  00000000  00000000  00020434  2**0  CONTENTS, READONLY
  9 .debug_info       0000194d  00000000  00000000  0002045c  2**0  CONTENTS, READONLY, DEBUGGING
 10 .debug_abbrev     000004e3  00000000  00000000  00021da9  2**0  CONTENTS, READONLY, DEBUGGING
 11 .debug_loc        000007f4  00000000  00000000  0002228c  2**0  CONTENTS, READONLY, DEBUGGING
 12 .debug_aranges    00000190  00000000  00000000  00022a80  2**0  CONTENTS, READONLY, DEBUGGING
 13 .debug_ranges     00000160  00000000  00000000  00022c10  2**0  CONTENTS, READONLY, DEBUGGING
 14 .debug_line       0000074e  00000000  00000000  00022d70  2**0  CONTENTS, READONLY, DEBUGGING
 15 .debug_str        00000ca0  00000000  00000000  000234be  2**0  CONTENTS, READONLY, DEBUGGING
 16 .comment          0000007f  00000000  00000000  0002415e  2**0  CONTENTS, READONLY
 17 .debug_frame      000006dc  00000000  00000000  000241e0  2**2  CONTENTS, READONLY, DEBUGGING

Disassembly of section .text:

080000c0 <__do_global_dtors_aux>:
 80000c0:	b510      	push	{r4, lr}
 80000c2:	4c06      	ldr	r4, [pc, #24]	; (80000dc <__do_global_dtors_aux+0x1c>)
 80000c4:	7823      	ldrb	r3, [r4, #0]
 80000c6:	2b00      	cmp	r3, #0
 80000c8:	d107      	bne.n	80000da <__do_global_dtors_aux+0x1a>
 80000ca:	4b05      	ldr	r3, [pc, #20]	; (80000e0 <__do_global_dtors_aux+0x20>)
 80000cc:	2b00      	cmp	r3, #0
 80000ce:	d002      	beq.n	80000d6 <__do_global_dtors_aux+0x16>
 80000d0:	4804      	ldr	r0, [pc, #16]	; (80000e4 <__do_global_dtors_aux+0x24>)
 80000d2:	e000      	b.n	80000d6 <__do_global_dtors_aux+0x16>
 80000d4:	bf00      	nop
 80000d6:	2301      	movs	r3, #1
 80000d8:	7023      	strb	r3, [r4, #0]
 80000da:	bd10      	pop	{r4, pc}
 80000dc:	20000434 	.word	0x20000434
 80000e0:	00000000 	.word	0x00000000
 80000e4:	08001160 	.word	0x08001160

080000e8 <frame_dummy>:
 80000e8:	4b04      	ldr	r3, [pc, #16]	; (80000fc <frame_dummy+0x14>)
 80000ea:	b510      	push	{r4, lr}
 80000ec:	2b00      	cmp	r3, #0
 80000ee:	d003      	beq.n	80000f8 <frame_dummy+0x10>
 80000f0:	4903      	ldr	r1, [pc, #12]	; (8000100 <frame_dummy+0x18>)
 80000f2:	4804      	ldr	r0, [pc, #16]	; (8000104 <frame_dummy+0x1c>)
 80000f4:	e000      	b.n	80000f8 <frame_dummy+0x10>
 80000f6:	bf00      	nop
 80000f8:	bd10      	pop	{r4, pc}
 80000fa:	46c0      	nop			; (mov r8, r8)
 80000fc:	00000000 	.word	0x00000000
 8000100:	20000438 	.word	0x20000438
 8000104:	08001160 	.word	0x08001160

08000108 <__udivsi3>:
 8000108:	2200      	movs	r2, #0
 800010a:	0843      	lsrs	r3, r0, #1
 800010c:	428b      	cmp	r3, r1
 800010e:	d374      	bcc.n	80001fa <__udivsi3+0xf2>
 8000110:	0903      	lsrs	r3, r0, #4
 8000112:	428b      	cmp	r3, r1
 8000114:	d35f      	bcc.n	80001d6 <__udivsi3+0xce>
 8000116:	0a03      	lsrs	r3, r0, #8
 8000118:	428b      	cmp	r3, r1
 800011a:	d344      	bcc.n	80001a6 <__udivsi3+0x9e>
 800011c:	0b03      	lsrs	r3, r0, #12
 800011e:	428b      	cmp	r3, r1
 8000120:	d328      	bcc.n	8000174 <__udivsi3+0x6c>
 8000122:	0c03      	lsrs	r3, r0, #16
 8000124:	428b      	cmp	r3, r1
 8000126:	d30d      	bcc.n	8000144 <__udivsi3+0x3c>
 8000128:	22ff      	movs	r2, #255	; 0xff
 800012a:	0209      	lsls	r1, r1, #8
 800012c:	ba12      	rev	r2, r2
 800012e:	0c03      	lsrs	r3, r0, #16
 8000130:	428b      	cmp	r3, r1
 8000132:	d302      	bcc.n	800013a <__udivsi3+0x32>
 8000134:	1212      	asrs	r2, r2, #8
 8000136:	0209      	lsls	r1, r1, #8
 8000138:	d065      	beq.n	8000206 <__udivsi3+0xfe>
 800013a:	0b03      	lsrs	r3, r0, #12
 800013c:	428b      	cmp	r3, r1
 800013e:	d319      	bcc.n	8000174 <__udivsi3+0x6c>
 8000140:	e000      	b.n	8000144 <__udivsi3+0x3c>
 8000142:	0a09      	lsrs	r1, r1, #8
 8000144:	0bc3      	lsrs	r3, r0, #15
 8000146:	428b      	cmp	r3, r1
 8000148:	d301      	bcc.n	800014e <__udivsi3+0x46>
 800014a:	03cb      	lsls	r3, r1, #15
 800014c:	1ac0      	subs	r0, r0, r3
 800014e:	4152      	adcs	r2, r2
 8000150:	0b83      	lsrs	r3, r0, #14
 8000152:	428b      	cmp	r3, r1
 8000154:	d301      	bcc.n	800015a <__udivsi3+0x52>
 8000156:	038b      	lsls	r3, r1, #14
 8000158:	1ac0      	subs	r0, r0, r3
 800015a:	4152      	adcs	r2, r2
 800015c:	0b43      	lsrs	r3, r0, #13
 800015e:	428b      	cmp	r3, r1
 8000160:	d301      	bcc.n	8000166 <__udivsi3+0x5e>
 8000162:	034b      	lsls	r3, r1, #13
 8000164:	1ac0      	subs	r0, r0, r3
 8000166:	4152      	adcs	r2, r2
 8000168:	0b03      	lsrs	r3, r0, #12
 800016a:	428b      	cmp	r3, r1
 800016c:	d301      	bcc.n	8000172 <__udivsi3+0x6a>
 800016e:	030b      	lsls	r3, r1, #12
 8000170:	1ac0      	subs	r0, r0, r3
 8000172:	4152      	adcs	r2, r2
 8000174:	0ac3      	lsrs	r3, r0, #11
 8000176:	428b      	cmp	r3, r1
 8000178:	d301      	bcc.n	800017e <__udivsi3+0x76>
 800017a:	02cb      	lsls	r3, r1, #11
 800017c:	1ac0      	subs	r0, r0, r3
 800017e:	4152      	adcs	r2, r2
 8000180:	0a83      	lsrs	r3, r0, #10
 8000182:	428b      	cmp	r3, r1
 8000184:	d301      	bcc.n	800018a <__udivsi3+0x82>
 8000186:	028b      	lsls	r3, r1, #10
 8000188:	1ac0      	subs	r0, r0, r3
 800018a:	4152      	adcs	r2, r2
 800018c:	0a43      	lsrs	r3, r0, #9
 800018e:	428b      	cmp	r3, r1
 8000190:	d301      	bcc.n	8000196 <__udivsi3+0x8e>
 8000192:	024b      	lsls	r3, r1, #9
 8000194:	1ac0      	subs	r0, r0, r3
 8000196:	4152      	adcs	r2, r2
 8000198:	0a03      	lsrs	r3, r0, #8
 800019a:	428b      	cmp	r3, r1
 800019c:	d301      	bcc.n	80001a2 <__udivsi3+0x9a>
 800019e:	020b      	lsls	r3, r1, #8
 80001a0:	1ac0      	subs	r0, r0, r3
 80001a2:	4152      	adcs	r2, r2
 80001a4:	d2cd      	bcs.n	8000142 <__udivsi3+0x3a>
 80001a6:	09c3      	lsrs	r3, r0, #7
 80001a8:	428b      	cmp	r3, r1
 80001aa:	d301      	bcc.n	80001b0 <__udivsi3+0xa8>
 80001ac:	01cb      	lsls	r3, r1, #7
 80001ae:	1ac0      	subs	r0, r0, r3
 80001b0:	4152      	adcs	r2, r2
 80001b2:	0983      	lsrs	r3, r0, #6
 80001b4:	428b      	cmp	r3, r1
 80001b6:	d301      	bcc.n	80001bc <__udivsi3+0xb4>
 80001b8:	018b      	lsls	r3, r1, #6
 80001ba:	1ac0      	subs	r0, r0, r3
 80001bc:	4152      	adcs	r2, r2
 80001be:	0943      	lsrs	r3, r0, #5
 80001c0:	428b      	cmp	r3, r1
 80001c2:	d301      	bcc.n	80001c8 <__udivsi3+0xc0>
 80001c4:	014b      	lsls	r3, r1, #5
 80001c6:	1ac0      	subs	r0, r0, r3
 80001c8:	4152      	adcs	r2, r2
 80001ca:	0903      	lsrs	r3, r0, #4
 80001cc:	428b      	cmp	r3, r1
 80001ce:	d301      	bcc.n	80001d4 <__udivsi3+0xcc>
 80001d0:	010b      	lsls	r3, r1, #4
 80001d2:	1ac0      	subs	r0, r0, r3
 80001d4:	4152      	adcs	r2, r2
 80001d6:	08c3      	lsrs	r3, r0, #3
 80001d8:	428b      	cmp	r3, r1
 80001da:	d301      	bcc.n	80001e0 <__udivsi3+0xd8>
 80001dc:	00cb      	lsls	r3, r1, #3
 80001de:	1ac0      	subs	r0, r0, r3
 80001e0:	4152      	adcs	r2, r2
 80001e2:	0883      	lsrs	r3, r0, #2
 80001e4:	428b      	cmp	r3, r1
 80001e6:	d301      	bcc.n	80001ec <__udivsi3+0xe4>
 80001e8:	008b      	lsls	r3, r1, #2
 80001ea:	1ac0      	subs	r0, r0, r3
 80001ec:	4152      	adcs	r2, r2
 80001ee:	0843      	lsrs	r3, r0, #1
 80001f0:	428b      	cmp	r3, r1
 80001f2:	d301      	bcc.n	80001f8 <__udivsi3+0xf0>
 80001f4:	004b      	lsls	r3, r1, #1
 80001f6:	1ac0      	subs	r0, r0, r3
 80001f8:	4152      	adcs	r2, r2
 80001fa:	1a41      	subs	r1, r0, r1
 80001fc:	d200      	bcs.n	8000200 <__udivsi3+0xf8>
 80001fe:	4601      	mov	r1, r0
 8000200:	4152      	adcs	r2, r2
 8000202:	4610      	mov	r0, r2
 8000204:	4770      	bx	lr
 8000206:	e7ff      	b.n	8000208 <__udivsi3+0x100>
 8000208:	b501      	push	{r0, lr}
 800020a:	2000      	movs	r0, #0
 800020c:	f000 f806 	bl	800021c <__aeabi_idiv0>
 8000210:	bd02      	pop	{r1, pc}
 8000212:	46c0      	nop			; (mov r8, r8)

08000214 <__aeabi_uidivmod>:
 8000214:	2900      	cmp	r1, #0
 8000216:	d0f7      	beq.n	8000208 <__udivsi3+0x100>
 8000218:	e776      	b.n	8000108 <__udivsi3>
 800021a:	4770      	bx	lr

0800021c <__aeabi_idiv0>:
 800021c:	4770      	bx	lr
 800021e:	46c0      	nop			; (mov r8, r8)

08000220 <Reset_Handler>:
 8000220:	480d      	ldr	r0, [pc, #52]	; (8000258 <LoopForever+0x2>)
 8000222:	4685      	mov	sp, r0
 8000224:	480d      	ldr	r0, [pc, #52]	; (800025c <LoopForever+0x6>)
 8000226:	490e      	ldr	r1, [pc, #56]	; (8000260 <LoopForever+0xa>)
 8000228:	4a0e      	ldr	r2, [pc, #56]	; (8000264 <LoopForever+0xe>)
 800022a:	2300      	movs	r3, #0
 800022c:	e002      	b.n	8000234 <LoopCopyDataInit>

0800022e <CopyDataInit>:
 800022e:	58d4      	ldr	r4, [r2, r3]
 8000230:	50c4      	str	r4, [r0, r3]
 8000232:	3304      	adds	r3, #4

08000234 <LoopCopyDataInit>:
 8000234:	18c4      	adds	r4, r0, r3
 8000236:	428c      	cmp	r4, r1
 8000238:	d3f9      	bcc.n	800022e <CopyDataInit>
 800023a:	4a0b      	ldr	r2, [pc, #44]	; (8000268 <LoopForever+0x12>)
 800023c:	4c0b      	ldr	r4, [pc, #44]	; (800026c <LoopForever+0x16>)
 800023e:	2300      	movs	r3, #0
 8000240:	e001      	b.n	8000246 <LoopFillZerobss>

08000242 <FillZerobss>:
 8000242:	6013      	str	r3, [r2, #0]
 8000244:	3204      	adds	r2, #4

08000246 <LoopFillZerobss>:
 8000246:	42a2      	cmp	r2, r4
 8000248:	d3fb      	bcc.n	8000242 <FillZerobss>
 800024a:	f000 fe63 	bl	8000f14 <SystemInit>
 800024e:	f000 feb7 	bl	8000fc0 <__libc_init_array>
 8000252:	f000 fe3f 	bl	8000ed4 <main>

08000256 <LoopForever>:
 8000256:	e7fe      	b.n	8000256 <LoopForever>
 8000258:	20002000 	.word	0x20002000
 800025c:	20000000 	.word	0x20000000
 8000260:	20000434 	.word	0x20000434
 8000264:	08001188 	.word	0x08001188
 8000268:	20000434 	.word	0x20000434
 800026c:	20000694 	.word	0x20000694

08000270 <ADC1_COMP_IRQHandler>:
 8000270:	e7fe      	b.n	8000270 <ADC1_COMP_IRQHandler>
	...

08000274 <NVIC_EnableIRQ>:
 8000274:	b580      	push	{r7, lr}
 8000276:	b082      	sub	sp, #8
 8000278:	af00      	add	r7, sp, #0
 800027a:	0002      	movs	r2, r0
 800027c:	1dfb      	adds	r3, r7, #7
 800027e:	701a      	strb	r2, [r3, #0]
 8000280:	1dfb      	adds	r3, r7, #7
 8000282:	781b      	ldrb	r3, [r3, #0]
 8000284:	001a      	movs	r2, r3
 8000286:	231f      	movs	r3, #31
 8000288:	401a      	ands	r2, r3
 800028a:	4b04      	ldr	r3, [pc, #16]	; (800029c <NVIC_EnableIRQ+0x28>)
 800028c:	2101      	movs	r1, #1
 800028e:	4091      	lsls	r1, r2
 8000290:	000a      	movs	r2, r1
 8000292:	601a      	str	r2, [r3, #0]
 8000294:	46c0      	nop			; (mov r8, r8)
 8000296:	46bd      	mov	sp, r7
 8000298:	b002      	add	sp, #8
 800029a:	bd80      	pop	{r7, pc}
 800029c:	e000e100 	.word	0xe000e100

080002a0 <NVIC_SetPriority>:
 80002a0:	b590      	push	{r4, r7, lr}
 80002a2:	b083      	sub	sp, #12
 80002a4:	af00      	add	r7, sp, #0
 80002a6:	0002      	movs	r2, r0
 80002a8:	6039      	str	r1, [r7, #0]
 80002aa:	1dfb      	adds	r3, r7, #7
 80002ac:	701a      	strb	r2, [r3, #0]
 80002ae:	1dfb      	adds	r3, r7, #7
 80002b0:	781b      	ldrb	r3, [r3, #0]
 80002b2:	2b7f      	cmp	r3, #127	; 0x7f
 80002b4:	d932      	bls.n	800031c <NVIC_SetPriority+0x7c>
 80002b6:	4a2f      	ldr	r2, [pc, #188]	; (8000374 <NVIC_SetPriority+0xd4>)
 80002b8:	1dfb      	adds	r3, r7, #7
 80002ba:	781b      	ldrb	r3, [r3, #0]
 80002bc:	0019      	movs	r1, r3
 80002be:	230f      	movs	r3, #15
 80002c0:	400b      	ands	r3, r1
 80002c2:	3b08      	subs	r3, #8
 80002c4:	089b      	lsrs	r3, r3, #2
 80002c6:	3306      	adds	r3, #6
 80002c8:	009b      	lsls	r3, r3, #2
 80002ca:	18d3      	adds	r3, r2, r3
 80002cc:	3304      	adds	r3, #4
 80002ce:	681b      	ldr	r3, [r3, #0]
 80002d0:	1dfa      	adds	r2, r7, #7
 80002d2:	7812      	ldrb	r2, [r2, #0]
 80002d4:	0011      	movs	r1, r2
 80002d6:	2203      	movs	r2, #3
 80002d8:	400a      	ands	r2, r1
 80002da:	00d2      	lsls	r2, r2, #3
 80002dc:	21ff      	movs	r1, #255	; 0xff
 80002de:	4091      	lsls	r1, r2
 80002e0:	000a      	movs	r2, r1
 80002e2:	43d2      	mvns	r2, r2
 80002e4:	401a      	ands	r2, r3
 80002e6:	0011      	movs	r1, r2
 80002e8:	683b      	ldr	r3, [r7, #0]
 80002ea:	019b      	lsls	r3, r3, #6
 80002ec:	22ff      	movs	r2, #255	; 0xff
 80002ee:	401a      	ands	r2, r3
 80002f0:	1dfb      	adds	r3, r7, #7
 80002f2:	781b      	ldrb	r3, [r3, #0]
 80002f4:	0018      	movs	r0, r3
 80002f6:	2303      	movs	r3, #3
 80002f8:	4003      	ands	r3, r0
 80002fa:	00db      	lsls	r3, r3, #3
 80002fc:	409a      	lsls	r2, r3
 80002fe:	481d      	ldr	r0, [pc, #116]	; (8000374 <NVIC_SetPriority+0xd4>)
 8000300:	1dfb      	adds	r3, r7, #7
 8000302:	781b      	ldrb	r3, [r3, #0]
 8000304:	001c      	movs	r4, r3
 8000306:	230f      	movs	r3, #15
 8000308:	4023      	ands	r3, r4
 800030a:	3b08      	subs	r3, #8
 800030c:	089b      	lsrs	r3, r3, #2
 800030e:	430a      	orrs	r2, r1
 8000310:	3306      	adds	r3, #6
 8000312:	009b      	lsls	r3, r3, #2
 8000314:	18c3      	adds	r3, r0, r3
 8000316:	3304      	adds	r3, #4
 8000318:	601a      	str	r2, [r3, #0]
 800031a:	e027      	b.n	800036c <NVIC_SetPriority+0xcc>
 800031c:	4a16      	ldr	r2, [pc, #88]	; (8000378 <NVIC_SetPriority+0xd8>)
 800031e:	1dfb      	adds	r3, r7, #7
 8000320:	781b      	ldrb	r3, [r3, #0]
 8000322:	b25b      	sxtb	r3, r3
 8000324:	089b      	lsrs	r3, r3, #2
 8000326:	33c0      	adds	r3, #192	; 0xc0
 8000328:	009b      	lsls	r3, r3, #2
 800032a:	589b      	ldr	r3, [r3, r2]
 800032c:	1dfa      	adds	r2, r7, #7
 800032e:	7812      	ldrb	r2, [r2, #0]
 8000330:	0011      	movs	r1, r2
 8000332:	2203      	movs	r2, #3
 8000334:	400a      	ands	r2, r1
 8000336:	00d2      	lsls	r2, r2, #3
 8000338:	21ff      	movs	r1, #255	; 0xff
 800033a:	4091      	lsls	r1, r2
 800033c:	000a      	movs	r2, r1
 800033e:	43d2      	mvns	r2, r2
 8000340:	401a      	ands	r2, r3
 8000342:	0011      	movs	r1, r2
 8000344:	683b      	ldr	r3, [r7, #0]
 8000346:	019b      	lsls	r3, r3, #6
 8000348:	22ff      	movs	r2, #255	; 0xff
 800034a:	401a      	ands	r2, r3
 800034c:	1dfb      	adds	r3, r7, #7
 800034e:	781b      	ldrb	r3, [r3, #0]
 8000350:	0018      	movs	r0, r3
 8000352:	2303      	movs	r3, #3
 8000354:	4003      	ands	r3, r0
 8000356:	00db      	lsls	r3, r3, #3
 8000358:	409a      	lsls	r2, r3
 800035a:	4807      	ldr	r0, [pc, #28]	; (8000378 <NVIC_SetPriority+0xd8>)
 800035c:	1dfb      	adds	r3, r7, #7
 800035e:	781b      	ldrb	r3, [r3, #0]
 8000360:	b25b      	sxtb	r3, r3
 8000362:	089b      	lsrs	r3, r3, #2
 8000364:	430a      	orrs	r2, r1
 8000366:	33c0      	adds	r3, #192	; 0xc0
 8000368:	009b      	lsls	r3, r3, #2
 800036a:	501a      	str	r2, [r3, r0]
 800036c:	46c0      	nop			; (mov r8, r8)
 800036e:	46bd      	mov	sp, r7
 8000370:	b003      	add	sp, #12
 8000372:	bd90      	pop	{r4, r7, pc}
 8000374:	e000ed00 	.word	0xe000ed00
 8000378:	e000e100 	.word	0xe000e100

0800037c <LL_RCC_HSI_Enable>:
 800037c:	b580      	push	{r7, lr}
 800037e:	af00      	add	r7, sp, #0
 8000380:	4b04      	ldr	r3, [pc, #16]	; (8000394 <LL_RCC_HSI_Enable+0x18>)
 8000382:	681a      	ldr	r2, [r3, #0]
 8000384:	4b03      	ldr	r3, [pc, #12]	; (8000394 <LL_RCC_HSI_Enable+0x18>)
 8000386:	2101      	movs	r1, #1
 8000388:	430a      	orrs	r2, r1
 800038a:	601a      	str	r2, [r3, #0]
 800038c:	46c0      	nop			; (mov r8, r8)
 800038e:	46bd      	mov	sp, r7
 8000390:	bd80      	pop	{r7, pc}
 8000392:	46c0      	nop			; (mov r8, r8)
 8000394:	40021000 	.word	0x40021000

08000398 <LL_RCC_HSI_IsReady>:
 8000398:	b580      	push	{r7, lr}
 800039a:	af00      	add	r7, sp, #0
 800039c:	4b05      	ldr	r3, [pc, #20]	; (80003b4 <LL_RCC_HSI_IsReady+0x1c>)
 800039e:	681b      	ldr	r3, [r3, #0]
 80003a0:	2202      	movs	r2, #2
 80003a2:	4013      	ands	r3, r2
 80003a4:	3b02      	subs	r3, #2
 80003a6:	425a      	negs	r2, r3
 80003a8:	4153      	adcs	r3, r2
 80003aa:	b2db      	uxtb	r3, r3
 80003ac:	0018      	movs	r0, r3
 80003ae:	46bd      	mov	sp, r7
 80003b0:	bd80      	pop	{r7, pc}
 80003b2:	46c0      	nop			; (mov r8, r8)
 80003b4:	40021000 	.word	0x40021000

080003b8 <LL_RCC_SetSysClkSource>:
 80003b8:	b580      	push	{r7, lr}
 80003ba:	b082      	sub	sp, #8
 80003bc:	af00      	add	r7, sp, #0
 80003be:	6078      	str	r0, [r7, #4]
 80003c0:	4b06      	ldr	r3, [pc, #24]	; (80003dc <LL_RCC_SetSysClkSource+0x24>)
 80003c2:	685b      	ldr	r3, [r3, #4]
 80003c4:	2203      	movs	r2, #3
 80003c6:	4393      	bics	r3, r2
 80003c8:	0019      	movs	r1, r3
 80003ca:	4b04      	ldr	r3, [pc, #16]	; (80003dc <LL_RCC_SetSysClkSource+0x24>)
 80003cc:	687a      	ldr	r2, [r7, #4]
 80003ce:	430a      	orrs	r2, r1
 80003d0:	605a      	str	r2, [r3, #4]
 80003d2:	46c0      	nop			; (mov r8, r8)
 80003d4:	46bd      	mov	sp, r7
 80003d6:	b002      	add	sp, #8
 80003d8:	bd80      	pop	{r7, pc}
 80003da:	46c0      	nop			; (mov r8, r8)
 80003dc:	40021000 	.word	0x40021000

080003e0 <LL_RCC_GetSysClkSource>:
 80003e0:	b580      	push	{r7, lr}
 80003e2:	af00      	add	r7, sp, #0
 80003e4:	4b03      	ldr	r3, [pc, #12]	; (80003f4 <LL_RCC_GetSysClkSource+0x14>)
 80003e6:	685b      	ldr	r3, [r3, #4]
 80003e8:	220c      	movs	r2, #12
 80003ea:	4013      	ands	r3, r2
 80003ec:	0018      	movs	r0, r3
 80003ee:	46bd      	mov	sp, r7
 80003f0:	bd80      	pop	{r7, pc}
 80003f2:	46c0      	nop			; (mov r8, r8)
 80003f4:	40021000 	.word	0x40021000

080003f8 <LL_RCC_SetAHBPrescaler>:
 80003f8:	b580      	push	{r7, lr}
 80003fa:	b082      	sub	sp, #8
 80003fc:	af00      	add	r7, sp, #0
 80003fe:	6078      	str	r0, [r7, #4]
 8000400:	4b06      	ldr	r3, [pc, #24]	; (800041c <LL_RCC_SetAHBPrescaler+0x24>)
 8000402:	685b      	ldr	r3, [r3, #4]
 8000404:	22f0      	movs	r2, #240	; 0xf0
 8000406:	4393      	bics	r3, r2
 8000408:	0019      	movs	r1, r3
 800040a:	4b04      	ldr	r3, [pc, #16]	; (800041c <LL_RCC_SetAHBPrescaler+0x24>)
 800040c:	687a      	ldr	r2, [r7, #4]
 800040e:	430a      	orrs	r2, r1
 8000410:	605a      	str	r2, [r3, #4]
 8000412:	46c0      	nop			; (mov r8, r8)
 8000414:	46bd      	mov	sp, r7
 8000416:	b002      	add	sp, #8
 8000418:	bd80      	pop	{r7, pc}
 800041a:	46c0      	nop			; (mov r8, r8)
 800041c:	40021000 	.word	0x40021000

08000420 <LL_RCC_SetAPB1Prescaler>:
 8000420:	b580      	push	{r7, lr}
 8000422:	b082      	sub	sp, #8
 8000424:	af00      	add	r7, sp, #0
 8000426:	6078      	str	r0, [r7, #4]
 8000428:	4b06      	ldr	r3, [pc, #24]	; (8000444 <LL_RCC_SetAPB1Prescaler+0x24>)
 800042a:	685b      	ldr	r3, [r3, #4]
 800042c:	4a06      	ldr	r2, [pc, #24]	; (8000448 <LL_RCC_SetAPB1Prescaler+0x28>)
 800042e:	4013      	ands	r3, r2
 8000430:	0019      	movs	r1, r3
 8000432:	4b04      	ldr	r3, [pc, #16]	; (8000444 <LL_RCC_SetAPB1Prescaler+0x24>)
 8000434:	687a      	ldr	r2, [r7, #4]
 8000436:	430a      	orrs	r2, r1
 8000438:	605a      	str	r2, [r3, #4]
 800043a:	46c0      	nop			; (mov r8, r8)
 800043c:	46bd      	mov	sp, r7
 800043e:	b002      	add	sp, #8
 8000440:	bd80      	pop	{r7, pc}
 8000442:	46c0      	nop			; (mov r8, r8)
 8000444:	40021000 	.word	0x40021000
 8000448:	fffff8ff 	.word	0xfffff8ff

0800044c <LL_RCC_PLL_Enable>:
 800044c:	b580      	push	{r7, lr}
 800044e:	af00      	add	r7, sp, #0
 8000450:	4b04      	ldr	r3, [pc, #16]	; (8000464 <LL_RCC_PLL_Enable+0x18>)
 8000452:	681a      	ldr	r2, [r3, #0]
 8000454:	4b03      	ldr	r3, [pc, #12]	; (8000464 <LL_RCC_PLL_Enable+0x18>)
 8000456:	2180      	movs	r1, #128	; 0x80
 8000458:	0449      	lsls	r1, r1, #17
 800045a:	430a      	orrs	r2, r1
 800045c:	601a      	str	r2, [r3, #0]
 800045e:	46c0      	nop			; (mov r8, r8)
 8000460:	46bd      	mov	sp, r7
 8000462:	bd80      	pop	{r7, pc}
 8000464:	40021000 	.word	0x40021000

08000468 <LL_RCC_PLL_IsReady>:
 8000468:	b580      	push	{r7, lr}
 800046a:	af00      	add	r7, sp, #0
 800046c:	4b07      	ldr	r3, [pc, #28]	; (800048c <LL_RCC_PLL_IsReady+0x24>)
 800046e:	681a      	ldr	r2, [r3, #0]
 8000470:	2380      	movs	r3, #128	; 0x80
 8000472:	049b      	lsls	r3, r3, #18
 8000474:	4013      	ands	r3, r2
 8000476:	22fe      	movs	r2, #254	; 0xfe
 8000478:	0612      	lsls	r2, r2, #24
 800047a:	4694      	mov	ip, r2
 800047c:	4463      	add	r3, ip
 800047e:	425a      	negs	r2, r3
 8000480:	4153      	adcs	r3, r2
 8000482:	b2db      	uxtb	r3, r3
 8000484:	0018      	movs	r0, r3
 8000486:	46bd      	mov	sp, r7
 8000488:	bd80      	pop	{r7, pc}
 800048a:	46c0      	nop			; (mov r8, r8)
 800048c:	40021000 	.word	0x40021000

08000490 <LL_RCC_PLL_ConfigDomain_SYS>:
 8000490:	b580      	push	{r7, lr}
 8000492:	b082      	sub	sp, #8
 8000494:	af00      	add	r7, sp, #0
 8000496:	6078      	str	r0, [r7, #4]
 8000498:	6039      	str	r1, [r7, #0]
 800049a:	4b0e      	ldr	r3, [pc, #56]	; (80004d4 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 800049c:	685b      	ldr	r3, [r3, #4]
 800049e:	4a0e      	ldr	r2, [pc, #56]	; (80004d8 <LL_RCC_PLL_ConfigDomain_SYS+0x48>)
 80004a0:	4013      	ands	r3, r2
 80004a2:	0019      	movs	r1, r3
 80004a4:	687a      	ldr	r2, [r7, #4]
 80004a6:	2380      	movs	r3, #128	; 0x80
 80004a8:	025b      	lsls	r3, r3, #9
 80004aa:	401a      	ands	r2, r3
 80004ac:	683b      	ldr	r3, [r7, #0]
 80004ae:	431a      	orrs	r2, r3
 80004b0:	4b08      	ldr	r3, [pc, #32]	; (80004d4 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 80004b2:	430a      	orrs	r2, r1
 80004b4:	605a      	str	r2, [r3, #4]
 80004b6:	4b07      	ldr	r3, [pc, #28]	; (80004d4 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 80004b8:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 80004ba:	220f      	movs	r2, #15
 80004bc:	4393      	bics	r3, r2
 80004be:	0019      	movs	r1, r3
 80004c0:	687b      	ldr	r3, [r7, #4]
 80004c2:	220f      	movs	r2, #15
 80004c4:	401a      	ands	r2, r3
 80004c6:	4b03      	ldr	r3, [pc, #12]	; (80004d4 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 80004c8:	430a      	orrs	r2, r1
 80004ca:	62da      	str	r2, [r3, #44]	; 0x2c
 80004cc:	46c0      	nop			; (mov r8, r8)
 80004ce:	46bd      	mov	sp, r7
 80004d0:	b002      	add	sp, #8
 80004d2:	bd80      	pop	{r7, pc}
 80004d4:	40021000 	.word	0x40021000
 80004d8:	ffc2ffff 	.word	0xffc2ffff

080004dc <LL_SYSCFG_SetEXTISource>:
 80004dc:	b590      	push	{r4, r7, lr}
 80004de:	b083      	sub	sp, #12
 80004e0:	af00      	add	r7, sp, #0
 80004e2:	6078      	str	r0, [r7, #4]
 80004e4:	6039      	str	r1, [r7, #0]
 80004e6:	4a0f      	ldr	r2, [pc, #60]	; (8000524 <LL_SYSCFG_SetEXTISource+0x48>)
 80004e8:	683b      	ldr	r3, [r7, #0]
 80004ea:	21ff      	movs	r1, #255	; 0xff
 80004ec:	400b      	ands	r3, r1
 80004ee:	3302      	adds	r3, #2
 80004f0:	009b      	lsls	r3, r3, #2
 80004f2:	589b      	ldr	r3, [r3, r2]
 80004f4:	683a      	ldr	r2, [r7, #0]
 80004f6:	0c12      	lsrs	r2, r2, #16
 80004f8:	210f      	movs	r1, #15
 80004fa:	4091      	lsls	r1, r2
 80004fc:	000a      	movs	r2, r1
 80004fe:	43d2      	mvns	r2, r2
 8000500:	401a      	ands	r2, r3
 8000502:	0011      	movs	r1, r2
 8000504:	683b      	ldr	r3, [r7, #0]
 8000506:	0c1b      	lsrs	r3, r3, #16
 8000508:	687a      	ldr	r2, [r7, #4]
 800050a:	409a      	lsls	r2, r3
 800050c:	4805      	ldr	r0, [pc, #20]	; (8000524 <LL_SYSCFG_SetEXTISource+0x48>)
 800050e:	683b      	ldr	r3, [r7, #0]
 8000510:	24ff      	movs	r4, #255	; 0xff
 8000512:	4023      	ands	r3, r4
 8000514:	430a      	orrs	r2, r1
 8000516:	3302      	adds	r3, #2
 8000518:	009b      	lsls	r3, r3, #2
 800051a:	501a      	str	r2, [r3, r0]
 800051c:	46c0      	nop			; (mov r8, r8)
 800051e:	46bd      	mov	sp, r7
 8000520:	b003      	add	sp, #12
 8000522:	bd90      	pop	{r4, r7, pc}
 8000524:	40010000 	.word	0x40010000

08000528 <LL_FLASH_SetLatency>:
 8000528:	b580      	push	{r7, lr}
 800052a:	b082      	sub	sp, #8
 800052c:	af00      	add	r7, sp, #0
 800052e:	6078      	str	r0, [r7, #4]
 8000530:	4b06      	ldr	r3, [pc, #24]	; (800054c <LL_FLASH_SetLatency+0x24>)
 8000532:	681b      	ldr	r3, [r3, #0]
 8000534:	2201      	movs	r2, #1
 8000536:	4393      	bics	r3, r2
 8000538:	0019      	movs	r1, r3
 800053a:	4b04      	ldr	r3, [pc, #16]	; (800054c <LL_FLASH_SetLatency+0x24>)
 800053c:	687a      	ldr	r2, [r7, #4]
 800053e:	430a      	orrs	r2, r1
 8000540:	601a      	str	r2, [r3, #0]
 8000542:	46c0      	nop			; (mov r8, r8)
 8000544:	46bd      	mov	sp, r7
 8000546:	b002      	add	sp, #8
 8000548:	bd80      	pop	{r7, pc}
 800054a:	46c0      	nop			; (mov r8, r8)
 800054c:	40022000 	.word	0x40022000

08000550 <LL_AHB1_GRP1_EnableClock>:
 8000550:	b580      	push	{r7, lr}
 8000552:	b084      	sub	sp, #16
 8000554:	af00      	add	r7, sp, #0
 8000556:	6078      	str	r0, [r7, #4]
 8000558:	4b07      	ldr	r3, [pc, #28]	; (8000578 <LL_AHB1_GRP1_EnableClock+0x28>)
 800055a:	6959      	ldr	r1, [r3, #20]
 800055c:	4b06      	ldr	r3, [pc, #24]	; (8000578 <LL_AHB1_GRP1_EnableClock+0x28>)
 800055e:	687a      	ldr	r2, [r7, #4]
 8000560:	430a      	orrs	r2, r1
 8000562:	615a      	str	r2, [r3, #20]
 8000564:	4b04      	ldr	r3, [pc, #16]	; (8000578 <LL_AHB1_GRP1_EnableClock+0x28>)
 8000566:	695b      	ldr	r3, [r3, #20]
 8000568:	687a      	ldr	r2, [r7, #4]
 800056a:	4013      	ands	r3, r2
 800056c:	60fb      	str	r3, [r7, #12]
 800056e:	68fb      	ldr	r3, [r7, #12]
 8000570:	46c0      	nop			; (mov r8, r8)
 8000572:	46bd      	mov	sp, r7
 8000574:	b004      	add	sp, #16
 8000576:	bd80      	pop	{r7, pc}
 8000578:	40021000 	.word	0x40021000

0800057c <LL_APB1_GRP2_EnableClock>:
 800057c:	b580      	push	{r7, lr}
 800057e:	b084      	sub	sp, #16
 8000580:	af00      	add	r7, sp, #0
 8000582:	6078      	str	r0, [r7, #4]
 8000584:	4b07      	ldr	r3, [pc, #28]	; (80005a4 <LL_APB1_GRP2_EnableClock+0x28>)
 8000586:	6999      	ldr	r1, [r3, #24]
 8000588:	4b06      	ldr	r3, [pc, #24]	; (80005a4 <LL_APB1_GRP2_EnableClock+0x28>)
 800058a:	687a      	ldr	r2, [r7, #4]
 800058c:	430a      	orrs	r2, r1
 800058e:	619a      	str	r2, [r3, #24]
 8000590:	4b04      	ldr	r3, [pc, #16]	; (80005a4 <LL_APB1_GRP2_EnableClock+0x28>)
 8000592:	699b      	ldr	r3, [r3, #24]
 8000594:	687a      	ldr	r2, [r7, #4]
 8000596:	4013      	ands	r3, r2
 8000598:	60fb      	str	r3, [r7, #12]
 800059a:	68fb      	ldr	r3, [r7, #12]
 800059c:	46c0      	nop			; (mov r8, r8)
 800059e:	46bd      	mov	sp, r7
 80005a0:	b004      	add	sp, #16
 80005a2:	bd80      	pop	{r7, pc}
 80005a4:	40021000 	.word	0x40021000

080005a8 <LL_GPIO_SetPinMode>:
 80005a8:	b580      	push	{r7, lr}
 80005aa:	b084      	sub	sp, #16
 80005ac:	af00      	add	r7, sp, #0
 80005ae:	60f8      	str	r0, [r7, #12]
 80005b0:	60b9      	str	r1, [r7, #8]
 80005b2:	607a      	str	r2, [r7, #4]
 80005b4:	68fb      	ldr	r3, [r7, #12]
 80005b6:	6819      	ldr	r1, [r3, #0]
 80005b8:	68bb      	ldr	r3, [r7, #8]
 80005ba:	68ba      	ldr	r2, [r7, #8]
 80005bc:	435a      	muls	r2, r3
 80005be:	0013      	movs	r3, r2
 80005c0:	005b      	lsls	r3, r3, #1
 80005c2:	189b      	adds	r3, r3, r2
 80005c4:	43db      	mvns	r3, r3
 80005c6:	400b      	ands	r3, r1
 80005c8:	001a      	movs	r2, r3
 80005ca:	68bb      	ldr	r3, [r7, #8]
 80005cc:	68b9      	ldr	r1, [r7, #8]
 80005ce:	434b      	muls	r3, r1
 80005d0:	6879      	ldr	r1, [r7, #4]
 80005d2:	434b      	muls	r3, r1
 80005d4:	431a      	orrs	r2, r3
 80005d6:	68fb      	ldr	r3, [r7, #12]
 80005d8:	601a      	str	r2, [r3, #0]
 80005da:	46c0      	nop			; (mov r8, r8)
 80005dc:	46bd      	mov	sp, r7
 80005de:	b004      	add	sp, #16
 80005e0:	bd80      	pop	{r7, pc}

080005e2 <LL_GPIO_SetOutputPin>:
 80005e2:	b580      	push	{r7, lr}
 80005e4:	b082      	sub	sp, #8
 80005e6:	af00      	add	r7, sp, #0
 80005e8:	6078      	str	r0, [r7, #4]
 80005ea:	6039      	str	r1, [r7, #0]
 80005ec:	687b      	ldr	r3, [r7, #4]
 80005ee:	683a      	ldr	r2, [r7, #0]
 80005f0:	619a      	str	r2, [r3, #24]
 80005f2:	46c0      	nop			; (mov r8, r8)
 80005f4:	46bd      	mov	sp, r7
 80005f6:	b002      	add	sp, #8
 80005f8:	bd80      	pop	{r7, pc}

080005fa <LL_GPIO_ResetOutputPin>:
 80005fa:	b580      	push	{r7, lr}
 80005fc:	b082      	sub	sp, #8
 80005fe:	af00      	add	r7, sp, #0
 8000600:	6078      	str	r0, [r7, #4]
 8000602:	6039      	str	r1, [r7, #0]
 8000604:	687b      	ldr	r3, [r7, #4]
 8000606:	683a      	ldr	r2, [r7, #0]
 8000608:	629a      	str	r2, [r3, #40]	; 0x28
 800060a:	46c0      	nop			; (mov r8, r8)
 800060c:	46bd      	mov	sp, r7
 800060e:	b002      	add	sp, #8
 8000610:	bd80      	pop	{r7, pc}

08000612 <LL_GPIO_TogglePin>:
 8000612:	b580      	push	{r7, lr}
 8000614:	b082      	sub	sp, #8
 8000616:	af00      	add	r7, sp, #0
 8000618:	6078      	str	r0, [r7, #4]
 800061a:	6039      	str	r1, [r7, #0]
 800061c:	687b      	ldr	r3, [r7, #4]
 800061e:	695a      	ldr	r2, [r3, #20]
 8000620:	683b      	ldr	r3, [r7, #0]
 8000622:	405a      	eors	r2, r3
 8000624:	687b      	ldr	r3, [r7, #4]
 8000626:	615a      	str	r2, [r3, #20]
 8000628:	46c0      	nop			; (mov r8, r8)
 800062a:	46bd      	mov	sp, r7
 800062c:	b002      	add	sp, #8
 800062e:	bd80      	pop	{r7, pc}

08000630 <LL_EXTI_EnableIT_0_31>:
 8000630:	b580      	push	{r7, lr}
 8000632:	b082      	sub	sp, #8
 8000634:	af00      	add	r7, sp, #0
 8000636:	6078      	str	r0, [r7, #4]
 8000638:	4b04      	ldr	r3, [pc, #16]	; (800064c <LL_EXTI_EnableIT_0_31+0x1c>)
 800063a:	6819      	ldr	r1, [r3, #0]
 800063c:	4b03      	ldr	r3, [pc, #12]	; (800064c <LL_EXTI_EnableIT_0_31+0x1c>)
 800063e:	687a      	ldr	r2, [r7, #4]
 8000640:	430a      	orrs	r2, r1
 8000642:	601a      	str	r2, [r3, #0]
 8000644:	46c0      	nop			; (mov r8, r8)
 8000646:	46bd      	mov	sp, r7
 8000648:	b002      	add	sp, #8
 800064a:	bd80      	pop	{r7, pc}
 800064c:	40010400 	.word	0x40010400

08000650 <LL_EXTI_EnableRisingTrig_0_31>:
 8000650:	b580      	push	{r7, lr}
 8000652:	b082      	sub	sp, #8
 8000654:	af00      	add	r7, sp, #0
 8000656:	6078      	str	r0, [r7, #4]
 8000658:	4b04      	ldr	r3, [pc, #16]	; (800066c <LL_EXTI_EnableRisingTrig_0_31+0x1c>)
 800065a:	6899      	ldr	r1, [r3, #8]
 800065c:	4b03      	ldr	r3, [pc, #12]	; (800066c <LL_EXTI_EnableRisingTrig_0_31+0x1c>)
 800065e:	687a      	ldr	r2, [r7, #4]
 8000660:	430a      	orrs	r2, r1
 8000662:	609a      	str	r2, [r3, #8]
 8000664:	46c0      	nop			; (mov r8, r8)
 8000666:	46bd      	mov	sp, r7
 8000668:	b002      	add	sp, #8
 800066a:	bd80      	pop	{r7, pc}
 800066c:	40010400 	.word	0x40010400

08000670 <LL_EXTI_EnableFallingTrig_0_31>:
 8000670:	b580      	push	{r7, lr}
 8000672:	b082      	sub	sp, #8
 8000674:	af00      	add	r7, sp, #0
 8000676:	6078      	str	r0, [r7, #4]
 8000678:	4b04      	ldr	r3, [pc, #16]	; (800068c <LL_EXTI_EnableFallingTrig_0_31+0x1c>)
 800067a:	68d9      	ldr	r1, [r3, #12]
 800067c:	4b03      	ldr	r3, [pc, #12]	; (800068c <LL_EXTI_EnableFallingTrig_0_31+0x1c>)
 800067e:	687a      	ldr	r2, [r7, #4]
 8000680:	430a      	orrs	r2, r1
 8000682:	60da      	str	r2, [r3, #12]
 8000684:	46c0      	nop			; (mov r8, r8)
 8000686:	46bd      	mov	sp, r7
 8000688:	b002      	add	sp, #8
 800068a:	bd80      	pop	{r7, pc}
 800068c:	40010400 	.word	0x40010400

08000690 <LL_EXTI_ClearFlag_0_31>:
 8000690:	b580      	push	{r7, lr}
 8000692:	b082      	sub	sp, #8
 8000694:	af00      	add	r7, sp, #0
 8000696:	6078      	str	r0, [r7, #4]
 8000698:	4b03      	ldr	r3, [pc, #12]	; (80006a8 <LL_EXTI_ClearFlag_0_31+0x18>)
 800069a:	687a      	ldr	r2, [r7, #4]
 800069c:	615a      	str	r2, [r3, #20]
 800069e:	46c0      	nop			; (mov r8, r8)
 80006a0:	46bd      	mov	sp, r7
 80006a2:	b002      	add	sp, #8
 80006a4:	bd80      	pop	{r7, pc}
 80006a6:	46c0      	nop			; (mov r8, r8)
 80006a8:	40010400 	.word	0x40010400

080006ac <LL_InitTick>:
 80006ac:	b580      	push	{r7, lr}
 80006ae:	b082      	sub	sp, #8
 80006b0:	af00      	add	r7, sp, #0
 80006b2:	6078      	str	r0, [r7, #4]
 80006b4:	6039      	str	r1, [r7, #0]
 80006b6:	6839      	ldr	r1, [r7, #0]
 80006b8:	6878      	ldr	r0, [r7, #4]
 80006ba:	f7ff fd25 	bl	8000108 <__udivsi3>
 80006be:	0003      	movs	r3, r0
 80006c0:	001a      	movs	r2, r3
 80006c2:	4b06      	ldr	r3, [pc, #24]	; (80006dc <LL_InitTick+0x30>)
 80006c4:	3a01      	subs	r2, #1
 80006c6:	605a      	str	r2, [r3, #4]
 80006c8:	4b04      	ldr	r3, [pc, #16]	; (80006dc <LL_InitTick+0x30>)
 80006ca:	2200      	movs	r2, #0
 80006cc:	609a      	str	r2, [r3, #8]
 80006ce:	4b03      	ldr	r3, [pc, #12]	; (80006dc <LL_InitTick+0x30>)
 80006d0:	2205      	movs	r2, #5
 80006d2:	601a      	str	r2, [r3, #0]
 80006d4:	46c0      	nop			; (mov r8, r8)
 80006d6:	46bd      	mov	sp, r7
 80006d8:	b002      	add	sp, #8
 80006da:	bd80      	pop	{r7, pc}
 80006dc:	e000e010 	.word	0xe000e010

080006e0 <LL_SYSTICK_EnableIT>:
 80006e0:	b580      	push	{r7, lr}
 80006e2:	af00      	add	r7, sp, #0
 80006e4:	4b04      	ldr	r3, [pc, #16]	; (80006f8 <LL_SYSTICK_EnableIT+0x18>)
 80006e6:	681a      	ldr	r2, [r3, #0]
 80006e8:	4b03      	ldr	r3, [pc, #12]	; (80006f8 <LL_SYSTICK_EnableIT+0x18>)
 80006ea:	2102      	movs	r1, #2
 80006ec:	430a      	orrs	r2, r1
 80006ee:	601a      	str	r2, [r3, #0]
 80006f0:	46c0      	nop			; (mov r8, r8)
 80006f2:	46bd      	mov	sp, r7
 80006f4:	bd80      	pop	{r7, pc}
 80006f6:	46c0      	nop			; (mov r8, r8)
 80006f8:	e000e010 	.word	0xe000e010

080006fc <rcc_config>:
 80006fc:	b580      	push	{r7, lr}
 80006fe:	af00      	add	r7, sp, #0
 8000700:	2001      	movs	r0, #1
 8000702:	f7ff ff11 	bl	8000528 <LL_FLASH_SetLatency>
 8000706:	f7ff fe39 	bl	800037c <LL_RCC_HSI_Enable>
 800070a:	46c0      	nop			; (mov r8, r8)
 800070c:	f7ff fe44 	bl	8000398 <LL_RCC_HSI_IsReady>
 8000710:	0003      	movs	r3, r0
 8000712:	2b01      	cmp	r3, #1
 8000714:	d1fa      	bne.n	800070c <rcc_config+0x10>
 8000716:	23a0      	movs	r3, #160	; 0xa0
 8000718:	039b      	lsls	r3, r3, #14
 800071a:	0019      	movs	r1, r3
 800071c:	2000      	movs	r0, #0
 800071e:	f7ff feb7 	bl	8000490 <LL_RCC_PLL_ConfigDomain_SYS>
 8000722:	f7ff fe93 	bl	800044c <LL_RCC_PLL_Enable>
 8000726:	46c0      	nop			; (mov r8, r8)
 8000728:	f7ff fe9e 	bl	8000468 <LL_RCC_PLL_IsReady>
 800072c:	0003      	movs	r3, r0
 800072e:	2b01      	cmp	r3, #1
 8000730:	d1fa      	bne.n	8000728 <rcc_config+0x2c>
 8000732:	2000      	movs	r0, #0
 8000734:	f7ff fe60 	bl	80003f8 <LL_RCC_SetAHBPrescaler>
 8000738:	2002      	movs	r0, #2
 800073a:	f7ff fe3d 	bl	80003b8 <LL_RCC_SetSysClkSource>
 800073e:	46c0      	nop			; (mov r8, r8)
 8000740:	f7ff fe4e 	bl	80003e0 <LL_RCC_GetSysClkSource>
 8000744:	0003      	movs	r3, r0
 8000746:	2b08      	cmp	r3, #8
 8000748:	d1fa      	bne.n	8000740 <rcc_config+0x44>
 800074a:	2000      	movs	r0, #0
 800074c:	f7ff fe68 	bl	8000420 <LL_RCC_SetAPB1Prescaler>
 8000750:	4b02      	ldr	r3, [pc, #8]	; (800075c <rcc_config+0x60>)
 8000752:	4a03      	ldr	r2, [pc, #12]	; (8000760 <rcc_config+0x64>)
 8000754:	601a      	str	r2, [r3, #0]
 8000756:	46c0      	nop			; (mov r8, r8)
 8000758:	46bd      	mov	sp, r7
 800075a:	bd80      	pop	{r7, pc}
 800075c:	20000000 	.word	0x20000000
 8000760:	02dc6c00 	.word	0x02dc6c00

08000764 <gpio_config>:
 8000764:	b580      	push	{r7, lr}
 8000766:	af00      	add	r7, sp, #0
 8000768:	2380      	movs	r3, #128	; 0x80
 800076a:	031b      	lsls	r3, r3, #12
 800076c:	0018      	movs	r0, r3
 800076e:	f7ff feef 	bl	8000550 <LL_AHB1_GRP1_EnableClock>
 8000772:	2380      	movs	r3, #128	; 0x80
 8000774:	005b      	lsls	r3, r3, #1
 8000776:	4807      	ldr	r0, [pc, #28]	; (8000794 <gpio_config+0x30>)
 8000778:	2201      	movs	r2, #1
 800077a:	0019      	movs	r1, r3
 800077c:	f7ff ff14 	bl	80005a8 <LL_GPIO_SetPinMode>
 8000780:	2380      	movs	r3, #128	; 0x80
 8000782:	009b      	lsls	r3, r3, #2
 8000784:	4803      	ldr	r0, [pc, #12]	; (8000794 <gpio_config+0x30>)
 8000786:	2201      	movs	r2, #1
 8000788:	0019      	movs	r1, r3
 800078a:	f7ff ff0d 	bl	80005a8 <LL_GPIO_SetPinMode>
 800078e:	46c0      	nop			; (mov r8, r8)
 8000790:	46bd      	mov	sp, r7
 8000792:	bd80      	pop	{r7, pc}
 8000794:	48000800 	.word	0x48000800

08000798 <exti_config>:
 8000798:	b580      	push	{r7, lr}
 800079a:	af00      	add	r7, sp, #0
 800079c:	2001      	movs	r0, #1
 800079e:	f7ff feed 	bl	800057c <LL_APB1_GRP2_EnableClock>
 80007a2:	2100      	movs	r1, #0
 80007a4:	2000      	movs	r0, #0
 80007a6:	f7ff fe99 	bl	80004dc <LL_SYSCFG_SetEXTISource>
 80007aa:	2001      	movs	r0, #1
 80007ac:	f7ff ff40 	bl	8000630 <LL_EXTI_EnableIT_0_31>
 80007b0:	2001      	movs	r0, #1
 80007b2:	f7ff ff5d 	bl	8000670 <LL_EXTI_EnableFallingTrig_0_31>
 80007b6:	2001      	movs	r0, #1
 80007b8:	f7ff ff4a 	bl	8000650 <LL_EXTI_EnableRisingTrig_0_31>
 80007bc:	2005      	movs	r0, #5
 80007be:	f7ff fd59 	bl	8000274 <NVIC_EnableIRQ>
 80007c2:	2100      	movs	r1, #0
 80007c4:	2005      	movs	r0, #5
 80007c6:	f7ff fd6b 	bl	80002a0 <NVIC_SetPriority>
 80007ca:	46c0      	nop			; (mov r8, r8)
 80007cc:	46bd      	mov	sp, r7
 80007ce:	bd80      	pop	{r7, pc}

080007d0 <EXTI0_1_IRQHandler>:
 80007d0:	b580      	push	{r7, lr}
 80007d2:	b082      	sub	sp, #8
 80007d4:	af00      	add	r7, sp, #0
 80007d6:	4b3e      	ldr	r3, [pc, #248]	; (80008d0 <EXTI0_1_IRQHandler+0x100>)
 80007d8:	681b      	ldr	r3, [r3, #0]
 80007da:	607b      	str	r3, [r7, #4]
 80007dc:	4b3d      	ldr	r3, [pc, #244]	; (80008d4 <EXTI0_1_IRQHandler+0x104>)
 80007de:	681b      	ldr	r3, [r3, #0]
 80007e0:	687a      	ldr	r2, [r7, #4]
 80007e2:	1ad3      	subs	r3, r2, r3
 80007e4:	603b      	str	r3, [r7, #0]
 80007e6:	2246      	movs	r2, #70	; 0x46
 80007e8:	683b      	ldr	r3, [r7, #0]
 80007ea:	4293      	cmp	r3, r2
 80007ec:	da03      	bge.n	80007f6 <EXTI0_1_IRQHandler+0x26>
 80007ee:	2001      	movs	r0, #1
 80007f0:	f7ff ff4e 	bl	8000690 <LL_EXTI_ClearFlag_0_31>
 80007f4:	e068      	b.n	80008c8 <EXTI0_1_IRQHandler+0xf8>
 80007f6:	4b38      	ldr	r3, [pc, #224]	; (80008d8 <EXTI0_1_IRQHandler+0x108>)
 80007f8:	2201      	movs	r2, #1
 80007fa:	601a      	str	r2, [r3, #0]
 80007fc:	4b37      	ldr	r3, [pc, #220]	; (80008dc <EXTI0_1_IRQHandler+0x10c>)
 80007fe:	681b      	ldr	r3, [r3, #0]
 8000800:	2b00      	cmp	r3, #0
 8000802:	d121      	bne.n	8000848 <EXTI0_1_IRQHandler+0x78>
 8000804:	23c8      	movs	r3, #200	; 0xc8
 8000806:	005b      	lsls	r3, r3, #1
 8000808:	683a      	ldr	r2, [r7, #0]
 800080a:	429a      	cmp	r2, r3
 800080c:	dd0b      	ble.n	8000826 <EXTI0_1_IRQHandler+0x56>
 800080e:	4b34      	ldr	r3, [pc, #208]	; (80008e0 <EXTI0_1_IRQHandler+0x110>)
 8000810:	681b      	ldr	r3, [r3, #0]
 8000812:	2b00      	cmp	r3, #0
 8000814:	d007      	beq.n	8000826 <EXTI0_1_IRQHandler+0x56>
 8000816:	4b32      	ldr	r3, [pc, #200]	; (80008e0 <EXTI0_1_IRQHandler+0x110>)
 8000818:	681b      	ldr	r3, [r3, #0]
 800081a:	1c59      	adds	r1, r3, #1
 800081c:	4a30      	ldr	r2, [pc, #192]	; (80008e0 <EXTI0_1_IRQHandler+0x110>)
 800081e:	6011      	str	r1, [r2, #0]
 8000820:	4a30      	ldr	r2, [pc, #192]	; (80008e4 <EXTI0_1_IRQHandler+0x114>)
 8000822:	2103      	movs	r1, #3
 8000824:	54d1      	strb	r1, [r2, r3]
 8000826:	4b2d      	ldr	r3, [pc, #180]	; (80008dc <EXTI0_1_IRQHandler+0x10c>)
 8000828:	2201      	movs	r2, #1
 800082a:	601a      	str	r2, [r3, #0]
 800082c:	4b29      	ldr	r3, [pc, #164]	; (80008d4 <EXTI0_1_IRQHandler+0x104>)
 800082e:	687a      	ldr	r2, [r7, #4]
 8000830:	601a      	str	r2, [r3, #0]
 8000832:	2380      	movs	r3, #128	; 0x80
 8000834:	009b      	lsls	r3, r3, #2
 8000836:	4a2c      	ldr	r2, [pc, #176]	; (80008e8 <EXTI0_1_IRQHandler+0x118>)
 8000838:	0019      	movs	r1, r3
 800083a:	0010      	movs	r0, r2
 800083c:	f7ff fee9 	bl	8000612 <LL_GPIO_TogglePin>
 8000840:	2001      	movs	r0, #1
 8000842:	f7ff ff25 	bl	8000690 <LL_EXTI_ClearFlag_0_31>
 8000846:	e03f      	b.n	80008c8 <EXTI0_1_IRQHandler+0xf8>
 8000848:	4b24      	ldr	r3, [pc, #144]	; (80008dc <EXTI0_1_IRQHandler+0x10c>)
 800084a:	2200      	movs	r2, #0
 800084c:	601a      	str	r2, [r3, #0]
 800084e:	23c8      	movs	r3, #200	; 0xc8
 8000850:	005b      	lsls	r3, r3, #1
 8000852:	683a      	ldr	r2, [r7, #0]
 8000854:	429a      	cmp	r2, r3
 8000856:	dc16      	bgt.n	8000886 <EXTI0_1_IRQHandler+0xb6>
 8000858:	4b21      	ldr	r3, [pc, #132]	; (80008e0 <EXTI0_1_IRQHandler+0x110>)
 800085a:	681b      	ldr	r3, [r3, #0]
 800085c:	1c59      	adds	r1, r3, #1
 800085e:	4a20      	ldr	r2, [pc, #128]	; (80008e0 <EXTI0_1_IRQHandler+0x110>)
 8000860:	6011      	str	r1, [r2, #0]
 8000862:	4a20      	ldr	r2, [pc, #128]	; (80008e4 <EXTI0_1_IRQHandler+0x114>)
 8000864:	2101      	movs	r1, #1
 8000866:	54d1      	strb	r1, [r2, r3]
 8000868:	2380      	movs	r3, #128	; 0x80
 800086a:	009b      	lsls	r3, r3, #2
 800086c:	4a1e      	ldr	r2, [pc, #120]	; (80008e8 <EXTI0_1_IRQHandler+0x118>)
 800086e:	0019      	movs	r1, r3
 8000870:	0010      	movs	r0, r2
 8000872:	f7ff fece 	bl	8000612 <LL_GPIO_TogglePin>
 8000876:	2380      	movs	r3, #128	; 0x80
 8000878:	005b      	lsls	r3, r3, #1
 800087a:	4a1b      	ldr	r2, [pc, #108]	; (80008e8 <EXTI0_1_IRQHandler+0x118>)
 800087c:	0019      	movs	r1, r3
 800087e:	0010      	movs	r0, r2
 8000880:	f7ff febb 	bl	80005fa <LL_GPIO_ResetOutputPin>
 8000884:	e01a      	b.n	80008bc <EXTI0_1_IRQHandler+0xec>
 8000886:	23c8      	movs	r3, #200	; 0xc8
 8000888:	005b      	lsls	r3, r3, #1
 800088a:	683a      	ldr	r2, [r7, #0]
 800088c:	429a      	cmp	r2, r3
 800088e:	dd15      	ble.n	80008bc <EXTI0_1_IRQHandler+0xec>
 8000890:	4b13      	ldr	r3, [pc, #76]	; (80008e0 <EXTI0_1_IRQHandler+0x110>)
 8000892:	681b      	ldr	r3, [r3, #0]
 8000894:	1c59      	adds	r1, r3, #1
 8000896:	4a12      	ldr	r2, [pc, #72]	; (80008e0 <EXTI0_1_IRQHandler+0x110>)
 8000898:	6011      	str	r1, [r2, #0]
 800089a:	4a12      	ldr	r2, [pc, #72]	; (80008e4 <EXTI0_1_IRQHandler+0x114>)
 800089c:	2102      	movs	r1, #2
 800089e:	54d1      	strb	r1, [r2, r3]
 80008a0:	2380      	movs	r3, #128	; 0x80
 80008a2:	009b      	lsls	r3, r3, #2
 80008a4:	4a10      	ldr	r2, [pc, #64]	; (80008e8 <EXTI0_1_IRQHandler+0x118>)
 80008a6:	0019      	movs	r1, r3
 80008a8:	0010      	movs	r0, r2
 80008aa:	f7ff feb2 	bl	8000612 <LL_GPIO_TogglePin>
 80008ae:	2380      	movs	r3, #128	; 0x80
 80008b0:	005b      	lsls	r3, r3, #1
 80008b2:	4a0d      	ldr	r2, [pc, #52]	; (80008e8 <EXTI0_1_IRQHandler+0x118>)
 80008b4:	0019      	movs	r1, r3
 80008b6:	0010      	movs	r0, r2
 80008b8:	f7ff fe93 	bl	80005e2 <LL_GPIO_SetOutputPin>
 80008bc:	4b05      	ldr	r3, [pc, #20]	; (80008d4 <EXTI0_1_IRQHandler+0x104>)
 80008be:	687a      	ldr	r2, [r7, #4]
 80008c0:	601a      	str	r2, [r3, #0]
 80008c2:	2001      	movs	r0, #1
 80008c4:	f7ff fee4 	bl	8000690 <LL_EXTI_ClearFlag_0_31>
 80008c8:	46bd      	mov	sp, r7
 80008ca:	b002      	add	sp, #8
 80008cc:	bd80      	pop	{r7, pc}
 80008ce:	46c0      	nop			; (mov r8, r8)
 80008d0:	20000450 	.word	0x20000450
 80008d4:	2000064c 	.word	0x2000064c
 80008d8:	20000650 	.word	0x20000650
 80008dc:	2000066c 	.word	0x2000066c
 80008e0:	20000648 	.word	0x20000648
 80008e4:	20000454 	.word	0x20000454
 80008e8:	48000800 	.word	0x48000800

080008ec <delay>:
 80008ec:	b580      	push	{r7, lr}
 80008ee:	4e02      	ldr	r6, [pc, #8]	; (80008f8 <delay+0xc>)
 80008f0:	3e01      	subs	r6, #1
 80008f2:	2e00      	cmp	r6, #0
 80008f4:	d1fc      	bne.n	80008f0 <delay+0x4>
 80008f6:	bd80      	pop	{r7, pc}
 80008f8:	0011ffff 	.word	0x0011ffff
 80008fc:	46c0      	nop			; (mov r8, r8)
	...

08000900 <systick_config>:
 8000900:	b580      	push	{r7, lr}
 8000902:	af00      	add	r7, sp, #0
 8000904:	23fa      	movs	r3, #250	; 0xfa
 8000906:	009b      	lsls	r3, r3, #2
 8000908:	4a07      	ldr	r2, [pc, #28]	; (8000928 <systick_config+0x28>)
 800090a:	0019      	movs	r1, r3
 800090c:	0010      	movs	r0, r2
 800090e:	f7ff fecd 	bl	80006ac <LL_InitTick>
 8000912:	f7ff fee5 	bl	80006e0 <LL_SYSTICK_EnableIT>
 8000916:	2301      	movs	r3, #1
 8000918:	425b      	negs	r3, r3
 800091a:	2100      	movs	r1, #0
 800091c:	0018      	movs	r0, r3
 800091e:	f7ff fcbf 	bl	80002a0 <NVIC_SetPriority>
 8000922:	46c0      	nop			; (mov r8, r8)
 8000924:	46bd      	mov	sp, r7
 8000926:	bd80      	pop	{r7, pc}
 8000928:	02dc6c00 	.word	0x02dc6c00

0800092c <push_ASCII>:
 800092c:	b580      	push	{r7, lr}
 800092e:	b082      	sub	sp, #8
 8000930:	af00      	add	r7, sp, #0
 8000932:	6078      	str	r0, [r7, #4]
 8000934:	687b      	ldr	r3, [r7, #4]
 8000936:	4ac7      	ldr	r2, [pc, #796]	; (8000c54 <push_ASCII+0x328>)
 8000938:	4293      	cmp	r3, r2
 800093a:	d100      	bne.n	800093e <push_ASCII+0x12>
 800093c:	e10c      	b.n	8000b58 <push_ASCII+0x22c>
 800093e:	4ac5      	ldr	r2, [pc, #788]	; (8000c54 <push_ASCII+0x328>)
 8000940:	4293      	cmp	r3, r2
 8000942:	dc45      	bgt.n	80009d0 <push_ASCII+0xa4>
 8000944:	2b7a      	cmp	r3, #122	; 0x7a
 8000946:	d100      	bne.n	800094a <push_ASCII+0x1e>
 8000948:	e169      	b.n	8000c1e <push_ASCII+0x2f2>
 800094a:	dc1c      	bgt.n	8000986 <push_ASCII+0x5a>
 800094c:	2b0c      	cmp	r3, #12
 800094e:	d100      	bne.n	8000952 <push_ASCII+0x26>
 8000950:	e09f      	b.n	8000a92 <push_ASCII+0x166>
 8000952:	dc09      	bgt.n	8000968 <push_ASCII+0x3c>
 8000954:	2b02      	cmp	r3, #2
 8000956:	d100      	bne.n	800095a <push_ASCII+0x2e>
 8000958:	e146      	b.n	8000be8 <push_ASCII+0x2bc>
 800095a:	2b0b      	cmp	r3, #11
 800095c:	d100      	bne.n	8000960 <push_ASCII+0x34>
 800095e:	e0e0      	b.n	8000b22 <push_ASCII+0x1f6>
 8000960:	2b01      	cmp	r3, #1
 8000962:	d100      	bne.n	8000966 <push_ASCII+0x3a>
 8000964:	e0b9      	b.n	8000ada <push_ASCII+0x1ae>
 8000966:	e206      	b.n	8000d76 <push_ASCII+0x44a>
 8000968:	2b16      	cmp	r3, #22
 800096a:	d100      	bne.n	800096e <push_ASCII+0x42>
 800096c:	e0fd      	b.n	8000b6a <push_ASCII+0x23e>
 800096e:	dc03      	bgt.n	8000978 <push_ASCII+0x4c>
 8000970:	2b15      	cmp	r3, #21
 8000972:	d100      	bne.n	8000976 <push_ASCII+0x4a>
 8000974:	e102      	b.n	8000b7c <push_ASCII+0x250>
 8000976:	e1fe      	b.n	8000d76 <push_ASCII+0x44a>
 8000978:	2b6f      	cmp	r3, #111	; 0x6f
 800097a:	d100      	bne.n	800097e <push_ASCII+0x52>
 800097c:	e12b      	b.n	8000bd6 <push_ASCII+0x2aa>
 800097e:	2b79      	cmp	r3, #121	; 0x79
 8000980:	d100      	bne.n	8000984 <push_ASCII+0x58>
 8000982:	e11f      	b.n	8000bc4 <push_ASCII+0x298>
 8000984:	e1f7      	b.n	8000d76 <push_ASCII+0x44a>
 8000986:	2bde      	cmp	r3, #222	; 0xde
 8000988:	d100      	bne.n	800098c <push_ASCII+0x60>
 800098a:	e100      	b.n	8000b8e <push_ASCII+0x262>
 800098c:	dc09      	bgt.n	80009a2 <push_ASCII+0x76>
 800098e:	2bd4      	cmp	r3, #212	; 0xd4
 8000990:	d100      	bne.n	8000994 <push_ASCII+0x68>
 8000992:	e0d8      	b.n	8000b46 <push_ASCII+0x21a>
 8000994:	2bdd      	cmp	r3, #221	; 0xdd
 8000996:	d100      	bne.n	800099a <push_ASCII+0x6e>
 8000998:	e0b1      	b.n	8000afe <push_ASCII+0x1d2>
 800099a:	2bd3      	cmp	r3, #211	; 0xd3
 800099c:	d100      	bne.n	80009a0 <push_ASCII+0x74>
 800099e:	e093      	b.n	8000ac8 <push_ASCII+0x19c>
 80009a0:	e1e9      	b.n	8000d76 <push_ASCII+0x44a>
 80009a2:	228b      	movs	r2, #139	; 0x8b
 80009a4:	00d2      	lsls	r2, r2, #3
 80009a6:	4293      	cmp	r3, r2
 80009a8:	d100      	bne.n	80009ac <push_ASCII+0x80>
 80009aa:	e12f      	b.n	8000c0c <push_ASCII+0x2e0>
 80009ac:	228b      	movs	r2, #139	; 0x8b
 80009ae:	00d2      	lsls	r2, r2, #3
 80009b0:	4293      	cmp	r3, r2
 80009b2:	dc04      	bgt.n	80009be <push_ASCII+0x92>
 80009b4:	4aa8      	ldr	r2, [pc, #672]	; (8000c58 <push_ASCII+0x32c>)
 80009b6:	4293      	cmp	r3, r2
 80009b8:	d100      	bne.n	80009bc <push_ASCII+0x90>
 80009ba:	e0a9      	b.n	8000b10 <push_ASCII+0x1e4>
 80009bc:	e1db      	b.n	8000d76 <push_ASCII+0x44a>
 80009be:	4aa7      	ldr	r2, [pc, #668]	; (8000c5c <push_ASCII+0x330>)
 80009c0:	4293      	cmp	r3, r2
 80009c2:	d100      	bne.n	80009c6 <push_ASCII+0x9a>
 80009c4:	e092      	b.n	8000aec <push_ASCII+0x1c0>
 80009c6:	4aa6      	ldr	r2, [pc, #664]	; (8000c60 <push_ASCII+0x334>)
 80009c8:	4293      	cmp	r3, r2
 80009ca:	d100      	bne.n	80009ce <push_ASCII+0xa2>
 80009cc:	e115      	b.n	8000bfa <push_ASCII+0x2ce>
 80009ce:	e1d2      	b.n	8000d76 <push_ASCII+0x44a>
 80009d0:	4aa4      	ldr	r2, [pc, #656]	; (8000c64 <push_ASCII+0x338>)
 80009d2:	4293      	cmp	r3, r2
 80009d4:	d100      	bne.n	80009d8 <push_ASCII+0xac>
 80009d6:	e198      	b.n	8000d0a <push_ASCII+0x3de>
 80009d8:	4aa2      	ldr	r2, [pc, #648]	; (8000c64 <push_ASCII+0x338>)
 80009da:	4293      	cmp	r3, r2
 80009dc:	dc28      	bgt.n	8000a30 <push_ASCII+0x104>
 80009de:	2284      	movs	r2, #132	; 0x84
 80009e0:	0112      	lsls	r2, r2, #4
 80009e2:	4293      	cmp	r3, r2
 80009e4:	d100      	bne.n	80009e8 <push_ASCII+0xbc>
 80009e6:	e123      	b.n	8000c30 <push_ASCII+0x304>
 80009e8:	2284      	movs	r2, #132	; 0x84
 80009ea:	0112      	lsls	r2, r2, #4
 80009ec:	4293      	cmp	r3, r2
 80009ee:	dc0b      	bgt.n	8000a08 <push_ASCII+0xdc>
 80009f0:	4a9d      	ldr	r2, [pc, #628]	; (8000c68 <push_ASCII+0x33c>)
 80009f2:	4293      	cmp	r3, r2
 80009f4:	d100      	bne.n	80009f8 <push_ASCII+0xcc>
 80009f6:	e09d      	b.n	8000b34 <push_ASCII+0x208>
 80009f8:	4a9c      	ldr	r2, [pc, #624]	; (8000c6c <push_ASCII+0x340>)
 80009fa:	4293      	cmp	r3, r2
 80009fc:	d052      	beq.n	8000aa4 <push_ASCII+0x178>
 80009fe:	4a9c      	ldr	r2, [pc, #624]	; (8000c70 <push_ASCII+0x344>)
 8000a00:	4293      	cmp	r3, r2
 8000a02:	d100      	bne.n	8000a06 <push_ASCII+0xda>
 8000a04:	e0cc      	b.n	8000ba0 <push_ASCII+0x274>
 8000a06:	e1b6      	b.n	8000d76 <push_ASCII+0x44a>
 8000a08:	4a9a      	ldr	r2, [pc, #616]	; (8000c74 <push_ASCII+0x348>)
 8000a0a:	4293      	cmp	r3, r2
 8000a0c:	d100      	bne.n	8000a10 <push_ASCII+0xe4>
 8000a0e:	e118      	b.n	8000c42 <push_ASCII+0x316>
 8000a10:	4a98      	ldr	r2, [pc, #608]	; (8000c74 <push_ASCII+0x348>)
 8000a12:	4293      	cmp	r3, r2
 8000a14:	dc03      	bgt.n	8000a1e <push_ASCII+0xf2>
 8000a16:	4a98      	ldr	r2, [pc, #608]	; (8000c78 <push_ASCII+0x34c>)
 8000a18:	4293      	cmp	r3, r2
 8000a1a:	d04c      	beq.n	8000ab6 <push_ASCII+0x18a>
 8000a1c:	e1ab      	b.n	8000d76 <push_ASCII+0x44a>
 8000a1e:	4a97      	ldr	r2, [pc, #604]	; (8000c7c <push_ASCII+0x350>)
 8000a20:	4293      	cmp	r3, r2
 8000a22:	d100      	bne.n	8000a26 <push_ASCII+0xfa>
 8000a24:	e144      	b.n	8000cb0 <push_ASCII+0x384>
 8000a26:	4a96      	ldr	r2, [pc, #600]	; (8000c80 <push_ASCII+0x354>)
 8000a28:	4293      	cmp	r3, r2
 8000a2a:	d100      	bne.n	8000a2e <push_ASCII+0x102>
 8000a2c:	e0c1      	b.n	8000bb2 <push_ASCII+0x286>
 8000a2e:	e1a2      	b.n	8000d76 <push_ASCII+0x44a>
 8000a30:	4a94      	ldr	r2, [pc, #592]	; (8000c84 <push_ASCII+0x358>)
 8000a32:	4293      	cmp	r3, r2
 8000a34:	d100      	bne.n	8000a38 <push_ASCII+0x10c>
 8000a36:	e171      	b.n	8000d1c <push_ASCII+0x3f0>
 8000a38:	4a92      	ldr	r2, [pc, #584]	; (8000c84 <push_ASCII+0x358>)
 8000a3a:	4293      	cmp	r3, r2
 8000a3c:	dc14      	bgt.n	8000a68 <push_ASCII+0x13c>
 8000a3e:	4a92      	ldr	r2, [pc, #584]	; (8000c88 <push_ASCII+0x35c>)
 8000a40:	4293      	cmp	r3, r2
 8000a42:	d100      	bne.n	8000a46 <push_ASCII+0x11a>
 8000a44:	e14f      	b.n	8000ce6 <push_ASCII+0x3ba>
 8000a46:	4a90      	ldr	r2, [pc, #576]	; (8000c88 <push_ASCII+0x35c>)
 8000a48:	4293      	cmp	r3, r2
 8000a4a:	dc04      	bgt.n	8000a56 <push_ASCII+0x12a>
 8000a4c:	4a8f      	ldr	r2, [pc, #572]	; (8000c8c <push_ASCII+0x360>)
 8000a4e:	4293      	cmp	r3, r2
 8000a50:	d100      	bne.n	8000a54 <push_ASCII+0x128>
 8000a52:	e151      	b.n	8000cf8 <push_ASCII+0x3cc>
 8000a54:	e18f      	b.n	8000d76 <push_ASCII+0x44a>
 8000a56:	4a8e      	ldr	r2, [pc, #568]	; (8000c90 <push_ASCII+0x364>)
 8000a58:	4293      	cmp	r3, r2
 8000a5a:	d100      	bne.n	8000a5e <push_ASCII+0x132>
 8000a5c:	e13a      	b.n	8000cd4 <push_ASCII+0x3a8>
 8000a5e:	4a8d      	ldr	r2, [pc, #564]	; (8000c94 <push_ASCII+0x368>)
 8000a60:	4293      	cmp	r3, r2
 8000a62:	d100      	bne.n	8000a66 <push_ASCII+0x13a>
 8000a64:	e12d      	b.n	8000cc2 <push_ASCII+0x396>
 8000a66:	e186      	b.n	8000d76 <push_ASCII+0x44a>
 8000a68:	4a8b      	ldr	r2, [pc, #556]	; (8000c98 <push_ASCII+0x36c>)
 8000a6a:	4293      	cmp	r3, r2
 8000a6c:	d100      	bne.n	8000a70 <push_ASCII+0x144>
 8000a6e:	e167      	b.n	8000d40 <push_ASCII+0x414>
 8000a70:	4a89      	ldr	r2, [pc, #548]	; (8000c98 <push_ASCII+0x36c>)
 8000a72:	4293      	cmp	r3, r2
 8000a74:	dc04      	bgt.n	8000a80 <push_ASCII+0x154>
 8000a76:	4a89      	ldr	r2, [pc, #548]	; (8000c9c <push_ASCII+0x370>)
 8000a78:	4293      	cmp	r3, r2
 8000a7a:	d100      	bne.n	8000a7e <push_ASCII+0x152>
 8000a7c:	e157      	b.n	8000d2e <push_ASCII+0x402>
 8000a7e:	e17a      	b.n	8000d76 <push_ASCII+0x44a>
 8000a80:	4a87      	ldr	r2, [pc, #540]	; (8000ca0 <push_ASCII+0x374>)
 8000a82:	4293      	cmp	r3, r2
 8000a84:	d100      	bne.n	8000a88 <push_ASCII+0x15c>
 8000a86:	e164      	b.n	8000d52 <push_ASCII+0x426>
 8000a88:	4a86      	ldr	r2, [pc, #536]	; (8000ca4 <push_ASCII+0x378>)
 8000a8a:	4293      	cmp	r3, r2
 8000a8c:	d100      	bne.n	8000a90 <push_ASCII+0x164>
 8000a8e:	e169      	b.n	8000d64 <push_ASCII+0x438>
 8000a90:	e171      	b.n	8000d76 <push_ASCII+0x44a>
 8000a92:	4b85      	ldr	r3, [pc, #532]	; (8000ca8 <push_ASCII+0x37c>)
 8000a94:	681b      	ldr	r3, [r3, #0]
 8000a96:	1c59      	adds	r1, r3, #1
 8000a98:	4a83      	ldr	r2, [pc, #524]	; (8000ca8 <push_ASCII+0x37c>)
 8000a9a:	6011      	str	r1, [r2, #0]
 8000a9c:	4a83      	ldr	r2, [pc, #524]	; (8000cac <push_ASCII+0x380>)
 8000a9e:	2148      	movs	r1, #72	; 0x48
 8000aa0:	54d1      	strb	r1, [r2, r3]
 8000aa2:	e168      	b.n	8000d76 <push_ASCII+0x44a>
 8000aa4:	4b80      	ldr	r3, [pc, #512]	; (8000ca8 <push_ASCII+0x37c>)
 8000aa6:	681b      	ldr	r3, [r3, #0]
 8000aa8:	1c59      	adds	r1, r3, #1
 8000aaa:	4a7f      	ldr	r2, [pc, #508]	; (8000ca8 <push_ASCII+0x37c>)
 8000aac:	6011      	str	r1, [r2, #0]
 8000aae:	4a7f      	ldr	r2, [pc, #508]	; (8000cac <push_ASCII+0x380>)
 8000ab0:	2149      	movs	r1, #73	; 0x49
 8000ab2:	54d1      	strb	r1, [r2, r3]
 8000ab4:	e15f      	b.n	8000d76 <push_ASCII+0x44a>
 8000ab6:	4b7c      	ldr	r3, [pc, #496]	; (8000ca8 <push_ASCII+0x37c>)
 8000ab8:	681b      	ldr	r3, [r3, #0]
 8000aba:	1c59      	adds	r1, r3, #1
 8000abc:	4a7a      	ldr	r2, [pc, #488]	; (8000ca8 <push_ASCII+0x37c>)
 8000abe:	6011      	str	r1, [r2, #0]
 8000ac0:	4a7a      	ldr	r2, [pc, #488]	; (8000cac <push_ASCII+0x380>)
 8000ac2:	214a      	movs	r1, #74	; 0x4a
 8000ac4:	54d1      	strb	r1, [r2, r3]
 8000ac6:	e156      	b.n	8000d76 <push_ASCII+0x44a>
 8000ac8:	4b77      	ldr	r3, [pc, #476]	; (8000ca8 <push_ASCII+0x37c>)
 8000aca:	681b      	ldr	r3, [r3, #0]
 8000acc:	1c59      	adds	r1, r3, #1
 8000ace:	4a76      	ldr	r2, [pc, #472]	; (8000ca8 <push_ASCII+0x37c>)
 8000ad0:	6011      	str	r1, [r2, #0]
 8000ad2:	4a76      	ldr	r2, [pc, #472]	; (8000cac <push_ASCII+0x380>)
 8000ad4:	214b      	movs	r1, #75	; 0x4b
 8000ad6:	54d1      	strb	r1, [r2, r3]
 8000ad8:	e14d      	b.n	8000d76 <push_ASCII+0x44a>
 8000ada:	4b73      	ldr	r3, [pc, #460]	; (8000ca8 <push_ASCII+0x37c>)
 8000adc:	681b      	ldr	r3, [r3, #0]
 8000ade:	1c59      	adds	r1, r3, #1
 8000ae0:	4a71      	ldr	r2, [pc, #452]	; (8000ca8 <push_ASCII+0x37c>)
 8000ae2:	6011      	str	r1, [r2, #0]
 8000ae4:	4a71      	ldr	r2, [pc, #452]	; (8000cac <push_ASCII+0x380>)
 8000ae6:	214c      	movs	r1, #76	; 0x4c
 8000ae8:	54d1      	strb	r1, [r2, r3]
 8000aea:	e144      	b.n	8000d76 <push_ASCII+0x44a>
 8000aec:	4b6e      	ldr	r3, [pc, #440]	; (8000ca8 <push_ASCII+0x37c>)
 8000aee:	681b      	ldr	r3, [r3, #0]
 8000af0:	1c59      	adds	r1, r3, #1
 8000af2:	4a6d      	ldr	r2, [pc, #436]	; (8000ca8 <push_ASCII+0x37c>)
 8000af4:	6011      	str	r1, [r2, #0]
 8000af6:	4a6d      	ldr	r2, [pc, #436]	; (8000cac <push_ASCII+0x380>)
 8000af8:	214d      	movs	r1, #77	; 0x4d
 8000afa:	54d1      	strb	r1, [r2, r3]
 8000afc:	e13b      	b.n	8000d76 <push_ASCII+0x44a>
 8000afe:	4b6a      	ldr	r3, [pc, #424]	; (8000ca8 <push_ASCII+0x37c>)
 8000b00:	681b      	ldr	r3, [r3, #0]
 8000b02:	1c59      	adds	r1, r3, #1
 8000b04:	4a68      	ldr	r2, [pc, #416]	; (8000ca8 <push_ASCII+0x37c>)
 8000b06:	6011      	str	r1, [r2, #0]
 8000b08:	4a68      	ldr	r2, [pc, #416]	; (8000cac <push_ASCII+0x380>)
 8000b0a:	214e      	movs	r1, #78	; 0x4e
 8000b0c:	54d1      	strb	r1, [r2, r3]
 8000b0e:	e132      	b.n	8000d76 <push_ASCII+0x44a>
 8000b10:	4b65      	ldr	r3, [pc, #404]	; (8000ca8 <push_ASCII+0x37c>)
 8000b12:	681b      	ldr	r3, [r3, #0]
 8000b14:	1c59      	adds	r1, r3, #1
 8000b16:	4a64      	ldr	r2, [pc, #400]	; (8000ca8 <push_ASCII+0x37c>)
 8000b18:	6011      	str	r1, [r2, #0]
 8000b1a:	4a64      	ldr	r2, [pc, #400]	; (8000cac <push_ASCII+0x380>)
 8000b1c:	214f      	movs	r1, #79	; 0x4f
 8000b1e:	54d1      	strb	r1, [r2, r3]
 8000b20:	e129      	b.n	8000d76 <push_ASCII+0x44a>
 8000b22:	4b61      	ldr	r3, [pc, #388]	; (8000ca8 <push_ASCII+0x37c>)
 8000b24:	681b      	ldr	r3, [r3, #0]
 8000b26:	1c59      	adds	r1, r3, #1
 8000b28:	4a5f      	ldr	r2, [pc, #380]	; (8000ca8 <push_ASCII+0x37c>)
 8000b2a:	6011      	str	r1, [r2, #0]
 8000b2c:	4a5f      	ldr	r2, [pc, #380]	; (8000cac <push_ASCII+0x380>)
 8000b2e:	2150      	movs	r1, #80	; 0x50
 8000b30:	54d1      	strb	r1, [r2, r3]
 8000b32:	e120      	b.n	8000d76 <push_ASCII+0x44a>
 8000b34:	4b5c      	ldr	r3, [pc, #368]	; (8000ca8 <push_ASCII+0x37c>)
 8000b36:	681b      	ldr	r3, [r3, #0]
 8000b38:	1c59      	adds	r1, r3, #1
 8000b3a:	4a5b      	ldr	r2, [pc, #364]	; (8000ca8 <push_ASCII+0x37c>)
 8000b3c:	6011      	str	r1, [r2, #0]
 8000b3e:	4a5b      	ldr	r2, [pc, #364]	; (8000cac <push_ASCII+0x380>)
 8000b40:	2151      	movs	r1, #81	; 0x51
 8000b42:	54d1      	strb	r1, [r2, r3]
 8000b44:	e117      	b.n	8000d76 <push_ASCII+0x44a>
 8000b46:	4b58      	ldr	r3, [pc, #352]	; (8000ca8 <push_ASCII+0x37c>)
 8000b48:	681b      	ldr	r3, [r3, #0]
 8000b4a:	1c59      	adds	r1, r3, #1
 8000b4c:	4a56      	ldr	r2, [pc, #344]	; (8000ca8 <push_ASCII+0x37c>)
 8000b4e:	6011      	str	r1, [r2, #0]
 8000b50:	4a56      	ldr	r2, [pc, #344]	; (8000cac <push_ASCII+0x380>)
 8000b52:	2152      	movs	r1, #82	; 0x52
 8000b54:	54d1      	strb	r1, [r2, r3]
 8000b56:	e10e      	b.n	8000d76 <push_ASCII+0x44a>
 8000b58:	4b53      	ldr	r3, [pc, #332]	; (8000ca8 <push_ASCII+0x37c>)
 8000b5a:	681b      	ldr	r3, [r3, #0]
 8000b5c:	1c59      	adds	r1, r3, #1
 8000b5e:	4a52      	ldr	r2, [pc, #328]	; (8000ca8 <push_ASCII+0x37c>)
 8000b60:	6011      	str	r1, [r2, #0]
 8000b62:	4a52      	ldr	r2, [pc, #328]	; (8000cac <push_ASCII+0x380>)
 8000b64:	2153      	movs	r1, #83	; 0x53
 8000b66:	54d1      	strb	r1, [r2, r3]
 8000b68:	e105      	b.n	8000d76 <push_ASCII+0x44a>
 8000b6a:	4b4f      	ldr	r3, [pc, #316]	; (8000ca8 <push_ASCII+0x37c>)
 8000b6c:	681b      	ldr	r3, [r3, #0]
 8000b6e:	1c59      	adds	r1, r3, #1
 8000b70:	4a4d      	ldr	r2, [pc, #308]	; (8000ca8 <push_ASCII+0x37c>)
 8000b72:	6011      	str	r1, [r2, #0]
 8000b74:	4a4d      	ldr	r2, [pc, #308]	; (8000cac <push_ASCII+0x380>)
 8000b76:	2154      	movs	r1, #84	; 0x54
 8000b78:	54d1      	strb	r1, [r2, r3]
 8000b7a:	e0fc      	b.n	8000d76 <push_ASCII+0x44a>
 8000b7c:	4b4a      	ldr	r3, [pc, #296]	; (8000ca8 <push_ASCII+0x37c>)
 8000b7e:	681b      	ldr	r3, [r3, #0]
 8000b80:	1c59      	adds	r1, r3, #1
 8000b82:	4a49      	ldr	r2, [pc, #292]	; (8000ca8 <push_ASCII+0x37c>)
 8000b84:	6011      	str	r1, [r2, #0]
 8000b86:	4a49      	ldr	r2, [pc, #292]	; (8000cac <push_ASCII+0x380>)
 8000b88:	2155      	movs	r1, #85	; 0x55
 8000b8a:	54d1      	strb	r1, [r2, r3]
 8000b8c:	e0f3      	b.n	8000d76 <push_ASCII+0x44a>
 8000b8e:	4b46      	ldr	r3, [pc, #280]	; (8000ca8 <push_ASCII+0x37c>)
 8000b90:	681b      	ldr	r3, [r3, #0]
 8000b92:	1c59      	adds	r1, r3, #1
 8000b94:	4a44      	ldr	r2, [pc, #272]	; (8000ca8 <push_ASCII+0x37c>)
 8000b96:	6011      	str	r1, [r2, #0]
 8000b98:	4a44      	ldr	r2, [pc, #272]	; (8000cac <push_ASCII+0x380>)
 8000b9a:	2156      	movs	r1, #86	; 0x56
 8000b9c:	54d1      	strb	r1, [r2, r3]
 8000b9e:	e0ea      	b.n	8000d76 <push_ASCII+0x44a>
 8000ba0:	4b41      	ldr	r3, [pc, #260]	; (8000ca8 <push_ASCII+0x37c>)
 8000ba2:	681b      	ldr	r3, [r3, #0]
 8000ba4:	1c59      	adds	r1, r3, #1
 8000ba6:	4a40      	ldr	r2, [pc, #256]	; (8000ca8 <push_ASCII+0x37c>)
 8000ba8:	6011      	str	r1, [r2, #0]
 8000baa:	4a40      	ldr	r2, [pc, #256]	; (8000cac <push_ASCII+0x380>)
 8000bac:	2157      	movs	r1, #87	; 0x57
 8000bae:	54d1      	strb	r1, [r2, r3]
 8000bb0:	e0e1      	b.n	8000d76 <push_ASCII+0x44a>
 8000bb2:	4b3d      	ldr	r3, [pc, #244]	; (8000ca8 <push_ASCII+0x37c>)
 8000bb4:	681b      	ldr	r3, [r3, #0]
 8000bb6:	1c59      	adds	r1, r3, #1
 8000bb8:	4a3b      	ldr	r2, [pc, #236]	; (8000ca8 <push_ASCII+0x37c>)
 8000bba:	6011      	str	r1, [r2, #0]
 8000bbc:	4a3b      	ldr	r2, [pc, #236]	; (8000cac <push_ASCII+0x380>)
 8000bbe:	2158      	movs	r1, #88	; 0x58
 8000bc0:	54d1      	strb	r1, [r2, r3]
 8000bc2:	e0d8      	b.n	8000d76 <push_ASCII+0x44a>
 8000bc4:	4b38      	ldr	r3, [pc, #224]	; (8000ca8 <push_ASCII+0x37c>)
 8000bc6:	681b      	ldr	r3, [r3, #0]
 8000bc8:	1c59      	adds	r1, r3, #1
 8000bca:	4a37      	ldr	r2, [pc, #220]	; (8000ca8 <push_ASCII+0x37c>)
 8000bcc:	6011      	str	r1, [r2, #0]
 8000bce:	4a37      	ldr	r2, [pc, #220]	; (8000cac <push_ASCII+0x380>)
 8000bd0:	2159      	movs	r1, #89	; 0x59
 8000bd2:	54d1      	strb	r1, [r2, r3]
 8000bd4:	e0cf      	b.n	8000d76 <push_ASCII+0x44a>
 8000bd6:	4b34      	ldr	r3, [pc, #208]	; (8000ca8 <push_ASCII+0x37c>)
 8000bd8:	681b      	ldr	r3, [r3, #0]
 8000bda:	1c59      	adds	r1, r3, #1
 8000bdc:	4a32      	ldr	r2, [pc, #200]	; (8000ca8 <push_ASCII+0x37c>)
 8000bde:	6011      	str	r1, [r2, #0]
 8000be0:	4a32      	ldr	r2, [pc, #200]	; (8000cac <push_ASCII+0x380>)
 8000be2:	215a      	movs	r1, #90	; 0x5a
 8000be4:	54d1      	strb	r1, [r2, r3]
 8000be6:	e0c6      	b.n	8000d76 <push_ASCII+0x44a>
 8000be8:	4b2f      	ldr	r3, [pc, #188]	; (8000ca8 <push_ASCII+0x37c>)
 8000bea:	681b      	ldr	r3, [r3, #0]
 8000bec:	1c59      	adds	r1, r3, #1
 8000bee:	4a2e      	ldr	r2, [pc, #184]	; (8000ca8 <push_ASCII+0x37c>)
 8000bf0:	6011      	str	r1, [r2, #0]
 8000bf2:	4a2e      	ldr	r2, [pc, #184]	; (8000cac <push_ASCII+0x380>)
 8000bf4:	2141      	movs	r1, #65	; 0x41
 8000bf6:	54d1      	strb	r1, [r2, r3]
 8000bf8:	e0bd      	b.n	8000d76 <push_ASCII+0x44a>
 8000bfa:	4b2b      	ldr	r3, [pc, #172]	; (8000ca8 <push_ASCII+0x37c>)
 8000bfc:	681b      	ldr	r3, [r3, #0]
 8000bfe:	1c59      	adds	r1, r3, #1
 8000c00:	4a29      	ldr	r2, [pc, #164]	; (8000ca8 <push_ASCII+0x37c>)
 8000c02:	6011      	str	r1, [r2, #0]
 8000c04:	4a29      	ldr	r2, [pc, #164]	; (8000cac <push_ASCII+0x380>)
 8000c06:	2142      	movs	r1, #66	; 0x42
 8000c08:	54d1      	strb	r1, [r2, r3]
 8000c0a:	e0b4      	b.n	8000d76 <push_ASCII+0x44a>
 8000c0c:	4b26      	ldr	r3, [pc, #152]	; (8000ca8 <push_ASCII+0x37c>)
 8000c0e:	681b      	ldr	r3, [r3, #0]
 8000c10:	1c59      	adds	r1, r3, #1
 8000c12:	4a25      	ldr	r2, [pc, #148]	; (8000ca8 <push_ASCII+0x37c>)
 8000c14:	6011      	str	r1, [r2, #0]
 8000c16:	4a25      	ldr	r2, [pc, #148]	; (8000cac <push_ASCII+0x380>)
 8000c18:	2143      	movs	r1, #67	; 0x43
 8000c1a:	54d1      	strb	r1, [r2, r3]
 8000c1c:	e0ab      	b.n	8000d76 <push_ASCII+0x44a>
 8000c1e:	4b22      	ldr	r3, [pc, #136]	; (8000ca8 <push_ASCII+0x37c>)
 8000c20:	681b      	ldr	r3, [r3, #0]
 8000c22:	1c59      	adds	r1, r3, #1
 8000c24:	4a20      	ldr	r2, [pc, #128]	; (8000ca8 <push_ASCII+0x37c>)
 8000c26:	6011      	str	r1, [r2, #0]
 8000c28:	4a20      	ldr	r2, [pc, #128]	; (8000cac <push_ASCII+0x380>)
 8000c2a:	2144      	movs	r1, #68	; 0x44
 8000c2c:	54d1      	strb	r1, [r2, r3]
 8000c2e:	e0a2      	b.n	8000d76 <push_ASCII+0x44a>
 8000c30:	4b1d      	ldr	r3, [pc, #116]	; (8000ca8 <push_ASCII+0x37c>)
 8000c32:	681b      	ldr	r3, [r3, #0]
 8000c34:	1c59      	adds	r1, r3, #1
 8000c36:	4a1c      	ldr	r2, [pc, #112]	; (8000ca8 <push_ASCII+0x37c>)
 8000c38:	6011      	str	r1, [r2, #0]
 8000c3a:	4a1c      	ldr	r2, [pc, #112]	; (8000cac <push_ASCII+0x380>)
 8000c3c:	2145      	movs	r1, #69	; 0x45
 8000c3e:	54d1      	strb	r1, [r2, r3]
 8000c40:	e099      	b.n	8000d76 <push_ASCII+0x44a>
 8000c42:	4b19      	ldr	r3, [pc, #100]	; (8000ca8 <push_ASCII+0x37c>)
 8000c44:	681b      	ldr	r3, [r3, #0]
 8000c46:	1c59      	adds	r1, r3, #1
 8000c48:	4a17      	ldr	r2, [pc, #92]	; (8000ca8 <push_ASCII+0x37c>)
 8000c4a:	6011      	str	r1, [r2, #0]
 8000c4c:	4a17      	ldr	r2, [pc, #92]	; (8000cac <push_ASCII+0x380>)
 8000c4e:	2146      	movs	r1, #70	; 0x46
 8000c50:	54d1      	strb	r1, [r2, r3]
 8000c52:	e090      	b.n	8000d76 <push_ASCII+0x44a>
 8000c54:	000004bb 	.word	0x000004bb
 8000c58:	00000457 	.word	0x00000457
 8000c5c:	00000461 	.word	0x00000461
 8000c60:	00000462 	.word	0x00000462
 8000c64:	00002b67 	.word	0x00002b67
 8000c68:	000004c6 	.word	0x000004c6
 8000c6c:	0000083f 	.word	0x0000083f
 8000c70:	000004c5 	.word	0x000004c5
 8000c74:	0000084a 	.word	0x0000084a
 8000c78:	00000849 	.word	0x00000849
 8000c7c:	000008a3 	.word	0x000008a3
 8000c80:	000008a4 	.word	0x000008a4
 8000c84:	00005277 	.word	0x00005277
 8000c88:	00002b72 	.word	0x00002b72
 8000c8c:	00002b68 	.word	0x00002b68
 8000c90:	00002bd6 	.word	0x00002bd6
 8000c94:	00002fbe 	.word	0x00002fbe
 8000c98:	000056c3 	.word	0x000056c3
 8000c9c:	0000565f 	.word	0x0000565f
 8000ca0:	000056cd 	.word	0x000056cd
 8000ca4:	000056ce 	.word	0x000056ce
 8000ca8:	20000668 	.word	0x20000668
 8000cac:	20000654 	.word	0x20000654
 8000cb0:	4b33      	ldr	r3, [pc, #204]	; (8000d80 <push_ASCII+0x454>)
 8000cb2:	681b      	ldr	r3, [r3, #0]
 8000cb4:	1c59      	adds	r1, r3, #1
 8000cb6:	4a32      	ldr	r2, [pc, #200]	; (8000d80 <push_ASCII+0x454>)
 8000cb8:	6011      	str	r1, [r2, #0]
 8000cba:	4a32      	ldr	r2, [pc, #200]	; (8000d84 <push_ASCII+0x458>)
 8000cbc:	2147      	movs	r1, #71	; 0x47
 8000cbe:	54d1      	strb	r1, [r2, r3]
 8000cc0:	e059      	b.n	8000d76 <push_ASCII+0x44a>
 8000cc2:	4b2f      	ldr	r3, [pc, #188]	; (8000d80 <push_ASCII+0x454>)
 8000cc4:	681b      	ldr	r3, [r3, #0]
 8000cc6:	1c59      	adds	r1, r3, #1
 8000cc8:	4a2d      	ldr	r2, [pc, #180]	; (8000d80 <push_ASCII+0x454>)
 8000cca:	6011      	str	r1, [r2, #0]
 8000ccc:	4a2d      	ldr	r2, [pc, #180]	; (8000d84 <push_ASCII+0x458>)
 8000cce:	2138      	movs	r1, #56	; 0x38
 8000cd0:	54d1      	strb	r1, [r2, r3]
 8000cd2:	e050      	b.n	8000d76 <push_ASCII+0x44a>
 8000cd4:	4b2a      	ldr	r3, [pc, #168]	; (8000d80 <push_ASCII+0x454>)
 8000cd6:	681b      	ldr	r3, [r3, #0]
 8000cd8:	1c59      	adds	r1, r3, #1
 8000cda:	4a29      	ldr	r2, [pc, #164]	; (8000d80 <push_ASCII+0x454>)
 8000cdc:	6011      	str	r1, [r2, #0]
 8000cde:	4a29      	ldr	r2, [pc, #164]	; (8000d84 <push_ASCII+0x458>)
 8000ce0:	2139      	movs	r1, #57	; 0x39
 8000ce2:	54d1      	strb	r1, [r2, r3]
 8000ce4:	e047      	b.n	8000d76 <push_ASCII+0x44a>
 8000ce6:	4b26      	ldr	r3, [pc, #152]	; (8000d80 <push_ASCII+0x454>)
 8000ce8:	681b      	ldr	r3, [r3, #0]
 8000cea:	1c59      	adds	r1, r3, #1
 8000cec:	4a24      	ldr	r2, [pc, #144]	; (8000d80 <push_ASCII+0x454>)
 8000cee:	6011      	str	r1, [r2, #0]
 8000cf0:	4a24      	ldr	r2, [pc, #144]	; (8000d84 <push_ASCII+0x458>)
 8000cf2:	2130      	movs	r1, #48	; 0x30
 8000cf4:	54d1      	strb	r1, [r2, r3]
 8000cf6:	e03e      	b.n	8000d76 <push_ASCII+0x44a>
 8000cf8:	4b21      	ldr	r3, [pc, #132]	; (8000d80 <push_ASCII+0x454>)
 8000cfa:	681b      	ldr	r3, [r3, #0]
 8000cfc:	1c59      	adds	r1, r3, #1
 8000cfe:	4a20      	ldr	r2, [pc, #128]	; (8000d80 <push_ASCII+0x454>)
 8000d00:	6011      	str	r1, [r2, #0]
 8000d02:	4a20      	ldr	r2, [pc, #128]	; (8000d84 <push_ASCII+0x458>)
 8000d04:	2131      	movs	r1, #49	; 0x31
 8000d06:	54d1      	strb	r1, [r2, r3]
 8000d08:	e035      	b.n	8000d76 <push_ASCII+0x44a>
 8000d0a:	4b1d      	ldr	r3, [pc, #116]	; (8000d80 <push_ASCII+0x454>)
 8000d0c:	681b      	ldr	r3, [r3, #0]
 8000d0e:	1c59      	adds	r1, r3, #1
 8000d10:	4a1b      	ldr	r2, [pc, #108]	; (8000d80 <push_ASCII+0x454>)
 8000d12:	6011      	str	r1, [r2, #0]
 8000d14:	4a1b      	ldr	r2, [pc, #108]	; (8000d84 <push_ASCII+0x458>)
 8000d16:	2132      	movs	r1, #50	; 0x32
 8000d18:	54d1      	strb	r1, [r2, r3]
 8000d1a:	e02c      	b.n	8000d76 <push_ASCII+0x44a>
 8000d1c:	4b18      	ldr	r3, [pc, #96]	; (8000d80 <push_ASCII+0x454>)
 8000d1e:	681b      	ldr	r3, [r3, #0]
 8000d20:	1c59      	adds	r1, r3, #1
 8000d22:	4a17      	ldr	r2, [pc, #92]	; (8000d80 <push_ASCII+0x454>)
 8000d24:	6011      	str	r1, [r2, #0]
 8000d26:	4a17      	ldr	r2, [pc, #92]	; (8000d84 <push_ASCII+0x458>)
 8000d28:	2133      	movs	r1, #51	; 0x33
 8000d2a:	54d1      	strb	r1, [r2, r3]
 8000d2c:	e023      	b.n	8000d76 <push_ASCII+0x44a>
 8000d2e:	4b14      	ldr	r3, [pc, #80]	; (8000d80 <push_ASCII+0x454>)
 8000d30:	681b      	ldr	r3, [r3, #0]
 8000d32:	1c59      	adds	r1, r3, #1
 8000d34:	4a12      	ldr	r2, [pc, #72]	; (8000d80 <push_ASCII+0x454>)
 8000d36:	6011      	str	r1, [r2, #0]
 8000d38:	4a12      	ldr	r2, [pc, #72]	; (8000d84 <push_ASCII+0x458>)
 8000d3a:	2134      	movs	r1, #52	; 0x34
 8000d3c:	54d1      	strb	r1, [r2, r3]
 8000d3e:	e01a      	b.n	8000d76 <push_ASCII+0x44a>
 8000d40:	4b0f      	ldr	r3, [pc, #60]	; (8000d80 <push_ASCII+0x454>)
 8000d42:	681b      	ldr	r3, [r3, #0]
 8000d44:	1c59      	adds	r1, r3, #1
 8000d46:	4a0e      	ldr	r2, [pc, #56]	; (8000d80 <push_ASCII+0x454>)
 8000d48:	6011      	str	r1, [r2, #0]
 8000d4a:	4a0e      	ldr	r2, [pc, #56]	; (8000d84 <push_ASCII+0x458>)
 8000d4c:	2135      	movs	r1, #53	; 0x35
 8000d4e:	54d1      	strb	r1, [r2, r3]
 8000d50:	e011      	b.n	8000d76 <push_ASCII+0x44a>
 8000d52:	4b0b      	ldr	r3, [pc, #44]	; (8000d80 <push_ASCII+0x454>)
 8000d54:	681b      	ldr	r3, [r3, #0]
 8000d56:	1c59      	adds	r1, r3, #1
 8000d58:	4a09      	ldr	r2, [pc, #36]	; (8000d80 <push_ASCII+0x454>)
 8000d5a:	6011      	str	r1, [r2, #0]
 8000d5c:	4a09      	ldr	r2, [pc, #36]	; (8000d84 <push_ASCII+0x458>)
 8000d5e:	2136      	movs	r1, #54	; 0x36
 8000d60:	54d1      	strb	r1, [r2, r3]
 8000d62:	e008      	b.n	8000d76 <push_ASCII+0x44a>
 8000d64:	4b06      	ldr	r3, [pc, #24]	; (8000d80 <push_ASCII+0x454>)
 8000d66:	681b      	ldr	r3, [r3, #0]
 8000d68:	1c59      	adds	r1, r3, #1
 8000d6a:	4a05      	ldr	r2, [pc, #20]	; (8000d80 <push_ASCII+0x454>)
 8000d6c:	6011      	str	r1, [r2, #0]
 8000d6e:	4a05      	ldr	r2, [pc, #20]	; (8000d84 <push_ASCII+0x458>)
 8000d70:	2137      	movs	r1, #55	; 0x37
 8000d72:	54d1      	strb	r1, [r2, r3]
 8000d74:	46c0      	nop			; (mov r8, r8)
 8000d76:	46c0      	nop			; (mov r8, r8)
 8000d78:	46bd      	mov	sp, r7
 8000d7a:	b002      	add	sp, #8
 8000d7c:	bd80      	pop	{r7, pc}
 8000d7e:	46c0      	nop			; (mov r8, r8)
 8000d80:	20000668 	.word	0x20000668
 8000d84:	20000654 	.word	0x20000654

08000d88 <word_handler>:
 8000d88:	b580      	push	{r7, lr}
 8000d8a:	b082      	sub	sp, #8
 8000d8c:	af00      	add	r7, sp, #0
 8000d8e:	4b39      	ldr	r3, [pc, #228]	; (8000e74 <word_handler+0xec>)
 8000d90:	2200      	movs	r2, #0
 8000d92:	601a      	str	r2, [r3, #0]
 8000d94:	2380      	movs	r3, #128	; 0x80
 8000d96:	005b      	lsls	r3, r3, #1
 8000d98:	4a37      	ldr	r2, [pc, #220]	; (8000e78 <word_handler+0xf0>)
 8000d9a:	0019      	movs	r1, r3
 8000d9c:	0010      	movs	r0, r2
 8000d9e:	f7ff fc2c 	bl	80005fa <LL_GPIO_ResetOutputPin>
 8000da2:	f7ff fda3 	bl	80008ec <delay>
 8000da6:	f7ff fda1 	bl	80008ec <delay>
 8000daa:	4b34      	ldr	r3, [pc, #208]	; (8000e7c <word_handler+0xf4>)
 8000dac:	681b      	ldr	r3, [r3, #0]
 8000dae:	4a34      	ldr	r2, [pc, #208]	; (8000e80 <word_handler+0xf8>)
 8000db0:	2100      	movs	r1, #0
 8000db2:	54d1      	strb	r1, [r2, r3]
 8000db4:	2300      	movs	r3, #0
 8000db6:	607b      	str	r3, [r7, #4]
 8000db8:	2300      	movs	r3, #0
 8000dba:	603b      	str	r3, [r7, #0]
 8000dbc:	e022      	b.n	8000e04 <word_handler+0x7c>
 8000dbe:	4a30      	ldr	r2, [pc, #192]	; (8000e80 <word_handler+0xf8>)
 8000dc0:	683b      	ldr	r3, [r7, #0]
 8000dc2:	18d3      	adds	r3, r2, r3
 8000dc4:	781b      	ldrb	r3, [r3, #0]
 8000dc6:	2b33      	cmp	r3, #51	; 0x33
 8000dc8:	d005      	beq.n	8000dd6 <word_handler+0x4e>
 8000dca:	4a2d      	ldr	r2, [pc, #180]	; (8000e80 <word_handler+0xf8>)
 8000dcc:	683b      	ldr	r3, [r7, #0]
 8000dce:	18d3      	adds	r3, r2, r3
 8000dd0:	781b      	ldrb	r3, [r3, #0]
 8000dd2:	2b00      	cmp	r3, #0
 8000dd4:	d106      	bne.n	8000de4 <word_handler+0x5c>
 8000dd6:	687b      	ldr	r3, [r7, #4]
 8000dd8:	0018      	movs	r0, r3
 8000dda:	f7ff fda7 	bl	800092c <push_ASCII>
 8000dde:	2300      	movs	r3, #0
 8000de0:	607b      	str	r3, [r7, #4]
 8000de2:	e00c      	b.n	8000dfe <word_handler+0x76>
 8000de4:	687a      	ldr	r2, [r7, #4]
 8000de6:	0013      	movs	r3, r2
 8000de8:	009b      	lsls	r3, r3, #2
 8000dea:	189b      	adds	r3, r3, r2
 8000dec:	005b      	lsls	r3, r3, #1
 8000dee:	0019      	movs	r1, r3
 8000df0:	4a23      	ldr	r2, [pc, #140]	; (8000e80 <word_handler+0xf8>)
 8000df2:	683b      	ldr	r3, [r7, #0]
 8000df4:	18d3      	adds	r3, r2, r3
 8000df6:	781b      	ldrb	r3, [r3, #0]
 8000df8:	3b30      	subs	r3, #48	; 0x30
 8000dfa:	18cb      	adds	r3, r1, r3
 8000dfc:	607b      	str	r3, [r7, #4]
 8000dfe:	683b      	ldr	r3, [r7, #0]
 8000e00:	3301      	adds	r3, #1
 8000e02:	603b      	str	r3, [r7, #0]
 8000e04:	4b1d      	ldr	r3, [pc, #116]	; (8000e7c <word_handler+0xf4>)
 8000e06:	681b      	ldr	r3, [r3, #0]
 8000e08:	683a      	ldr	r2, [r7, #0]
 8000e0a:	429a      	cmp	r2, r3
 8000e0c:	ddd7      	ble.n	8000dbe <word_handler+0x36>
 8000e0e:	4b1d      	ldr	r3, [pc, #116]	; (8000e84 <word_handler+0xfc>)
 8000e10:	681b      	ldr	r3, [r3, #0]
 8000e12:	4a1d      	ldr	r2, [pc, #116]	; (8000e88 <word_handler+0x100>)
 8000e14:	2100      	movs	r1, #0
 8000e16:	54d1      	strb	r1, [r2, r3]
 8000e18:	4b18      	ldr	r3, [pc, #96]	; (8000e7c <word_handler+0xf4>)
 8000e1a:	2200      	movs	r2, #0
 8000e1c:	601a      	str	r2, [r3, #0]
 8000e1e:	4b1b      	ldr	r3, [pc, #108]	; (8000e8c <word_handler+0x104>)
 8000e20:	2200      	movs	r2, #0
 8000e22:	601a      	str	r2, [r3, #0]
 8000e24:	4b1a      	ldr	r3, [pc, #104]	; (8000e90 <word_handler+0x108>)
 8000e26:	2200      	movs	r2, #0
 8000e28:	601a      	str	r2, [r3, #0]
 8000e2a:	2380      	movs	r3, #128	; 0x80
 8000e2c:	009b      	lsls	r3, r3, #2
 8000e2e:	4a12      	ldr	r2, [pc, #72]	; (8000e78 <word_handler+0xf0>)
 8000e30:	0019      	movs	r1, r3
 8000e32:	0010      	movs	r0, r2
 8000e34:	f7ff fbed 	bl	8000612 <LL_GPIO_TogglePin>
 8000e38:	2380      	movs	r3, #128	; 0x80
 8000e3a:	005b      	lsls	r3, r3, #1
 8000e3c:	4a0e      	ldr	r2, [pc, #56]	; (8000e78 <word_handler+0xf0>)
 8000e3e:	0019      	movs	r1, r3
 8000e40:	0010      	movs	r0, r2
 8000e42:	f7ff fbe6 	bl	8000612 <LL_GPIO_TogglePin>
 8000e46:	f7ff fd51 	bl	80008ec <delay>
 8000e4a:	f7ff fd4f 	bl	80008ec <delay>
 8000e4e:	2380      	movs	r3, #128	; 0x80
 8000e50:	009b      	lsls	r3, r3, #2
 8000e52:	4a09      	ldr	r2, [pc, #36]	; (8000e78 <word_handler+0xf0>)
 8000e54:	0019      	movs	r1, r3
 8000e56:	0010      	movs	r0, r2
 8000e58:	f7ff fbdb 	bl	8000612 <LL_GPIO_TogglePin>
 8000e5c:	2380      	movs	r3, #128	; 0x80
 8000e5e:	005b      	lsls	r3, r3, #1
 8000e60:	4a05      	ldr	r2, [pc, #20]	; (8000e78 <word_handler+0xf0>)
 8000e62:	0019      	movs	r1, r3
 8000e64:	0010      	movs	r0, r2
 8000e66:	f7ff fbd4 	bl	8000612 <LL_GPIO_TogglePin>
 8000e6a:	46c0      	nop			; (mov r8, r8)
 8000e6c:	46bd      	mov	sp, r7
 8000e6e:	b002      	add	sp, #8
 8000e70:	bd80      	pop	{r7, pc}
 8000e72:	46c0      	nop			; (mov r8, r8)
 8000e74:	20000650 	.word	0x20000650
 8000e78:	48000800 	.word	0x48000800
 8000e7c:	20000648 	.word	0x20000648
 8000e80:	20000454 	.word	0x20000454
 8000e84:	20000668 	.word	0x20000668
 8000e88:	20000654 	.word	0x20000654
 8000e8c:	20000450 	.word	0x20000450
 8000e90:	2000064c 	.word	0x2000064c

08000e94 <SysTick_Handler>:
 8000e94:	b580      	push	{r7, lr}
 8000e96:	af00      	add	r7, sp, #0
 8000e98:	4b0b      	ldr	r3, [pc, #44]	; (8000ec8 <SysTick_Handler+0x34>)
 8000e9a:	681b      	ldr	r3, [r3, #0]
 8000e9c:	2b00      	cmp	r3, #0
 8000e9e:	d00b      	beq.n	8000eb8 <SysTick_Handler+0x24>
 8000ea0:	4b0a      	ldr	r3, [pc, #40]	; (8000ecc <SysTick_Handler+0x38>)
 8000ea2:	681a      	ldr	r2, [r3, #0]
 8000ea4:	4b0a      	ldr	r3, [pc, #40]	; (8000ed0 <SysTick_Handler+0x3c>)
 8000ea6:	681b      	ldr	r3, [r3, #0]
 8000ea8:	1ad2      	subs	r2, r2, r3
 8000eaa:	23c8      	movs	r3, #200	; 0xc8
 8000eac:	005b      	lsls	r3, r3, #1
 8000eae:	009b      	lsls	r3, r3, #2
 8000eb0:	429a      	cmp	r2, r3
 8000eb2:	dd01      	ble.n	8000eb8 <SysTick_Handler+0x24>
 8000eb4:	f7ff ff68 	bl	8000d88 <word_handler>
 8000eb8:	4b04      	ldr	r3, [pc, #16]	; (8000ecc <SysTick_Handler+0x38>)
 8000eba:	681b      	ldr	r3, [r3, #0]
 8000ebc:	1c5a      	adds	r2, r3, #1
 8000ebe:	4b03      	ldr	r3, [pc, #12]	; (8000ecc <SysTick_Handler+0x38>)
 8000ec0:	601a      	str	r2, [r3, #0]
 8000ec2:	46c0      	nop			; (mov r8, r8)
 8000ec4:	46bd      	mov	sp, r7
 8000ec6:	bd80      	pop	{r7, pc}
 8000ec8:	20000650 	.word	0x20000650
 8000ecc:	20000450 	.word	0x20000450
 8000ed0:	2000064c 	.word	0x2000064c

08000ed4 <main>:
 8000ed4:	b580      	push	{r7, lr}
 8000ed6:	af00      	add	r7, sp, #0
 8000ed8:	f7ff fc10 	bl	80006fc <rcc_config>
 8000edc:	f7ff fc42 	bl	8000764 <gpio_config>
 8000ee0:	f7ff fc5a 	bl	8000798 <exti_config>
 8000ee4:	f7ff fd0c 	bl	8000900 <systick_config>
 8000ee8:	2380      	movs	r3, #128	; 0x80
 8000eea:	005b      	lsls	r3, r3, #1
 8000eec:	4a08      	ldr	r2, [pc, #32]	; (8000f10 <main+0x3c>)
 8000eee:	0019      	movs	r1, r3
 8000ef0:	0010      	movs	r0, r2
 8000ef2:	f7ff fb76 	bl	80005e2 <LL_GPIO_SetOutputPin>
 8000ef6:	f7ff fcf9 	bl	80008ec <delay>
 8000efa:	f7ff fcf7 	bl	80008ec <delay>
 8000efe:	2380      	movs	r3, #128	; 0x80
 8000f00:	005b      	lsls	r3, r3, #1
 8000f02:	4a03      	ldr	r2, [pc, #12]	; (8000f10 <main+0x3c>)
 8000f04:	0019      	movs	r1, r3
 8000f06:	0010      	movs	r0, r2
 8000f08:	f7ff fb77 	bl	80005fa <LL_GPIO_ResetOutputPin>
 8000f0c:	e7fe      	b.n	8000f0c <main+0x38>
 8000f0e:	46c0      	nop			; (mov r8, r8)
 8000f10:	48000800 	.word	0x48000800

08000f14 <SystemInit>:
 8000f14:	b580      	push	{r7, lr}
 8000f16:	af00      	add	r7, sp, #0
 8000f18:	4b1a      	ldr	r3, [pc, #104]	; (8000f84 <SystemInit+0x70>)
 8000f1a:	681a      	ldr	r2, [r3, #0]
 8000f1c:	4b19      	ldr	r3, [pc, #100]	; (8000f84 <SystemInit+0x70>)
 8000f1e:	2101      	movs	r1, #1
 8000f20:	430a      	orrs	r2, r1
 8000f22:	601a      	str	r2, [r3, #0]
 8000f24:	4b17      	ldr	r3, [pc, #92]	; (8000f84 <SystemInit+0x70>)
 8000f26:	685a      	ldr	r2, [r3, #4]
 8000f28:	4b16      	ldr	r3, [pc, #88]	; (8000f84 <SystemInit+0x70>)
 8000f2a:	4917      	ldr	r1, [pc, #92]	; (8000f88 <SystemInit+0x74>)
 8000f2c:	400a      	ands	r2, r1
 8000f2e:	605a      	str	r2, [r3, #4]
 8000f30:	4b14      	ldr	r3, [pc, #80]	; (8000f84 <SystemInit+0x70>)
 8000f32:	681a      	ldr	r2, [r3, #0]
 8000f34:	4b13      	ldr	r3, [pc, #76]	; (8000f84 <SystemInit+0x70>)
 8000f36:	4915      	ldr	r1, [pc, #84]	; (8000f8c <SystemInit+0x78>)
 8000f38:	400a      	ands	r2, r1
 8000f3a:	601a      	str	r2, [r3, #0]
 8000f3c:	4b11      	ldr	r3, [pc, #68]	; (8000f84 <SystemInit+0x70>)
 8000f3e:	681a      	ldr	r2, [r3, #0]
 8000f40:	4b10      	ldr	r3, [pc, #64]	; (8000f84 <SystemInit+0x70>)
 8000f42:	4913      	ldr	r1, [pc, #76]	; (8000f90 <SystemInit+0x7c>)
 8000f44:	400a      	ands	r2, r1
 8000f46:	601a      	str	r2, [r3, #0]
 8000f48:	4b0e      	ldr	r3, [pc, #56]	; (8000f84 <SystemInit+0x70>)
 8000f4a:	685a      	ldr	r2, [r3, #4]
 8000f4c:	4b0d      	ldr	r3, [pc, #52]	; (8000f84 <SystemInit+0x70>)
 8000f4e:	4911      	ldr	r1, [pc, #68]	; (8000f94 <SystemInit+0x80>)
 8000f50:	400a      	ands	r2, r1
 8000f52:	605a      	str	r2, [r3, #4]
 8000f54:	4b0b      	ldr	r3, [pc, #44]	; (8000f84 <SystemInit+0x70>)
 8000f56:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8000f58:	4b0a      	ldr	r3, [pc, #40]	; (8000f84 <SystemInit+0x70>)
 8000f5a:	210f      	movs	r1, #15
 8000f5c:	438a      	bics	r2, r1
 8000f5e:	62da      	str	r2, [r3, #44]	; 0x2c
 8000f60:	4b08      	ldr	r3, [pc, #32]	; (8000f84 <SystemInit+0x70>)
 8000f62:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8000f64:	4b07      	ldr	r3, [pc, #28]	; (8000f84 <SystemInit+0x70>)
 8000f66:	490c      	ldr	r1, [pc, #48]	; (8000f98 <SystemInit+0x84>)
 8000f68:	400a      	ands	r2, r1
 8000f6a:	631a      	str	r2, [r3, #48]	; 0x30
 8000f6c:	4b05      	ldr	r3, [pc, #20]	; (8000f84 <SystemInit+0x70>)
 8000f6e:	6b5a      	ldr	r2, [r3, #52]	; 0x34
 8000f70:	4b04      	ldr	r3, [pc, #16]	; (8000f84 <SystemInit+0x70>)
 8000f72:	2101      	movs	r1, #1
 8000f74:	438a      	bics	r2, r1
 8000f76:	635a      	str	r2, [r3, #52]	; 0x34
 8000f78:	4b02      	ldr	r3, [pc, #8]	; (8000f84 <SystemInit+0x70>)
 8000f7a:	2200      	movs	r2, #0
 8000f7c:	609a      	str	r2, [r3, #8]
 8000f7e:	46c0      	nop			; (mov r8, r8)
 8000f80:	46bd      	mov	sp, r7
 8000f82:	bd80      	pop	{r7, pc}
 8000f84:	40021000 	.word	0x40021000
 8000f88:	f8ffb80c 	.word	0xf8ffb80c
 8000f8c:	fef6ffff 	.word	0xfef6ffff
 8000f90:	fffbffff 	.word	0xfffbffff
 8000f94:	ffc0ffff 	.word	0xffc0ffff
 8000f98:	fffffeac 	.word	0xfffffeac

08000f9c <NMI_Handler>:
 8000f9c:	b580      	push	{r7, lr}
 8000f9e:	af00      	add	r7, sp, #0
 8000fa0:	46c0      	nop			; (mov r8, r8)
 8000fa2:	46bd      	mov	sp, r7
 8000fa4:	bd80      	pop	{r7, pc}

08000fa6 <HardFault_Handler>:
 8000fa6:	b580      	push	{r7, lr}
 8000fa8:	af00      	add	r7, sp, #0
 8000faa:	e7fe      	b.n	8000faa <HardFault_Handler+0x4>

08000fac <SVC_Handler>:
 8000fac:	b580      	push	{r7, lr}
 8000fae:	af00      	add	r7, sp, #0
 8000fb0:	46c0      	nop			; (mov r8, r8)
 8000fb2:	46bd      	mov	sp, r7
 8000fb4:	bd80      	pop	{r7, pc}

08000fb6 <PendSV_Handler>:
 8000fb6:	b580      	push	{r7, lr}
 8000fb8:	af00      	add	r7, sp, #0
 8000fba:	46c0      	nop			; (mov r8, r8)
 8000fbc:	46bd      	mov	sp, r7
 8000fbe:	bd80      	pop	{r7, pc}

08000fc0 <__libc_init_array>:
 8000fc0:	b570      	push	{r4, r5, r6, lr}
 8000fc2:	4e0d      	ldr	r6, [pc, #52]	; (8000ff8 <__libc_init_array+0x38>)
 8000fc4:	4d0d      	ldr	r5, [pc, #52]	; (8000ffc <__libc_init_array+0x3c>)
 8000fc6:	1bad      	subs	r5, r5, r6
 8000fc8:	10ad      	asrs	r5, r5, #2
 8000fca:	d006      	beq.n	8000fda <__libc_init_array+0x1a>
 8000fcc:	2400      	movs	r4, #0
 8000fce:	00a3      	lsls	r3, r4, #2
 8000fd0:	58f3      	ldr	r3, [r6, r3]
 8000fd2:	3401      	adds	r4, #1
 8000fd4:	4798      	blx	r3
 8000fd6:	42a5      	cmp	r5, r4
 8000fd8:	d1f9      	bne.n	8000fce <__libc_init_array+0xe>
 8000fda:	f000 f8c1 	bl	8001160 <_init>
 8000fde:	4e08      	ldr	r6, [pc, #32]	; (8001000 <__libc_init_array+0x40>)
 8000fe0:	4d08      	ldr	r5, [pc, #32]	; (8001004 <__libc_init_array+0x44>)
 8000fe2:	1bad      	subs	r5, r5, r6
 8000fe4:	10ad      	asrs	r5, r5, #2
 8000fe6:	d006      	beq.n	8000ff6 <__libc_init_array+0x36>
 8000fe8:	2400      	movs	r4, #0
 8000fea:	00a3      	lsls	r3, r4, #2
 8000fec:	58f3      	ldr	r3, [r6, r3]
 8000fee:	3401      	adds	r4, #1
 8000ff0:	4798      	blx	r3
 8000ff2:	42a5      	cmp	r5, r4
 8000ff4:	d1f9      	bne.n	8000fea <__libc_init_array+0x2a>
 8000ff6:	bd70      	pop	{r4, r5, r6, pc}
 8000ff8:	0800117c 	.word	0x0800117c
 8000ffc:	0800117c 	.word	0x0800117c
 8001000:	0800117c 	.word	0x0800117c
 8001004:	08001184 	.word	0x08001184

08001008 <register_fini>:
 8001008:	4b03      	ldr	r3, [pc, #12]	; (8001018 <register_fini+0x10>)
 800100a:	b510      	push	{r4, lr}
 800100c:	2b00      	cmp	r3, #0
 800100e:	d002      	beq.n	8001016 <register_fini+0xe>
 8001010:	4802      	ldr	r0, [pc, #8]	; (800101c <register_fini+0x14>)
 8001012:	f000 f805 	bl	8001020 <atexit>
 8001016:	bd10      	pop	{r4, pc}
 8001018:	00000000 	.word	0x00000000
 800101c:	08001031 	.word	0x08001031

08001020 <atexit>:
 8001020:	b510      	push	{r4, lr}
 8001022:	0001      	movs	r1, r0
 8001024:	2300      	movs	r3, #0
 8001026:	2200      	movs	r2, #0
 8001028:	2000      	movs	r0, #0
 800102a:	f000 f81f 	bl	800106c <__register_exitproc>
 800102e:	bd10      	pop	{r4, pc}

08001030 <__libc_fini_array>:
 8001030:	b570      	push	{r4, r5, r6, lr}
 8001032:	4b09      	ldr	r3, [pc, #36]	; (8001058 <__libc_fini_array+0x28>)
 8001034:	4c09      	ldr	r4, [pc, #36]	; (800105c <__libc_fini_array+0x2c>)
 8001036:	1ae4      	subs	r4, r4, r3
 8001038:	10a4      	asrs	r4, r4, #2
 800103a:	d009      	beq.n	8001050 <__libc_fini_array+0x20>
 800103c:	4a08      	ldr	r2, [pc, #32]	; (8001060 <__libc_fini_array+0x30>)
 800103e:	18a5      	adds	r5, r4, r2
 8001040:	00ad      	lsls	r5, r5, #2
 8001042:	18ed      	adds	r5, r5, r3
 8001044:	682b      	ldr	r3, [r5, #0]
 8001046:	3c01      	subs	r4, #1
 8001048:	4798      	blx	r3
 800104a:	3d04      	subs	r5, #4
 800104c:	2c00      	cmp	r4, #0
 800104e:	d1f9      	bne.n	8001044 <__libc_fini_array+0x14>
 8001050:	f000 f88c 	bl	800116c <_fini>
 8001054:	bd70      	pop	{r4, r5, r6, pc}
 8001056:	46c0      	nop			; (mov r8, r8)
 8001058:	08001184 	.word	0x08001184
 800105c:	08001188 	.word	0x08001188
 8001060:	3fffffff 	.word	0x3fffffff

08001064 <__retarget_lock_acquire_recursive>:
 8001064:	4770      	bx	lr
 8001066:	46c0      	nop			; (mov r8, r8)

08001068 <__retarget_lock_release_recursive>:
 8001068:	4770      	bx	lr
 800106a:	46c0      	nop			; (mov r8, r8)

0800106c <__register_exitproc>:
 800106c:	b5f0      	push	{r4, r5, r6, r7, lr}
 800106e:	464e      	mov	r6, r9
 8001070:	4645      	mov	r5, r8
 8001072:	46de      	mov	lr, fp
 8001074:	4657      	mov	r7, sl
 8001076:	b5e0      	push	{r5, r6, r7, lr}
 8001078:	4d36      	ldr	r5, [pc, #216]	; (8001154 <__register_exitproc+0xe8>)
 800107a:	b083      	sub	sp, #12
 800107c:	0006      	movs	r6, r0
 800107e:	6828      	ldr	r0, [r5, #0]
 8001080:	4698      	mov	r8, r3
 8001082:	000f      	movs	r7, r1
 8001084:	4691      	mov	r9, r2
 8001086:	f7ff ffed 	bl	8001064 <__retarget_lock_acquire_recursive>
 800108a:	4b33      	ldr	r3, [pc, #204]	; (8001158 <__register_exitproc+0xec>)
 800108c:	681c      	ldr	r4, [r3, #0]
 800108e:	23a4      	movs	r3, #164	; 0xa4
 8001090:	005b      	lsls	r3, r3, #1
 8001092:	58e0      	ldr	r0, [r4, r3]
 8001094:	2800      	cmp	r0, #0
 8001096:	d052      	beq.n	800113e <__register_exitproc+0xd2>
 8001098:	6843      	ldr	r3, [r0, #4]
 800109a:	2b1f      	cmp	r3, #31
 800109c:	dc13      	bgt.n	80010c6 <__register_exitproc+0x5a>
 800109e:	1c5a      	adds	r2, r3, #1
 80010a0:	9201      	str	r2, [sp, #4]
 80010a2:	2e00      	cmp	r6, #0
 80010a4:	d128      	bne.n	80010f8 <__register_exitproc+0x8c>
 80010a6:	9a01      	ldr	r2, [sp, #4]
 80010a8:	3302      	adds	r3, #2
 80010aa:	009b      	lsls	r3, r3, #2
 80010ac:	6042      	str	r2, [r0, #4]
 80010ae:	501f      	str	r7, [r3, r0]
 80010b0:	6828      	ldr	r0, [r5, #0]
 80010b2:	f7ff ffd9 	bl	8001068 <__retarget_lock_release_recursive>
 80010b6:	2000      	movs	r0, #0
 80010b8:	b003      	add	sp, #12
 80010ba:	bc3c      	pop	{r2, r3, r4, r5}
 80010bc:	4690      	mov	r8, r2
 80010be:	4699      	mov	r9, r3
 80010c0:	46a2      	mov	sl, r4
 80010c2:	46ab      	mov	fp, r5
 80010c4:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80010c6:	4b25      	ldr	r3, [pc, #148]	; (800115c <__register_exitproc+0xf0>)
 80010c8:	2b00      	cmp	r3, #0
 80010ca:	d03d      	beq.n	8001148 <__register_exitproc+0xdc>
 80010cc:	20c8      	movs	r0, #200	; 0xc8
 80010ce:	0040      	lsls	r0, r0, #1
 80010d0:	e000      	b.n	80010d4 <__register_exitproc+0x68>
 80010d2:	bf00      	nop
 80010d4:	2800      	cmp	r0, #0
 80010d6:	d037      	beq.n	8001148 <__register_exitproc+0xdc>
 80010d8:	22a4      	movs	r2, #164	; 0xa4
 80010da:	2300      	movs	r3, #0
 80010dc:	0052      	lsls	r2, r2, #1
 80010de:	58a1      	ldr	r1, [r4, r2]
 80010e0:	6043      	str	r3, [r0, #4]
 80010e2:	6001      	str	r1, [r0, #0]
 80010e4:	50a0      	str	r0, [r4, r2]
 80010e6:	3240      	adds	r2, #64	; 0x40
 80010e8:	5083      	str	r3, [r0, r2]
 80010ea:	3204      	adds	r2, #4
 80010ec:	5083      	str	r3, [r0, r2]
 80010ee:	3301      	adds	r3, #1
 80010f0:	9301      	str	r3, [sp, #4]
 80010f2:	2300      	movs	r3, #0
 80010f4:	2e00      	cmp	r6, #0
 80010f6:	d0d6      	beq.n	80010a6 <__register_exitproc+0x3a>
 80010f8:	009a      	lsls	r2, r3, #2
 80010fa:	4692      	mov	sl, r2
 80010fc:	4482      	add	sl, r0
 80010fe:	464a      	mov	r2, r9
 8001100:	2188      	movs	r1, #136	; 0x88
 8001102:	4654      	mov	r4, sl
 8001104:	5062      	str	r2, [r4, r1]
 8001106:	22c4      	movs	r2, #196	; 0xc4
 8001108:	0052      	lsls	r2, r2, #1
 800110a:	4691      	mov	r9, r2
 800110c:	4481      	add	r9, r0
 800110e:	464a      	mov	r2, r9
 8001110:	3987      	subs	r1, #135	; 0x87
 8001112:	4099      	lsls	r1, r3
 8001114:	6812      	ldr	r2, [r2, #0]
 8001116:	468b      	mov	fp, r1
 8001118:	430a      	orrs	r2, r1
 800111a:	4694      	mov	ip, r2
 800111c:	464a      	mov	r2, r9
 800111e:	4661      	mov	r1, ip
 8001120:	6011      	str	r1, [r2, #0]
 8001122:	2284      	movs	r2, #132	; 0x84
 8001124:	4641      	mov	r1, r8
 8001126:	0052      	lsls	r2, r2, #1
 8001128:	50a1      	str	r1, [r4, r2]
 800112a:	2e02      	cmp	r6, #2
 800112c:	d1bb      	bne.n	80010a6 <__register_exitproc+0x3a>
 800112e:	0002      	movs	r2, r0
 8001130:	465c      	mov	r4, fp
 8001132:	328d      	adds	r2, #141	; 0x8d
 8001134:	32ff      	adds	r2, #255	; 0xff
 8001136:	6811      	ldr	r1, [r2, #0]
 8001138:	430c      	orrs	r4, r1
 800113a:	6014      	str	r4, [r2, #0]
 800113c:	e7b3      	b.n	80010a6 <__register_exitproc+0x3a>
 800113e:	0020      	movs	r0, r4
 8001140:	304d      	adds	r0, #77	; 0x4d
 8001142:	30ff      	adds	r0, #255	; 0xff
 8001144:	50e0      	str	r0, [r4, r3]
 8001146:	e7a7      	b.n	8001098 <__register_exitproc+0x2c>
 8001148:	6828      	ldr	r0, [r5, #0]
 800114a:	f7ff ff8d 	bl	8001068 <__retarget_lock_release_recursive>
 800114e:	2001      	movs	r0, #1
 8001150:	4240      	negs	r0, r0
 8001152:	e7b1      	b.n	80010b8 <__register_exitproc+0x4c>
 8001154:	20000430 	.word	0x20000430
 8001158:	08001178 	.word	0x08001178
 800115c:	00000000 	.word	0x00000000

08001160 <_init>:
 8001160:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001162:	46c0      	nop			; (mov r8, r8)
 8001164:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8001166:	bc08      	pop	{r3}
 8001168:	469e      	mov	lr, r3
 800116a:	4770      	bx	lr

0800116c <_fini>:
 800116c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800116e:	46c0      	nop			; (mov r8, r8)
 8001170:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8001172:	bc08      	pop	{r3}
 8001174:	469e      	mov	lr, r3
 8001176:	4770      	bx	lr
