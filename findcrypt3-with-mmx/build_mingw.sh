#!/usr/bin/env bash
IDA_SDK=../idasdk68

i686-w64-mingw32-g++ -Wno-conversion-null -Wno-narrowing -D__NT__ -D__IDP__ -DNO_OBSOLETE_FUNCS -DNDEBUG -D_SECURE_SCL=0 -fexceptions findcrypt.cpp sparse.cpp consts.cpp -Os "-I$IDA_SDK/include" "-I$IDA_SDK/plugins/debugger" -I. -static-libgcc -static-libstdc++ "-L$IDA_SDK/bin" -Wl,--dll,--enable-stdcall-fixup,--dynamicbase,--large-address-aware "$IDA_SDK/lib/ida.a" -lws2_32 -shared -mwindows -ofindcrypt3.plw
if [ $? -eq 0 ]; then
    echo "Done! Next steps:"
    echo "1. Copy findcrypt3.plw to your IDA plugins directory"
    echo "2. Copy libwinpthread-1.dll to your IDA directory (NOT the plugins directory)".
fi
