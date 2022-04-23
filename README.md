## SSH Into EC2 JMeter Controller
```
ssh -i /Users/tobiaswittmann/Downloads/jmeter.pem ec2-user@3.121.87.129
```

## Copy Test File into EC2 JMeter Controller
```
scp -i /Users/tobiaswittmann/Downloads/jmeter.pem Load_Test_scaled.jmx ec2-user@3.121.87.129:.
```

## Start JMeter Test
```
jmeter -n -t Load_Test.jmx -Dserver.rmi.ssl.disable=true -R<private worker ips> -l <output jtl file>
jmeter -n -t Load_Test_scaled.jmx -Dserver.rmi.ssl.disable=true -R10.0.101.15 -l ./Azure/run-500-users/run-500-users.jtl
```

## Copy Result File from EC2 JMeter Controller
```
scp -i /Users/tobiaswittmann/Downloads/jmeter.pem ec2-user@3.121.87.129:./Azure/run-500-users/run-500-users.jtl .
```