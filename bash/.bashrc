JAVA8_HOME=$HOME/data/jdk1.8.0_45
JAVA7_HOME=$HOME/data/jdk1.7.0_55
JAVA6_HOME=$HOME/data/jdk1.6.0_45

export JAVA_HOME=$JAVA8_HOME
#export JAVA_HOME=$JAVA7_HOME
#export JAVA_HOME=$JAVA6_HOME
export ECLIPSE_HOME=$HOME/data/eclipse
export ADT_HOME=$HOME/data/adt-bundle-linux-x86_64-20131030
export SCALAIDE_HOME=$HOME/data/scalaide
export GOROOT=$HOME/data/go
export WAF_HOME=$HOME/data/waf-1.7.15
export GRADLE_HOME=$HOME/data/gradle-2.3
export ANT_HOME=$HOME/data/apache-ant-1.9.4
export M2_HOME=$HOME/data/apache-maven-3.3.1
export SCALA_HOME=$HOME/data/scala-2.11.6
export GROOVY_HOME=$HOME/data/groovy-2.4.3
export NODE_HOME=$HOME/data/node-v0.12.3
export SBT_HOME=$HOME/data/sbt-0.13.8
export GOPATH=$HOME/data/goprojects
export LITEIDE_HOME=$HOME/data/liteide
export RUST_HOME=$HOME/data/rust-1.0.0
export PATH=$HOME/data/bin:$JAVA_HOME/bin:$ECLIPSE_HOME:$SCALAIDE_HOME:$ADT_HOME/eclipse:$ADT_HOME/sdk/platform-tools:$ADT_HOME/sdk/android:$GOROOT/bin:$WAF_HOME:$GRADLE_HOME/bin:$ANT_HOME/bin:$M2_HOME/bin:$SCALA_HOME/bin:$GROOVY_HOME/bin:$NODE_HOME/bin:$SBT_HOME/bin:$GOPATH/bin:$LITEIDE_HOME/bin:$RUST_HOME/rustc/bin:$RUST_HOME/cargo/bin:$PATH
export LD_LIBRARY_PATH=$RUST_HOME/rustc/lib

alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias startgodoc="godoc -http=:6060"
alias searchgodoc="godoc -server=localhost:6060"
alias setjava6="export JAVA_HOME=$JAVA6_HOME; export PATH=$JAVA6_HOME/bin:$PATH"
alias setjava7="export JAVA_HOME=$JAVA7_HOME; export PATH=$JAVA7_HOME/bin:$PATH"
alias setjava8="export JAVA_HOME=$JAVA8_HOME; export PATH=$JAVA8_HOME/bin:$PATH"
alias cddata="cd $HOME/data"
alias cdgit="cd $HOME/data/git"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$PATH:$HOME/.rvm/bin" # AGdd RVM to PATH for scripting
