## 01_on-premises

> Note: Перед вызовом **init** нужно включить **VPN**. После установки провайдеров, необходимо его выключить.

Proof of concept: Деплой образа в локальной инфраструктуре. Манифест не меняет пароли пользователей и не кастомизирует ОС. Выводит просто IP адреса задеплоенных VM. CML2 - admin:P@ssw0rd, OS - sysadmin:sysadmin.

```bash
cd 01_on-premises/
terraform init
terraform plan -var-file="E:\creds\creds-local.tfvars"
terraform apply -var-file="E:\creds\creds-local.tfvars"
terraform destroy -var-file="E:\creds\creds-local.tfvars"
```

## 02_c4y_cloud

> Note: Перед вызовом **init** нужно включить **VPN**. После установки провайдеров, необходимо его выключить.

Деплой образа в инфраструктуре выбранного IaaS провайдера

Если скрипт смены пароля не запускается, то нужно убедиться, что в Powershell разрешено выполнение неподписанных скриптов, запустив от имени Администратора следущие команды:

```
Get-ExecutionPolicy
Set-ExecutionPolicy unrestricted
```

Запуск манифеста

```bash
cd 02_c4y_cloud/
terraform init
terraform plan -var-file="E:\creds\creds-cy.tfvars"
terraform apply -var-file="E:\creds\creds-cy.tfvars"
terraform destroy -var-file="E:\creds\creds-cy.tfvars"
```

Вывод манифеста
```json
{
    "properties": [ {
        "vm-uri": "URI for CML2",
        "cml2-user": "CML2 user",
        "cml2-password": "CML2 password",
        "ip-address": "VM's IPv4 address",
        "os-user": "OS system user",
        "os-password": "OS system password"
    } ]
}
```

Подключение к VM с Bastion host

```bash
ssh sysadmin@192.168.200.10 -p 1122
ssh sysadmin@192.168.200.11 -p 1122
```

## 03_selectel_cloud

> Note: Перед вызовом **init** нужно включить **VPN**. После установки провайдеров, необходимо его выключить.

Деплой образа в инфраструктуре резервного IaaS провайдера

```bash
cd 03_selectel_cloud/
terraform init
terraform plan -var-file="E:\creds\creds-sl.tfvars"
terraform apply -var-file="E:\creds\creds-sl.tfvars"
terraform destroy -var-file="E:\creds\creds-sl.tfvars"
```

Вывод манифеста
```json
{
    "properties": [ {
        "vm-uri": "URI for CML2",
        "cml2-user": "CML2 user",
        "cml2-password": "CML2 password",
        "ip-address": "VM's IPv4 address",
        "os-user": "OS system user",
        "os-password": "OS system password"
    } ]
}
```

Подключение к VM с Bastion host

```bash
ssh sysadmin@192.168.100.10 -p 1122
ssh sysadmin@192.168.100.11 -p 1122
```

## TestLab.yaml

Простая лабораторная работа из двух устройств с доступом в интернет

## Auto checker

Импортируйте тестовую лабораторную работу TestLab.yaml в выбранный экземпляр CML2

Подключаемся к хосту, имеющим доступ к развернутым лабораторным работам

```bash
ssh root@wsr39.ru
cd pyats/
```
Нужно убедиться, что в testbed.yaml указан IP адрес существующего CML

```bash
source .venv/bin/activate
python test/test.py --testbed ./testbed.yaml
```