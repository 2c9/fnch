
## 01_on-premises

Деплой образа в локальной инфраструктуре

```bash
cd 01_on-premises/
terraform plan
terraform apply -var-file="E:\creds\creds-local.tfvars"
```

## 02_c4y_cloud

Деплой образа в инфраструктуре выбранного IaaS провайдера

Если скрипт смены пароля не запускается, то нужно убедиться, что в Powershell разрешено выполнение неподписанных скриптов

```
Get-ExecutionPolicy
Set-ExecutionPolicy unrestricted
```
Запуск манифеста

```bash
cd 02_c4y_cloud/
terraform plan
terraform apply -var-file="E:\creds\creds-cy.tfvars"
```

## 03_selectel_cloud

Деплой образа в инфраструктуре резервного IaaS провайдера

```bash
cd 03_selectel_cloud/
terraform plan
terraform apply -var-file="E:\creds\creds-sl.tfvars"
```

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