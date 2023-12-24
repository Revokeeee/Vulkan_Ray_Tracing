#include "Application.h"
#include "Renderer.h"

Application::Application()
{
	m_Window.Init();
	Renderer::Init();
}


bool Application::IsClose()
{
	if(m_Window.IsClose())
	{
		return true;
	}
	return false;
}
