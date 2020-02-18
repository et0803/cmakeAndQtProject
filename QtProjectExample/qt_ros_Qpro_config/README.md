# ROS + Qt Creator

By now, I don't plan to make this repository a software. It hasn't any relevant
code; it just shows one how to compile and link ROS-based softwares against ROS
libraries under Qt Creator environment.

This experient works with Ubuntu 14.04 (codename `trusty`) and 16.04 (codename
`xenial`).

To make this project work, make sure you have correctly installed ROS. So,
do make a little change in Qt Creator icon:

    gedit $(find ~ -name "DigiaQt-qtcreator-community.desktop")

Search for field named `Exec=` and add `bash -ic` right after `=`.

Open Qt Creator and compile the project. Before execute it, open a terminal and
execute:
    
    roscore

As soon as `roscore` is ready, execute the program. See on "Application Output"
if a message with `exited with code 0` is printed. If yes, the software is set
and ready. Else, you did something wrong. And don't blame me.

# Licensing

This code is under the public domain.
