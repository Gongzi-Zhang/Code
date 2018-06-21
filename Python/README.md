# Python 

## Data type: Hashable, unhashable
* hashable: constant, incommutable, whose hash value can be checked with hash function, can be used as **key** of dictionaries.
* unhashable: list, dict and set, their value can be changed dynamically. They can't be used as key of dict.

## venv: virtual environment 

create a python virtual env under dir:
> python -m venv dir  

active venv
> source dir/bin/activate

## package management tool [pip](https://pypi.python.org/pypi)
```
pip install <package>[==version number]
pip install --upgrade <package>
pip uninstall <package>
pip show <package>
pip list
pip freeze  
    # will produce a similar list of the installed packages, but the 
    # output uses the format that pip install expects
```

### for version control
pip freeze > requirements.txt	# required packages.
pip install -r requirements.txt

