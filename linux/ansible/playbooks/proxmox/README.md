# LXC Container Deployment mit Ansible (Proxmox)

## Allgemeines

Dieses Playbooks erstellt einen LXC Container (DHCP) mit einem OS deiner Wahl (vorher definierbar durch templates) in einer PVE Umgebung deiner Wahl.

In diesem Repo Beispielhaft mit Rocky Linux oder Ubuntu.

Folgende Variablen werden bei start des Playbooks abgefragt:

* pve_environment
* vm_os
* vm_name
* vm_id

Folgende Variablen sind fest vergeben:

* vm_storage
* vm_ram
* vm_cpu
* vm_type

## Vorbereitung

* Erstelle einen Ordner 'vars' in dem gleichen Verzeichnis in dem sich das Playbook befindet.
* Für jede PVE Umgebung musst du in diesem Ordner eine env.yml Datei anlegen

Beispiel:

```yaml
node: NAME_OF_YOUR_NODE
api_user: "user@pam"
api_token_secret: YOUR_API_KEY
api_host: "IP_OF_YOUR_PVE_HOST"
ostemplate_path: PVE_TEMPLATE_STORAGE_NAME
storage: PVE_STORAGE_NAME 
storage_path: PVE_VM_HDD_STORAGE_PATH
```

Dafür benötigst du einen API User auf deinem Proxmox der [VMs erstellen darf](https://pve.proxmox.com/wiki/User_Management#pveum_permission_management).

In diesem Repo gehe ich von zwei PVE Umgebungen aus, die eine hat nur eine Node und die andere mehrer.

* Für jedes [OS](https://pve.proxmox.com/wiki/Linux_Container#pct_container_images) musst du musst du in diesem Ordner eine os_name.yaml Datei erstellen die den Namen des Templates enthält.

Beispiel:

```yaml
vm_os_path: ubuntu-22.04-standard_22.04-1_amd64.tar.zst
```

* Ansible Module siehe requirenments.yml
* Python Module: proxmoxer, requests
