pip install --user -r requirements.txt
pip install --user -r dev-requirements.txt
python setup.py develop --user
ckan generate config ckan.ini
mkdir /workspace/data
ckan config-tool ckan.ini ckan.storage_path=/workspace/data
ckan db init
ckan user add ckan_admin email=admin@example.com password=test1234
ckan sysadmin add ckan_admin
