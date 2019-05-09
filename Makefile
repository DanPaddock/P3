# Makefile for UD CISC user-level thread library

CC = gcc
CFLAGS = -g

LIBOBJS = t_lib.o 

TSTOBJS = test01x.o test01.o philosopher.o Shone-Hoffman.o T3.o

# specify the executable 

EXECS = test01x test01 T3 philosopher Shone-Hoffman

# specify the source files

LIBSRCS = t_lib.c

TSTSRCS = test01x.c test01.c philosopher.c Shone-Hoffman.c T3.c

# ar creates the static thread library

t_lib.a: ${LIBOBJS} Makefile
	ar rcs t_lib.a ${LIBOBJS}

# here, we specify how each file should be compiled, what
# files they depend on, etc.

t_lib.o: t_lib.c t_lib.h Makefile
	${CC} ${CFLAGS} -c t_lib.c

test01.o: test01.c ud_thread.h Makefile
	${CC} ${CFLAGS} -c test01.c
	
test01: test01.o t_lib.a Makefile
	${CC} ${CFLAGS} test01.o t_lib.a -o test01

test01x.o: test01x.c ud_thread.h Makefile
	${CC} ${CFLAGS} -c test01x.c

test01x: test01x.o t_lib.a Makefile
	${CC} ${CFLAGS} test01x.o t_lib.a -o test01x

philosopher.o: philosopher.c ud_thread.h Makefile
	${CC} ${CFLAGS} -c philosopher.c

philosopher: philosopher.o t_lib.a Makefile
	${CC} ${CFLAGS} philosopher.o t_lib.a -o philosopher

Shone-Hoffman.o: Shone-Hoffman ud_thread.h Makefile
	${CC} ${CFLAGS} -c Shone-Hoffman.c

Shone-Hoffman: Shone-Hoffman.o t_lib.a Makefile
	${CC} ${CFLAGS} Shone-Hoffman.o t_lib.a -o Shone-Hoffman

T3.o: T3.c ud_thread.h Makefile
	${CC} ${CFLAGS} -c T3.c

T3: T3.o t_lib.a Makefile
	${CC} ${CFLAGS} T3.o t_lib.a -o T3

clean:
	rm -f t_lib.a ${EXECS} ${LIBOBJS} ${TSTOBJS} 
