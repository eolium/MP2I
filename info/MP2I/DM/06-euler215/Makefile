.PHONY: main, test, clean cleanall, zip

# Fichiers à compiler
SRC := euler215.ml
MAIN := main
TESTEUR := testeur
MLI := $(SRC:.ml=.mli)
CMI := $(MLI:.mli=.cmi)
CMO := $(SRC:.ml=.cmo)


# Les deux règles de compilation
main: $(MLI) $(SRC) $(MAIN).ml
	ocamlc $^ -o $(MAIN).exe

test: $(MLI) $(SRC) $(TESTEUR).cmo
	ocamlc $^ -o $(TESTEUR).exe


# Nettoyage des auxiliaires et du total
clean:
	rm -f $(CMI) $(MAIN).cmi
	rm -f $(CMO) $(MAIN).cmo

cleanall: clean
	rm -f *.exe


# Création du zip
.ONESHELL:
zip: clean
	@echo "Entrez votre nom de famille (avec des underscore comme séparateur éventuel :)"
	@read nom
	tar -cvzf $$nom.zip $(SRC)