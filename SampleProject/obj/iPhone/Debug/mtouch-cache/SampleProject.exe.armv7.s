.subsections_via_symbols
.section __DWARF, __debug_abbrev,regular,debug

	.byte 1,17,1,37,8,3,8,27,8,19,11,17,1,18,1,16,6,0,0,2,46,1,3,8,17,1,18,1,64,10,0,0
	.byte 3,5,0,3,8,73,19,2,10,0,0,15,5,0,3,8,73,19,2,6,0,0,4,36,0,11,11,62,11,3,8,0
	.byte 0,5,2,1,3,8,11,15,0,0,17,2,0,3,8,11,15,0,0,6,13,0,3,8,73,19,56,10,0,0,7,22
	.byte 0,3,8,73,19,0,0,8,4,1,3,8,11,15,73,19,0,0,9,40,0,3,8,28,13,0,0,10,57,1,3,8
	.byte 0,0,11,52,0,3,8,73,19,2,10,0,0,12,52,0,3,8,73,19,2,6,0,0,13,15,0,73,19,0,0,14
	.byte 16,0,73,19,0,0,16,28,0,73,19,56,10,0,0,18,46,0,3,8,17,1,18,1,0,0,0
.section __DWARF, __debug_info,regular,debug
Ldebug_info_start:

LDIFF_SYM0=Ldebug_info_end - Ldebug_info_begin
	.long LDIFF_SYM0
Ldebug_info_begin:

	.short 2
	.long 0
	.byte 4,1
	.asciz "Mono AOT Compiler 3.10.0 (mono-3.10.0-branch/491d1f5 Fri Oct  3 00:18:38 EDT 2014)"
	.asciz "SampleProject.exe"
	.asciz ""

	.byte 2,0,0,0,0,0,0,0,0
LDIFF_SYM1=Ldebug_line_start - Ldebug_line_section_start
	.long LDIFF_SYM1
LDIE_I1:

	.byte 4,1,5
	.asciz "sbyte"
LDIE_U1:

	.byte 4,1,7
	.asciz "byte"
LDIE_I2:

	.byte 4,2,5
	.asciz "short"
LDIE_U2:

	.byte 4,2,7
	.asciz "ushort"
LDIE_I4:

	.byte 4,4,5
	.asciz "int"
LDIE_U4:

	.byte 4,4,7
	.asciz "uint"
LDIE_I8:

	.byte 4,8,5
	.asciz "long"
LDIE_U8:

	.byte 4,8,7
	.asciz "ulong"
LDIE_I:

	.byte 4,4,5
	.asciz "intptr"
LDIE_U:

	.byte 4,4,7
	.asciz "uintptr"
LDIE_R4:

	.byte 4,4,4
	.asciz "float"
LDIE_R8:

	.byte 4,8,4
	.asciz "double"
LDIE_BOOLEAN:

	.byte 4,1,2
	.asciz "boolean"
LDIE_CHAR:

	.byte 4,2,8
	.asciz "char"
LDIE_STRING:

	.byte 4,4,1
	.asciz "string"
LDIE_OBJECT:

	.byte 4,4,1
	.asciz "object"
LDIE_SZARRAY:

	.byte 4,4,1
	.asciz "object"
.section __DWARF, __debug_loc,regular,debug
Ldebug_loc_start:
.section __DWARF, __debug_frame,regular,debug
	.align 3

LDIFF_SYM2=Lcie0_end - Lcie0_start
	.long LDIFF_SYM2
Lcie0_start:

	.long -1
	.byte 3
	.asciz ""

	.byte 1,124,14
	.align 2
Lcie0_end:
.text
	.align 3
methods:
	.space 16
.text
	.align 2
	.no_dead_strip _SampleProject_Application__ctor
_SampleProject_Application__ctor:

	.byte 128,64,45,233,13,112,160,225,0,1,45,233,20,208,77,226,8,0,141,229,0,0,159,229,0,0,0,234
	.long _mono_aot_SampleProject_got - . + 4
	.byte 0,0,159,231,0,0,141,229,0,224,157,229,0,224,158,229,4,224,141,229,0,224,157,229,60,224,158,229,0,0,94,227
	.byte 0,224,158,21,8,0,157,229,0,224,157,229,80,224,158,229,0,0,94,227,0,224,158,21,20,208,141,226,0,1,189,232
	.byte 128,128,189,232

Lme_0:
.text
	.align 2
	.no_dead_strip _SampleProject_Application_Main_string__
_SampleProject_Application_Main_string__:

	.byte 128,64,45,233,13,112,160,225,0,1,45,233,28,208,77,226,8,0,141,229,0,0,159,229,0,0,0,234
	.long _mono_aot_SampleProject_got - . + 8
	.byte 0,0,159,231,0,0,141,229,0,224,157,229,0,224,158,229,4,224,141,229,0,224,157,229,60,224,158,229,0,0,94,227
	.byte 0,224,158,21,4,224,157,229,0,224,158,229,0,224,157,229,84,224,158,229,0,0,94,227,0,224,158,21,0,224,157,229
	.byte 100,224,158,229,0,0,94,227,0,224,158,21,8,0,157,229,16,0,141,229,0,0,160,227,0,0,159,229,0,0,0,234
	.long _mono_aot_SampleProject_got - . + 12
	.byte 0,0,159,231,20,0,141,229,0,224,157,229,148,224,158,229,0,0,94,227,0,224,158,21,16,0,157,229,20,32,157,229
	.byte 0,16,160,227
bl _p_1

	.byte 0,224,157,229,180,224,158,229,0,0,94,227,0,224,158,21,0,224,157,229,196,224,158,229,0,0,94,227,0,224,158,21
	.byte 28,208,141,226,0,1,189,232,128,128,189,232

Lme_1:
.text
	.align 2
	.no_dead_strip _SampleProject_AppDelegate__ctor
_SampleProject_AppDelegate__ctor:

	.byte 128,64,45,233,13,112,160,225,0,1,45,233,20,208,77,226,8,0,141,229,0,0,159,229,0,0,0,234
	.long _mono_aot_SampleProject_got - . + 16
	.byte 0,0,159,231,0,0,141,229,0,224,157,229,0,224,158,229,4,224,141,229,0,224,157,229,60,224,158,229,0,0,94,227
	.byte 0,224,158,21,8,0,157,229
bl _p_2

	.byte 0,224,157,229,84,224,158,229,0,0,94,227,0,224,158,21,20,208,141,226,0,1,189,232,128,128,189,232

Lme_2:
.text
	.align 2
	.no_dead_strip _SampleProject_AppDelegate_get_Window
_SampleProject_AppDelegate_get_Window:

	.byte 128,64,45,233,13,112,160,225,64,1,45,233,16,208,77,226,8,0,141,229,0,0,159,229,0,0,0,234
	.long _mono_aot_SampleProject_got - . + 20
	.byte 0,0,159,231,0,0,141,229,0,224,157,229,0,224,158,229,4,224,141,229,0,96,160,227,0,224,157,229,64,224,158,229
	.byte 0,0,94,227,0,224,158,21,4,224,157,229,0,224,158,229,0,224,157,229,88,224,158,229,0,0,94,227,0,224,158,21
	.byte 8,0,157,229,20,0,144,229,0,96,160,225,0,224,157,229,116,224,158,229,0,0,94,227,0,224,158,21,16,208,141,226
	.byte 64,1,189,232,128,128,189,232

Lme_3:
.text
	.align 2
	.no_dead_strip _SampleProject_AppDelegate_set_Window_MonoTouch_UIKit_UIWindow
_SampleProject_AppDelegate_set_Window_MonoTouch_UIKit_UIWindow:

	.byte 128,64,45,233,13,112,160,225,0,1,45,233,20,208,77,226,8,0,141,229,12,16,141,229,0,0,159,229,0,0,0,234
	.long _mono_aot_SampleProject_got - . + 24
	.byte 0,0,159,231,0,0,141,229,0,224,157,229,0,224,158,229,4,224,141,229,0,224,157,229,64,224,158,229,0,0,94,227
	.byte 0,224,158,21,4,224,157,229,0,224,158,229,0,224,157,229,88,224,158,229,0,0,94,227,0,224,158,21,8,0,157,229
	.byte 12,16,157,229,20,16,128,229,0,224,157,229,116,224,158,229,0,0,94,227,0,224,158,21,20,208,141,226,0,1,189,232
	.byte 128,128,189,232

Lme_4:
.text
	.align 2
	.no_dead_strip _SampleProject_AppDelegate_OnResignActivation_MonoTouch_UIKit_UIApplication
_SampleProject_AppDelegate_OnResignActivation_MonoTouch_UIKit_UIApplication:

	.byte 128,64,45,233,13,112,160,225,0,1,45,233,20,208,77,226,8,0,141,229,12,16,141,229,0,0,159,229,0,0,0,234
	.long _mono_aot_SampleProject_got - . + 28
	.byte 0,0,159,231,0,0,141,229,0,224,157,229,0,224,158,229,4,224,141,229,0,224,157,229,64,224,158,229,0,0,94,227
	.byte 0,224,158,21,4,224,157,229,0,224,158,229,0,224,157,229,88,224,158,229,0,0,94,227,0,224,158,21,0,224,157,229
	.byte 104,224,158,229,0,0,94,227,0,224,158,21,0,224,157,229,120,224,158,229,0,0,94,227,0,224,158,21,20,208,141,226
	.byte 0,1,189,232,128,128,189,232

Lme_5:
.text
	.align 2
	.no_dead_strip _SampleProject_AppDelegate_DidEnterBackground_MonoTouch_UIKit_UIApplication
_SampleProject_AppDelegate_DidEnterBackground_MonoTouch_UIKit_UIApplication:

	.byte 128,64,45,233,13,112,160,225,0,1,45,233,20,208,77,226,8,0,141,229,12,16,141,229,0,0,159,229,0,0,0,234
	.long _mono_aot_SampleProject_got - . + 32
	.byte 0,0,159,231,0,0,141,229,0,224,157,229,0,224,158,229,4,224,141,229,0,224,157,229,64,224,158,229,0,0,94,227
	.byte 0,224,158,21,4,224,157,229,0,224,158,229,0,224,157,229,88,224,158,229,0,0,94,227,0,224,158,21,0,224,157,229
	.byte 104,224,158,229,0,0,94,227,0,224,158,21,0,224,157,229,120,224,158,229,0,0,94,227,0,224,158,21,20,208,141,226
	.byte 0,1,189,232,128,128,189,232

Lme_6:
.text
	.align 2
	.no_dead_strip _SampleProject_AppDelegate_WillEnterForeground_MonoTouch_UIKit_UIApplication
_SampleProject_AppDelegate_WillEnterForeground_MonoTouch_UIKit_UIApplication:

	.byte 128,64,45,233,13,112,160,225,0,1,45,233,20,208,77,226,8,0,141,229,12,16,141,229,0,0,159,229,0,0,0,234
	.long _mono_aot_SampleProject_got - . + 36
	.byte 0,0,159,231,0,0,141,229,0,224,157,229,0,224,158,229,4,224,141,229,0,224,157,229,64,224,158,229,0,0,94,227
	.byte 0,224,158,21,4,224,157,229,0,224,158,229,0,224,157,229,88,224,158,229,0,0,94,227,0,224,158,21,0,224,157,229
	.byte 104,224,158,229,0,0,94,227,0,224,158,21,0,224,157,229,120,224,158,229,0,0,94,227,0,224,158,21,20,208,141,226
	.byte 0,1,189,232,128,128,189,232

Lme_7:
.text
	.align 2
	.no_dead_strip _SampleProject_AppDelegate_WillTerminate_MonoTouch_UIKit_UIApplication
_SampleProject_AppDelegate_WillTerminate_MonoTouch_UIKit_UIApplication:

	.byte 128,64,45,233,13,112,160,225,0,1,45,233,20,208,77,226,8,0,141,229,12,16,141,229,0,0,159,229,0,0,0,234
	.long _mono_aot_SampleProject_got - . + 40
	.byte 0,0,159,231,0,0,141,229,0,224,157,229,0,224,158,229,4,224,141,229,0,224,157,229,64,224,158,229,0,0,94,227
	.byte 0,224,158,21,4,224,157,229,0,224,158,229,0,224,157,229,88,224,158,229,0,0,94,227,0,224,158,21,0,224,157,229
	.byte 104,224,158,229,0,0,94,227,0,224,158,21,0,224,157,229,120,224,158,229,0,0,94,227,0,224,158,21,20,208,141,226
	.byte 0,1,189,232,128,128,189,232

Lme_8:
.text
	.align 2
	.no_dead_strip _SampleProject_SampleProjectViewController__ctor_intptr
_SampleProject_SampleProjectViewController__ctor_intptr:

	.byte 128,64,45,233,13,112,160,225,0,1,45,233,20,208,77,226,8,0,141,229,12,16,141,229,0,0,159,229,0,0,0,234
	.long _mono_aot_SampleProject_got - . + 44
	.byte 0,0,159,231,0,0,141,229,0,224,157,229,0,224,158,229,4,224,141,229,0,224,157,229,64,224,158,229,0,0,94,227
	.byte 0,224,158,21,4,224,157,229,0,224,158,229,0,224,157,229,88,224,158,229,0,0,94,227,0,224,158,21,8,0,157,229
	.byte 12,16,157,229
bl _p_3

	.byte 0,224,157,229,116,224,158,229,0,0,94,227,0,224,158,21,0,224,157,229,132,224,158,229,0,0,94,227,0,224,158,21
	.byte 0,224,157,229,148,224,158,229,0,0,94,227,0,224,158,21,20,208,141,226,0,1,189,232,128,128,189,232

Lme_9:
.text
	.align 2
	.no_dead_strip _SampleProject_SampleProjectViewController_ViewDidLoad
_SampleProject_SampleProjectViewController_ViewDidLoad:

	.byte 128,64,45,233,13,112,160,225,0,13,45,233,236,208,77,226,13,176,160,225,0,160,160,225,0,0,159,229,0,0,0,234
	.long _mono_aot_SampleProject_got - . + 48
	.byte 0,0,159,231,16,0,139,229,16,224,155,229,0,224,158,229,20,224,139,229,24,0,139,226,0,0,160,227,0,0,160,227
	.byte 24,0,139,229,0,0,160,227,28,0,139,229,0,0,160,227,32,0,139,229,0,0,160,227,36,0,139,229,40,0,139,226
	.byte 0,0,160,227,0,0,160,227,40,0,139,229,0,0,160,227,44,0,139,229,0,0,160,227,48,0,139,229,0,0,160,227
	.byte 52,0,139,229,16,224,155,229,144,224,158,229,0,0,94,227,0,224,158,21,20,224,155,229,0,224,158,229,16,224,155,229
	.byte 168,224,158,229,0,0,94,227,0,224,158,21,16,224,155,229,184,224,158,229,0,0,94,227,0,224,158,21,10,0,160,225
	.byte 16,224,155,229,204,224,158,229,0,0,94,227,0,224,158,21,10,0,160,225
bl _p_4

	.byte 16,224,155,229,228,224,158,229,0,0,94,227,0,224,158,21,10,0,160,225,16,224,155,229,248,224,158,229,0,0,94,227
	.byte 0,224,158,21,0,0,159,229,0,0,0,234
	.long _mono_aot_SampleProject_got - . + 52
	.byte 0,0,159,231
bl _p_5

	.byte 224,0,139,229
bl _p_6

	.byte 224,0,155,229,32,0,138,229,16,224,155,229,44,225,158,229,0,0,94,227,0,224,158,21,10,0,160,225,32,0,154,229
	.byte 152,0,139,229,0,42,159,237,0,0,0,234,0,0,0,0,194,42,183,238,46,43,139,237,0,42,159,237,0,0,0,234
	.byte 0,0,0,0,194,42,183,238,44,43,139,237,10,0,160,225,16,224,155,229,116,225,158,229,0,0,94,227,0,224,158,21
	.byte 10,0,160,225,0,16,154,229,15,224,160,225,104,240,145,229,220,0,139,229,16,224,155,229,152,225,158,229,0,0,94,227
	.byte 0,224,158,21,220,32,155,229,56,16,139,226,2,0,160,225,0,32,146,229,15,224,160,225,176,240,146,229,16,224,155,229
	.byte 192,225,158,229,0,0,94,227,0,224,158,21,56,0,139,226,24,0,139,226,56,0,155,229,24,0,139,229,60,0,155,229
	.byte 28,0,139,229,64,0,155,229,32,0,139,229,68,0,155,229,36,0,139,229,24,0,139,226,216,0,139,229,16,224,155,229
	.byte 0,226,158,229,0,0,94,227,0,224,158,21,216,0,155,229
bl _p_7

	.byte 16,10,2,238,194,42,183,238,52,43,139,237,16,224,155,229,36,226,158,229,0,0,94,227,0,224,158,21,52,43,155,237
	.byte 194,43,183,238,194,42,183,238,42,43,139,237,10,0,160,225,16,224,155,229,72,226,158,229,0,0,94,227,0,224,158,21
	.byte 10,0,160,225,0,16,154,229,15,224,160,225,104,240,145,229,204,0,139,229,16,224,155,229,108,226,158,229,0,0,94,227
	.byte 0,224,158,21,204,32,155,229,72,16,139,226,2,0,160,225,0,32,146,229,15,224,160,225,176,240,146,229,16,224,155,229
	.byte 148,226,158,229,0,0,94,227,0,224,158,21,72,0,139,226,40,0,139,226,72,0,155,229,40,0,139,229,76,0,155,229
	.byte 44,0,139,229,80,0,155,229,48,0,139,229,84,0,155,229,52,0,139,229,40,0,139,226,200,0,139,229,16,224,155,229
	.byte 212,226,158,229,0,0,94,227,0,224,158,21,200,0,155,229
bl _p_8

	.byte 16,10,2,238,194,42,183,238,48,43,139,237,16,224,155,229,248,226,158,229,0,0,94,227,0,224,158,21,48,43,155,237
	.byte 66,43,176,238,0,59,159,237,1,0,0,234,0,0,0,0,0,0,0,64,3,43,130,238,194,43,183,238,194,42,183,238
	.byte 40,43,139,237,16,224,155,229,48,227,158,229,0,0,94,227,0,224,158,21,40,43,155,237,42,59,155,237,44,75,155,237
	.byte 46,91,155,237,88,0,139,226,0,0,160,227,0,0,160,227,88,0,139,229,0,0,160,227,92,0,139,229,0,0,160,227
	.byte 96,0,139,229,0,0,160,227,100,0,139,229,88,0,139,226,197,11,183,238,2,10,13,237,8,16,29,229,196,11,183,238
	.byte 2,10,13,237,8,32,29,229,195,11,183,238,2,10,13,237,8,48,29,229,194,11,183,238,0,10,141,237
bl _p_9

	.byte 88,0,139,226,104,0,139,226,88,0,155,229,104,0,139,229,92,0,155,229,108,0,139,229,96,0,155,229,112,0,139,229
	.byte 100,0,155,229,116,0,139,229,16,224,155,229,212,227,158,229,0,0,94,227,0,224,158,21,152,192,155,229,12,0,160,225
	.byte 148,0,139,229,104,0,139,226,104,16,155,229,108,32,155,229,112,48,155,229,116,0,155,229,0,0,141,229,148,0,155,229
	.byte 0,192,156,229,15,224,160,225,172,240,156,229,16,224,155,229,24,228,158,229,0,0,94,227,0,224,158,21,10,0,160,225
	.byte 32,0,154,229,140,0,139,229,0,0,159,229,0,0,0,234
	.long _mono_aot_SampleProject_got - . + 56
	.byte 0,0,159,231,144,0,139,229,16,224,155,229,72,228,158,229,0,0,94,227,0,224,158,21,144,0,155,229
bl _p_10

	.byte 136,0,139,229,16,224,155,229,100,228,158,229,0,0,94,227,0,224,158,21,0,0,160,227,16,224,155,229,120,228,158,229
	.byte 0,0,94,227,0,224,158,21,136,16,155,229,140,48,155,229,3,0,160,225,0,32,160,227,0,48,147,229,15,224,160,225
	.byte 32,241,147,229,16,224,155,229,164,228,158,229,0,0,94,227,0,224,158,21,10,0,160,225,16,224,155,229,184,228,158,229
	.byte 0,0,94,227,0,224,158,21,10,0,160,225,0,16,154,229,15,224,160,225,104,240,145,229,132,0,139,229,16,224,155,229
	.byte 220,228,158,229,0,0,94,227,0,224,158,21,10,0,160,225,32,0,154,229,128,0,139,229,16,224,155,229,248,228,158,229
	.byte 0,0,94,227,0,224,158,21,128,16,155,229,132,32,155,229,2,0,160,225,0,32,146,229,15,224,160,225,12,241,146,229
	.byte 16,224,155,229,32,229,158,229,0,0,94,227,0,224,158,21,10,0,160,225,32,0,154,229,124,0,139,229,10,0,160,225
	.byte 0,0,90,227,44,0,0,11,0,0,159,229,0,0,0,234
	.long _mono_aot_SampleProject_got - . + 60
	.byte 0,0,159,231
bl _p_11

	.byte 16,160,128,229,0,16,159,229,0,0,0,234
	.long _mono_aot_SampleProject_got - . + 64
	.byte 1,16,159,231,20,16,128,229,0,16,159,229,0,0,0,234
	.long _mono_aot_SampleProject_got - . + 68
	.byte 1,16,159,231,28,16,128,229,0,16,159,229,0,0,0,234
	.long _mono_aot_SampleProject_got - . + 72
	.byte 1,16,159,231,20,32,145,229,12,32,128,229,16,16,145,229,8,16,128,229,120,0,139,229,16,224,155,229,172,229,158,229
	.byte 0,0,94,227,0,224,158,21,120,16,155,229,124,32,155,229,2,0,160,225,0,224,210,229
bl _p_12

	.byte 16,224,155,229,208,229,158,229,0,0,94,227,0,224,158,21,16,224,155,229,224,229,158,229,0,0,94,227,0,224,158,21
	.byte 236,208,139,226,0,13,189,232,128,128,189,232,14,16,160,225,0,0,159,229
bl _p_13

	.byte 72,1,0,2

Lme_a:
.text
	.align 2
	.no_dead_strip _SampleProject_SampleProjectViewController_CatImageButtonTapped_object_System_EventArgs
_SampleProject_SampleProjectViewController_CatImageButtonTapped_object_System_EventArgs:

	.byte 128,64,45,233,13,112,160,225,96,13,45,233,92,208,77,226,13,176,160,225,0,160,160,225,32,16,139,229,36,32,139,229
	.byte 0,0,159,229,0,0,0,234
	.long _mono_aot_SampleProject_got - . + 76
	.byte 0,0,159,231,8,0,139,229,8,224,155,229,0,224,158,229,12,224,139,229,0,96,160,227,0,80,160,227,8,224,155,229
	.byte 80,224,158,229,0,0,94,227,0,224,158,21,12,224,155,229,0,224,158,229,8,224,155,229,104,224,158,229,0,0,94,227
	.byte 0,224,158,21,8,224,155,229,120,224,158,229,0,0,94,227,0,224,158,21,0,0,159,229,0,0,0,234
	.long _mono_aot_SampleProject_got - . + 80
	.byte 0,0,159,231
bl _p_11

	.byte 84,0,139,229
bl _p_14

	.byte 84,0,155,229,0,96,160,225,8,224,155,229,172,224,158,229,0,0,94,227,0,224,158,21,6,0,160,225,76,0,139,229
	.byte 0,0,159,229,0,0,0,234
	.long _mono_aot_SampleProject_got - . + 56
	.byte 0,0,159,231,80,0,139,229,8,224,155,229,216,224,158,229,0,0,94,227,0,224,158,21,80,0,155,229
bl _p_10

	.byte 72,0,139,229,8,224,155,229,244,224,158,229,0,0,94,227,0,224,158,21,72,16,155,229,76,32,155,229,2,0,160,225
	.byte 0,224,210,229
bl _p_15

	.byte 8,224,155,229,24,225,158,229,0,0,94,227,0,224,158,21,6,0,160,225,64,0,139,229,10,0,160,225,32,0,154,229
	.byte 68,0,139,229,8,224,155,229,60,225,158,229,0,0,94,227,0,224,158,21,68,32,155,229,16,16,139,226,2,0,160,225
	.byte 0,32,146,229,15,224,160,225,176,240,146,229,8,224,155,229,100,225,158,229,0,0,94,227,0,224,158,21,64,192,155,229
	.byte 12,0,160,225,60,0,139,229,16,0,139,226,16,16,155,229,20,32,155,229,24,48,155,229,28,0,155,229,0,0,141,229
	.byte 60,0,155,229,0,224,220,229
bl _p_16

	.byte 8,224,155,229,164,225,158,229,0,0,94,227,0,224,158,21,6,0,160,225,52,0,139,229,10,0,160,225,32,0,154,229
	.byte 56,0,139,229,8,224,155,229,200,225,158,229,0,0,94,227,0,224,158,21,56,16,155,229,1,0,160,225,0,16,145,229
	.byte 15,224,160,225,148,240,145,229,48,0,139,229,8,224,155,229,240,225,158,229,0,0,94,227,0,224,158,21,48,16,155,229
	.byte 52,32,155,229,2,0,160,225,0,224,210,229
bl _p_17

	.byte 8,224,155,229,20,226,158,229,0,0,94,227,0,224,158,21,6,0,160,225,44,0,139,229,0,0,160,227,0,0,160,227
	.byte 8,224,155,229,52,226,158,229,0,0,94,227,0,224,158,21,0,0,159,229,0,0,0,234
	.long _mono_aot_SampleProject_got - . + 84
	.byte 0,0,159,231
bl _p_5

	.byte 44,16,155,229,40,0,139,229,0,32,160,227,0,48,160,227
bl _p_18

	.byte 40,0,155,229,0,80,160,225,8,224,155,229,116,226,158,229,0,0,94,227,0,224,158,21,5,0,160,225,10,0,160,225
	.byte 0,0,160,227,8,224,155,229,144,226,158,229,0,0,94,227,0,224,158,21,5,0,160,225,10,16,160,225,0,32,160,227
	.byte 0,224,213,229
bl _p_19

	.byte 8,224,155,229,180,226,158,229,0,0,94,227,0,224,158,21,8,224,155,229,196,226,158,229,0,0,94,227,0,224,158,21
	.byte 92,208,139,226,96,13,189,232,128,128,189,232

Lme_b:
.text
	.align 2
	.no_dead_strip _SampleProject_SampleProjectViewController_ViewWillAppear_bool
_SampleProject_SampleProjectViewController_ViewWillAppear_bool:

	.byte 128,64,45,233,13,112,160,225,0,1,45,233,28,208,77,226,8,0,141,229,12,16,205,229,0,0,159,229,0,0,0,234
	.long _mono_aot_SampleProject_got - . + 88
	.byte 0,0,159,231,0,0,141,229,0,224,157,229,0,224,158,229,4,224,141,229,0,224,157,229,64,224,158,229,0,0,94,227
	.byte 0,224,158,21,4,224,157,229,0,224,158,229,0,224,157,229,88,224,158,229,0,0,94,227,0,224,158,21,0,224,157,229
	.byte 104,224,158,229,0,0,94,227,0,224,158,21,8,0,157,229,16,0,141,229,12,0,221,229,20,0,141,229,0,224,157,229
	.byte 136,224,158,229,0,0,94,227,0,224,158,21,16,0,157,229,20,16,157,229
bl _p_20

	.byte 0,224,157,229,164,224,158,229,0,0,94,227,0,224,158,21,0,224,157,229,180,224,158,229,0,0,94,227,0,224,158,21
	.byte 28,208,141,226,0,1,189,232,128,128,189,232

Lme_c:
.text
	.align 2
	.no_dead_strip _SampleProject_SampleProjectViewController_ViewDidAppear_bool
_SampleProject_SampleProjectViewController_ViewDidAppear_bool:

	.byte 128,64,45,233,13,112,160,225,0,1,45,233,28,208,77,226,8,0,141,229,12,16,205,229,0,0,159,229,0,0,0,234
	.long _mono_aot_SampleProject_got - . + 92
	.byte 0,0,159,231,0,0,141,229,0,224,157,229,0,224,158,229,4,224,141,229,0,224,157,229,64,224,158,229,0,0,94,227
	.byte 0,224,158,21,4,224,157,229,0,224,158,229,0,224,157,229,88,224,158,229,0,0,94,227,0,224,158,21,0,224,157,229
	.byte 104,224,158,229,0,0,94,227,0,224,158,21,8,0,157,229,16,0,141,229,12,0,221,229,20,0,141,229,0,224,157,229
	.byte 136,224,158,229,0,0,94,227,0,224,158,21,16,0,157,229,20,16,157,229
bl _p_21

	.byte 0,224,157,229,164,224,158,229,0,0,94,227,0,224,158,21,0,224,157,229,180,224,158,229,0,0,94,227,0,224,158,21
	.byte 28,208,141,226,0,1,189,232,128,128,189,232

Lme_d:
.text
	.align 2
	.no_dead_strip _SampleProject_SampleProjectViewController_ViewWillDisappear_bool
_SampleProject_SampleProjectViewController_ViewWillDisappear_bool:

	.byte 128,64,45,233,13,112,160,225,0,1,45,233,28,208,77,226,8,0,141,229,12,16,205,229,0,0,159,229,0,0,0,234
	.long _mono_aot_SampleProject_got - . + 96
	.byte 0,0,159,231,0,0,141,229,0,224,157,229,0,224,158,229,4,224,141,229,0,224,157,229,64,224,158,229,0,0,94,227
	.byte 0,224,158,21,4,224,157,229,0,224,158,229,0,224,157,229,88,224,158,229,0,0,94,227,0,224,158,21,0,224,157,229
	.byte 104,224,158,229,0,0,94,227,0,224,158,21,8,0,157,229,16,0,141,229,12,0,221,229,20,0,141,229,0,224,157,229
	.byte 136,224,158,229,0,0,94,227,0,224,158,21,16,0,157,229,20,16,157,229
bl _p_22

	.byte 0,224,157,229,164,224,158,229,0,0,94,227,0,224,158,21,0,224,157,229,180,224,158,229,0,0,94,227,0,224,158,21
	.byte 28,208,141,226,0,1,189,232,128,128,189,232

Lme_e:
.text
	.align 2
	.no_dead_strip _SampleProject_SampleProjectViewController_ViewDidDisappear_bool
_SampleProject_SampleProjectViewController_ViewDidDisappear_bool:

	.byte 128,64,45,233,13,112,160,225,0,1,45,233,28,208,77,226,8,0,141,229,12,16,205,229,0,0,159,229,0,0,0,234
	.long _mono_aot_SampleProject_got - . + 100
	.byte 0,0,159,231,0,0,141,229,0,224,157,229,0,224,158,229,4,224,141,229,0,224,157,229,64,224,158,229,0,0,94,227
	.byte 0,224,158,21,4,224,157,229,0,224,158,229,0,224,157,229,88,224,158,229,0,0,94,227,0,224,158,21,0,224,157,229
	.byte 104,224,158,229,0,0,94,227,0,224,158,21,8,0,157,229,16,0,141,229,12,0,221,229,20,0,141,229,0,224,157,229
	.byte 136,224,158,229,0,0,94,227,0,224,158,21,16,0,157,229,20,16,157,229
bl _p_23

	.byte 0,224,157,229,164,224,158,229,0,0,94,227,0,224,158,21,0,224,157,229,180,224,158,229,0,0,94,227,0,224,158,21
	.byte 28,208,141,226,0,1,189,232,128,128,189,232

Lme_f:
.text
	.align 2
	.no_dead_strip _SampleProject_SampleProjectViewController_ReleaseDesignerOutlets
_SampleProject_SampleProjectViewController_ReleaseDesignerOutlets:

	.byte 128,64,45,233,13,112,160,225,0,1,45,233,20,208,77,226,8,0,141,229,0,0,159,229,0,0,0,234
	.long _mono_aot_SampleProject_got - . + 104
	.byte 0,0,159,231,0,0,141,229,0,224,157,229,0,224,158,229,4,224,141,229,0,224,157,229,60,224,158,229,0,0,94,227
	.byte 0,224,158,21,4,224,157,229,0,224,158,229,0,224,157,229,84,224,158,229,0,0,94,227,0,224,158,21,0,224,157,229
	.byte 100,224,158,229,0,0,94,227,0,224,158,21,0,224,157,229,116,224,158,229,0,0,94,227,0,224,158,21,20,208,141,226
	.byte 0,1,189,232,128,128,189,232

Lme_10:
.text
	.align 3
methods_end:

	.long 0
.text
	.align 3
method_addresses:
	.no_dead_strip method_addresses
bl _SampleProject_Application__ctor
bl _SampleProject_Application_Main_string__
bl _SampleProject_AppDelegate__ctor
bl _SampleProject_AppDelegate_get_Window
bl _SampleProject_AppDelegate_set_Window_MonoTouch_UIKit_UIWindow
bl _SampleProject_AppDelegate_OnResignActivation_MonoTouch_UIKit_UIApplication
bl _SampleProject_AppDelegate_DidEnterBackground_MonoTouch_UIKit_UIApplication
bl _SampleProject_AppDelegate_WillEnterForeground_MonoTouch_UIKit_UIApplication
bl _SampleProject_AppDelegate_WillTerminate_MonoTouch_UIKit_UIApplication
bl _SampleProject_SampleProjectViewController__ctor_intptr
bl _SampleProject_SampleProjectViewController_ViewDidLoad
bl _SampleProject_SampleProjectViewController_CatImageButtonTapped_object_System_EventArgs
bl _SampleProject_SampleProjectViewController_ViewWillAppear_bool
bl _SampleProject_SampleProjectViewController_ViewDidAppear_bool
bl _SampleProject_SampleProjectViewController_ViewWillDisappear_bool
bl _SampleProject_SampleProjectViewController_ViewDidDisappear_bool
bl _SampleProject_SampleProjectViewController_ReleaseDesignerOutlets
bl method_addresses
method_addresses_end:
.section __TEXT, __const
	.align 3
code_offsets:

	.long 0

.text
	.align 3
unbox_trampolines:
unbox_trampolines_end:

	.long 0
.section __TEXT, __const
	.align 3
method_info_offsets:

	.long 18,10,2,2
	.short 0, 10
	.byte 1,3,4,3,3,3,3,3,3,3,32,9,6,3,3,3,3,255,255,255,255,197
.section __TEXT, __const
	.align 3
extra_method_table:

	.long 11,0,0,0,0,0,0,0
	.long 0,0,0,0,0,0,0,0
	.long 0,0,0,0,0,0,0,0
	.long 0,0,0,0,0,0,0,0
	.long 0,0
.section __TEXT, __const
	.align 3
extra_method_info_offsets:

	.long 0
.section __TEXT, __const
	.align 3
class_name_table:

	.short 11, 1, 11, 4, 0, 0, 0, 0
	.short 0, 0, 0, 0, 0, 0, 0, 0
	.short 0, 0, 0, 0, 0, 2, 0, 3
	.short 0
.section __TEXT, __const
	.align 3
got_info_offsets:

	.long 30,10,3,2
	.short 0, 10, 20
	.byte 62,2,1,1,1,1,1,3,1,1,75,1,1,1,1,1,1,5,3,5,96,2,8,1,4,4,1,1,1,1
.section __TEXT, __const
	.align 3
ex_info_offsets:

	.long 18,10,2,2
	.short 0, 11
	.byte 129,49,31,68,33,43,45,51,51,51,51,131,21,129,165,128,255,67,67,67,67,255,255,255,249,59
.section __TEXT, __const
	.align 3
unwind_info:

	.byte 18,12,13,0,72,14,8,135,2,68,14,12,136,3,142,1,68,14,32,18,12,13,0,72,14,8,135,2,68,14,12,136
	.byte 3,142,1,68,14,40,20,12,13,0,72,14,8,135,2,68,14,16,134,4,136,3,142,1,68,14,32,26,12,13,0,72
	.byte 14,8,135,2,68,14,20,136,5,138,4,139,3,142,1,68,14,128,2,68,13,11,29,12,13,0,72,14,8,135,2,68
	.byte 14,28,133,7,134,6,136,5,138,4,139,3,142,1,68,14,120,68,13,11
.section __TEXT, __const
	.align 3
class_info_offsets:

	.long 4,10,1,2
	.short 0
	.byte 134,242,7,23,65

.text
	.align 4
plt:
_mono_aot_SampleProject_plt:
	.no_dead_strip plt_MonoTouch_UIKit_UIApplication_Main_string___string_string
plt_MonoTouch_UIKit_UIApplication_Main_string___string_string:
_p_1:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_SampleProject_got - . + 120,120
	.no_dead_strip plt_MonoTouch_UIKit_UIApplicationDelegate__ctor
plt_MonoTouch_UIKit_UIApplicationDelegate__ctor:
_p_2:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_SampleProject_got - . + 124,125
	.no_dead_strip plt_MonoTouch_UIKit_UIViewController__ctor_intptr
plt_MonoTouch_UIKit_UIViewController__ctor_intptr:
_p_3:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_SampleProject_got - . + 128,130
	.no_dead_strip plt_MonoTouch_UIKit_UIViewController_ViewDidLoad
plt_MonoTouch_UIKit_UIViewController_ViewDidLoad:
_p_4:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_SampleProject_got - . + 132,135
	.no_dead_strip plt__jit_icall_mono_object_new_specific
plt__jit_icall_mono_object_new_specific:
_p_5:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_SampleProject_got - . + 136,140
	.no_dead_strip plt_MonoTouch_UIKit_UIButton__ctor
plt_MonoTouch_UIKit_UIButton__ctor:
_p_6:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_SampleProject_got - . + 140,167
	.no_dead_strip plt_System_Drawing_RectangleF_get_Width
plt_System_Drawing_RectangleF_get_Width:
_p_7:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_SampleProject_got - . + 144,172
	.no_dead_strip plt_System_Drawing_RectangleF_get_Height
plt_System_Drawing_RectangleF_get_Height:
_p_8:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_SampleProject_got - . + 148,177
	.no_dead_strip plt_System_Drawing_RectangleF__ctor_single_single_single_single
plt_System_Drawing_RectangleF__ctor_single_single_single_single:
_p_9:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_SampleProject_got - . + 152,182
	.no_dead_strip plt_MonoTouch_UIKit_UIImage_FromBundle_string
plt_MonoTouch_UIKit_UIImage_FromBundle_string:
_p_10:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_SampleProject_got - . + 156,187
	.no_dead_strip plt__jit_icall_mono_object_new_fast
plt__jit_icall_mono_object_new_fast:
_p_11:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_SampleProject_got - . + 160,192
	.no_dead_strip plt_MonoTouch_UIKit_UIControl_add_TouchUpInside_System_EventHandler
plt_MonoTouch_UIKit_UIControl_add_TouchUpInside_System_EventHandler:
_p_12:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_SampleProject_got - . + 164,215
	.no_dead_strip plt__jit_icall_mono_arch_throw_corlib_exception
plt__jit_icall_mono_arch_throw_corlib_exception:
_p_13:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_SampleProject_got - . + 168,220
	.no_dead_strip plt_JTSImageViewController_JTSImageInfo__ctor
plt_JTSImageViewController_JTSImageInfo__ctor:
_p_14:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_SampleProject_got - . + 172,255
	.no_dead_strip plt_JTSImageViewController_JTSImageInfo_set_Image_MonoTouch_UIKit_UIImage
plt_JTSImageViewController_JTSImageInfo_set_Image_MonoTouch_UIKit_UIImage:
_p_15:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_SampleProject_got - . + 176,260
	.no_dead_strip plt_JTSImageViewController_JTSImageInfo_set_ReferenceRect_System_Drawing_RectangleF
plt_JTSImageViewController_JTSImageInfo_set_ReferenceRect_System_Drawing_RectangleF:
_p_16:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_SampleProject_got - . + 180,265
	.no_dead_strip plt_JTSImageViewController_JTSImageInfo_set_ReferenceView_MonoTouch_UIKit_UIView
plt_JTSImageViewController_JTSImageInfo_set_ReferenceView_MonoTouch_UIKit_UIView:
_p_17:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_SampleProject_got - . + 184,270
	.no_dead_strip plt_JTSImageViewController_JTSImageViewController__ctor_JTSImageViewController_JTSImageInfo_JTSImageViewController_JTSImageViewController_JTSImageViewControllerMode_JTSImageViewController_JTSImageViewController_JTSImageViewControllerBackgroundStyle
plt_JTSImageViewController_JTSImageViewController__ctor_JTSImageViewController_JTSImageInfo_JTSImageViewController_JTSImageViewController_JTSImageViewControllerMode_JTSImageViewController_JTSImageViewController_JTSImageViewControllerBackgroundStyle:
_p_18:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_SampleProject_got - . + 188,275
	.no_dead_strip plt_JTSImageViewController_JTSImageViewController_ShowFromViewController_MonoTouch_UIKit_UIViewController_JTSImageViewController_JTSImageViewController_JTSImageViewControllerTransition
plt_JTSImageViewController_JTSImageViewController_ShowFromViewController_MonoTouch_UIKit_UIViewController_JTSImageViewController_JTSImageViewController_JTSImageViewControllerTransition:
_p_19:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_SampleProject_got - . + 192,280
	.no_dead_strip plt_MonoTouch_UIKit_UIViewController_ViewWillAppear_bool
plt_MonoTouch_UIKit_UIViewController_ViewWillAppear_bool:
_p_20:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_SampleProject_got - . + 196,285
	.no_dead_strip plt_MonoTouch_UIKit_UIViewController_ViewDidAppear_bool
plt_MonoTouch_UIKit_UIViewController_ViewDidAppear_bool:
_p_21:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_SampleProject_got - . + 200,290
	.no_dead_strip plt_MonoTouch_UIKit_UIViewController_ViewWillDisappear_bool
plt_MonoTouch_UIKit_UIViewController_ViewWillDisappear_bool:
_p_22:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_SampleProject_got - . + 204,295
	.no_dead_strip plt_MonoTouch_UIKit_UIViewController_ViewDidDisappear_bool
plt_MonoTouch_UIKit_UIViewController_ViewDidDisappear_bool:
_p_23:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_SampleProject_got - . + 208,300
plt_end:
.section __TEXT, __const
	.align 3
image_table:

	.long 4
	.asciz "SampleProject"
	.asciz "1AB22FA8-D863-4751-A9F6-1CCB005399CA"
	.asciz ""
	.asciz ""
	.align 3

	.long 0,0,0,0,0
	.asciz "monotouch"
	.asciz "C5FE593A-8E9F-42CC-AC30-E167F87E86A9"
	.asciz ""
	.asciz "84e04ff9cfb79065"
	.align 3

	.long 1,0,0,0,0
	.asciz "mscorlib"
	.asciz "34CB4459-4B5D-47BC-AF5D-887A9696EC39"
	.asciz ""
	.asciz "7cec85d7bea7798e"
	.align 3

	.long 1,2,0,5,0
	.asciz "JTSImageViewController"
	.asciz "397B4CA1-34B8-4260-B3F3-B587AA3ACF7E"
	.asciz ""
	.asciz ""
	.align 3

	.long 0,1,0,5400,29537
.data
	.align 3
_mono_aot_SampleProject_got:
	.space 216
got_end:
.section __TEXT, __const
	.align 2
assembly_guid:
	.asciz "1AB22FA8-D863-4751-A9F6-1CCB005399CA"
.section __TEXT, __const
	.align 2
runtime_version:
	.asciz ""
.section __TEXT, __const
	.align 2
assembly_name:
	.asciz "SampleProject"
.data
	.align 3
_mono_aot_file_info:

	.long 102,0
	.align 2
	.long _mono_aot_SampleProject_got
	.align 2
	.long methods
	.align 2
	.long 0
	.align 2
	.long blob
	.align 2
	.long class_name_table
	.align 2
	.long class_info_offsets
	.align 2
	.long method_info_offsets
	.align 2
	.long ex_info_offsets
	.align 2
	.long code_offsets
	.align 2
	.long method_addresses
	.align 2
	.long extra_method_info_offsets
	.align 2
	.long extra_method_table
	.align 2
	.long got_info_offsets
	.align 2
	.long methods_end
	.align 2
	.long unwind_info
	.align 2
	.long mem_end
	.align 2
	.long image_table
	.align 2
	.long plt
	.align 2
	.long plt_end
	.align 2
	.long assembly_guid
	.align 2
	.long runtime_version
	.align 2
	.long 0
	.align 2
	.long 0
	.align 2
	.long 0
	.align 2
	.long 0
	.align 2
	.long 0
	.align 2
	.long globals
	.align 2
	.long assembly_name
	.align 2
	.long unbox_trampolines
	.align 2
	.long unbox_trampolines_end

	.long 30,216,24,18,14,387000831,0,2041
	.long 0,0,0,0,0,0,0,0
	.long 0,0,0,0,128,4,4,14
	.long 0,0,0,0,0
	.globl _mono_aot_module_SampleProject_info
	.align 2
_mono_aot_module_SampleProject_info:
	.align 2
	.long _mono_aot_file_info
.section __TEXT, __const
	.align 3
blob:

	.byte 0,0,1,4,0,2,5,6,0,1,7,0,1,8,0,1,9,0,1,10,0,1,11,0,1,12,0,1,13,0,1,14
	.byte 0,7,15,16,17,18,19,20,21,0,4,22,23,17,24,0,1,25,0,1,26,0,1,27,0,1,28,0,1,29,12,0
	.byte 39,42,47,40,40,17,0,1,40,40,40,40,40,40,40,40,40,14,2,128,135,1,17,0,25,14,2,129,122,2,6,12
	.byte 50,12,30,2,129,122,2,1,12,0,40,14,2,13,3,14,2,2,3,40,40,40,40,40,3,193,0,3,44,3,193,0
	.byte 4,95,3,193,0,4,35,3,193,0,4,51,7,24,109,111,110,111,95,111,98,106,101,99,116,95,110,101,119,95,115,112
	.byte 101,99,105,102,105,99,0,3,193,0,3,55,3,193,0,1,216,3,193,0,1,209,3,193,0,1,206,3,193,0,3,159
	.byte 7,20,109,111,110,111,95,111,98,106,101,99,116,95,110,101,119,95,102,97,115,116,0,3,193,0,3,82,7,32,109,111
	.byte 110,111,95,97,114,99,104,95,116,104,114,111,119,95,99,111,114,108,105,98,95,101,120,99,101,112,116,105,111,110,0,3
	.byte 195,0,0,199,3,195,0,0,201,3,195,0,0,213,3,195,0,0,215,3,195,0,0,1,3,195,0,0,68,3,193,0
	.byte 4,52,3,193,0,4,48,3,193,0,4,53,3,193,0,4,49,10,0,2,255,255,255,255,255,52,0,0,193,0,0,0
	.byte 20,0,0,12,88,0,100,208,0,0,13,8,0,1,7,88,10,19,6,255,255,255,255,255,52,0,0,1,24,0,1,2
	.byte 1,16,0,1,3,7,48,1,1,4,5,32,0,0,192,255,255,242,16,0,0,30,128,204,68,128,216,208,0,0,13,8
	.byte 0,9,0,68,1,24,1,24,1,4,5,20,0,24,0,4,5,4,1,32,10,0,2,255,255,255,255,255,52,0,0,193
	.byte 0,0,0,24,0,0,14,92,72,104,208,0,0,13,8,0,2,1,72,6,20,10,38,3,255,255,255,255,255,56,0,0
	.byte 1,24,0,0,192,255,255,255,28,0,0,20,124,72,128,136,208,0,0,13,8,6,0,4,0,72,1,28,5,4,8,20
	.byte 10,0,3,255,255,255,255,255,56,0,0,1,24,0,0,192,255,255,255,28,0,0,22,124,72,128,136,208,0,0,13,12
	.byte 208,0,0,13,8,0,3,0,72,2,32,6,20,10,0,4,255,255,255,255,255,56,0,0,1,24,0,1,2,1,16,0
	.byte 0,192,255,255,254,16,0,0,23,128,128,72,128,140,208,0,0,13,12,208,0,0,13,8,0,3,0,72,1,24,1,32
	.byte 10,0,4,255,255,255,255,255,56,0,0,1,24,0,1,2,1,16,0,0,192,255,255,254,16,0,0,23,128,128,72,128
	.byte 140,208,0,0,13,12,208,0,0,13,8,0,3,0,72,1,24,1,32,10,0,4,255,255,255,255,255,56,0,0,1,24
	.byte 0,1,2,1,16,0,0,192,255,255,254,16,0,0,23,128,128,72,128,140,208,0,0,13,12,208,0,0,13,8,0,3
	.byte 0,72,1,24,1,32,10,0,4,255,255,255,255,255,56,0,0,1,24,0,1,2,1,16,0,0,192,255,255,254,16,0
	.byte 0,23,128,128,72,128,140,208,0,0,13,12,208,0,0,13,8,0,3,0,72,1,24,1,32,10,0,5,255,255,255,255
	.byte 255,56,0,0,1,24,0,1,2,7,28,0,1,3,1,16,0,0,192,255,255,247,16,0,0,27,128,156,72,128,168,208
	.byte 0,0,13,12,208,0,0,13,8,0,5,0,72,2,32,5,4,1,16,1,32,10,59,31,255,255,255,255,255,128,136,0
	.byte 0,1,24,0,1,2,1,16,0,1,3,1,20,1,1,4,5,24,0,1,5,1,20,1,1,6,10,52,0,1,7,17
	.byte 72,1,1,8,5,36,1,1,9,5,40,1,1,10,3,64,1,1,11,5,36,1,1,12,2,36,1,1,13,5,36,1
	.byte 1,14,5,40,1,1,15,3,64,1,1,16,5,36,1,1,17,12,56,1,1,18,5,128,164,1,1,19,5,68,0,1
	.byte 20,11,48,1,1,21,5,28,1,1,22,1,20,1,1,23,5,44,0,1,24,1,20,1,1,25,5,36,1,1,26,6
	.byte 28,1,1,27,5,40,0,1,28,18,128,140,1,1,29,5,36,0,0,192,255,255,98,16,0,0,128,254,133,232,128,152
	.byte 134,4,10,208,0,0,11,24,208,0,0,11,40,0,117,0,128,152,1,24,0,16,1,4,0,16,0,4,5,4,0,16
	.byte 1,4,0,16,0,16,0,4,0,4,5,8,5,4,0,16,1,4,5,8,5,20,5,20,1,4,0,16,0,4,0,4
	.byte 5,12,0,24,0,4,0,4,0,8,6,56,2,8,0,20,0,16,5,20,1,12,1,4,0,16,0,4,0,4,5,12
	.byte 0,24,0,4,0,4,0,8,6,56,2,8,0,20,0,16,5,20,1,4,9,16,1,4,1,12,0,72,0,4,0,8
	.byte 0,4,0,8,0,4,0,8,0,4,0,8,5,44,0,20,0,36,0,4,5,8,0,16,1,4,5,8,5,20,0,20
	.byte 0,8,5,16,1,4,0,24,0,4,0,4,0,4,5,8,0,16,1,4,0,16,0,4,0,4,0,12,5,16,1,4
	.byte 5,8,0,24,0,4,0,4,5,8,0,16,1,4,5,8,1,4,0,4,0,4,0,16,0,4,0,4,0,16,0,4
	.byte 0,16,0,4,0,16,0,4,0,4,0,4,11,8,0,24,0,4,0,4,0,0,5,4,1,32,10,86,18,255,255,255
	.byte 255,255,72,0,0,1,24,0,1,2,1,16,0,1,3,6,52,0,1,4,6,44,1,1,5,5,28,1,1,6,5,36
	.byte 0,1,7,7,36,1,1,8,5,40,1,1,9,5,64,0,1,10,7,36,1,1,11,5,40,1,1,12,5,36,0,1
	.byte 13,3,32,1,1,14,6,64,0,1,15,3,28,1,1,16,5,36,0,0,192,255,255,181,16,0,0,128,156,130,204,88
	.byte 130,216,208,0,0,11,32,208,0,0,11,36,10,6,5,0,68,0,88,1,24,0,16,0,16,0,4,0,4,5,8,1
	.byte 4,0,16,1,8,5,20,0,20,5,8,0,24,0,4,0,4,0,0,5,4,0,16,1,8,1,4,5,8,0,24,0
	.byte 4,0,4,5,8,0,20,0,36,0,4,0,0,5,4,0,16,1,8,1,4,5,8,0,20,0,4,0,4,5,12,0
	.byte 24,0,4,0,4,0,0,5,4,0,16,1,8,1,4,1,4,0,16,0,16,0,8,0,4,0,4,0,4,5,8,1
	.byte 4,0,16,1,4,1,4,1,4,0,16,0,4,0,4,0,4,0,4,0,0,5,4,1,32,10,19,6,255,255,255,255
	.byte 255,56,0,0,1,24,0,1,2,1,16,0,1,3,2,32,1,1,4,5,28,0,0,192,255,255,247,16,0,0,29,128
	.byte 188,72,128,200,208,0,0,13,12,208,0,0,13,8,0,6,0,72,1,24,2,32,0,24,5,4,1,32,10,19,6,255
	.byte 255,255,255,255,56,0,0,1,24,0,1,2,1,16,0,1,3,2,32,1,1,4,5,28,0,0,192,255,255,247,16,0
	.byte 0,29,128,188,72,128,200,208,0,0,13,12,208,0,0,13,8,0,6,0,72,1,24,2,32,0,24,5,4,1,32,10
	.byte 19,6,255,255,255,255,255,56,0,0,1,24,0,1,2,1,16,0,1,3,2,32,1,1,4,5,28,0,0,192,255,255
	.byte 247,16,0,0,29,128,188,72,128,200,208,0,0,13,12,208,0,0,13,8,0,6,0,72,1,24,2,32,0,24,5,4
	.byte 1,32,10,19,6,255,255,255,255,255,56,0,0,1,24,0,1,2,1,16,0,1,3,2,32,1,1,4,5,28,0,0
	.byte 192,255,255,247,16,0,0,29,128,188,72,128,200,208,0,0,13,12,208,0,0,13,8,0,6,0,72,1,24,2,32,0
	.byte 24,5,4,1,32,10,0,4,255,255,255,255,255,52,0,0,1,24,0,1,2,1,16,0,0,192,255,255,254,16,0,0
	.byte 17,124,68,128,136,208,0,0,13,8,0,3,0,68,1,24,1,32,0,128,144,8,0,0,1,4,128,144,8,0,0,1
	.byte 194,0,7,204,194,0,7,201,194,0,7,200,194,0,7,198,18,128,162,193,0,0,211,24,0,0,4,193,0,0,226,194
	.byte 0,7,201,193,0,0,211,194,0,7,198,193,0,0,221,193,0,0,212,193,0,0,239,193,0,0,238,193,0,0,237,193
	.byte 0,0,236,193,0,0,228,193,0,0,217,5,4,9,8,6,7,43,128,162,193,0,0,211,36,0,0,4,193,0,0,226
	.byte 194,0,7,201,193,0,0,211,194,0,7,198,193,0,0,221,193,0,0,212,193,0,0,239,193,0,0,238,193,0,0,237
	.byte 193,0,4,38,193,0,4,64,193,0,0,217,193,0,4,42,193,0,4,47,193,0,4,40,193,0,4,54,193,0,4,57
	.byte 193,0,4,59,193,0,4,63,193,0,4,62,193,0,4,61,193,0,4,60,193,0,4,59,193,0,4,58,193,0,4,57
	.byte 193,0,4,56,193,0,4,55,193,0,4,54,15,13,11,193,0,4,50,16,14,193,0,4,47,193,0,4,46,193,0,4
	.byte 45,193,0,4,44,193,0,4,43,193,0,4,42,193,0,4,41,193,0,4,40,193,0,4,39,98,111,101,104,109,0
.section __TEXT, __const
	.align 3
Lglobals_hash:

	.short 11, 0, 0, 0, 0, 0, 0, 0
	.short 0, 0, 0, 0, 0, 0, 0, 0
	.short 0, 0, 0, 0, 0, 0, 0
.data
	.align 3
globals:
	.align 2
	.long Lglobals_hash

	.long 0,0
.section __DWARF, __debug_info,regular,debug
LTDIE_1:

	.byte 17
	.asciz "System_Object"

	.byte 8,7
	.asciz "System_Object"

LDIFF_SYM3=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM3
LTDIE_1_POINTER:

	.byte 13
LDIFF_SYM4=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM4
LTDIE_1_REFERENCE:

	.byte 14
LDIFF_SYM5=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM5
LTDIE_0:

	.byte 5
	.asciz "SampleProject_Application"

	.byte 8,16
LDIFF_SYM6=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM6
	.byte 2,35,0,0,7
	.asciz "SampleProject_Application"

LDIFF_SYM7=LTDIE_0 - Ldebug_info_start
	.long LDIFF_SYM7
LTDIE_0_POINTER:

	.byte 13
LDIFF_SYM8=LTDIE_0 - Ldebug_info_start
	.long LDIFF_SYM8
LTDIE_0_REFERENCE:

	.byte 14
LDIFF_SYM9=LTDIE_0 - Ldebug_info_start
	.long LDIFF_SYM9
	.byte 2
	.asciz "SampleProject.Application:.ctor"
	.long _SampleProject_Application__ctor
	.long Lme_0

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM10=LTDIE_0_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM10
	.byte 2,125,8,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM11=Lfde0_end - Lfde0_start
	.long LDIFF_SYM11
Lfde0_start:

	.long 0
	.align 2
	.long _SampleProject_Application__ctor

LDIFF_SYM12=Lme_0 - _SampleProject_Application__ctor
	.long LDIFF_SYM12
	.byte 12,13,0,72,14,8,135,2,68,14,12,136,3,142,1,68,14,32
	.align 2
Lfde0_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "SampleProject.Application:Main"
	.long _SampleProject_Application_Main_string__
	.long Lme_1

	.byte 2,118,16,3
	.asciz "args"

LDIFF_SYM13=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM13
	.byte 2,125,8,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM14=Lfde1_end - Lfde1_start
	.long LDIFF_SYM14
Lfde1_start:

	.long 0
	.align 2
	.long _SampleProject_Application_Main_string__

LDIFF_SYM15=Lme_1 - _SampleProject_Application_Main_string__
	.long LDIFF_SYM15
	.byte 12,13,0,72,14,8,135,2,68,14,12,136,3,142,1,68,14,40
	.align 2
Lfde1_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_5:

	.byte 8
	.asciz "_Flags"

	.byte 1
LDIFF_SYM16=LDIE_U1 - Ldebug_info_start
	.long LDIFF_SYM16
	.byte 9
	.asciz "Disposed"

	.byte 1,9
	.asciz "NativeRef"

	.byte 2,9
	.asciz "IsDirectBinding"

	.byte 4,9
	.asciz "RegisteredToggleRef"

	.byte 8,9
	.asciz "InFinalizerQueue"

	.byte 16,0,7
	.asciz "_Flags"

LDIFF_SYM17=LTDIE_5 - Ldebug_info_start
	.long LDIFF_SYM17
LTDIE_5_POINTER:

	.byte 13
LDIFF_SYM18=LTDIE_5 - Ldebug_info_start
	.long LDIFF_SYM18
LTDIE_5_REFERENCE:

	.byte 14
LDIFF_SYM19=LTDIE_5 - Ldebug_info_start
	.long LDIFF_SYM19
LTDIE_7:

	.byte 5
	.asciz "System_ValueType"

	.byte 8,16
LDIFF_SYM20=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM20
	.byte 2,35,0,0,7
	.asciz "System_ValueType"

LDIFF_SYM21=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM21
LTDIE_7_POINTER:

	.byte 13
LDIFF_SYM22=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM22
LTDIE_7_REFERENCE:

	.byte 14
LDIFF_SYM23=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM23
LTDIE_6:

	.byte 5
	.asciz "System_Boolean"

	.byte 9,16
LDIFF_SYM24=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM24
	.byte 2,35,0,6
	.asciz "m_value"

LDIFF_SYM25=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM25
	.byte 2,35,8,0,7
	.asciz "System_Boolean"

LDIFF_SYM26=LTDIE_6 - Ldebug_info_start
	.long LDIFF_SYM26
LTDIE_6_POINTER:

	.byte 13
LDIFF_SYM27=LTDIE_6 - Ldebug_info_start
	.long LDIFF_SYM27
LTDIE_6_REFERENCE:

	.byte 14
LDIFF_SYM28=LTDIE_6 - Ldebug_info_start
	.long LDIFF_SYM28
LTDIE_4:

	.byte 5
	.asciz "MonoTouch_Foundation_NSObject"

	.byte 20,16
LDIFF_SYM29=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM29
	.byte 2,35,0,6
	.asciz "handle"

LDIFF_SYM30=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM30
	.byte 2,35,8,6
	.asciz "class_handle"

LDIFF_SYM31=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM31
	.byte 2,35,12,6
	.asciz "flags"

LDIFF_SYM32=LTDIE_5 - Ldebug_info_start
	.long LDIFF_SYM32
	.byte 2,35,16,6
	.asciz "IsDirectBinding"

LDIFF_SYM33=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM33
	.byte 2,35,17,0,7
	.asciz "MonoTouch_Foundation_NSObject"

LDIFF_SYM34=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM34
LTDIE_4_POINTER:

	.byte 13
LDIFF_SYM35=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM35
LTDIE_4_REFERENCE:

	.byte 14
LDIFF_SYM36=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM36
LTDIE_3:

	.byte 5
	.asciz "MonoTouch_UIKit_UIApplicationDelegate"

	.byte 20,16
LDIFF_SYM37=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM37
	.byte 2,35,0,0,7
	.asciz "MonoTouch_UIKit_UIApplicationDelegate"

LDIFF_SYM38=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM38
LTDIE_3_POINTER:

	.byte 13
LDIFF_SYM39=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM39
LTDIE_3_REFERENCE:

	.byte 14
LDIFF_SYM40=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM40
LTDIE_10:

	.byte 5
	.asciz "MonoTouch_UIKit_UIResponder"

	.byte 20,16
LDIFF_SYM41=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM41
	.byte 2,35,0,0,7
	.asciz "MonoTouch_UIKit_UIResponder"

LDIFF_SYM42=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM42
LTDIE_10_POINTER:

	.byte 13
LDIFF_SYM43=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM43
LTDIE_10_REFERENCE:

	.byte 14
LDIFF_SYM44=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM44
LTDIE_9:

	.byte 5
	.asciz "MonoTouch_UIKit_UIView"

	.byte 48,16
LDIFF_SYM45=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM45
	.byte 2,35,0,6
	.asciz "__mt_BackgroundColor_var"

LDIFF_SYM46=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM46
	.byte 2,35,20,6
	.asciz "__mt_GestureRecognizers_var"

LDIFF_SYM47=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM47
	.byte 2,35,24,6
	.asciz "__mt_Layer_var"

LDIFF_SYM48=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM48
	.byte 2,35,28,6
	.asciz "__mt_MotionEffects_var"

LDIFF_SYM49=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM49
	.byte 2,35,32,6
	.asciz "__mt_Subviews_var"

LDIFF_SYM50=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM50
	.byte 2,35,36,6
	.asciz "__mt_Superview_var"

LDIFF_SYM51=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM51
	.byte 2,35,40,6
	.asciz "__mt_TintColor_var"

LDIFF_SYM52=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM52
	.byte 2,35,44,0,7
	.asciz "MonoTouch_UIKit_UIView"

LDIFF_SYM53=LTDIE_9 - Ldebug_info_start
	.long LDIFF_SYM53
LTDIE_9_POINTER:

	.byte 13
LDIFF_SYM54=LTDIE_9 - Ldebug_info_start
	.long LDIFF_SYM54
LTDIE_9_REFERENCE:

	.byte 14
LDIFF_SYM55=LTDIE_9 - Ldebug_info_start
	.long LDIFF_SYM55
LTDIE_8:

	.byte 5
	.asciz "MonoTouch_UIKit_UIWindow"

	.byte 52,16
LDIFF_SYM56=LTDIE_9 - Ldebug_info_start
	.long LDIFF_SYM56
	.byte 2,35,0,6
	.asciz "__mt_RootViewController_var"

LDIFF_SYM57=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM57
	.byte 2,35,48,0,7
	.asciz "MonoTouch_UIKit_UIWindow"

LDIFF_SYM58=LTDIE_8 - Ldebug_info_start
	.long LDIFF_SYM58
LTDIE_8_POINTER:

	.byte 13
LDIFF_SYM59=LTDIE_8 - Ldebug_info_start
	.long LDIFF_SYM59
LTDIE_8_REFERENCE:

	.byte 14
LDIFF_SYM60=LTDIE_8 - Ldebug_info_start
	.long LDIFF_SYM60
LTDIE_2:

	.byte 5
	.asciz "SampleProject_AppDelegate"

	.byte 24,16
LDIFF_SYM61=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM61
	.byte 2,35,0,6
	.asciz "<Window>k__BackingField"

LDIFF_SYM62=LTDIE_8_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM62
	.byte 2,35,20,0,7
	.asciz "SampleProject_AppDelegate"

LDIFF_SYM63=LTDIE_2 - Ldebug_info_start
	.long LDIFF_SYM63
LTDIE_2_POINTER:

	.byte 13
LDIFF_SYM64=LTDIE_2 - Ldebug_info_start
	.long LDIFF_SYM64
LTDIE_2_REFERENCE:

	.byte 14
LDIFF_SYM65=LTDIE_2 - Ldebug_info_start
	.long LDIFF_SYM65
	.byte 2
	.asciz "SampleProject.AppDelegate:.ctor"
	.long _SampleProject_AppDelegate__ctor
	.long Lme_2

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM66=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM66
	.byte 2,125,8,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM67=Lfde2_end - Lfde2_start
	.long LDIFF_SYM67
Lfde2_start:

	.long 0
	.align 2
	.long _SampleProject_AppDelegate__ctor

LDIFF_SYM68=Lme_2 - _SampleProject_AppDelegate__ctor
	.long LDIFF_SYM68
	.byte 12,13,0,72,14,8,135,2,68,14,12,136,3,142,1,68,14,32
	.align 2
Lfde2_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "SampleProject.AppDelegate:get_Window"
	.long _SampleProject_AppDelegate_get_Window
	.long Lme_3

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM69=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM69
	.byte 2,125,8,11
	.asciz "V_0"

LDIFF_SYM70=LTDIE_8_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM70
	.byte 1,86,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM71=Lfde3_end - Lfde3_start
	.long LDIFF_SYM71
Lfde3_start:

	.long 0
	.align 2
	.long _SampleProject_AppDelegate_get_Window

LDIFF_SYM72=Lme_3 - _SampleProject_AppDelegate_get_Window
	.long LDIFF_SYM72
	.byte 12,13,0,72,14,8,135,2,68,14,16,134,4,136,3,142,1,68,14,32
	.align 2
Lfde3_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "SampleProject.AppDelegate:set_Window"
	.long _SampleProject_AppDelegate_set_Window_MonoTouch_UIKit_UIWindow
	.long Lme_4

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM73=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM73
	.byte 2,125,8,3
	.asciz "value"

LDIFF_SYM74=LTDIE_8_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM74
	.byte 2,125,12,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM75=Lfde4_end - Lfde4_start
	.long LDIFF_SYM75
Lfde4_start:

	.long 0
	.align 2
	.long _SampleProject_AppDelegate_set_Window_MonoTouch_UIKit_UIWindow

LDIFF_SYM76=Lme_4 - _SampleProject_AppDelegate_set_Window_MonoTouch_UIKit_UIWindow
	.long LDIFF_SYM76
	.byte 12,13,0,72,14,8,135,2,68,14,12,136,3,142,1,68,14,32
	.align 2
Lfde4_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_11:

	.byte 5
	.asciz "MonoTouch_UIKit_UIApplication"

	.byte 20,16
LDIFF_SYM77=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM77
	.byte 2,35,0,0,7
	.asciz "MonoTouch_UIKit_UIApplication"

LDIFF_SYM78=LTDIE_11 - Ldebug_info_start
	.long LDIFF_SYM78
LTDIE_11_POINTER:

	.byte 13
LDIFF_SYM79=LTDIE_11 - Ldebug_info_start
	.long LDIFF_SYM79
LTDIE_11_REFERENCE:

	.byte 14
LDIFF_SYM80=LTDIE_11 - Ldebug_info_start
	.long LDIFF_SYM80
	.byte 2
	.asciz "SampleProject.AppDelegate:OnResignActivation"
	.long _SampleProject_AppDelegate_OnResignActivation_MonoTouch_UIKit_UIApplication
	.long Lme_5

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM81=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM81
	.byte 2,125,8,3
	.asciz "application"

LDIFF_SYM82=LTDIE_11_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM82
	.byte 2,125,12,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM83=Lfde5_end - Lfde5_start
	.long LDIFF_SYM83
Lfde5_start:

	.long 0
	.align 2
	.long _SampleProject_AppDelegate_OnResignActivation_MonoTouch_UIKit_UIApplication

LDIFF_SYM84=Lme_5 - _SampleProject_AppDelegate_OnResignActivation_MonoTouch_UIKit_UIApplication
	.long LDIFF_SYM84
	.byte 12,13,0,72,14,8,135,2,68,14,12,136,3,142,1,68,14,32
	.align 2
Lfde5_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "SampleProject.AppDelegate:DidEnterBackground"
	.long _SampleProject_AppDelegate_DidEnterBackground_MonoTouch_UIKit_UIApplication
	.long Lme_6

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM85=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM85
	.byte 2,125,8,3
	.asciz "application"

LDIFF_SYM86=LTDIE_11_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM86
	.byte 2,125,12,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM87=Lfde6_end - Lfde6_start
	.long LDIFF_SYM87
Lfde6_start:

	.long 0
	.align 2
	.long _SampleProject_AppDelegate_DidEnterBackground_MonoTouch_UIKit_UIApplication

LDIFF_SYM88=Lme_6 - _SampleProject_AppDelegate_DidEnterBackground_MonoTouch_UIKit_UIApplication
	.long LDIFF_SYM88
	.byte 12,13,0,72,14,8,135,2,68,14,12,136,3,142,1,68,14,32
	.align 2
Lfde6_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "SampleProject.AppDelegate:WillEnterForeground"
	.long _SampleProject_AppDelegate_WillEnterForeground_MonoTouch_UIKit_UIApplication
	.long Lme_7

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM89=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM89
	.byte 2,125,8,3
	.asciz "application"

LDIFF_SYM90=LTDIE_11_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM90
	.byte 2,125,12,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM91=Lfde7_end - Lfde7_start
	.long LDIFF_SYM91
Lfde7_start:

	.long 0
	.align 2
	.long _SampleProject_AppDelegate_WillEnterForeground_MonoTouch_UIKit_UIApplication

LDIFF_SYM92=Lme_7 - _SampleProject_AppDelegate_WillEnterForeground_MonoTouch_UIKit_UIApplication
	.long LDIFF_SYM92
	.byte 12,13,0,72,14,8,135,2,68,14,12,136,3,142,1,68,14,32
	.align 2
Lfde7_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "SampleProject.AppDelegate:WillTerminate"
	.long _SampleProject_AppDelegate_WillTerminate_MonoTouch_UIKit_UIApplication
	.long Lme_8

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM93=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM93
	.byte 2,125,8,3
	.asciz "application"

LDIFF_SYM94=LTDIE_11_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM94
	.byte 2,125,12,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM95=Lfde8_end - Lfde8_start
	.long LDIFF_SYM95
Lfde8_start:

	.long 0
	.align 2
	.long _SampleProject_AppDelegate_WillTerminate_MonoTouch_UIKit_UIApplication

LDIFF_SYM96=Lme_8 - _SampleProject_AppDelegate_WillTerminate_MonoTouch_UIKit_UIApplication
	.long LDIFF_SYM96
	.byte 12,13,0,72,14,8,135,2,68,14,12,136,3,142,1,68,14,32
	.align 2
Lfde8_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_13:

	.byte 5
	.asciz "MonoTouch_UIKit_UIViewController"

	.byte 32,16
LDIFF_SYM97=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM97
	.byte 2,35,0,6
	.asciz "__mt_PresentedViewController_var"

LDIFF_SYM98=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM98
	.byte 2,35,20,6
	.asciz "__mt_PresentingViewController_var"

LDIFF_SYM99=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM99
	.byte 2,35,24,6
	.asciz "__mt_View_var"

LDIFF_SYM100=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM100
	.byte 2,35,28,0,7
	.asciz "MonoTouch_UIKit_UIViewController"

LDIFF_SYM101=LTDIE_13 - Ldebug_info_start
	.long LDIFF_SYM101
LTDIE_13_POINTER:

	.byte 13
LDIFF_SYM102=LTDIE_13 - Ldebug_info_start
	.long LDIFF_SYM102
LTDIE_13_REFERENCE:

	.byte 14
LDIFF_SYM103=LTDIE_13 - Ldebug_info_start
	.long LDIFF_SYM103
LTDIE_17:

	.byte 17
	.asciz "System_Collections_Generic_IEqualityComparer`1"

	.byte 8,7
	.asciz "System_Collections_Generic_IEqualityComparer`1"

LDIFF_SYM104=LTDIE_17 - Ldebug_info_start
	.long LDIFF_SYM104
LTDIE_17_POINTER:

	.byte 13
LDIFF_SYM105=LTDIE_17 - Ldebug_info_start
	.long LDIFF_SYM105
LTDIE_17_REFERENCE:

	.byte 14
LDIFF_SYM106=LTDIE_17 - Ldebug_info_start
	.long LDIFF_SYM106
LTDIE_18:

	.byte 5
	.asciz "System_Int32"

	.byte 12,16
LDIFF_SYM107=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM107
	.byte 2,35,0,6
	.asciz "m_value"

LDIFF_SYM108=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM108
	.byte 2,35,8,0,7
	.asciz "System_Int32"

LDIFF_SYM109=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM109
LTDIE_18_POINTER:

	.byte 13
LDIFF_SYM110=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM110
LTDIE_18_REFERENCE:

	.byte 14
LDIFF_SYM111=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM111
LTDIE_16:

	.byte 5
	.asciz "System_Collections_Generic_Dictionary`2"

	.byte 48,16
LDIFF_SYM112=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM112
	.byte 2,35,0,6
	.asciz "table"

LDIFF_SYM113=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM113
	.byte 2,35,8,6
	.asciz "linkSlots"

LDIFF_SYM114=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM114
	.byte 2,35,12,6
	.asciz "keySlots"

LDIFF_SYM115=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM115
	.byte 2,35,16,6
	.asciz "valueSlots"

LDIFF_SYM116=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM116
	.byte 2,35,20,6
	.asciz "hcp"

LDIFF_SYM117=LTDIE_17_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM117
	.byte 2,35,24,6
	.asciz "touchedSlots"

LDIFF_SYM118=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM118
	.byte 2,35,28,6
	.asciz "emptySlot"

LDIFF_SYM119=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM119
	.byte 2,35,32,6
	.asciz "count"

LDIFF_SYM120=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM120
	.byte 2,35,36,6
	.asciz "threshold"

LDIFF_SYM121=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM121
	.byte 2,35,40,6
	.asciz "generation"

LDIFF_SYM122=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM122
	.byte 2,35,44,0,7
	.asciz "System_Collections_Generic_Dictionary`2"

LDIFF_SYM123=LTDIE_16 - Ldebug_info_start
	.long LDIFF_SYM123
LTDIE_16_POINTER:

	.byte 13
LDIFF_SYM124=LTDIE_16 - Ldebug_info_start
	.long LDIFF_SYM124
LTDIE_16_REFERENCE:

	.byte 14
LDIFF_SYM125=LTDIE_16 - Ldebug_info_start
	.long LDIFF_SYM125
LTDIE_15:

	.byte 5
	.asciz "MonoTouch_UIKit_UIControl"

	.byte 52,16
LDIFF_SYM126=LTDIE_9 - Ldebug_info_start
	.long LDIFF_SYM126
	.byte 2,35,0,6
	.asciz "targets"

LDIFF_SYM127=LTDIE_16_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM127
	.byte 2,35,48,0,7
	.asciz "MonoTouch_UIKit_UIControl"

LDIFF_SYM128=LTDIE_15 - Ldebug_info_start
	.long LDIFF_SYM128
LTDIE_15_POINTER:

	.byte 13
LDIFF_SYM129=LTDIE_15 - Ldebug_info_start
	.long LDIFF_SYM129
LTDIE_15_REFERENCE:

	.byte 14
LDIFF_SYM130=LTDIE_15 - Ldebug_info_start
	.long LDIFF_SYM130
LTDIE_14:

	.byte 5
	.asciz "MonoTouch_UIKit_UIButton"

	.byte 52,16
LDIFF_SYM131=LTDIE_15 - Ldebug_info_start
	.long LDIFF_SYM131
	.byte 2,35,0,0,7
	.asciz "MonoTouch_UIKit_UIButton"

LDIFF_SYM132=LTDIE_14 - Ldebug_info_start
	.long LDIFF_SYM132
LTDIE_14_POINTER:

	.byte 13
LDIFF_SYM133=LTDIE_14 - Ldebug_info_start
	.long LDIFF_SYM133
LTDIE_14_REFERENCE:

	.byte 14
LDIFF_SYM134=LTDIE_14 - Ldebug_info_start
	.long LDIFF_SYM134
LTDIE_12:

	.byte 5
	.asciz "SampleProject_SampleProjectViewController"

	.byte 36,16
LDIFF_SYM135=LTDIE_13 - Ldebug_info_start
	.long LDIFF_SYM135
	.byte 2,35,0,6
	.asciz "catImageButton"

LDIFF_SYM136=LTDIE_14_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM136
	.byte 2,35,32,0,7
	.asciz "SampleProject_SampleProjectViewController"

LDIFF_SYM137=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM137
LTDIE_12_POINTER:

	.byte 13
LDIFF_SYM138=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM138
LTDIE_12_REFERENCE:

	.byte 14
LDIFF_SYM139=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM139
	.byte 2
	.asciz "SampleProject.SampleProjectViewController:.ctor"
	.long _SampleProject_SampleProjectViewController__ctor_intptr
	.long Lme_9

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM140=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM140
	.byte 2,125,8,3
	.asciz "handle"

LDIFF_SYM141=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM141
	.byte 2,125,12,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM142=Lfde9_end - Lfde9_start
	.long LDIFF_SYM142
Lfde9_start:

	.long 0
	.align 2
	.long _SampleProject_SampleProjectViewController__ctor_intptr

LDIFF_SYM143=Lme_9 - _SampleProject_SampleProjectViewController__ctor_intptr
	.long LDIFF_SYM143
	.byte 12,13,0,72,14,8,135,2,68,14,12,136,3,142,1,68,14,32
	.align 2
Lfde9_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "SampleProject.SampleProjectViewController:ViewDidLoad"
	.long _SampleProject_SampleProjectViewController_ViewDidLoad
	.long Lme_a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM144=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM144
	.byte 1,90,11
	.asciz "V_0"

LDIFF_SYM145=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM145
	.byte 2,123,24,11
	.asciz "V_1"

LDIFF_SYM146=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM146
	.byte 2,123,40,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM147=Lfde10_end - Lfde10_start
	.long LDIFF_SYM147
Lfde10_start:

	.long 0
	.align 2
	.long _SampleProject_SampleProjectViewController_ViewDidLoad

LDIFF_SYM148=Lme_a - _SampleProject_SampleProjectViewController_ViewDidLoad
	.long LDIFF_SYM148
	.byte 12,13,0,72,14,8,135,2,68,14,20,136,5,138,4,139,3,142,1,68,14,128,2,68,13,11
	.align 2
Lfde10_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_19:

	.byte 5
	.asciz "System_EventArgs"

	.byte 8,16
LDIFF_SYM149=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM149
	.byte 2,35,0,0,7
	.asciz "System_EventArgs"

LDIFF_SYM150=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM150
LTDIE_19_POINTER:

	.byte 13
LDIFF_SYM151=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM151
LTDIE_19_REFERENCE:

	.byte 14
LDIFF_SYM152=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM152
LTDIE_21:

	.byte 5
	.asciz "MonoTouch_UIKit_UIImage"

	.byte 20,16
LDIFF_SYM153=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM153
	.byte 2,35,0,0,7
	.asciz "MonoTouch_UIKit_UIImage"

LDIFF_SYM154=LTDIE_21 - Ldebug_info_start
	.long LDIFF_SYM154
LTDIE_21_POINTER:

	.byte 13
LDIFF_SYM155=LTDIE_21 - Ldebug_info_start
	.long LDIFF_SYM155
LTDIE_21_REFERENCE:

	.byte 14
LDIFF_SYM156=LTDIE_21 - Ldebug_info_start
	.long LDIFF_SYM156
LTDIE_22:

	.byte 5
	.asciz "MonoTouch_Foundation_NSUrl"

	.byte 20,16
LDIFF_SYM157=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM157
	.byte 2,35,0,0,7
	.asciz "MonoTouch_Foundation_NSUrl"

LDIFF_SYM158=LTDIE_22 - Ldebug_info_start
	.long LDIFF_SYM158
LTDIE_22_POINTER:

	.byte 13
LDIFF_SYM159=LTDIE_22 - Ldebug_info_start
	.long LDIFF_SYM159
LTDIE_22_REFERENCE:

	.byte 14
LDIFF_SYM160=LTDIE_22 - Ldebug_info_start
	.long LDIFF_SYM160
LTDIE_24:

	.byte 17
	.asciz "System_Collections_Generic_IEqualityComparer`1"

	.byte 8,7
	.asciz "System_Collections_Generic_IEqualityComparer`1"

LDIFF_SYM161=LTDIE_24 - Ldebug_info_start
	.long LDIFF_SYM161
LTDIE_24_POINTER:

	.byte 13
LDIFF_SYM162=LTDIE_24 - Ldebug_info_start
	.long LDIFF_SYM162
LTDIE_24_REFERENCE:

	.byte 14
LDIFF_SYM163=LTDIE_24 - Ldebug_info_start
	.long LDIFF_SYM163
LTDIE_23:

	.byte 5
	.asciz "System_Collections_Generic_Dictionary`2"

	.byte 48,16
LDIFF_SYM164=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM164
	.byte 2,35,0,6
	.asciz "table"

LDIFF_SYM165=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM165
	.byte 2,35,8,6
	.asciz "linkSlots"

LDIFF_SYM166=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM166
	.byte 2,35,12,6
	.asciz "keySlots"

LDIFF_SYM167=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM167
	.byte 2,35,16,6
	.asciz "valueSlots"

LDIFF_SYM168=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM168
	.byte 2,35,20,6
	.asciz "hcp"

LDIFF_SYM169=LTDIE_24_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM169
	.byte 2,35,24,6
	.asciz "touchedSlots"

LDIFF_SYM170=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM170
	.byte 2,35,28,6
	.asciz "emptySlot"

LDIFF_SYM171=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM171
	.byte 2,35,32,6
	.asciz "count"

LDIFF_SYM172=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM172
	.byte 2,35,36,6
	.asciz "threshold"

LDIFF_SYM173=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM173
	.byte 2,35,40,6
	.asciz "generation"

LDIFF_SYM174=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM174
	.byte 2,35,44,0,7
	.asciz "System_Collections_Generic_Dictionary`2"

LDIFF_SYM175=LTDIE_23 - Ldebug_info_start
	.long LDIFF_SYM175
LTDIE_23_POINTER:

	.byte 13
LDIFF_SYM176=LTDIE_23 - Ldebug_info_start
	.long LDIFF_SYM176
LTDIE_23_REFERENCE:

	.byte 14
LDIFF_SYM177=LTDIE_23 - Ldebug_info_start
	.long LDIFF_SYM177
LTDIE_20:

	.byte 5
	.asciz "JTSImageViewController_JTSImageInfo"

	.byte 56,16
LDIFF_SYM178=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM178
	.byte 2,35,0,6
	.asciz "<Image>k__BackingField"

LDIFF_SYM179=LTDIE_21_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM179
	.byte 2,35,8,6
	.asciz "<PlaceholderImage>k__BackingField"

LDIFF_SYM180=LTDIE_21_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM180
	.byte 2,35,12,6
	.asciz "<ImageURL>k__BackingField"

LDIFF_SYM181=LTDIE_22_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM181
	.byte 2,35,16,6
	.asciz "<CanonicalImageURL>k__BackingField"

LDIFF_SYM182=LTDIE_22_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM182
	.byte 2,35,20,6
	.asciz "<AltText>k__BackingField"

LDIFF_SYM183=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM183
	.byte 2,35,24,6
	.asciz "<Title>k__BackingField"

LDIFF_SYM184=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM184
	.byte 2,35,28,6
	.asciz "<ReferenceRect>k__BackingField"

LDIFF_SYM185=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM185
	.byte 2,35,40,6
	.asciz "<ReferenceView>k__BackingField"

LDIFF_SYM186=LTDIE_9_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM186
	.byte 2,35,32,6
	.asciz "<UserInfo>k__BackingField"

LDIFF_SYM187=LTDIE_23_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM187
	.byte 2,35,36,0,7
	.asciz "JTSImageViewController_JTSImageInfo"

LDIFF_SYM188=LTDIE_20 - Ldebug_info_start
	.long LDIFF_SYM188
LTDIE_20_POINTER:

	.byte 13
LDIFF_SYM189=LTDIE_20 - Ldebug_info_start
	.long LDIFF_SYM189
LTDIE_20_REFERENCE:

	.byte 14
LDIFF_SYM190=LTDIE_20 - Ldebug_info_start
	.long LDIFF_SYM190
LTDIE_26:

	.byte 8
	.asciz "_JTSImageViewControllerMode"

	.byte 4
LDIFF_SYM191=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM191
	.byte 9
	.asciz "Image"

	.byte 0,9
	.asciz "AltText"

	.byte 1,0,7
	.asciz "_JTSImageViewControllerMode"

LDIFF_SYM192=LTDIE_26 - Ldebug_info_start
	.long LDIFF_SYM192
LTDIE_26_POINTER:

	.byte 13
LDIFF_SYM193=LTDIE_26 - Ldebug_info_start
	.long LDIFF_SYM193
LTDIE_26_REFERENCE:

	.byte 14
LDIFF_SYM194=LTDIE_26 - Ldebug_info_start
	.long LDIFF_SYM194
LTDIE_27:

	.byte 8
	.asciz "_JTSImageViewControllerBackgroundStyle"

	.byte 4
LDIFF_SYM195=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM195
	.byte 9
	.asciz "ScaledDimmed"

	.byte 0,9
	.asciz "ScaledDimmedBlurred"

	.byte 1,0,7
	.asciz "_JTSImageViewControllerBackgroundStyle"

LDIFF_SYM196=LTDIE_27 - Ldebug_info_start
	.long LDIFF_SYM196
LTDIE_27_POINTER:

	.byte 13
LDIFF_SYM197=LTDIE_27 - Ldebug_info_start
	.long LDIFF_SYM197
LTDIE_27_REFERENCE:

	.byte 14
LDIFF_SYM198=LTDIE_27 - Ldebug_info_start
	.long LDIFF_SYM198
LTDIE_29:

	.byte 8
	.asciz "MonoTouch_UIKit_UIStatusBarStyle"

	.byte 4
LDIFF_SYM199=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM199
	.byte 9
	.asciz "Default"

	.byte 0,9
	.asciz "BlackTranslucent"

	.byte 1,9
	.asciz "LightContent"

	.byte 1,9
	.asciz "BlackOpaque"

	.byte 2,0,7
	.asciz "MonoTouch_UIKit_UIStatusBarStyle"

LDIFF_SYM200=LTDIE_29 - Ldebug_info_start
	.long LDIFF_SYM200
LTDIE_29_POINTER:

	.byte 13
LDIFF_SYM201=LTDIE_29 - Ldebug_info_start
	.long LDIFF_SYM201
LTDIE_29_REFERENCE:

	.byte 14
LDIFF_SYM202=LTDIE_29 - Ldebug_info_start
	.long LDIFF_SYM202
LTDIE_30:

	.byte 8
	.asciz "MonoTouch_UIKit_UIInterfaceOrientation"

	.byte 4
LDIFF_SYM203=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM203
	.byte 9
	.asciz "Unknown"

	.byte 0,9
	.asciz "Portrait"

	.byte 1,9
	.asciz "PortraitUpsideDown"

	.byte 2,9
	.asciz "LandscapeLeft"

	.byte 4,9
	.asciz "LandscapeRight"

	.byte 3,0,7
	.asciz "MonoTouch_UIKit_UIInterfaceOrientation"

LDIFF_SYM204=LTDIE_30 - Ldebug_info_start
	.long LDIFF_SYM204
LTDIE_30_POINTER:

	.byte 13
LDIFF_SYM205=LTDIE_30 - Ldebug_info_start
	.long LDIFF_SYM205
LTDIE_30_REFERENCE:

	.byte 14
LDIFF_SYM206=LTDIE_30 - Ldebug_info_start
	.long LDIFF_SYM206
LTDIE_28:

	.byte 5
	.asciz "_JTSImageViewControllerStartingInfo"

	.byte 64,16
LDIFF_SYM207=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM207
	.byte 2,35,0,6
	.asciz "<StatusBarHiddenPriorToPresentation>k__BackingField"

LDIFF_SYM208=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM208
	.byte 2,35,8,6
	.asciz "<StatusBarStylePriorToPresentation>k__BackingField"

LDIFF_SYM209=LTDIE_29 - Ldebug_info_start
	.long LDIFF_SYM209
	.byte 2,35,12,6
	.asciz "<StartingReferenceFrameForThumbnail>k__BackingField"

LDIFF_SYM210=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM210
	.byte 2,35,16,6
	.asciz "<StartingReferenceFrameForThumbnailInPresentingViewControllersOriginalOrientation>k__BackingField"

LDIFF_SYM211=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM211
	.byte 2,35,32,6
	.asciz "<StartingReferenceCenterForThumbnail>k__BackingField"

LDIFF_SYM212=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM212
	.byte 2,35,48,6
	.asciz "<StartingInterfaceOrientation>k__BackingField"

LDIFF_SYM213=LTDIE_30 - Ldebug_info_start
	.long LDIFF_SYM213
	.byte 2,35,56,6
	.asciz "<PresentingViewControllerPresentedFromItsUnsupportedOrientation>k__BackingField"

LDIFF_SYM214=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM214
	.byte 2,35,60,0,7
	.asciz "_JTSImageViewControllerStartingInfo"

LDIFF_SYM215=LTDIE_28 - Ldebug_info_start
	.long LDIFF_SYM215
LTDIE_28_POINTER:

	.byte 13
LDIFF_SYM216=LTDIE_28 - Ldebug_info_start
	.long LDIFF_SYM216
LTDIE_28_REFERENCE:

	.byte 14
LDIFF_SYM217=LTDIE_28 - Ldebug_info_start
	.long LDIFF_SYM217
LTDIE_31:

	.byte 5
	.asciz "_JTSImageViewControllerFlags"

	.byte 21,16
LDIFF_SYM218=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM218
	.byte 2,35,0,6
	.asciz "<IsAnimatingAPresentationOrDismissal>k__BackingField"

LDIFF_SYM219=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM219
	.byte 2,35,8,6
	.asciz "<IsDismissing>k__BackingField"

LDIFF_SYM220=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM220
	.byte 2,35,9,6
	.asciz "<IsTransitioningFromInitialModalToInteractiveState>k__BackingField"

LDIFF_SYM221=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM221
	.byte 2,35,10,6
	.asciz "<ViewHasAppeared>k__BackingField"

LDIFF_SYM222=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM222
	.byte 2,35,11,6
	.asciz "<IsRotating>k__BackingField"

LDIFF_SYM223=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM223
	.byte 2,35,12,6
	.asciz "<IsPresented>k__BackingField"

LDIFF_SYM224=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM224
	.byte 2,35,13,6
	.asciz "<RotationTransformIsDirty>k__BackingField"

LDIFF_SYM225=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM225
	.byte 2,35,14,6
	.asciz "<ImageIsFlickingAwayForDismissal>k__BackingField"

LDIFF_SYM226=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM226
	.byte 2,35,15,6
	.asciz "<IsDraggingImage>k__BackingField"

LDIFF_SYM227=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM227
	.byte 2,35,16,6
	.asciz "<ScrollViewIsAnimatingAZoom>k__BackingField"

LDIFF_SYM228=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM228
	.byte 2,35,17,6
	.asciz "<ImageIsBeingReadFromDisk>k__BackingField"

LDIFF_SYM229=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM229
	.byte 2,35,18,6
	.asciz "<IsManuallyResizingTheScrollViewFrame>k__BackingField"

LDIFF_SYM230=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM230
	.byte 2,35,19,6
	.asciz "<ImageDownloadFailed>k__BackingField"

LDIFF_SYM231=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM231
	.byte 2,35,20,0,7
	.asciz "_JTSImageViewControllerFlags"

LDIFF_SYM232=LTDIE_31 - Ldebug_info_start
	.long LDIFF_SYM232
LTDIE_31_POINTER:

	.byte 13
LDIFF_SYM233=LTDIE_31 - Ldebug_info_start
	.long LDIFF_SYM233
LTDIE_31_REFERENCE:

	.byte 14
LDIFF_SYM234=LTDIE_31 - Ldebug_info_start
	.long LDIFF_SYM234
LTDIE_32:

	.byte 5
	.asciz "MonoTouch_UIKit_UIImageView"

	.byte 52,16
LDIFF_SYM235=LTDIE_9 - Ldebug_info_start
	.long LDIFF_SYM235
	.byte 2,35,0,6
	.asciz "__mt_Image_var"

LDIFF_SYM236=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM236
	.byte 2,35,48,0,7
	.asciz "MonoTouch_UIKit_UIImageView"

LDIFF_SYM237=LTDIE_32 - Ldebug_info_start
	.long LDIFF_SYM237
LTDIE_32_POINTER:

	.byte 13
LDIFF_SYM238=LTDIE_32 - Ldebug_info_start
	.long LDIFF_SYM238
LTDIE_32_REFERENCE:

	.byte 14
LDIFF_SYM239=LTDIE_32 - Ldebug_info_start
	.long LDIFF_SYM239
LTDIE_33:

	.byte 5
	.asciz "MonoTouch_UIKit_UIScrollView"

	.byte 56,16
LDIFF_SYM240=LTDIE_9 - Ldebug_info_start
	.long LDIFF_SYM240
	.byte 2,35,0,6
	.asciz "__mt_PanGestureRecognizer_var"

LDIFF_SYM241=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM241
	.byte 2,35,48,6
	.asciz "__mt_WeakDelegate_var"

LDIFF_SYM242=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM242
	.byte 2,35,52,0,7
	.asciz "MonoTouch_UIKit_UIScrollView"

LDIFF_SYM243=LTDIE_33 - Ldebug_info_start
	.long LDIFF_SYM243
LTDIE_33_POINTER:

	.byte 13
LDIFF_SYM244=LTDIE_33 - Ldebug_info_start
	.long LDIFF_SYM244
LTDIE_33_REFERENCE:

	.byte 14
LDIFF_SYM245=LTDIE_33 - Ldebug_info_start
	.long LDIFF_SYM245
LTDIE_34:

	.byte 5
	.asciz "MonoTouch_UIKit_UITextView"

	.byte 96,16
LDIFF_SYM246=LTDIE_33 - Ldebug_info_start
	.long LDIFF_SYM246
	.byte 2,35,0,6
	.asciz "__mt_BeginningOfDocument_var"

LDIFF_SYM247=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM247
	.byte 2,35,56,6
	.asciz "__mt_EndOfDocument_var"

LDIFF_SYM248=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM248
	.byte 2,35,60,6
	.asciz "__mt_LayoutManager_var"

LDIFF_SYM249=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM249
	.byte 2,35,64,6
	.asciz "__mt_MarkedTextRange_var"

LDIFF_SYM250=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM250
	.byte 2,35,68,6
	.asciz "__mt_MarkedTextStyle_var"

LDIFF_SYM251=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM251
	.byte 2,35,72,6
	.asciz "__mt_SelectedTextRange_var"

LDIFF_SYM252=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM252
	.byte 2,35,76,6
	.asciz "__mt_TextContainer_var"

LDIFF_SYM253=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM253
	.byte 2,35,80,6
	.asciz "__mt_WeakDelegate_var"

LDIFF_SYM254=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM254
	.byte 2,35,84,6
	.asciz "__mt_WeakInputDelegate_var"

LDIFF_SYM255=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM255
	.byte 2,35,88,6
	.asciz "__mt_WeakTokenizer_var"

LDIFF_SYM256=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM256
	.byte 2,35,92,0,7
	.asciz "MonoTouch_UIKit_UITextView"

LDIFF_SYM257=LTDIE_34 - Ldebug_info_start
	.long LDIFF_SYM257
LTDIE_34_POINTER:

	.byte 13
LDIFF_SYM258=LTDIE_34 - Ldebug_info_start
	.long LDIFF_SYM258
LTDIE_34_REFERENCE:

	.byte 14
LDIFF_SYM259=LTDIE_34 - Ldebug_info_start
	.long LDIFF_SYM259
LTDIE_35:

	.byte 5
	.asciz "MonoTouch_UIKit_UIProgressView"

	.byte 52,16
LDIFF_SYM260=LTDIE_9 - Ldebug_info_start
	.long LDIFF_SYM260
	.byte 2,35,0,6
	.asciz "__mt_TrackTintColor_var"

LDIFF_SYM261=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM261
	.byte 2,35,48,0,7
	.asciz "MonoTouch_UIKit_UIProgressView"

LDIFF_SYM262=LTDIE_35 - Ldebug_info_start
	.long LDIFF_SYM262
LTDIE_35_POINTER:

	.byte 13
LDIFF_SYM263=LTDIE_35 - Ldebug_info_start
	.long LDIFF_SYM263
LTDIE_35_REFERENCE:

	.byte 14
LDIFF_SYM264=LTDIE_35 - Ldebug_info_start
	.long LDIFF_SYM264
LTDIE_36:

	.byte 5
	.asciz "MonoTouch_UIKit_UIActivityIndicatorView"

	.byte 48,16
LDIFF_SYM265=LTDIE_9 - Ldebug_info_start
	.long LDIFF_SYM265
	.byte 2,35,0,0,7
	.asciz "MonoTouch_UIKit_UIActivityIndicatorView"

LDIFF_SYM266=LTDIE_36 - Ldebug_info_start
	.long LDIFF_SYM266
LTDIE_36_POINTER:

	.byte 13
LDIFF_SYM267=LTDIE_36 - Ldebug_info_start
	.long LDIFF_SYM267
LTDIE_36_REFERENCE:

	.byte 14
LDIFF_SYM268=LTDIE_36 - Ldebug_info_start
	.long LDIFF_SYM268
LTDIE_38:

	.byte 5
	.asciz "MonoTouch_UIKit_UIGestureRecognizer"

	.byte 28,16
LDIFF_SYM269=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM269
	.byte 2,35,0,6
	.asciz "recognizers"

LDIFF_SYM270=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM270
	.byte 2,35,20,6
	.asciz "__mt_WeakDelegate_var"

LDIFF_SYM271=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM271
	.byte 2,35,24,0,7
	.asciz "MonoTouch_UIKit_UIGestureRecognizer"

LDIFF_SYM272=LTDIE_38 - Ldebug_info_start
	.long LDIFF_SYM272
LTDIE_38_POINTER:

	.byte 13
LDIFF_SYM273=LTDIE_38 - Ldebug_info_start
	.long LDIFF_SYM273
LTDIE_38_REFERENCE:

	.byte 14
LDIFF_SYM274=LTDIE_38 - Ldebug_info_start
	.long LDIFF_SYM274
LTDIE_37:

	.byte 5
	.asciz "MonoTouch_UIKit_UITapGestureRecognizer"

	.byte 28,16
LDIFF_SYM275=LTDIE_38 - Ldebug_info_start
	.long LDIFF_SYM275
	.byte 2,35,0,0,7
	.asciz "MonoTouch_UIKit_UITapGestureRecognizer"

LDIFF_SYM276=LTDIE_37 - Ldebug_info_start
	.long LDIFF_SYM276
LTDIE_37_POINTER:

	.byte 13
LDIFF_SYM277=LTDIE_37 - Ldebug_info_start
	.long LDIFF_SYM277
LTDIE_37_REFERENCE:

	.byte 14
LDIFF_SYM278=LTDIE_37 - Ldebug_info_start
	.long LDIFF_SYM278
LTDIE_39:

	.byte 5
	.asciz "MonoTouch_UIKit_UILongPressGestureRecognizer"

	.byte 28,16
LDIFF_SYM279=LTDIE_38 - Ldebug_info_start
	.long LDIFF_SYM279
	.byte 2,35,0,0,7
	.asciz "MonoTouch_UIKit_UILongPressGestureRecognizer"

LDIFF_SYM280=LTDIE_39 - Ldebug_info_start
	.long LDIFF_SYM280
LTDIE_39_POINTER:

	.byte 13
LDIFF_SYM281=LTDIE_39 - Ldebug_info_start
	.long LDIFF_SYM281
LTDIE_39_REFERENCE:

	.byte 14
LDIFF_SYM282=LTDIE_39 - Ldebug_info_start
	.long LDIFF_SYM282
LTDIE_40:

	.byte 5
	.asciz "MonoTouch_UIKit_UIPanGestureRecognizer"

	.byte 28,16
LDIFF_SYM283=LTDIE_38 - Ldebug_info_start
	.long LDIFF_SYM283
	.byte 2,35,0,0,7
	.asciz "MonoTouch_UIKit_UIPanGestureRecognizer"

LDIFF_SYM284=LTDIE_40 - Ldebug_info_start
	.long LDIFF_SYM284
LTDIE_40_POINTER:

	.byte 13
LDIFF_SYM285=LTDIE_40 - Ldebug_info_start
	.long LDIFF_SYM285
LTDIE_40_REFERENCE:

	.byte 14
LDIFF_SYM286=LTDIE_40 - Ldebug_info_start
	.long LDIFF_SYM286
LTDIE_41:

	.byte 5
	.asciz "MonoTouch_UIKit_UIDynamicAnimator"

	.byte 24,16
LDIFF_SYM287=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM287
	.byte 2,35,0,6
	.asciz "__mt_Behaviors_var"

LDIFF_SYM288=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM288
	.byte 2,35,20,0,7
	.asciz "MonoTouch_UIKit_UIDynamicAnimator"

LDIFF_SYM289=LTDIE_41 - Ldebug_info_start
	.long LDIFF_SYM289
LTDIE_41_POINTER:

	.byte 13
LDIFF_SYM290=LTDIE_41 - Ldebug_info_start
	.long LDIFF_SYM290
LTDIE_41_REFERENCE:

	.byte 14
LDIFF_SYM291=LTDIE_41 - Ldebug_info_start
	.long LDIFF_SYM291
LTDIE_43:

	.byte 5
	.asciz "MonoTouch_UIKit_UIDynamicBehavior"

	.byte 20,16
LDIFF_SYM292=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM292
	.byte 2,35,0,0,7
	.asciz "MonoTouch_UIKit_UIDynamicBehavior"

LDIFF_SYM293=LTDIE_43 - Ldebug_info_start
	.long LDIFF_SYM293
LTDIE_43_POINTER:

	.byte 13
LDIFF_SYM294=LTDIE_43 - Ldebug_info_start
	.long LDIFF_SYM294
LTDIE_43_REFERENCE:

	.byte 14
LDIFF_SYM295=LTDIE_43 - Ldebug_info_start
	.long LDIFF_SYM295
LTDIE_42:

	.byte 5
	.asciz "MonoTouch_UIKit_UIAttachmentBehavior"

	.byte 20,16
LDIFF_SYM296=LTDIE_43 - Ldebug_info_start
	.long LDIFF_SYM296
	.byte 2,35,0,0,7
	.asciz "MonoTouch_UIKit_UIAttachmentBehavior"

LDIFF_SYM297=LTDIE_42 - Ldebug_info_start
	.long LDIFF_SYM297
LTDIE_42_POINTER:

	.byte 13
LDIFF_SYM298=LTDIE_42 - Ldebug_info_start
	.long LDIFF_SYM298
LTDIE_42_REFERENCE:

	.byte 14
LDIFF_SYM299=LTDIE_42 - Ldebug_info_start
	.long LDIFF_SYM299
LTDIE_44:

	.byte 8
	.asciz "_JTSImageViewControllerTransition"

	.byte 4
LDIFF_SYM300=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM300
	.byte 9
	.asciz "FromOriginalPosition"

	.byte 0,9
	.asciz "FromOffscreen"

	.byte 1,0,7
	.asciz "_JTSImageViewControllerTransition"

LDIFF_SYM301=LTDIE_44 - Ldebug_info_start
	.long LDIFF_SYM301
LTDIE_44_POINTER:

	.byte 13
LDIFF_SYM302=LTDIE_44 - Ldebug_info_start
	.long LDIFF_SYM302
LTDIE_44_REFERENCE:

	.byte 14
LDIFF_SYM303=LTDIE_44 - Ldebug_info_start
	.long LDIFF_SYM303
LTDIE_45:

	.byte 5
	.asciz "_JTSImageViewControllerDismissalDelegate"

	.byte 8,16
LDIFF_SYM304=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM304
	.byte 2,35,0,0,7
	.asciz "_JTSImageViewControllerDismissalDelegate"

LDIFF_SYM305=LTDIE_45 - Ldebug_info_start
	.long LDIFF_SYM305
LTDIE_45_POINTER:

	.byte 13
LDIFF_SYM306=LTDIE_45 - Ldebug_info_start
	.long LDIFF_SYM306
LTDIE_45_REFERENCE:

	.byte 14
LDIFF_SYM307=LTDIE_45 - Ldebug_info_start
	.long LDIFF_SYM307
LTDIE_46:

	.byte 5
	.asciz "_JTSImageViewControllerOptionsDelegate"

	.byte 8,16
LDIFF_SYM308=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM308
	.byte 2,35,0,0,7
	.asciz "_JTSImageViewControllerOptionsDelegate"

LDIFF_SYM309=LTDIE_46 - Ldebug_info_start
	.long LDIFF_SYM309
LTDIE_46_POINTER:

	.byte 13
LDIFF_SYM310=LTDIE_46 - Ldebug_info_start
	.long LDIFF_SYM310
LTDIE_46_REFERENCE:

	.byte 14
LDIFF_SYM311=LTDIE_46 - Ldebug_info_start
	.long LDIFF_SYM311
LTDIE_47:

	.byte 5
	.asciz "_JTSImageViewControllerInteractionsDelegate"

	.byte 8,16
LDIFF_SYM312=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM312
	.byte 2,35,0,0,7
	.asciz "_JTSImageViewControllerInteractionsDelegate"

LDIFF_SYM313=LTDIE_47 - Ldebug_info_start
	.long LDIFF_SYM313
LTDIE_47_POINTER:

	.byte 13
LDIFF_SYM314=LTDIE_47 - Ldebug_info_start
	.long LDIFF_SYM314
LTDIE_47_REFERENCE:

	.byte 14
LDIFF_SYM315=LTDIE_47 - Ldebug_info_start
	.long LDIFF_SYM315
LTDIE_48:

	.byte 5
	.asciz "_JTSImageViewControllerAccessibilityDelegate"

	.byte 8,16
LDIFF_SYM316=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM316
	.byte 2,35,0,0,7
	.asciz "_JTSImageViewControllerAccessibilityDelegate"

LDIFF_SYM317=LTDIE_48 - Ldebug_info_start
	.long LDIFF_SYM317
LTDIE_48_POINTER:

	.byte 13
LDIFF_SYM318=LTDIE_48 - Ldebug_info_start
	.long LDIFF_SYM318
LTDIE_48_REFERENCE:

	.byte 14
LDIFF_SYM319=LTDIE_48 - Ldebug_info_start
	.long LDIFF_SYM319
LTDIE_25:

	.byte 5
	.asciz "JTSImageViewController_JTSImageViewController"

	.byte 196,1,16
LDIFF_SYM320=LTDIE_13 - Ldebug_info_start
	.long LDIFF_SYM320
	.byte 2,35,0,6
	.asciz "<ImageInfo>k__BackingField"

LDIFF_SYM321=LTDIE_20_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM321
	.byte 2,35,32,6
	.asciz "<Image>k__BackingField"

LDIFF_SYM322=LTDIE_21_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM322
	.byte 2,35,36,6
	.asciz "<Mode>k__BackingField"

LDIFF_SYM323=LTDIE_26 - Ldebug_info_start
	.long LDIFF_SYM323
	.byte 3,35,132,1,6
	.asciz "<BackgroundStyle>k__BackingField"

LDIFF_SYM324=LTDIE_27 - Ldebug_info_start
	.long LDIFF_SYM324
	.byte 3,35,136,1,6
	.asciz "<StartingInfo>k__BackingField"

LDIFF_SYM325=LTDIE_28_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM325
	.byte 2,35,40,6
	.asciz "<Flags>k__BackingField"

LDIFF_SYM326=LTDIE_31_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM326
	.byte 2,35,44,6
	.asciz "<LastUsedOrientation>k__BackingField"

LDIFF_SYM327=LTDIE_30 - Ldebug_info_start
	.long LDIFF_SYM327
	.byte 3,35,140,1,6
	.asciz "<CurrentSnapshotRotationTransform>k__BackingField"

LDIFF_SYM328=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM328
	.byte 3,35,144,1,6
	.asciz "<ProgressContainer>k__BackingField"

LDIFF_SYM329=LTDIE_9_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM329
	.byte 2,35,48,6
	.asciz "<OuterContainerForScrollView>k__BackingField"

LDIFF_SYM330=LTDIE_9_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM330
	.byte 2,35,52,6
	.asciz "<SnapshotView>k__BackingField"

LDIFF_SYM331=LTDIE_9_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM331
	.byte 2,35,56,6
	.asciz "<BlurredSnapshotView>k__BackingField"

LDIFF_SYM332=LTDIE_9_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM332
	.byte 2,35,60,6
	.asciz "<BlackBackdrop>k__BackingField"

LDIFF_SYM333=LTDIE_9_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM333
	.byte 2,35,64,6
	.asciz "<ImageView>k__BackingField"

LDIFF_SYM334=LTDIE_32_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM334
	.byte 2,35,68,6
	.asciz "<ScrollView>k__BackingField"

LDIFF_SYM335=LTDIE_33_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM335
	.byte 2,35,72,6
	.asciz "<TextView>k__BackingField"

LDIFF_SYM336=LTDIE_34_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM336
	.byte 2,35,76,6
	.asciz "<ProgressView>k__BackingField"

LDIFF_SYM337=LTDIE_35_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM337
	.byte 2,35,80,6
	.asciz "<Spinner>k__BackingField"

LDIFF_SYM338=LTDIE_36_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM338
	.byte 2,35,84,6
	.asciz "<SingleTapperPhoto>k__BackingField"

LDIFF_SYM339=LTDIE_37_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM339
	.byte 2,35,88,6
	.asciz "<DoubleTapperPhoto>k__BackingField"

LDIFF_SYM340=LTDIE_37_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM340
	.byte 2,35,92,6
	.asciz "<SingleTapperText>k__BackingField"

LDIFF_SYM341=LTDIE_37_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM341
	.byte 2,35,96,6
	.asciz "<LongPresserPhoto>k__BackingField"

LDIFF_SYM342=LTDIE_39_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM342
	.byte 2,35,100,6
	.asciz "<PanRecognizer>k__BackingField"

LDIFF_SYM343=LTDIE_40_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM343
	.byte 2,35,104,6
	.asciz "<Animator>k__BackingField"

LDIFF_SYM344=LTDIE_41_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM344
	.byte 2,35,108,6
	.asciz "<AttachmentBehavior>k__BackingField"

LDIFF_SYM345=LTDIE_42_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM345
	.byte 2,35,112,6
	.asciz "<ImageDragStartingPoint>k__BackingField"

LDIFF_SYM346=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM346
	.byte 3,35,168,1,6
	.asciz "<ImageDragOffsetFromActualTranslation>k__BackingField"

LDIFF_SYM347=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM347
	.byte 3,35,176,1,6
	.asciz "<ImageDragOffsetFromImageCenter>k__BackingField"

LDIFF_SYM348=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM348
	.byte 3,35,184,1,6
	.asciz "<Transition>k__BackingField"

LDIFF_SYM349=LTDIE_44 - Ldebug_info_start
	.long LDIFF_SYM349
	.byte 3,35,192,1,6
	.asciz "<DismissalDelegate>k__BackingField"

LDIFF_SYM350=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM350
	.byte 2,35,116,6
	.asciz "<OptionsDelegate>k__BackingField"

LDIFF_SYM351=LTDIE_46_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM351
	.byte 2,35,120,6
	.asciz "<InteractionDelegate>k__BackingField"

LDIFF_SYM352=LTDIE_47_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM352
	.byte 2,35,124,6
	.asciz "<AccessibilityDelegate>k__BackingField"

LDIFF_SYM353=LTDIE_48_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM353
	.byte 3,35,128,1,0,7
	.asciz "JTSImageViewController_JTSImageViewController"

LDIFF_SYM354=LTDIE_25 - Ldebug_info_start
	.long LDIFF_SYM354
LTDIE_25_POINTER:

	.byte 13
LDIFF_SYM355=LTDIE_25 - Ldebug_info_start
	.long LDIFF_SYM355
LTDIE_25_REFERENCE:

	.byte 14
LDIFF_SYM356=LTDIE_25 - Ldebug_info_start
	.long LDIFF_SYM356
	.byte 2
	.asciz "SampleProject.SampleProjectViewController:CatImageButtonTapped"
	.long _SampleProject_SampleProjectViewController_CatImageButtonTapped_object_System_EventArgs
	.long Lme_b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM357=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM357
	.byte 1,90,3
	.asciz "sender"

LDIFF_SYM358=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM358
	.byte 2,123,32,3
	.asciz "e"

LDIFF_SYM359=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM359
	.byte 2,123,36,11
	.asciz "imageInfo"

LDIFF_SYM360=LTDIE_20_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM360
	.byte 1,86,11
	.asciz "imageViewer"

LDIFF_SYM361=LTDIE_25_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM361
	.byte 1,85,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM362=Lfde11_end - Lfde11_start
	.long LDIFF_SYM362
Lfde11_start:

	.long 0
	.align 2
	.long _SampleProject_SampleProjectViewController_CatImageButtonTapped_object_System_EventArgs

LDIFF_SYM363=Lme_b - _SampleProject_SampleProjectViewController_CatImageButtonTapped_object_System_EventArgs
	.long LDIFF_SYM363
	.byte 12,13,0,72,14,8,135,2,68,14,28,133,7,134,6,136,5,138,4,139,3,142,1,68,14,120,68,13,11
	.align 2
Lfde11_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "SampleProject.SampleProjectViewController:ViewWillAppear"
	.long _SampleProject_SampleProjectViewController_ViewWillAppear_bool
	.long Lme_c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM364=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM364
	.byte 2,125,8,3
	.asciz "animated"

LDIFF_SYM365=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM365
	.byte 2,125,12,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM366=Lfde12_end - Lfde12_start
	.long LDIFF_SYM366
Lfde12_start:

	.long 0
	.align 2
	.long _SampleProject_SampleProjectViewController_ViewWillAppear_bool

LDIFF_SYM367=Lme_c - _SampleProject_SampleProjectViewController_ViewWillAppear_bool
	.long LDIFF_SYM367
	.byte 12,13,0,72,14,8,135,2,68,14,12,136,3,142,1,68,14,40
	.align 2
Lfde12_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "SampleProject.SampleProjectViewController:ViewDidAppear"
	.long _SampleProject_SampleProjectViewController_ViewDidAppear_bool
	.long Lme_d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM368=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM368
	.byte 2,125,8,3
	.asciz "animated"

LDIFF_SYM369=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM369
	.byte 2,125,12,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM370=Lfde13_end - Lfde13_start
	.long LDIFF_SYM370
Lfde13_start:

	.long 0
	.align 2
	.long _SampleProject_SampleProjectViewController_ViewDidAppear_bool

LDIFF_SYM371=Lme_d - _SampleProject_SampleProjectViewController_ViewDidAppear_bool
	.long LDIFF_SYM371
	.byte 12,13,0,72,14,8,135,2,68,14,12,136,3,142,1,68,14,40
	.align 2
Lfde13_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "SampleProject.SampleProjectViewController:ViewWillDisappear"
	.long _SampleProject_SampleProjectViewController_ViewWillDisappear_bool
	.long Lme_e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM372=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM372
	.byte 2,125,8,3
	.asciz "animated"

LDIFF_SYM373=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM373
	.byte 2,125,12,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM374=Lfde14_end - Lfde14_start
	.long LDIFF_SYM374
Lfde14_start:

	.long 0
	.align 2
	.long _SampleProject_SampleProjectViewController_ViewWillDisappear_bool

LDIFF_SYM375=Lme_e - _SampleProject_SampleProjectViewController_ViewWillDisappear_bool
	.long LDIFF_SYM375
	.byte 12,13,0,72,14,8,135,2,68,14,12,136,3,142,1,68,14,40
	.align 2
Lfde14_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "SampleProject.SampleProjectViewController:ViewDidDisappear"
	.long _SampleProject_SampleProjectViewController_ViewDidDisappear_bool
	.long Lme_f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM376=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM376
	.byte 2,125,8,3
	.asciz "animated"

LDIFF_SYM377=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM377
	.byte 2,125,12,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM378=Lfde15_end - Lfde15_start
	.long LDIFF_SYM378
Lfde15_start:

	.long 0
	.align 2
	.long _SampleProject_SampleProjectViewController_ViewDidDisappear_bool

LDIFF_SYM379=Lme_f - _SampleProject_SampleProjectViewController_ViewDidDisappear_bool
	.long LDIFF_SYM379
	.byte 12,13,0,72,14,8,135,2,68,14,12,136,3,142,1,68,14,40
	.align 2
Lfde15_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "SampleProject.SampleProjectViewController:ReleaseDesignerOutlets"
	.long _SampleProject_SampleProjectViewController_ReleaseDesignerOutlets
	.long Lme_10

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM380=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM380
	.byte 2,125,8,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM381=Lfde16_end - Lfde16_start
	.long LDIFF_SYM381
Lfde16_start:

	.long 0
	.align 2
	.long _SampleProject_SampleProjectViewController_ReleaseDesignerOutlets

LDIFF_SYM382=Lme_10 - _SampleProject_SampleProjectViewController_ReleaseDesignerOutlets
	.long LDIFF_SYM382
	.byte 12,13,0,72,14,8,135,2,68,14,12,136,3,142,1,68,14,32
	.align 2
Lfde16_end:

.section __DWARF, __debug_info,regular,debug

	.byte 0
Ldebug_info_end:
.section __DWARF, __debug_line,regular,debug
Ldebug_line_section_start:
Ldebug_line_start:

	.long Ldebug_line_end - . -4
	.short 2
	.long Ldebug_line_header_end - . -4
	.byte 1,1,251,14,13,0,1,1,1,1,0,0,0,1,0,0,1
.section __DWARF, __debug_line,regular,debug
	.asciz "/Users/namkim/Projects/JTSImageViewController/SampleProject"

	.byte 0
	.asciz "<unknown>"

	.byte 0,0,0
	.asciz "Main.cs"

	.byte 1,0,0
	.asciz "AppDelegate.cs"

	.byte 1,0,0
	.asciz "SampleProjectViewController.cs"

	.byte 1,0,0
	.asciz "SampleProjectViewController.designer.cs"

	.byte 1,0,0,0
Ldebug_line_header_end:
.section __DWARF, __debug_line,regular,debug

	.byte 0,5,2
	.long _SampleProject_Application_Main_string__

	.byte 3,13,4,2,1,3,13,2,196,0,1,8,119,3,1,2,208,0,1,2,44,1,0,1,1
.section __DWARF, __debug_line,regular,debug

	.byte 0,5,2
	.long _SampleProject_AppDelegate_get_Window

	.byte 3,18,4,3,1,3,18,2,200,0,1,2,192,0,1,0,1,1
.section __DWARF, __debug_line,regular,debug

	.byte 0,5,2
	.long _SampleProject_AppDelegate_set_Window_MonoTouch_UIKit_UIWindow

	.byte 3,19,4,3,1,3,19,2,200,0,1,2,192,0,1,0,1,1
.section __DWARF, __debug_line,regular,debug

	.byte 0,5,2
	.long _SampleProject_AppDelegate_OnResignActivation_MonoTouch_UIKit_UIApplication

	.byte 3,25,4,3,1,3,25,2,200,0,1,8,117,2,44,1,0,1,1
.section __DWARF, __debug_line,regular,debug

	.byte 0,5,2
	.long _SampleProject_AppDelegate_DidEnterBackground_MonoTouch_UIKit_UIApplication

	.byte 3,32,4,3,1,3,32,2,200,0,1,8,117,2,44,1,0,1,1
.section __DWARF, __debug_line,regular,debug

	.byte 0,5,2
	.long _SampleProject_AppDelegate_WillEnterForeground_MonoTouch_UIKit_UIApplication

	.byte 3,37,4,3,1,3,37,2,200,0,1,8,117,2,44,1,0,1,1
.section __DWARF, __debug_line,regular,debug

	.byte 0,5,2
	.long _SampleProject_AppDelegate_WillTerminate_MonoTouch_UIKit_UIApplication

	.byte 3,42,4,3,1,3,42,2,200,0,1,8,117,2,44,1,0,1,1
.section __DWARF, __debug_line,regular,debug

	.byte 0,5,2
	.long _SampleProject_SampleProjectViewController__ctor_intptr

	.byte 3,13,4,4,1,3,13,2,200,0,1,3,1,2,36,1,243,2,44,1,0,1,1
.section __DWARF, __debug_line,regular,debug

	.byte 0,5,2
	.long _SampleProject_SampleProjectViewController_ViewDidLoad

	.byte 3,20,4,4,1,3,20,2,152,1,1,8,117,3,3,2,44,1,3,1,2,200,0,1,3,1,2,236,5,1,3,1
	.byte 2,140,1,1,3,2,2,252,0,1,3,1,2,176,1,1,2,60,1,0,1,1
.section __DWARF, __debug_line,regular,debug

	.byte 0,5,2
	.long _SampleProject_SampleProjectViewController_CatImageButtonTapped_object_System_EventArgs

	.byte 3,33,4,4,1,3,33,2,216,0,1,8,117,3,1,2,52,1,3,1,2,236,0,1,3,1,2,140,1,1,3,2
	.byte 2,240,0,1,3,1,2,224,0,1,3,1,2,192,0,1,2,44,1,0,1,1
.section __DWARF, __debug_line,regular,debug

	.byte 0,5,2
	.long _SampleProject_SampleProjectViewController_ViewWillAppear_bool

	.byte 3,44,4,4,1,3,44,2,200,0,1,8,117,3,1,2,60,1,2,44,1,0,1,1
.section __DWARF, __debug_line,regular,debug

	.byte 0,5,2
	.long _SampleProject_SampleProjectViewController_ViewDidAppear_bool

	.byte 3,49,4,4,1,3,49,2,200,0,1,8,117,3,2,2,60,1,2,44,1,0,1,1
.section __DWARF, __debug_line,regular,debug

	.byte 0,5,2
	.long _SampleProject_SampleProjectViewController_ViewWillDisappear_bool

	.byte 3,56,4,4,1,3,56,2,200,0,1,8,117,3,1,2,60,1,2,44,1,0,1,1
.section __DWARF, __debug_line,regular,debug

	.byte 0,5,2
	.long _SampleProject_SampleProjectViewController_ViewDidDisappear_bool

	.byte 3,61,4,4,1,3,61,2,200,0,1,8,117,3,1,2,60,1,2,44,1,0,1,1
.section __DWARF, __debug_line,regular,debug

	.byte 0,5,2
	.long _SampleProject_SampleProjectViewController_ReleaseDesignerOutlets

	.byte 3,13,4,5,1,3,13,2,196,0,1,8,117,2,44,1,0,1,1,0,1,1
Ldebug_line_end:
.text
	.align 3
mem_end:
