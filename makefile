compile-debug: prelude
	clang++ ./main.cpp -o ./build/debug/main -g -Wall -std=c++20 -include-pch ./build/pch/entt.pch ./build/pch/glm.pch -lglfw -lGL

warmup: prelude compile-ext-pch

compile-ext-pch: 
	mkdir -p ./build/pch
	clang++ -x c++-header -stdlib=libstdc++ ./ext/entt.hpp -o ./build/pch/entt.pch -std=c++20
	clang++ -x c++-header -stdlib=libstdc++ ./ext/glm.hpp -o ./build/pch/glm.pch -std=c++20

prelude:
	mkdir -p ./build/debug
	mkdir -p ./build/release

clean:
	rm -rf ./build
