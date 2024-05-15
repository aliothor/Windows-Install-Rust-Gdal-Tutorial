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