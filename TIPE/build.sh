blue='\033[0;34m'
green='\033[1;32m'
red='\033[1;31m'
warn='\033[0;33m'
NC='\033[m'

(
    echo -e "\n\n${blue}Tentative de compilation de la librairie...${NC}" &&

    (
        cd lib/ &&
        gcc -g -Wall -Wextra -fsanitize=undefined -fsanitize=address -c lib_calcul.c lib_expression.c &&
        cd .. &&
        echo -e "${green}Compilation réussie${NC}"
    ) || (
        echo -e "${red}Echec de la compilation${NC}"
        exit 1
    ) &&

    echo -e "\n\n${blue}Tentative de compilation du testeur...${NC}" &&

    (
        gcc lib/lib_calcul.c lib/lib_expression.c test.c -o test &&
        echo -e "${green}Compilation réussie"
    ) || (
        echo -e "${red}Echec de la compilation"
        exit 1
    ) &&

    echo -e "\n\n${blue}Exécution des tests...${NC}" &&

    (
        ./test &&
        echo -e "${green}Tous les tests ont réussis bg !${NC}"
    ) || (
        echo -e "${red}Échec des tests${NC}"
        exit 1
    )

)