# DefectDojo 
## Installation
Defect Dojo installation instructions can be retrieved here:  
https://docs.defectdojo.com/get_started/open_source/installation/

We set up a docker-compose.yml and a .env.example file in the same folder as this README.md to ease the first startup.
Secrets have no defaults in docker-compose.yml: copy .env.example to .env and fill them in (the generation commands are in the comments) before starting.
```
cp .env.example .env
# edit .env: DD_SECRET_KEY, DD_CREDENTIAL_AES_256_KEY, DD_DATABASE_PASSWORD, DD_DATABASE_URL
docker compose up -d
```

Then to retrieve password:
```
docker compose logs initializer | grep "Admin password:"
```

Once retrieved you can login to http://localhost:9080 (or on a different port if specified otherwise in docker-compose.yml)

# Integration
We collect in this section settings needed to integrate defect dojo with other tools.

## API key
API key can be retrieved from GUI.
Dashboard -> top right user icon -> API V2 key

## Dependency Track
Defect dojo integrates with dependency track to collect and dedupe evidence of monitored projects.
The project hierarchy differs from defect-dojo, having to map dependency track projects (that can be hierarchically complex) to organization, assets and engagements:  
https://docs.defectdojo.com/it/asset_modelling/os_hierarchy/os__asset_hierarchy/

### Dependency-Track → DefectDojo: Property per project
 
To set into each Dependency Track non-collection project (e.g. `app`, `docker`).
Path: Project → **View Details** → **Properties** → **Create Property**.
 
| Project | Group Name | Property Name | Property Value | Property Type |
|---|---|---|---|---|
| app | `integrations` | `defectdojo.engagementId` | `<ID engagement version>` | `STRING` |
| app | `integrations` | `defectdojo.testTitle` | `app` | `STRING` |
| app | `integrations` | `defectdojo.reimport` | `true` | `BOOLEAN` |
 
Note:
- `defectdojo.engagementId` is the same for project under the same collection (version engagement).
- `defectdojo.testTitle` need to differs for each project, otherwise with reimport the different project overwrite the same test.
 