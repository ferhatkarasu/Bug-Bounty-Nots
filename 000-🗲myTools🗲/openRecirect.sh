
#Kullanım -> ./openRecirect.sh result.txt
#!/bin/bash
grep -E "next=|url=|target=|rurl=|dest=|destination=|redir=|redirect_uri=|redirect_url=|redirect=|redirection_url=|/redirect/|/cgi-bin/redirect.cgi|/out/|/out|view=|/loginto=|image_url=|go=|return=|returnTo=|return_to=|checkout_url=|continue=|return_path=" $1
