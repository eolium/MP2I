#!/usr/bin/env sh
export MISSION_DIR="$GSH_ROOT/missions/finding_files_maze/00_shared"
export TEXTDOMAIN="finding_files_maze,00_shared"
exec "$GSH_ROOT/missions/finding_files_maze/00_shared/sbin/generate_maze.sh" "$@"
