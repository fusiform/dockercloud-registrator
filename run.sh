priv_addr=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
pub_addr=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)

/bin/registrator -ip=$pub_addr consul://localhost:8500
