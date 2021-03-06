# crisalid_infra
Valerii Spiridonov Infra repository

<h2>VPN</h2>

Папка VPN включает в себя данные, необходимые для подключения к серверу, имеющему только внутренний ip-адрес - через VPN на bastion host, находящийся в этой же сети, но с внешним адресом.<br>

<pre>
bastion_IP = 35.210.51.84
someinternalhost_IP = 10.132.0.3
</pre>

Подключение к VPN осуществляется путём установки OpenVPN клиента и использования находящегося в репозитарии файла-ключа.

<h2>SSH</h2>

Переход к целевому серверу через бастион одной командой выглядит так: ssh -i gcp-bastion -A -t 35.210.51.84 ssh 10.132.0.3 где gcp-bastion - ваш ssh key, флаг -A указывает на передачу ключа дальше по сессии, а флаг -t включает присвоение терминального ввода на промежуточном сервере сразу после предыдущей выполненой команды.

<h2>TESTAPP</h2>

Для перехода к тестовому приложению необходимо использовать следущие адрес и порт:

<pre>
testapp_IP = 35.205.194.187
testapp_port = 9292
</pre>

Следущие bash-скрипты содержат команды для деплоймента
install_ruby.sh - фреймворк Ruby
install_mongodb.sh - база данных MongoDB
deploy.sh - тестовое приложение

Скрипты уже являются исполняемыми.

<h2>Packer</h2>

Папка packer включает в себя шаблон проекта для билда образа, содержащего Ruby и MongoDB с помощью packer.

<h2>Terraform</h2>

Папка terraform содержит проект управления инфраструктурой через IaC фреймворк Terraform. Проект разворачивает из подготовленного с помощью Packer образа новый инстанс, устанавливает на него приложение reddit-app, и создает firewall-правило.

<h2>Terraform 2</h2>

Папка Terraform содержит готовые модули для деплоймента приложения, базы данных и настроек файрвола, а так же конфигурации для stage и prod энвайронментов.
