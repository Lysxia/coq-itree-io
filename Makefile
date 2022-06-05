.PHONY: build

MFCOQ:=Makefile.coq

build: $(MFCOQ)
	$(MAKE) -f $(MFCOQ)

install: $(MFCOQ)
	$(MAKE) -f $^ $@

$(MFCOQ): _CoqProject
	coq_makefile -f $< -o $(MFCOQ)

clean:
	if [ -f $(MFCOQ) ] ; then make -f $(MFCOQ) clean ; fi
