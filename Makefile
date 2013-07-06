ENTRYPOINTS = 0 11 107 123 0x115f 0x1162 0x1165 0x1168  0x116b 0x116e 0x1171 0x1174  0x1177 0x117a 0x117d 0x1180  0x1183 \
	0x0a92 0x0a95 0x0a98 0x0a9b  0x0a9e 0x0aa1 0x0aa4 0x0aa7  0x0aaa 0x0aad 0x0ab0 0x0ab3  0x0ab6 0x0ab9 0x0abc 0x0abf  0x0ac2 0x0ac5 0x0ac8 \
	0x1409 0x140C 0x140F 0x1412  0x1415 0x1418 0x141B 0x141E

ENTRYPOINTS_MOD =  0 11 107 123 0x115f 0x1162 0x1165 0x1168  0x116b 0x116e 0x1171 0x1174  0x1177 0x117a 0x117d 0x1180  0x1183

hex: TrulyErgonomic_v3yk.hex

listing: TrulyErgonomic_209_v3.lst.orig

listing-mod: TrulyErgonomic_v3yk.lst.orig

_build:
	mkdir -p _build


_build/TrulyErgonomic_v3yk.ref: _build TrulyErgonomic_v3yk_conf.refi TrulyErgonomic_v3yk_code.refi
	cat TrulyErgonomic_v3yk_conf.refi TrulyErgonomic_v3yk_code.refi >$@

TrulyErgonomic_209_v3.lst.orig: TrulyErgonomic_209_v3.hex Makefile
	dis51 -l $(ENTRYPOINTS) <$< >$@
TrulyErgonomic_v3yk.lst.orig: TrulyErgonomic_v3yk.hex Makefile
	dis51 -l $(ENTRYPOINTS_MOD) <$< >$@

TrulyErgonomic_v3yk.hex: TrulyErgonomic_209_v3.lst.annotated _build/TrulyErgonomic_v3yk.ref
	tools/undump.py _build/TrulyErgonomic_v3yk.ref TrulyErgonomic_209_v3.lst.annotated >$@
