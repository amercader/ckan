# CKAN in GitHub Codespaces

Welcome to your cloud development instance of CKAN! 

 If you are not seeing a browser tab with the CKAN homepage to the right or a terminal below that says _"Running CKAN on http://localhost:5000"_, wait a bit, things are getting set up...

 Once you see them, you are ready to go! 🚀

 ## What is this?

 This is an online development environment powered by [GitHub Codespaces](https://github.com/features/codespaces). It is a fully functional CKAN instance that you can configure and customize in any way you need. Changes that you make to the source files with the editor as well as changes to the site itself (e.g. creating a dataset or uploading a file) will be persisted until you delete the codespace.

 ⚠️ GitHub Codespaces have a free tier, currently 120 core-hours (i.e. 60h on the default 2-core VM, 30h on a 4-core VM), but after that you will be charged for usage. Check the [documentation](https://github.com/features/codespaces) for more details.


 ## What can I do with it?

 ### Explore

 It's your own CKAN demo site! You can log in using the `ckan_admin` sysadmin user (password `test1234`) which will give you full control of the UI. Try creating an Organization, adding some datasets, uploading data, etc

 * [User Guide](https://docs.ckan.org/en/latest/user-guide.html)
 * [Sysadmin Guide](https://docs.ckan.org/en/latest/sysadmin-guide.html)


 ### Customize

 The site has been configured using the default settings that you get in a brand new CKAN instance but you can change any configuration in the `ckan.ini` file. The development server will refresh automatically as soon as you save your changes to reflect the new configuration.

  * [Configuration options reference](https://docs.ckan.org/en/latest/maintaining/configuration.html#ckan-configuration-file)
  * [Authorization overview](https://docs.ckan.org/en/latest/maintaining/authorization.html)

Additionally, you can install as many extensions as you want. Check the extension README for any particular instructions but they all basically follow the same pattern:
1. Open a new terminal in the panel below
2. Clone the extension
    ```
    git clone https://github.com/ckan/ckanext-dcat.git
    ```
3. Install the extension
    ```
    cd ckanext-dcat 
    python setup.py develop --user
    ```
3. Install extra requirements (if any)
    ```
    pip install -r requirements.txt
    ```
4. Add the plugin(s) to the `ckan.plugins` configuration option in the `ckan.ini` file.

### Develop

What you are using right now is an online editor, Visual Studio Code for the Web, which runs in your browser. You can browse the files in the CKAN source code using the tree panel on the left, open one of them and edit it. Once you save your changes, the development server will be restarted automatically.

You can commit your changes to the branch where you started the codespace in using the "Source Control" icon in the left tool bar.

* [Getting started with Visual Studio Code](https://code.visualstudio.com/docs/editor/codebasics)
* [CKAN Architecture Overview](https://docs.ckan.org/en/latest/contributing/architecture.html)




TODO: run the tests (need to create DB/user)


