#
# Prepare shared lib calls
#
const basedir=Base.@__DIR__
const depsdir=basedir*"/../deps/"

# if Sys.iswindows()
# 	libsuffix = ".dll"

if Sys.isapple()
    libsuffix = ".dylib"
elseif Sys.islinux()
    libsuffix = ".so"
else
    Base.@error "Operating system not supported."
end

const libtriangle = depsdir*"usr/lib/libtriangle"*libsuffix


if ~isfile(libtriangle)
    Base.@error("Triangle library not found. Please run `Pkg.build(\"VoronoiFVM\")` first.")
end

#
# Struct maping Triangle's triangulateio
#
mutable struct CTriangulateIO
    pointlist :: Ptr{Cdouble}
    pointattributelist :: Ptr{Cdouble}
    pointmarkerlist :: Ptr{Cint}
    numberofpoints :: Cint
    numberofpointattributes :: Cint
    
    trianglelist :: Ptr{Cint}
    triangleattributelist :: Ptr{Cdouble}
    trianglearealist :: Ptr{Cdouble}
    neighborlist :: Ptr{Cint}
    numberoftriangles :: Cint
    numberofcorners :: Cint
    numberoftriangleattributes :: Cint
    
    segmentlist :: Ptr{Cint}
    segmentmarkerlist :: Ptr{Cint}
    numberofsegments :: Cint

    holelist :: Ptr{Cdouble}
    numberofholes :: Cint

    regionlist :: Ptr{Cdouble}
    numberofregions :: Cint

    edgelist :: Ptr{Cint}
    edgemarkerlist :: Ptr{Cint}
    normlist :: Ptr{Cdouble}
    numberofedges :: Cint
end 

#
# Constructor for `CTriangulateIO`. Initialize everything as `NULL`. Only for internal use.
# 
function CTriangulateIO()
    return CTriangulateIO(C_NULL, C_NULL, C_NULL, 0, 0,
                          C_NULL, C_NULL, C_NULL, C_NULL, 0, 0, 0,
                          C_NULL, C_NULL, 0,
                          C_NULL, 0,
                          C_NULL, 0,
                          C_NULL, C_NULL, C_NULL, 0)
end


#
# "Raw" triangulation call to Triangle library
#
function triangulate(triangle_switches::String, ctio_in::CTriangulateIO, ctio_out::CTriangulateIO, vor_out::CTriangulateIO)
    ccall((:triangulate,libtriangle),
          Cvoid,
          ( Cstring,
            Ref{CTriangulateIO}, 
            Ref{CTriangulateIO},
            Ref{CTriangulateIO}
            ),
          triangle_switches,
          Ref(ctio_in),
          Ref(ctio_out),
          Ref(vor_out)
          )
end


