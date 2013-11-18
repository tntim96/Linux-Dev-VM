class java($java_archive, $java_home, $java_folder) {

    Exec {
        path => [ "/usr/bin", "/bin", "/usr/sbin"]
    }

    file { "/tmp/${java_archive}" :
        ensure => "present",
        #source => "puppet:///modules/java/${java_archive}",
        source => "/shared/pkg/${java_archive}",
        owner  => vagrant,
        mode   => 755
    }

    exec { 'extract jdk':
        cwd => '/tmp',
        command => "tar xfv ${java_archive}",
        creates => $java_home,
        require => File["/tmp/${java_archive}"],
    }

    file { '/usr/lib/jvm' :
        ensure => directory,
        owner => vagrant,
        require => Exec['extract jdk']
    }

    exec { 'move jdk':
        cwd => '/tmp',
        creates => $java_home,
        require => File['/usr/lib/jvm'],
        command => "mv ${java_folder} /usr/lib/jvm/"
    }

    exec {'install java':
        require => Exec['move jdk'],
        logoutput => true,
        command => "update-alternatives --install /bin/java java ${java_home}/bin/java 1"
    }

    exec {'set java':
        require => Exec['install java'],
        logoutput => true,
        command => "update-alternatives --set java ${java_home}/bin/java"
    }

    exec {'install javac':
        require => Exec['move jdk'],
        logoutput => true,
        command => "update-alternatives --install /bin/javac javac ${java_home}/bin/javac 1"
    }

    exec {'set javac':
        require => Exec['install javac'],
        logoutput => true,
        command => "update-alternatives --set javac ${java_home}/bin/javac"
    }

  file { "/etc/profile.d/java.sh":
      content => "export JAVA_HOME=${java_home}
                  export PATH=\$PATH:\$JAVA_HOME/bin"
  }
}
