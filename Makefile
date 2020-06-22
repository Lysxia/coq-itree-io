.PHONY: build

MFCOQ:=Makefile.coq

build: $(MFCOQ)
	$(MAKE) -f $(MFCOQ)

$(MFCOQ): _CoqProject
	coq_makefile -f $< -o $(MFCOQ)


