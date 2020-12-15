# 1. 制作builder1镜像

     下面步骤是存储类服务器VirtualBox虚拟机使用的基础镜像。

     1. 第一种方法是自己制作，比较耗时

        ```shell
        ./export.sh
        ```

     2. 第二种方法，是可以从我们的镜像网站下载并添加

        ```shell
        ./import.sh
        ```

# 2. 常用vagrant命令

     启动：```vagrant up```
     SSH登录：```vagrant ssh```


vagrant ssh -c "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"
譬如：aee27d4d95a84b7c93f784da36fd5840

TODO: https://github.com/jenkinsci/docker#preinstalling-plugins

验证一下：http://192.168.50.121:8080是否能否访问，
外部用反向代理转发到这个地址，譬如https://builder.engineer365.org:40443



- 创建第一个管理员用户
用户名和密码：qiangyt/***   qiangyt@wxcount.com

- 实例配置
https://builder.engineer365.org:40443/


- Jenkins即将就绪！
  Jenkins安装已完成，但部分插件需要重启Jenkins。


- https://www.jenkins.io/security/advisory/2018-02-26/#SECURITY-248
  - Descriptions
    Environment Injector Plugin before 1.91 stored sensitive build variables


https://builder.engineer365.org:40443/view/all/newJob
   - 选择“构建一个maven项目”，任务名字为“fleashop-server”, 点击“确定”按钮
   - 选择“GitHub 项目”：
     - 项目 URL： https://github.com/engineer-365/cloud-native-micro-service-engineering/
     - “源码管理”选择“git“：  https://github.com/engineer-365/cloud-native-micro-service-engineering.git
     - ”指定分支（为空时代表any）“：“*/main”
     - “源码库浏览器”： 自动   “githubweb"
       - URL:  https://github.com/engineer-365/cloud-native-micro-service-engineering/
     - Build:
       - Root POM: server/pom.xml
     - “Branches to build”：“
   - 选择“丢弃旧的构建”，“保持构建的天数”设为30
   - 选择“Delete workspace before build starts”
   - 选择“Add timestamps to the Console Output”
   - 选择“Abort the build if it's stuck”，“Timeout minutes”设为60

cd /opt/

- 设置maven
   export download_site=https://download.engineer365.org:40443
   wget --quiet "${download_site}/maven/apache-maven-3.5.3-bin.tar.gz"
   tar xfz apache-maven-3.5.3-bin.tar.gz
   rm apache-maven-3.5.3-bin.tar.gz
   ln -s /opt/apache-maven-3.5.3 /opt/maven
   echo 'export MAVEN_HOME=/opt/maven' >> /etc/profile
   echo 'export PATH=$MAVEN_HOME/bin:$PATH' >> /etc/profile
   echo '' >> /etc/profile



- 替换默认的jdk8
cp -r /opt/java/openjdk /opt/java/openjdk-1.8.0_272-b10

wget --quiet "${download_site}/jdk/11/OpenJDK11U-jdk_x64_linux_hotspot_11.0.7_10.tar.gz"
tar xfz OpenJDK11U-jdk_x64_linux_hotspot_11.0.7_10.tar.gz
rm OpenJDK11U-jdk_x64_linux_hotspot_11.0.7_10.tar.gz
ln -s /opt/jdk-11.0.7+10 /opt/jdk-11
echo 'export JAVA_HOME=/opt/jdk-11' >> /etc/profile
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /etc/profile
echo '' >> /etc/profile


rm -rf /opt/java/openjdk
ln -s /opt/jdk-11 /opt/java/openjdk


- 设置maven
  - https://builder.engineer365.org:40443/configureTools
    - mkdir /root/.m2
    -  wget https://download.engineer365.org:40443/maven/settings.xml -q -P /root/.m2/
    - “默认全局 settings 提供”：        - /var/jenkins_home/.m2/settings.xml
    - "JDK 安装":
      - “别名”填写："openjdk 11.0.7+10"
      - 去掉“自动安装”
      - "JAVA_HOME"： /opt/jdk-11
    - "Maven 安装"
      - 点击"新增maven"
      - name: "Maven 3.5.3"
      - 去掉“自动安装”
        - "MAVEN_HOME" :/opt/maven
    - 点击“保存”


# plugin docs
# https://plugins.jenkins.io/maven-plugin/
# https://plugins.jenkins.io/docker-workflow/
# https://www.jenkins.io/doc/book/pipeline/
# https://plugins.jenkins.io/workflow-aggregator/
# https://www.jenkins.io/doc/book/blueocean
# https://plugins.jenkins.io/blueocean/