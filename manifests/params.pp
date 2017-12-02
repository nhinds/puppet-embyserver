class embyserver::params (
) {

  $package = 'emby-server'
  $service = 'emby-server'

  # Check: Only supporting debian-y things at this time...
  case "${::lsbdistid}_${::lsbdistrelease}" {
    'Ubuntu_12.04', 'Ubuntu_14.04', 'Ubuntu_14.10', 'Ubuntu_15.04', 'Ubuntu_16.04', 'Ubuntu_16.10', 'Ubuntu_17.04' : {
      $repo = "xUbuntu_${::lsbdistrelease}"
    }
    /'Debian_7'/ : {
      $repo = "Debian_7.0"
    }
    /'Debian_8'/ : {
      $repo = "Debian_8.0"
    }
    default : {
      fail("Module ${module_name} is not supported on ${::lsbdistid} ${::lsbdistrelease}")
    }

    default : {
      fail("Module ${module_name} is not supported on ${::lsbdistid}")
    }
  }

}
