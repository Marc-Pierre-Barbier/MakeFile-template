COMPILE_FLAG = -c
LD_FLAG = -o
OBJDIR=./objs/
SRC=./src/
SRCS=$(shell ls src/* | grep "\.c")

ALL : build link clean

build :
	mkdir -p ${OBJDIR}
	-@rm run
	@echo ""
	@echo "building :"
	@cd objs && for src in ${SRCS}; do echo gcc ${COMPILE_FLAG} ../$$src &&gcc ${COMPILE_FLAG} ../$$src;	done;

link:
	gcc objs/* ${LD_FLAG} run


clean :
	@echo ""
	@echo "cleaning : "
	-rm ${OBJDIR}*
