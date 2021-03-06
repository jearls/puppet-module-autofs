# == Define: autofs::params

class autofs::params {
  $package_manage  = true
  $package_ensure  = 'installed'
  $service_manage  = true
  $service_ensure  = 'running'
  $service_enable  = true
  $service_restart = undef

  case $::osfamily {
    'Debian': {
      $config_file_group  = 'root'
      $config_file_owner  = 'root'
      $master_config      = 'auto.master'
      $map_config_dir     = '/etc'
      $package_name       = [ 'autofs-ldap' ]
      $service_name       = 'autofs'
      $service_hasrestart = true
      $service_hasstatus  = true
    }
    'Solaris': {
      $config_file_group  = 'root'
      $config_file_owner  = 'root'
      $master_config      = 'auto_master'
      $map_config_dir     = '/etc'
      $package_name       = [] # solaris has it built-in, no package required
      $service_name       = 'autofs'
      $service_hasrestart = true
      $service_hasstatus  = true
    }
    'RedHat': {
      $config_file_group  = 'root'
      $config_file_owner  = 'root'
      $master_config      = 'auto.master'
      $map_config_dir     = '/etc'
      $package_name       = [ 'autofs' ]
      $service_name       = 'autofs'
      $service_hasrestart = true
      $service_hasstatus  = true
    }
    'Archlinux': {
      $config_file_group  = 'root'
      $config_file_owner  = 'root'
      $master_config      = 'auto.master'
      $map_config_dir     = '/etc/autofs'
      $package_name       = [ 'autofs' ]
      $service_name       = 'autofs'
      $service_hasrestart = true
      $service_hasstatus  = true
    }
    'Gentoo': {
      $config_file_group  = 'root'
      $config_file_owner  = 'root'
      $master_config      = 'auto.master'
      $map_config_dir     = '/etc/autofs'
      $package_name       = [ 'net-fs/autofs' ]
      $service_name       = 'autofs'
      $service_hasrestart = true
      $service_hasstatus  = true
    }
    default: {
      fail("osfamily not supported: ${::osfamily}")
    }
  }
}
