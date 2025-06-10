aws ec2 run-instances \
    --image-id  ami-02457590d33d576c3 \
    --count 1 \
    --instance-type t2.small \
    --key-name vockey \
    --security-groups grupo_seguridad_ejercicio_1\
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=ejercicio1}]"
