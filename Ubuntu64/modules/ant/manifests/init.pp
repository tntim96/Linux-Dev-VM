class ant($ant_version ) {
	exec { "install_ant":
	  command => "/bin/tar -xzf /shared/pkg/apache-ant-${ant_version}-bin.tar.gz",
	  cwd => "/opt",
	  creates => "/opt/apache-ant-${ant_version}/bin/ant"
	}

	file { '/etc/profile.d/ant.sh':
	  #ensure => file,
	  #mode   => 644,
      content => "export ANT_HOME=/opt/apache-ant-${ant_version}\nexport PATH=\${PATH}:\${ANT_HOME}/bin",
	  #require => Exec["install_ant"]
	}
}
