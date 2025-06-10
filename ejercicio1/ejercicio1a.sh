aws ec2 create-security-group \
    --group-name grupo_seguridad_ejercicio_1 \
    --description "ejercicio1"

aws ec2 authorize-security-group-ingress \
    --group-name grupo_seguridad_ejercicio_1 \
    --protocol tcp \
    --port 22 \
    --cidr 0.0.0.0/0
