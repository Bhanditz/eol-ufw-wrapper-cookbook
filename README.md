eol-ufw-wrapper Cookbook
========================
Creates firewall rules for ufw package using data bag

Requirements
------------
It should work on Ubuntu Linux platrorm

Usage
-----
#### eol-ufw-wrapper::default

Two things have to be done t use this cookbook

- Node run list has to inlude eol-ufw-wrapper recipe:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[eol-ufw-wrapper]"
  ]
}
```
- firewall rules have to be added to eol-ufw-wrapper/config.json data bag:


```json
{
  "_readme": "Information to create firewall rules",
  "id": "config",
  "ufw_rules": {
    "http1": {
      "nodes": [],
      "protocol": "tcp",
      "port": "80",
      "action": "enable"
    },
    "http2": {
      "nodes": ["chef11.example.edu"],
      "protocol": "tcp",
      "port": "8080",
      "action": "enable"
    }
  }
}
```

When "nodes" array is left empty - this port will be open for all nodes
eol-ufw-wrapper recipe. Otherwise host will not apply ports
which do not contain its node name

Athors
-------------------

[Dmitry Mozzherin][1]

Copyright
---------

Copyright (c) 2014 Marine Biological Laboratory. See LICENSE.txt for
further details.

[1]: https://github.com/dimus

