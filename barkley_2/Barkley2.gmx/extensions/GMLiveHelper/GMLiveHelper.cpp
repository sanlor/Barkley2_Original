/// @author YellowAfterlife

#include "stdafx.h"

#define dllx extern "C" __declspec(dllexport)

dllx double execute_program_windows(char* path, char* params, double wait) {
	//
	auto wpath_size = MultiByteToWideChar(CP_UTF8, 0, path, -1, nullptr, 0);
	auto wpath = new WCHAR[wpath_size];
	MultiByteToWideChar(CP_UTF8, 0, path, -1, wpath, wpath_size);
	//
	auto wparams_size = MultiByteToWideChar(CP_UTF8, 0, params, -1, nullptr, 0);
	auto wparams = new WCHAR[wparams_size];
	MultiByteToWideChar(CP_UTF8, 0, params, -1, wparams, wparams_size);
	//
	STARTUPINFO startInfo;
	memset(&startInfo, 0, sizeof(startInfo));
	startInfo.cb = sizeof(startInfo);
	PROCESS_INFORMATION procInfo;
	//
	auto ok = CreateProcessW(wpath, wparams,
		/* process attributes */ nullptr,
		/* thread attributes */ nullptr,
		/* inherit handles */ false,
		/* creation flags*/ 0x0,
		/* environment */ nullptr,
		/* current directory */ nullptr,
		&startInfo, &procInfo);
	//
	if (ok) {
		if (wait > 0.5) WaitForSingleObject(procInfo.hProcess, INFINITE);
		CloseHandle(procInfo.hThread);
		CloseHandle(procInfo.hProcess);
	}
	//
	return ok != 0;
}
