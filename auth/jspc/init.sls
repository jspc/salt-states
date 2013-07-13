jspc:
  - user.present:
    - shell: /bin/bash
    - home: /home/jspc

ssh-dir:
  - file.directory:
    - name: /home/jspc/.ssh
    - mode: 700
    - user: jspc
    - require:
      - user: jspc

priv:
  - file.managed:
    - name: /home/jspc/.ssh/id_rsa
    - source: salt://auth/jspc/files/id_rsa
    - user: jspc
    - group: jspc
    - mode: 500
    - require:
      - file: ssh-dir

pub:
  - file.managed
    - name: /home/jspc/ssh/id_rsa.pub
    - source: salt://auth/jspc/files/id_rsa.pub
    - user: jspc
    - group: jspc
    - mode: 500
    - require:
      - file: ssh-dir
