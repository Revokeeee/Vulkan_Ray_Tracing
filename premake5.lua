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
        }

        links
        {
           
        }

        filter "system:windows"
            systemversion "latest"

            defines
            {
            }          

        filter "configurations:Debug"
            defines "RV_DEBUG"
            runtime "Debug"
            symbols "On"

        filter "configurations:Release"
            defines "RV_RELEASE"
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
        }
    
        links
        {
            "Core"
        }
    
        filter "system:windows"
            
            systemversion "latest"
    
            defines
            {
            }
    
        filter "configurations:Debug"
            defines "RV_DEBUG"
            runtime "Debug"
            symbols "On"
    
        filter "configurations:Release"
            defines "RV_RELEASE"
            runtime "Release"
            optimize "On"
