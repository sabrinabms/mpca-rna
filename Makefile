#Compilador Tupa
#CC=ftn 

#Compilador 
CC= mpif90 

# Opcoes de compilacao
CFLAG= -c -O3 -g

# Opcoes de otimizacao
CFLAGOPT= -O3 -g

VPATH = src
MODDIR = mod
BUILDDIR = build

all: clean $(BUILDDIR)/foul.o \
	$(BUILDDIR)/newTypes.o \
	$(BUILDDIR)/uniformR8.o \
	$(BUILDDIR)/normalR8.o \
	$(BUILDDIR)/annTraining.o \
	$(BUILDDIR)/mpcaFunctions.o \
	$(BUILDDIR)/mpca.o \
	$(BUILDDIR)/annActivation.o \
	$(BUILDDIR)/main_activation.o \
	annMPCA \
	annActivation \
	removemod
	
annMPCA: 
	$(CC) $(CFLAGOPT) -o annMPCA $(BUILDDIR)/foul.o $(BUILDDIR)/uniformR8.o $(BUILDDIR)/newTypes.o $(BUILDDIR)/normalR8.o $(BUILDDIR)/annTraining.o $(BUILDDIR)/mpcaFunctions.o $(BUILDDIR)/mpca.o

annActivation:
	$(CC) $(CFLAGOPT) -o annActivation $(BUILDDIR)/foul.o $(BUILDDIR)/newTypes.o $(BUILDDIR)/annActivation.o $(BUILDDIR)/main_activation.o

$(BUILDDIR)/%.o: $(VPATH)/%.f90
	$(CC) $(CFLAG) $< -o $@

clean:
	rm -rf *.*~ Makefile~ build/*.o *.mod annActivation  annMPCA output/*.out

removemod:
	rm -f build/*.o *.mod
