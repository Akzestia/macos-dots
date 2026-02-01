clean:
    rm -rf build

rebuild: clean c b

test:
    cd build && ctest --output-on-failure

fmt:
    find src -name "*.cpp" -o -name "*.h" | xargs clang-format -i

fmt-check:
    find src -name "*.cpp" -o -name "*.h" | xargs clang-format --dry-run --Werror

lint:
    clang-tidy src/**/*.cpp -- -I build

ls:
    find src -name "*.cpp" -o -name "*.h" | sort

loc:
    find src -name "*.cpp" -o -name "*.h" | xargs wc -l

debug:
    cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Debug \
    && ninja -C build

release:
    cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Release \
    && ninja -C build

rm-mod NAME:
    rm -rf src/{{NAME}}

memcheck BIN:
    valgrind --leak-check=full ./build/{{BIN}}

c:
    cmake -S . -B build -G Ninja

cc:
    cmake -S . -B build -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
    && cp build/compile_commands.json .

b:
    ninja -C build

cl NAME:
    #!/usr/bin/env bash
    mkdir -p src/{{NAME}}

    cat > src/{{NAME}}/{{NAME}}.h << EOF
    #pragma once
    EOF

    cat > src/{{NAME}}/{{NAME}}.cpp << EOF
    #include "{{NAME}}.h"
    EOF

    cat > src/{{NAME}}/CMakeLists.txt << EOF
    cmake_minimum_required(VERSION 4.0.1)
    project({{NAME}})

    add_library({{NAME}}
        {{NAME}}.cpp
    )

    target_include_directories({{NAME}}
        PUBLIC
            \${CMAKE_CURRENT_SOURCE_DIR}
    )
    EOF

help:
    @just --list
