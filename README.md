pclint Cookbook
===============
Installs PCLint and applies patches.

Requirements
------------
Runs on Windows. The PCLint patches zip needs to have a structure like this:
````
zip.file
  |- *.lp <-- patches
  |- lpatch.exe
````

#### packages
- `windows` - pclint needs windows to install PC Lint from a Wise install package.

Attributes
----------
````
default['pclint']['installer_path'] = 'C:\vagrant\installers\pclint9.exe'
default['pclint']['patches_zip_path'] = 'C:\vagrant\installers\pclint-patches.zip'
````

Usage
-----
Just include `pclint` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[pclint]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Ivan Li
