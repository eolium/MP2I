#!/usr/bin/env sh
export MISSION_DIR="$GSH_ROOT/missions/pipe_intro_book_of_potions/00_shared"
export TEXTDOMAIN="pipe_intro_book_of_potions,00_shared"
exec "$GSH_ROOT/missions/pipe_intro_book_of_potions/00_shared/sbin/install_potion_book.sh" "$@"
