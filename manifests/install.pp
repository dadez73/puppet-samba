# samba::install
#
class samba::install () inherits samba {
  assert_private("Use of private class ${name} by ${caller_module_name}")

  if $samba::package_manage {
    $samba::packages[server].each |String $package_name| {
      unless defined(Package[$package_name]) {
        package { $package_name:
          ensure => $samba::package_ensure,
        }
      }
    }
    $samba::packages[utils].each |String $package_name| {
      unless defined(Package[$package_name]) {
        package { $package_name:
          ensure => $samba::package_ensure,
        }
      }
    }
  }
}
