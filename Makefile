CEU_DIR    = $(error set absolute path to "<ceu>" repository)
CEU_UV_DIR = $(error set absolute path to "<ceu-libuv>" repository)

all:
	ceu --pre --pre-args="-I$(CEU_DIR)/include -I$(CEU_UV_DIR)/include -I./include" \
	          --pre-input=src/timer-01.ceu                                  \
	    --ceu --ceu-features-lua=true --ceu-features-thread=true --ceu-err-unused=pass --ceu-err-uninitialized=pass \
	    --env --env-types=/data/ceu/ceu/env/types.h                         \
	          --env-threads=/data/ceu/ceu/env/threads.h                     \
	          --env-main=/data/ceu/ceu/env/main.c                           \
	          --env-output=/tmp/x.c                                         \
	    --cc --cc-args="`pkg-config play --libs --cflags` -luv -lm -llua5.3 -lpthread" \
	         --cc-output=/tmp/ceu-media-sample
	/tmp/ceu-media-sample
