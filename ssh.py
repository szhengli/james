import paramiko, argparse



def main(hostname, username,password):
    client=paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy)
    client.connect(hostname,username=username,password=password)
    commands=['echo "hello world"',
              'uname -a',
              'ifconfig | grep 192.168']
    for command in commands:
        stdin,stdout,stderr=client.exec_command(command)
        stdin.close()
        print(stdout.read().decode())
        stdout.close()
        stderr.close()
    client.close()



if  __name__=='__main__':
    parser=argparse.ArgumentParser("run command over ssh")
    parser.add_argument('--host', help='Remote machine to connect')
    parser.add_argument('--username')
    parser.add_argument('--password')

    args=parser.parse_args()
    main(args.host,args.username, args.password)




