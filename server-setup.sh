sudo usermod -aG docker ec2-user # not sure if sudo will work in this script or needs to be somewhere else
git clone https://github.com/rchatley/extreme_startup.git
cd extreme_startup
docker build -t extreme_startup .
docker run -d -p 80:3000 extreme_startup
