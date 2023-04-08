#include <string>
#include <codecvt>
#include <direct.h>
#include <lua.hpp>
#include <iostream>

int wmain(int argc, wchar_t* argv[]) {
	setlocale(LC_ALL, "");
	std::cout << "Animation folder path: ";
	std::wstring path;
	if (argc > 1) {
		path = std::wstring(argv[1]);
		std::wcout << path;
	}
	else {
		std::getline(std::wcin, path);
	}
	std::cout << std::endl;

	std::wstring_convert<std::codecvt_utf8<wchar_t>> converter;

	if (_mkdir(converter.to_bytes(path + L"\\output").c_str())) {
		printf("Error creating output folder.\n");
	}
	else {
		printf("Folder created succesfully.\n");
	}

	std::wcout << "Animation path in level: /dynamic/";

	std::wstring animation_path;
	std::getline(std::wcin, animation_path);

	lua_State* L = luaL_newstate();
	luaL_openlibs(L);

	lua_pushlstring(L, converter.to_bytes(path).c_str(), path.size());
	lua_setglobal(L, "__path");

	lua_pushlstring(L, converter.to_bytes(animation_path).c_str(), animation_path.size());
	lua_setglobal(L, "__animation_path");

	luaL_dofile(L, "generate_animation.lua");

	lua_close(L);
	std::cin.get();
}