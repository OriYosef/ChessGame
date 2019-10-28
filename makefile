CC = gcc
OBJS = SPCHArrayList.o SPCHGame.o SPCHMainAux.o SPCHMiniMax.o SPCHParser.o main.o MainConsuleMode.o MainGuiMode.o SPCHMemoryCard.o SPCHColorWin.o SPCHDifficultyWin.o SPCHGameModeWin.o SPCHGameWin.o SPCHGUIManager.o SPCHLoadWin.o SPCHMainMenuWin.o
 
EXEC = chessprog
COMP_FLAG = -std=c99 -Wall -Wextra \
-Werror -pedantic-errors
SDL_COMP_FLAG = -I/usr/local/lib/sdl_2.0.5/include/SDL2 -D_REENTRANT
SDL_LIB = -L/usr/local/lib/sdl_2.0.5/lib -Wl,-rpath,/usr/local/lib/sdl_2.0.5/lib -Wl,--enable-new-dtags -lSDL2 -lSDL2main

$(EXEC): $(OBJS)
	$(CC) $(OBJS) $(SDL_LIB) -o $@


SPCHArrayList.o: SPCHArrayList.h SPCHArrayList.c
	$(CC) $(COMP_FLAG) $(SDL_COMP_FLAG) -c $*.c
SPCHGame.o: SPCHGame.c SPCHGame.h SPCHArrayList.h
	$(CC) $(COMP_FLAG) $(SDL_COMP_FLAG) -c $*.c
SPCHMainAux.o: SPCHMainAux.c SPCHMainAux.h SPCHGame.h SPCHMiniMax.h SPCHParser.h
	$(CC) $(COMP_FLAG) $(SDL_COMP_FLAG) -c $*.c
SPCHMiniMax.o: SPCHMiniMax.c SPCHMiniMax.h SPCHGame.h
	$(CC) $(COMP_FLAG) $(SDL_COMP_FLAG) -c $*.c
SPCHParser.o: SPCHParser.c SPCHParser.h
	$(CC) $(COMP_FLAG) $(SDL_COMP_FLAG) -c $*.c
MainConsuleMode.o: MainConsuleMode.c MainConsuleMode.h SPCHMainAux.h SPCHGame.h SPCHParser.h
	$(CC) $(COMP_FLAG) $(SDL_COMP_FLAG) -c $*.c

SPCHMemoryCard.o: SPCHMemoryCard.c SPCHMemoryCard.h
	$(CC) $(COMP_FLAG) $(SDL_COMP_FLAG) -c $*.c

SPCHColorWin.o: SPCHColorWin.c SPCHColorWin.h
	$(CC) $(COMP_FLAG) $(SDL_COMP_FLAG) -c $*.c
SPCHDifficultyWin.o: SPCHDifficultyWin.c SPCHDifficultyWin.h
	$(CC) $(COMP_FLAG) $(SDL_COMP_FLAG) -c $*.c
SPCHGameModeWin.o: SPCHGameModeWin.c SPCHGameModeWin.h
	$(CC) $(COMP_FLAG) $(SDL_COMP_FLAG) -c $*.c
SPCHGameWin.o: SPCHGameWin.c SPCHGameWin.h SPCHMemoryCard.h
	$(CC) $(COMP_FLAG) $(SDL_COMP_FLAG) -c $*.c
SPCHGUIManager.o: SPCHGUIManager.c SPCHGUIManager.h SPCHMainAux.h SPCHMemoryCard.h
	$(CC) $(COMP_FLAG) $(SDL_COMP_FLAG) -c $*.c
SPCHLoadWin.o: SPCHLoadWin.c SPCHLoadWin.h SPCHMemoryCard.h
	$(CC) $(COMP_FLAG) $(SDL_COMP_FLAG) -c $*.c

SPCHMainMenuWin.o: SPCHMainMenuWin.c SPCHMainMenuWin.h
	$(CC) $(COMP_FLAG) $(SDL_COMP_FLAG) -c $*.c

MainGuiMode.o: MainGuiMode.h SPCHGUIManager.h
	$(CC) $(COMP_FLAG) $(SDL_COMP_FLAG) -c $*.c


main.o: main.c MainConsuleMode.h MainGuiMode.h
	$(CC) $(COMP_FLAG) $(SDL_COMP_FLAG) -c $*.c


clean:
	rm -f *.o $(EXEC) $(UNIT_TESTS)

