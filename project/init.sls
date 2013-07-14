#sls

src_dir:
  file.directory:
    - name: /usr/src/code
    - user: jspc
    - group: jspc
  git.latest:
    - name: pillar['checkout']['repo']
    - rev: pillar['checkout']['sha']
    - target: /usr/src/code
    - require: 
      - file: src_dir
    - runas: jspc
