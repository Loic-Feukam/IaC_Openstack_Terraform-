# IaC_Openstack_Terraform-
Déploiement automatisé d’une infrastructure cloud sécurisée sur OpenStack avec Terraform. Architecture réseau segmentée (public / privé), machines virtuelles, contrôle d’accès SSH via Network Security Groups et création d'un compte de stockage.

Description de l’architecture déployée
 Création d’un groupe de ressources.

1️⃣ Mise en place du réseau virtuel.

2️⃣ Sous-réseau public.

Le sous-réseau public héberge une machine virtuelle avec une adresse IP publique permettant l’accès depuis l’extérieur. Ce sous-réseau est destiné aux ressources devant être accessibles depuis Internet, notamment pour l’administration à distance.

3️⃣ Sous-réseau privé

Le sous-réseau privé héberge une machine virtuelle non exposée directement à Internet et un compte de stockage Azure associé à ce sous-réseau. Ce sous-réseau est isolé et conçu pour héberger des ressources internes nécessitant un niveau de sécurité renforcé.

4️⃣ Sécurisation par groupes de sécurité réseau (NSG)

Deux Network Security Groups (NSG) sont définis afin de contrôler les flux réseau :

NSG du sous-réseau public.

Autorise les connexions SSH (port 22) depuis l’extérieur.
Permet l’administration de la machine virtuelle publique.
NSG du sous-réseau privé.

Autorise les connexions SSH uniquement depuis les machines situées dans le sous-réseau public.
Bloque tout accès direct depuis Internet.
