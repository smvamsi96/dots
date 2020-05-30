import socket as soc               # Import socket module

s = soc.socket()         # Create a socket object
host = '192.168.43.21'
port = 12342                # Reserve a port for your service.
#223.238.59.213
s.connect((host, port))
while True:
    message = s.recv(1024)
    message = message.decode()
    if (message == ''):
        continue
    elif message == 'quit':
        print("Connection Terminated By Server")
        break
    else:
        print("New Message: ")
        print(message)
s.close()                     # Close the socket when done
