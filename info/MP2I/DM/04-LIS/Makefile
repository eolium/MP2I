.PHONY: all, main, test, clean, zip

SRC = load.ml naif.ml dyn.ml
TESTEUR = testeur
MAIN = main
GCH = $(SRC:.ml=.cmi)
OBJ = $(SRC:.ml=.cmo)

# Compile and run the main
main: $(MAIN).exe $(GCH) $(OBJ)
	./$<

# Compile and run the tests
test: $(GCH) $(OBJ) 
	ocamlc $(OBJ) $(TESTEUR).cmo -o $(TESTEUR).exe
	./$(TESTEUR).exe

%.exe: %.ml $(OBJ)
	ocamlc -c $< -o $*.cmo
	ocamlc $(OBJ) $*.cmo -o $@

%.cmi: %.mli
	ocamlc -c $< -o $@

%.cmo: %.ml %.cmi
	ocamlc -c $< -o $@


# Delete cmi/cmo. Don't delete testeur.cmi/cmo !!
clean:
	rm -f $(GCH) $(OBJ) 
	rm -f $(MAIN).cmi $(MAIN).cmo 
	rm -f *.exe


# Create documentation
doc: $(SRC:.ml=.mli)
	mkdir -p doc/
	ocamldoc -html -colorize-code -charset utf8 -d doc/ *.mli


# Create the zip
.ONESHELL:
zip: clean
	@echo "Entrez votre nom de famille (avec des underscore comme séparateur éventuel :)"
	@read nom
	tar -cvzf $$nom.zip $(SRC)