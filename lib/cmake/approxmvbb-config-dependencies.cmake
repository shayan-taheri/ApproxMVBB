include(CMakeFindDependencyMacro)

function(define_dependencies)

    if(TARGET ApproxMVBB::Core)
        find_dependency(Eigen3)
        add_library(eigenLib INTERFACE IMPORTED)
        set_property(TARGET eigenLib PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${EIGEN3_INCLUDE_DIR})
    endif()


    if(${ApproxMVBB_FIND_REQUIRED_XML_SUPPORT})
        find_dependency(PugiXML)
    endif()

    if(${ApproxMVBB_FIND_REQUIRED_KDTREE_SUPPORT})
    
        set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/modules;${CMAKE_MODULE_PATH}")

        find_dependency(Meta)

        add_library(metaLib INTERFACE IMPORTED)
        set_property(TARGET metaLib PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${Meta_INCLUDE_DIR})
        if( NOT ${Meta_TARGET} STREQUAL "")
            add_dependencies(metaLib ${Meta_TARGET})
        endif()

    endif()
endfunction()

define_dependencies()