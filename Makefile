
ifeq ($(OS),Windows_NT)
    CAT := type
    RM := del
    EXE_EXT := .exe
else
    CAT := cat
    RM := rm
    EXE_EXT :=
endif

EUI := eui$(EXE_EXT)
ECHO := echo

ORXFILES = $(wildcard include/*.e) \
	$(wildcard include/**/**/*.e)  \
	$(wildcard include/**/*.e)     \

TESTFILES = $(patsubst %.e,%.e.test,$(ORXFILES))

all :

test : $(TESTFILES)

%.e.test : %.e
ifeq ($(OS),Windows_NT)
	@$(ECHO) $(subst /,\,$<)
	@$(EUI) -batch -test $(subst /,\,$<) > $(subst /,\,$@)
	@$(CAT) $(subst /,\,$@)
else
	@$(ECHO) $<
	@$(EUI) -batch -test $< > $@
	@$(CAT) $@
endif

clean:
ifeq ($(OS),Windows_NT)
	@$(ECHO) $(RM) $(TESTFILES) 2>NUL
	@$(RM) $(subst /,\,$(TESTFILES)) 2>NUL
else
	$(RM) $(TESTFILES)
endif

.PHONY : clean

