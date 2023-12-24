#include <iostream>
#include "Renderer.h"
#include "GLFW/glfw3.h"

void Renderer::Begin()
{
	
}

void Renderer::Init()
{
	uint32_t extentionCount = 0;
	vkEnumerateInstanceExtensionProperties(nullptr, &extentionCount, nullptr);
	std::cout << extentionCount;
}


