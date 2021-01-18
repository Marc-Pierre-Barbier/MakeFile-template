COMPILER = g++
WINDOWS_COMPILE = x86_64-w64-mingw32-g++
WINDOWS_LD_FLAG = --static
COMPILE_FLAG = -c
LD_FLAG = -Wall -o
OBJDIR=./objs/
SRC=./src/
SRCS=$(shell ls src/* | grep "\.c")

ALL : build link clean
windows : winswitch build winlink clean
	
winswitch : 
	echo "building"
	$(eval COMPILER = $(WINDOWS_COMPILE))
	$(eval LD_FLAG = $(WINDOWS_LD_FLAG) $(LD_FLAG) )

build :
	mkdir -p ${OBJDIR}
	-@rm run
	@echo ""
	@echo "building :"
	@cd objs && for src in ${SRCS}; do echo ${COMPILER} ${COMPILE_FLAG} ../$$src && ${COMPILER} ${COMPILE_FLAG} ../$$src;	done;

link:
	${COMPILER} objs/* ${LD_FLAG} run

winlink:
	-rm run.exe
	${COMPILER} objs/* ${LD_FLAG} run.exe

winrun:
	WINEDEBUG=-all wine run.exe

clean :
	@echo ""
	@echo "cleaning : "
	-rm ${OBJDIR}*
