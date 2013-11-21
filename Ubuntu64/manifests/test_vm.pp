#include java
class { "java":
    java_archive => "jdk-7u45-linux-x64.tar.gz",
    java_home => "/usr/lib/jvm/jdk1.7.0_45",
    java_folder => "jdk1.7.0_45"
}

class { "ant":
    ant_version => "1.9.2"
}

class { "maven":
    maven_version => "3.1.1"
}
