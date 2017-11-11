ansible-role-pritunl-server
=========
[![Build Status](https://travis-ci.org/jugatsu/ansible-role-pritunl-server.svg?branch=master)](https://travis-ci.org/jugatsu/ansible-role-pritunl-server)

An Ansible Role that installs Pritunl Server (https://pritunl.com).

Requirements
------------

This role only supports Ubuntu 12.x, 14.x, 16.x.

Example Playbook
----------------
```yaml
- hosts: servers
  roles:
    - { role: ansible-role-pritunl-server }
```

License
-------

BSD
