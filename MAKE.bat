@echo off
if "%1"=="tidy" (
	del *.pdb
	del *.exe
	del *.obj
	del *.ilk
	del *.exp
	del *.lib
	del *.dll
	exit /b
)

@echo on

if not exist sdl git clone https://github.com/libsdl-org sdl --depth=1

copy /y ..\ext\ext-sdl3\x64\*
for %%i in (tests\*.c) do cl /nologo %%i mojoal.c -I . -I ..\ext\ext-sdl3\inc ..\ext\ext-sdl3\x64\SDL3.lib -DAL_LIBTYPE_STATIC /Zi %*
testqueueing.exe tada.wav tada.wav 
