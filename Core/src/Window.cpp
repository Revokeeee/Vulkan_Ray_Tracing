#include "Window.h"

GLFWwindow* m_Window;
Window::~Window()
{
    glfwTerminate();
}

void Window::Init()
{
    
    /* Initialize the library */
    if (!glfwInit())
        return ;

    glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);
    /* Create a windowed mode window and its OpenGL context */
    m_Window = glfwCreateWindow(640, 480, "RayTracing", NULL, NULL);


    /* Make the window's context current */
    glfwMakeContextCurrent(m_Window);
   
}

bool Window::IsClose()
{
    if (!glfwWindowShouldClose(m_Window))
    {
        OnUpdate();
        return false;
    }
    else
    {
        glfwDestroyWindow(m_Window);
        return true;
    }
}

void Window::OnUpdate()
{
    glfwPollEvents();
}
