{ Game Executable   : DyingLightGame.exe
  Executable Version: 1.49.0.0
  Module Version    : 1.0.0.0
  Inject Address    : engine_x64_rwdi.dll+48E1FD
  Scripts Version   : 1.0
  Date     		   	: 2022-06-01
  Author            : Reflection
 
  AOB ptr scripts write by Reflection custom templates
}
[ENABLE]
aobscanmodule(SetHuntColor,engine_x64_rwdi.dll,89 44 CB 28 8B 47 04)
registersymbol(SetHuntColor)//Free scripts unique release page: https://www.nexusmods.com/dyinglight/mods/662
aobscanmodule(SetCodeExit,engine_x64_rwdi.dll,CB 34 48 8B 5C 24 30) // should be unique
registersymbol(SetCodeExit)
alloc(GetPtrMem,$1000,SetHuntColor)

label(red)
label(orange)
label(yellow)
label(green)
label(cyan)
label(blue)
label(purple)
label(white)

label(o_code)
label(code)
alloc(sleepTime,4)

alloc(HuntC_R,8)
alloc(HuntC_G,8)
alloc(HuntC_B,8)
registersymbol(HuntC_R)
registersymbol(HuntC_G)
registersymbol(HuntC_B)
HuntC_R:
  db 00 00 7F C3
HuntC_G:
  db 00 00 80 3F
HuntC_B:
  db 00 00 80 3F

GetPtrMem:
  cmp rcx,00000000
  jne o_code
  cmp rdx,00000000
  jne o_code
  cmp r12,00000000
  je o_code
  cmp r13,00000000
  jne o_code
  cmp [sleepTime],50
  jbe code
  mov [sleepTime],0
//-------------------------
  cmp [HuntC_R],(float)-255
  jz red
  cmp [HuntC_G],(float)-128
  jz cyan
  cmp [HuntC_G],(float)-255
  jz blue
  cmp [HuntC_B],(float)-155
  jz purple
  cmp [HuntC_B],(float)-128
  jz white

red:
  cmp [HuntC_G],(float)0
  jz orange
  cmp [HuntC_G],(float)-165
  jz yellow
  cmp [HuntC_G],(float)-255
  jz green
  mov [HuntC_R],(float)-255
  mov [HuntC_G],(float)0
  mov [HuntC_B],(float)0
  jmp code
orange:
  mov [HuntC_R],(float)-255
  mov [HuntC_G],(float)-165
  mov [HuntC_B],(float)0
  jmp code
yellow:
  mov [HuntC_R],(float)-255
  mov [HuntC_G],(float)-255
  mov [HuntC_B],(float)0
  jmp code
green:
  mov [HuntC_R],(float)0
  mov [HuntC_G],(float)-128
  mov [HuntC_B],(float)0
  jmp code
cyan:
  mov [HuntC_R],(float)0
  mov [HuntC_G],(float)-255
  mov [HuntC_B],(float)-255
  jmp code
blue:
  mov [HuntC_R],(float)0
  mov [HuntC_G],(float)0
  mov [HuntC_B],(float)-155
  jmp code
purple:
  mov [HuntC_R],(float)-128
  mov [HuntC_G],(float)0
  mov [HuntC_B],(float)-128
  jmp code
white:
  mov [HuntC_R],(float)-255
  mov [HuntC_G],(float)1
  mov [HuntC_B],(float)1
  jmp code

code:
  add [sleepTime],1
  //--R
  mov eax,[HuntC_R]
  mov [rbx+rcx*8+28],eax
  //--G
  mov eax,[HuntC_G]
  mov [rbx+rcx*8+2C],eax
  //--B
  mov eax,[HuntC_B]
  mov [rbx+rcx*8+30],eax
  //--A
  mov eax,[rdi+0C]
  mov [rbx+rcx*8+34],eax
  jmp SetCodeExit+2
o_code:
  mov [rbx+rcx*8+28],eax
  mov eax,[rdi+04]
  jmp SetHuntColor+7

SetHuntColor:
  jmp GetPtrMem
  nop 2

[DISABLE]
SetHuntColor:
  db 89 44 CB 28 8B 47 04
dealloc(HuntC_R)
unregistersymbol(HuntC_R)
dealloc(HuntC_G)
unregistersymbol(HuntC_G)
dealloc(HuntC_B)
unregistersymbol(HuntC_B)
dealloc(sleepTime)
dealloc(GetPtrMem)
unregistersymbol(SetHuntColor)
unregistersymbol(SetCodeExit) 
{
// ORIGINAL CODE - INJECTION POINT: engine_x64_rwdi.dll+48E1FD

engine_x64_rwdi.dll+48E1BE: CC              - int 3 
engine_x64_rwdi.dll+48E1BF: CC              - int 3 
engine_x64_rwdi.dll+48E1C0: 48 89 5C 24 08  - mov [rsp+08],rbx
engine_x64_rwdi.dll+48E1C5: 48 89 74 24 10  - mov [rsp+10],rsi
engine_x64_rwdi.dll+48E1CA: 57              - push rdi
engine_x64_rwdi.dll+48E1CB: 48 83 EC 20     - sub rsp,20
engine_x64_rwdi.dll+48E1CF: 8B 41 48        - mov eax,[rcx+48]
engine_x64_rwdi.dll+48E1D2: 48 8D 59 40     - lea rbx,[rcx+40]
engine_x64_rwdi.dll+48E1D6: 8B F2           - mov esi,edx
engine_x64_rwdi.dll+48E1D8: 49 8B F8        - mov rdi,r8
engine_x64_rwdi.dll+48E1DB: 83 F8 FE        - cmp eax,-02
engine_x64_rwdi.dll+48E1DE: 72 10           - jb engine_x64_rwdi.dll+48E1F0
engine_x64_rwdi.dll+48E1E0: E8 AB 19 BB FF  - call engine_x64_rwdi.UIBoundingBox::operator=+620
engine_x64_rwdi.dll+48E1E5: 48 8B C8        - mov rcx,rax
engine_x64_rwdi.dll+48E1E8: 4C 8B C3        - mov r8,rbx
engine_x64_rwdi.dll+48E1EB: E8 D0 17 BB FF  - call engine_x64_rwdi.UIBoundingBox::operator=+450
engine_x64_rwdi.dll+48E1F0: 8B 07           - mov eax,[rdi]
engine_x64_rwdi.dll+48E1F2: 48 8B CE        - mov rcx,rsi
engine_x64_rwdi.dll+48E1F5: 48 8B 74 24 38  - mov rsi,[rsp+38]
engine_x64_rwdi.dll+48E1FA: 48 03 C9        - add rcx,rcx
// ---------- INJECTING HERE ----------
engine_x64_rwdi.dll+48E1FD: 89 44 CB 28     - mov [rbx+rcx*8+28],eax
// ---------- DONE INJECTING  ----------
engine_x64_rwdi.dll+48E201: 8B 47 04        - mov eax,[rdi+04]
engine_x64_rwdi.dll+48E204: 89 44 CB 2C     - mov [rbx+rcx*8+2C],eax
engine_x64_rwdi.dll+48E208: 8B 47 08        - mov eax,[rdi+08]
engine_x64_rwdi.dll+48E20B: 89 44 CB 30     - mov [rbx+rcx*8+30],eax
engine_x64_rwdi.dll+48E20F: 8B 47 0C        - mov eax,[rdi+0C]
// -------------------------------↓ Exit Search Start ----------
engine_x64_rwdi.dll+48E212: 89 44 CB 34     - mov [rbx+rcx*8+34],eax
engine_x64_rwdi.dll+48E216: 48 8B 5C 24 30  - mov rbx,[rsp+30]
// ---------- Exit (Start+2) ----------
engine_x64_rwdi.dll+48E21B: 48 83 C4 20     - add rsp,20
engine_x64_rwdi.dll+48E21F: 5F              - pop rdi
engine_x64_rwdi.dll+48E220: C3              - ret 
engine_x64_rwdi.dll+48E221: CC              - int 3 
engine_x64_rwdi.dll+48E222: CC              - int 3 
engine_x64_rwdi.dll+48E223: CC              - int 3 
engine_x64_rwdi.dll+48E224: CC              - int 3 
engine_x64_rwdi.dll+48E225: CC              - int 3 
engine_x64_rwdi.dll+48E226: CC              - int 3 
engine_x64_rwdi.dll+48E227: CC              - int 3 
engine_x64_rwdi.dll+48E228: CC              - int 3 
engine_x64_rwdi.dll+48E229: CC              - int 3 
engine_x64_rwdi.dll+48E22A: CC              - int 3 
}
