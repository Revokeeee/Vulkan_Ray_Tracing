#pragma once
#include <GLFW/glfw3.h>

class Window
{
public:
	Window() = default;
	~Window();

	void Init();
	void OnUpdate();

	bool IsClose();
private:
	
};