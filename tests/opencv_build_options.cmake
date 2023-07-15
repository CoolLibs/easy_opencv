# Choose which libraries to link into OpenCV
set(WITH_1394 OFF CACHE BOOL "" FORCE)
set(WITH_ADE OFF CACHE BOOL "" FORCE)
set(WITH_ARITH_DEC OFF CACHE BOOL "" FORCE)
set(WITH_AVIF OFF CACHE BOOL "" FORCE)
set(WITH_CANN OFF CACHE BOOL "" FORCE)
set(WITH_CLP OFF CACHE BOOL "" FORCE)
set(WITH_CUDA OFF CACHE BOOL "" FORCE)
set(WITH_DIRECTX OFF CACHE BOOL "" FORCE)

if(WIN32)
    set(WITH_DSHOW ON CACHE BOOL "" FORCE)
else()
    set(WITH_DSHOW OFF CACHE BOOL "" FORCE)
endif()

set(WITH_EIGEN OFF CACHE BOOL "" FORCE)
set(WITH_FFMPEG OFF CACHE BOOL "" FORCE)
set(WITH_FLATBUFFERS OFF CACHE BOOL "" FORCE)
set(WITH_FREETYPE OFF CACHE BOOL "" FORCE)
set(WITH_GDAL OFF CACHE BOOL "" FORCE)
set(WITH_GDCM OFF CACHE BOOL "" FORCE)
set(WITH_GSTREAMER OFF CACHE BOOL "" FORCE)

if(LINUX)
    set(WITH_GTK ON CACHE BOOL "" FORCE)
else()
    set(WITH_GTK OFF CACHE BOOL "" FORCE)
endif()

set(WITH_GTK_2_X OFF CACHE BOOL "" FORCE)
set(WITH_HALIDE OFF CACHE BOOL "" FORCE)
set(WITH_HPX OFF CACHE BOOL "" FORCE)
set(WITH_IMGCODEC_HDR OFF CACHE BOOL "" FORCE)
set(WITH_IMGCODEC_PFM OFF CACHE BOOL "" FORCE)
set(WITH_IMGCODEC_PXM OFF CACHE BOOL "" FORCE)
set(WITH_IMGCODEC_SUNRASTER OFF CACHE BOOL "" FORCE)
set(WITH_IPP OFF CACHE BOOL "" FORCE)
set(WITH_ITT OFF CACHE BOOL "" FORCE)
set(WITH_JASPER OFF CACHE BOOL "" FORCE)
set(WITH_JPEG OFF CACHE BOOL "" FORCE)
set(WITH_LAPACK OFF CACHE BOOL "" FORCE)
set(WITH_LIBREALSENSE OFF CACHE BOOL "" FORCE)
set(WITH_MFX OFF CACHE BOOL "" FORCE)
set(WITH_MSMF OFF CACHE BOOL "" FORCE)
set(WITH_MSMF_DXVA OFF CACHE BOOL "" FORCE)
set(WITH_OAK OFF CACHE BOOL "" FORCE)
set(WITH_OBSENSOR OFF CACHE BOOL "" FORCE)
set(WITH_OPENCL OFF CACHE BOOL "" FORCE)
set(WITH_OPENCLAMDBLAS OFF CACHE BOOL "" FORCE)
set(WITH_OPENCLAMDFFT OFF CACHE BOOL "" FORCE)
set(WITH_OPENCL_D3D11_NV OFF CACHE BOOL "" FORCE)
set(WITH_OPENCL_SVM OFF CACHE BOOL "" FORCE)
set(WITH_OPENEXR OFF CACHE BOOL "" FORCE)
set(WITH_OPENGL OFF CACHE BOOL "" FORCE)
set(WITH_OPENJPEG OFF CACHE BOOL "" FORCE)
set(WITH_OPENMP OFF CACHE BOOL "" FORCE)
set(WITH_OPENNI OFF CACHE BOOL "" FORCE)
set(WITH_OPENNI2 OFF CACHE BOOL "" FORCE)
set(WITH_OPENVINO OFF CACHE BOOL "" FORCE)
set(WITH_OPENVX OFF CACHE BOOL "" FORCE)
set(WITH_PLAIDML OFF CACHE BOOL "" FORCE)
set(WITH_PNG OFF CACHE BOOL "" FORCE)
set(WITH_PROTOBUF OFF CACHE BOOL "" FORCE)
set(WITH_PTHREADS_PF OFF CACHE BOOL "" FORCE)
set(WITH_PVAPI OFF CACHE BOOL "" FORCE)
set(WITH_QT OFF CACHE BOOL "" FORCE)
set(WITH_QUIRC OFF CACHE BOOL "" FORCE)
set(WITH_SPNG OFF CACHE BOOL "" FORCE)
set(WITH_TBB OFF CACHE BOOL "" FORCE)
set(WITH_TIFF OFF CACHE BOOL "" FORCE)
set(WITH_TIMVX OFF CACHE BOOL "" FORCE)
set(WITH_UEYE OFF CACHE BOOL "" FORCE)
set(WITH_VTK OFF CACHE BOOL "" FORCE)
set(WITH_VULKAN OFF CACHE BOOL "" FORCE)
set(WITH_WEBNN OFF CACHE BOOL "" FORCE)
set(WITH_WEBP OFF CACHE BOOL "" FORCE)

if(WIN32)
    set(WITH_WIN32UI ON CACHE BOOL "" FORCE)
else()
    set(WITH_WIN32UI OFF CACHE BOOL "" FORCE)
endif()

set(WITH_XIMEA OFF CACHE BOOL "" FORCE)

# Choose which parts of OpenCV to build
set(BUILD_opencv_apps OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_calib3d OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_dnn OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_features2d OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_flann OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_gapi OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_highgui ON CACHE BOOL "" FORCE)
set(BUILD_opencv_imgcodecs ON CACHE BOOL "" FORCE)
set(BUILD_opencv_imgproc ON CACHE BOOL "" FORCE)
set(BUILD_opencv_java_bindings_generator OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_js OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_js_bindings_generator OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_ml OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_objc_bindings_generator OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_objdetect OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_photo OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_python_bindings_generator OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_python_tests OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_stitching OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_ts OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_video OFF CACHE BOOL "" FORCE)
set(BUILD_opencv_videoio ON CACHE BOOL "" FORCE)
