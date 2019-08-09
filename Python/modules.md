# frequently used python modules
* optparse
  argparse	--- option parsing
* os		--- os dependent functionality
* system	--- system-specific info, related to Python 
		    interpreter
* sh		--- execute external command: more convinient to 
		    receive output, error stream and exit code
* shutil	--- high-level file operations
* glob		--- pattern matching on files
* collections	
    deque	--- double directions queue
			   

# module search path
modules are search in the installation dependent default path and the list of
directories specified by the environment variable 'PYTHONPATH'

the list of dir. searched by Python is given by:
>>> import sys
>>> sys.path

>>> new_dir = '/path/to/python/module"
>>> if new_path not in sys.path:
	sys.path.append(new_path)

# package
a package is a module with submodules (which can have submodules themselves)
