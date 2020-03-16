# PrivilegesCLI
A CLI tool to switch admin privileges for macOS. This is inspired from SAP's Privileges app. 

##About
This repository aims to build a CLI only tool to switch/toggle admin privileges.

##Goals
This repository's goals are as follows:
1. CLI tool should run in user context,
2. Privilege operations should happen via XPC Mach service daemon,
3. The code should be fully in Swift,
4. Use Apple's new Argument Parser library,

##Design
Proposed design:
1. Build a package with user CLI and XPC daemon,
2. Installing the package will start the deamon and install the CLI tool,
3. When the CLI is invoked, CLI asks XPC to do appropriate privilege change to the currently 
logged in user,
4. Uninstallation can also be done in user privilege if possible and make XPC to shut down 
itself

##Current Status
1. The working XPC daemon service and a sample client invoking it code is ready,

##TODO
1. Add Apple's collaboration framework to XPC daemon and check if its daemon safe,
2. In client, add Apple's argument parser Swift package to parse CLI arguments,
3. Test the functionality
