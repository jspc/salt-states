#sls

git:
  pkg.installed

ssh_dir:
  file.directory:
    - name: /home/vagrant/.ssh
    - mode: 0750

ssh_conf:
  file.managed:
    - name: /home/vagrant/.ssh/config
    - source: salt://common/project/files/ssh-conf
    - require:
      - file: ssh_dir

src_dir:
  file.directory:
    - name: /usr/src/code
    - user: jspc
    - group: jspc
  git.latest:
    - name: {{ pillar.get('repo') }}
    - rev: {{ pillar.get('sha') }}
    - target: /usr/src/code
    - require:
      - pkg: git
      - file: src_dir
      - file: ssh_conf
