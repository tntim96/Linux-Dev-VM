class maven($maven_version ) {
	exec { "install_maven":
	  command => "/bin/tar -xzf /shared/pkg/apache-maven-${maven_version}-bin.tar.gz",
	  cwd => "/opt",
	  creates => "/opt/apache-maven-${maven_version}/bin/maven"
	}

	file { '/etc/profile.d/maven.sh':
	  #ensure => file,
	  #mode   => 644,
      content => "export MAVEN_HOME=/opt/apache-maven-${maven_version}\nexport PATH=\${PATH}:\${MAVEN_HOME}/bin",
	  #require => Exec["install_maven"]
	}

	file { '/home/vagrant/.m2/settings.xml':
      source => "puppet:///modules/maven/settings.xml",
	}
}
