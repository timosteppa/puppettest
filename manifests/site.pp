## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.

#hiera_include('classes')

#class motd { notify{"testing":} }

#class motd(
#$message,
#){
#notify{"message: ${message}":}
#}


####### installing packages###########
class package {
package { 'gcc':
   ensure => present,
  }

}
package {'tftp':}
package {'firefox':}
package {'mysql':}
package {'ksh':}
package {'m4':}




######## installing packages###########


#class motd::message { notify{"blah blah":} }

node default{
#notify {hiera(motd::message):}

#class{'motd':}
#class{'motd::message':}
#include motd
#include motd::message

}

## different nodes for NTP

node "kermit.example.com" {
  class { "ntp":
    servers    => [ '0.us.pool.ntp.org iburst','1.us.pool.ntp.org iburst','2.us.pool.ntp.org iburst','3.us.pool.ntp.org iburst'],
    autoupdate => false,
    restrict   => [],
    enable     => true,
  }
}

node "grover.example.com" {
  class { "ntp":
    servers    => [ 'kermit.example.com','0.us.pool.ntp.org iburst','1.us.pool.ntp.org iburst','2.us.pool.ntp.org iburst'],
    autoupdate => true,
    restrict   => [],
    enable     => true,
  }
}

node "snuffie.example.com", "bigbird.example.com", "hooper.example.com" {
  class { "ntp":
    servers    => [ 'grover.example.com', 'kermit.example.com'],
    autoupdate => true,
    enable     => true,
  }
}

#####

#notification message coming from the init.pp file
#node 'pupblv22.t-mobile.lab'{
#include test
    
#etc motd file information 
#class { 'helloworld':}
#class { 'helloworld::world':}

#}


#node 'pupblv23.t-mobile.lab'{
#include allFiles
#class {'helloworld::new':}
#class {'touch':}
#class {'touch::tf':}

#}

#class allFiles{
#notify{"lets make new files with time info":}
#}

#what is being outputted to the agent's screen
#class test{
#notify{"we are trying a test on pupblv22 officialy":}
 #   }

