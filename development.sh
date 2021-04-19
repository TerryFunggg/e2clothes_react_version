# https://www.npmjs.com/package/concurrently
(concurrently "cd ./e2clothesBackend && rails s" "cd ./graphql && npm run start" "cd ./web && yarn start" "cd ./admin && yarn start")
