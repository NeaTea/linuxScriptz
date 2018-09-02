 #!/bin/bash
#Unity Greeter
function lightdm() {
	lightdm=$(grep "allow-guest=" /usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf)
	if [ "$lightdm" == null ]; then
		echo "allow-guest=false" >> /usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf
	else
		sed -i -e 's/allow-guest=*/allow-guest=false/g' /usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf
	fi
}
lightdm(){ true;}
