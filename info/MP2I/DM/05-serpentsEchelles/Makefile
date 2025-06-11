.PHONY: main test clean zip
.PRECIOUS: %.o

SRC = file.c plateaux.c solver.c
OBJ = $(SRC:.c=.o)
TESTEUR = testeur
MAIN = main
CFLAGS += -std=gnu11 -Wall -Wextra -g -fsanitize=undefined,address

main: $(MAIN).exe
	@./$<

test: $(TESTEUR).exe
	@./$<

%.exe: %.o $(OBJ)
	@gcc $^ -o $@ $(CFLAGS)

%.o: %.c
	@gcc -c $< -o $@ $(CFLAGS)


# Delete objects, exe and eventual gch. Don't delete testeur !!
clean:
	@rm -f $(OBJ) *.gch
	@rm -f $(MAIN).o
	@rm -f *.exe


# Create the zip
.ONESHELL:
zip: clean
	@echo "Entrez votre nom de famille (avec des underscore comme séparateur éventuel :)"
	@read nom
	@tar -cvzf $$nom.zip main.c solver.c