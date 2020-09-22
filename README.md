# DBT models for Singer GitHub Tap
This repo contains [dbt](https://www.getdbt.com) models to create a dimensional model with data sourced from  [Singer GitHub Tap] (https://github.com/singer-io/tap-github)
and [Singer PostgreSQL target](https://github.com/datamill-co/target-postgres)

## Getting started
1. Install dependencies in virtual environment with `pipenv install --skip-lock`
2. Run PostgreSQL database in background with: `docker-compose up -d postgres`
3. Create a GitHub access token. Login to your GitHub account, go to the Personal Access Tokens settings page, and generate a new token with at least the repo scope. Save this access token, you'll need it for the next step.
4. Create `github.sample.json` from `github.config.sample.json`. Create a JSON file containing the access token you just created and the path to one or multiple repositories that you want to extract data from. Each repo path should be space delimited. The repo path is relative to https://github.com/. For example the path for this repository is singer-io/tap-github.
5. Run the tap in discovery mode to get properties.json file
    ```bash
    pipenv run tap-github --config github.config.json --discover > properties.json
    ```
6. In the properties.json file, select the streams to sync
Each stream in the properties.json file has a "schema" entry.  To select a stream to sync, add `"selected": true` to that stream's "schema" entry.  For example, to sync the pull_requests stream:
    
   ```
    ...
    "tap_stream_id": "pull_requests",
    "schema": {
      "selected": true,
      "properties": {
        "updated_at": {
          "format": "date-time",
          "type": [
            "null",
            "string"
          ]
        }
    ...
    ```
7. Run the application:
    ```bash
    pipenv run tap-github --config github.config.json --properties properties.json
    ```
8. Run DBT models:
    ```bash
   pipenv run dbt deps
   pipenv run dbt run 
   ```
9. Run DBT tests:
    ```bash
   pipenv run dbt tests 
   ```
   
## Diagrams
### Source ERD
![Source ERD](resources/er_source_diagram.png?raw=true "Source ERD")

### Dimensional Model
![Dimensional Model](resources/dim_model_diagram.png?raw=true "Dimensional Model")

### DBT DAG
![DBT DAG](resources/dbt_dag.png?raw=true "DBT DAG")