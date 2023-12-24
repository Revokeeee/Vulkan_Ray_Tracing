workspace "RayTracer"
    architecture "x64"
    startproject "App"

    configurations { "Debug", "Release" }

    outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

    project "Core"
        location "Core"
        kind "StaticLib"
        language "C++"
        cppdialect "C++20"
        staticruntime "on"

        targetdir ("bin/" .. outputdir .. "/%{prj.name}")
        objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

        

        files
        {
            "%{prj.name}/src/**.h",
            "%{prj.name}/src/**.cpp", 
        }
    

        includedirs
        {
            "%{prj.name}/src",
            "%{prj.name}/vendor/GLFW/include",
            "%{prj.name}/vendor/Vulkan/include",
            "%{prj.name}/vendor/glm",
        }

        links
        {
           "glfw3_mt.lib",
           "vulkan-1.lib",
        }

        filter "system:windows"
            systemversion "latest"
            libdirs "%{prj.name}/vendor/GLFW/lib-vc2022"
            libdirs "%{prj.name}/vendor/Vulkan/lib"

            defines
            {
                "GLFW_INCLUDE_VULKAN",
                "_GLFW_WIN32",
            }          

        filter "configurations:Debug"
            defines "CONF_DEBUG"
            runtime "Debug"
            symbols "On"

        filter "configurations:Release"
            defines "CONF_RELEASE"
            runtime "Release"
            optimize "On"


   
        project "App"
        location "App"
        kind "ConsoleApp"
        cppdialect "C++20"
        language "C++"
        staticruntime "on"
    
        targetdir ("bin/" .. outputdir .. "/%{prj.name}")
        objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
    
        files
        {
            "%{prj.name}/src/**.h",
            "%{prj.name}/src/**.cpp",
          
        }
    
        includedirs
        {
            "Core/src",
            "Core/vendor/GLFW/include",
            "Core/vendor/Vulkan/include",
            "Core/vendor/glm",
        }
    
        links
        {
            "Core",
            "glfw3_mt.lib",
            "vulkan-1.lib",
        }
    
        filter "system:windows"
            systemversion "latest"
            libdirs "Core/vendor/GLFW/lib-vc2022"
            libdirs "Core/vendor/Vulkan/lib"
    
            defines
            {
            }
    
        filter "configurations:Debug"
            defines "CONF_DEBUG"
            runtime "Debug"
            symbols "On"
    
        filter "configurations:Release"
            defines "CONF_RELEASE"
            runtime "Release"
            optimize "On"
