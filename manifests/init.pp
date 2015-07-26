# == Class: embyserver
#
# Full description of class embyserver here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'embyserver':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Andy Newton <amn@ecs.soton.ac.uk>
#
# === Copyright
#
# Copyright 2015 Andy Newton
#
class embyserver (
  $repo = $embyserver::params::repo,
  $package = $embyserver::params::package,
  $service = $embyserver::params::service,
) inherits embyserver::params {

  include ::apt
  apt::source { 'emby-server':
    comment  => 'The official Emby server repository for debian/ubuntu',
    location => "http://download.opensuse.org/repositories/home:/emby/${repo}/",
    release  => '/',
    repos => '',
    key      => {
      'id' => '7C73B6B7B0937468962299C50A506F712A7D8A28',
      'source' => "http://download.opensuse.org/repositories/home:emby/${repo}/Release.key",
    },
    include  => {
      'deb' => true,
    },
  }

  package {$package:
    ensure => present,
    notify => Service[$service],
    require => Apt::Source['emby-server'],
  }

  service {$service:
    ensure => running,
    require => Package[$package],
  }

}
