include:
  - cyware.config.user
  - cyware.config.inetsim
  - cyware.config.wget
  - cyware.config.curl
  - cyware.config.objects
  - cyware.config.bash-rc
  - cyware.config.bash-history
  - cyware.config.thug
  - cyware.config.networkminer
  - cyware.config.salt-minion
  - cyware.config.dot-local
  - cyware.config.dot-config
  - cyware.config.dot-cpan
  - cyware.config.dot-dbus
  - cyware.config.dot-cache
  - cyware.config.ghidra
  - cyware.config.bash-completion
  - cyware.config.binee
  - cyware.config.nginx
  - cyware.config.android-project-creator
  - cyware.config.volatility3
#  - cyware.config.viper-virtualenv

cyware-config:
  test.nop:
    - require:
      - sls: cyware.config.user
      - sls: cyware.config.inetsim
      - sls: cyware.config.wget
      - sls: cyware.config.curl
      - sls: cyware.config.objects
      - sls: cyware.config.bash-rc
      - sls: cyware.config.bash-history
      - sls: cyware.config.thug
      - sls: cyware.config.networkminer
      - sls: cyware.config.salt-minion
      - sls: cyware.config.dot-local
      - sls: cyware.config.dot-cache
      - sls: cyware.config.dot-config
      - sls: cyware.config.dot-cpan
      - sls: cyware.config.dot-dbus
      - sls: cyware.config.ghidra
      - sls: cyware.config.bash-completion
      - sls: cyware.config.binee
      - sls: cyware.config.nginx
      - sls: cyware.config.android-project-creator
      - sls: cyware.config.volatility3
#      - sls: cyware.config.viper-virtualenv
