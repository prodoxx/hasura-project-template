
# GraphQL

We use Hasura as our GraphQL engine.


### Using Hasura for Dev
1. Install the Hasura CLI:
```sh
curl -L https://github.com/hasura/graphql-engine/raw/stable/cli/get.sh | bash
```
2. Start Hasura services
```
docker-compose  --env-file ./.env.docker.development up
```
3. Start Hasura console
```
hasura console --admin-secret "WHATEER_IS_IN.env"
```

### Using Hasura in Prod / staging
1. Install docker: https://phoenixnap.com/kb/install-docker-on-ubuntu-20-04
2. Install docker-compose
```sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

```sh
sudo chmod +x /usr/local/bin/docker-compose
```

```sh
echo "export PATH=/usr/local/bin/docker-compose:${PATH}" >> ~/.bashrc
source ~/.bashrc
3. Make sure to copy confg.yaml and create a .env.docker file with all envs
```
4. cd to `hasura` directory and run:
```sh
sudo docker-compose --env-file .env.docker up --force-recreate -d
```

### Things to Remember

#### Enum Tables
When we make changes to enum tables, we need to reload the metadata.
You can do it from the console UI here: http://localhost:9695/console/settings/metadata-actions
or through the Hasura CLI:
```
hasura metadata reload --admin-secret "<admin-secret>"
```

More about enums: https://hasura.io/docs/latest/schema/postgres/enums/
