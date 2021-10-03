
# build docker 
cd ~/dev/add 
docker build -t add  .


#run docker 
sudo docker run --env X=5 --rm -v /data/:/data  add


