# Install CKAN locally
python setup.py develop --user

# Create ini file
ckan generate config ckan.ini

# Set up storage
mkdir /workspace/data
ckan config-tool ckan.ini ckan.storage_path=/workspace/data

# Set up site URL
ckan config-tool ckan.ini ckan.site_url=https://$CODESPACE_NAME-5000.$GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN

# Init DB
ckan db init

# Create sysadmin user
ckan user add ckan_admin email=admin@example.com password=test1234
ckan sysadmin add ckan_admin

# Set up DataStore
ckan config-tool ckan.ini \
    ckan.datastore.write_url=postgresql://ckan_default:pass@localhost/datastore_default \
    ckan.datastore.read_url=postgresql://datastore_default:pass@localhost/datastore_default \
    "ckan.plugins=activity datastore datatables_view"
ckan datastore set-permissions | psql $(grep ckan.datastore.write_url ckan.ini | awk -F= '{print $2}')

# Install ckanext-xloader
git clone https://github.com/ckan/ckanext-xloader.git
cd ckanext-xloader && python setup.py develop --user && cd ..
pip install -r ckanext-xloader/requirements.txt
ckan config-tool ckan.ini "ckan.xloader.api_token=$(ckan user token add ckan_admin datapusher | tail -n 1 | tr -d '\t')"
ckan config-tool ckan.ini "ckan.plugins=activity datastore datatables_view xloader"
