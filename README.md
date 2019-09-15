This contains scripts to automate the installation of GNAT Community.

# Usage

## On Mac OS and Linux

Launch the script install_package.sh:

``` sh install_package.sh  <path_to_package>  <target_dir> [<components>]```

## On Windows

From this directory, launch install_package.bat:

``` install_package.bat  <path_to_package>  <target_dir> [<components]```

## Customization

`<components>` is an optional argument which specifies a comma-separated
list of components to install. This is useful if you don't want to install
the entire package, but want to instead only install a specific subset of
components that are available in the package.

If the `<components>` argument is not specified then by default the entire
package is installed.

The list is comma-separated without spaces. For example,
`com.adacore.spark2014_discovery` will only install the SPARK 2014 Discovery
component, and `com.adacore.spark2014_discovery,com.adacore.gnat` will install
both the SPARK tools and the GNAT compiler.

The names of the components that are available for installation depends on
the package you are installing.
