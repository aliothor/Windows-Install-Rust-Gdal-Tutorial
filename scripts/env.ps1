# 1、download gdal and libs

# curl -o  gdal.zip "http://127.0.0.1:8080/release-1930-x64-gdal-3-7-3-mapserver-8-0-1.zip"
# curl -o  gdal-libs.zip "http://127.0.0.1:8080/release-1930-x64-gdal-3-7-3-mapserver-8-0-1-libs.zip"
curl -o  gdal.zip "https://build2.gisinternals.com/sdk/downloads/release-1930-x64-gdal-3-7-3-mapserver-8-0-1.zip"
curl -o  gdal-libs.zip "https://build2.gisinternals.com/sdk/downloads/release-1930-x64-gdal-3-7-3-mapserver-8-0-1-libs.zip"

# 2、unzip gdal.zip gdll-libs.zip

7z x gdal.zip -ogdal
7z x gdal-libs.zip -ogdal

# 3、install pkgconfiglite

choco install pkgconfiglite -y

# 4、set env variable

$gdal_bin=Join-Path -Path $PSScriptRoot -ChildPath "gdal\bin"
$gdal_apps=Join-Path -Path $PSScriptRoot -ChildPath "gdal\bin\gdal\apps"
$gdal_home=Join-Path -Path $PSScriptRoot -ChildPath "gdal"
$proj_lib=Join-Path -Path $PSScriptRoot -ChildPath "gdal\bin\proj9\share"
$gdal_pc_path=Join-Path -Path $PSScriptRoot -ChildPath "gdal\gdal.pc"

$env:Path += ";"+$gdal_bin
$env:Path += ";"+$gdal_apps
$env:GDAL_HOME=$gdal_home
$env:PKG_CONFIG_PATH=$gdal_home
$env:PROJ_LIB=$proj_lib
$env:GDAL_VERSION=373

$gdal_content = @'
name=gdal
prefix=/usr
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${exec_prefix}/include
datadir=${prefix}/share/${name}

Name: lib${name}
Description: Geospatial Data Abstraction Library
Version: 3.7.3
Libs: -L${libdir} -l${name}
Cflags: -I${includedir}/${name}
'@

# 5、write gdal.pc
Set-Content -Path $gdal_pc_path -Value $gdal_content