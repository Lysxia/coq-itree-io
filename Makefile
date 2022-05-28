.PHONY: build

MFCOQ:=Makefile.coq
COQ_VERSION:=$(word 1, $(shell coqc -print-version))

build: $(MFCOQ)
	$(MAKE) -f $(MFCOQ)

install: $(MFCOQ)
	$(MAKE) -f $^ $@

$(MFCOQ): _CoqProject
	coq_makefile -f $< -o $(MFCOQ)

_CoqProject: _CoqProject.8.13
ifeq ($(shell expr $(COQ_VERSION) \>= "8.14"), 1)
	echo '-native-compiler no' > $@
	cat $^ >> $@
else
	cp -f $^ $@
endif

clean:
	if [ -f $(MFCOQ) ] ; then make -f $(MFCOQ) clean ; fi
