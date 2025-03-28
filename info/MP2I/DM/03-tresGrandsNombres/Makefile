.PHONY: all, clean

TESTEUR = testeur.cmo
TARGET = exec
SRC = suites.ml nombres.ml
GCH = $(SRC:.ml=.cmi)
OBJ = $(SRC:.ml=.cmo)



all: $(GCH) $(TARGET)
	./$(TARGET)

$(TARGET): $(OBJ) $(TESTEUR)
	ocamlc $^ -o $@

%.cmi: %.mli
	ocamlc -c $< -o $@

%.cmo: %.ml %.cmi
	ocamlc -c $< -o $@


# Delete SRC.cmi / SRC.cmo, hence NOT testeur.*
clean:
	rm -f $(GCH) $(OBJ) $(TARGET)