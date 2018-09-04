# /// Prepare directories & files ///
WORKING_DIR='.'
BUILD_DIR='./setup'
DOCKER_DIR='./docker/rails'
MYSQL_DIR='./docker/mysql'

mkdir -p ${DOCKER_DIR}
mkdir -p ${MYSQL_DIR}/volumes

cp -f ${BUILD_DIR}/docker-compose.yml ${WORKING_DIR}/docker-compose.yml
cp -f ${BUILD_DIR}/Gemfile ${WORKING_DIR}/Gemfile
cp -f ${BUILD_DIR}/Gemfile.lock ${WORKING_DIR}/Gemfile.lock
cp -f ${BUILD_DIR}/Dockerfile ${DOCKER_DIR}/Dockerfile
cp -f ${BUILD_DIR}/password.yml ${MYSQL_DIR}/password.yml

# /// Initiate application: rails new ///
docker-compose run --rm web rails new ${WORKING_DIR} --force --database=mysql --skip-bundle

# /// Edit Gemfile & Update Gemfile.lock ///
cp -f ${WORKING_DIR}/Gemfile ${WORKING_DIR}/Gemfile.tmp
cat ${WORKING_DIR}/Gemfile.tmp | awk '{ if($0~"mini_racer"){ print("gem \047mini_racer\047, platforms: :ruby"); } else { print $0; } }' > ${WORKING_DIR}/Gemfile
rm -f ${WORKING_DIR}/Gemfile.tmp

docker-compose run --rm web bundle install

# /// Build application ///
docker-compose build

# /// Edit config/database.yml ///
cp -f ${BUILD_DIR}/database.yml config/database.yml

# /// Initiate application database ///
docker-compose run --rm web rails db:create
sleep 5

# /// Clean containers & images ///
docker stop $(docker ps -q)
docker container prune -f
docker image prune -f

# /// Update README.md ///
cp -f ${BUILD_DIR}/README.md ${WORKING_DIR}/README.md
