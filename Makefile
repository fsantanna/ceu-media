#CEU_DIR    = $(error set absolute path to "<ceu>" repository)
#CEU_UV_DIR = $(error set absolute path to "<ceu-libuv>" repository)

CEU_DIR    = /data/ceu/ceu
CEU_UV_DIR = /data/ceu/ceu-libuv

all:
	ceu --pre --pre-args="-I$(CEU_DIR)/include -I$(CEU_UV_DIR)/include -I./include" \
	          --pre-input=src/hello-01.ceu                                  \
	    --ceu                                                               \
	    --env --env-types=/data/ceu/ceu/env/types.h                         \
	          --env-threads=/data/ceu/ceu/env/threads.h                     \
	          --env-main=/data/ceu/ceu/env/main.c                           \
	          --env-output=/tmp/x.c                                         \
	    --cc --cc-args="-lm -llua5.3 -lpthread -lSDL2 -lSDL2_image -lSDL2_mixer -lSDL2_ttf -lSDL2_gfx" \
	         --cc-output=hello-01
	./hello-01
