#pragma once
#include "Window.h"

class Application
{
public:
	Application();

	bool IsClose();

private:
	bool m_IsClose = false;
	Window m_Window;
};

