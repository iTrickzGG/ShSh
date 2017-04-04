#!/bin/bash
#@iTrickzGG
#March 7-8 2017
clear
echo "What Would You Like To Do Today??"
echo "Please Run "Setup" For The First Time"
echo "@iTrickzGG"
echo "================================================="
echo "[0] Setup"
echo "[1] Save SHSH Blobs For Latest"
echo "[2] Save SHSH Blobs For Specific Signed Firmware"
echo "[3] Verify Existing SHSH Blobs<64bit>"
echo "[4] Exit"
echo "=================================================="
read e
if [ "$e" = "0" ]
	then
cd ~/Desktop
echo "To Setup This Script..Follow The Instructions Below"
	echo "Please Make Sure You Have "tsschecker_macos" On Desktop"
	echo "Please Make Sure You Have "img4tool_macos" On Desktop"
	echo "Please Make Sure You Have The Same Spelling As Shown"
	echo "Please Make Sure You Have A Recent Version Of Said Tools"
	echo "Please Be Sure To Verify Your SHSH, Just In Case"
	echo "Now, You May Use Other Options :D"
	echo "Press Any Key To Dismiss"
read -s -n 1 key
if [[ "$key" == "" ]]
then
mkdir -p SHSHBLOBS
mkdir -p SHSHBLOBS2
else
echo "You Failed To Click Return.."
fi
fi
#-----------------------------------------------------------------------------------------------------------------------------------------------
if [ "$e" = "1" ]
	then
cd ~/Desktop
	echo "Great! I Think I Found Them!"
	echo "Let's Get Started, Shall we?"
	echo "[***] What Model Is Your Device <EX: iPhone8,1>"
	echo "To Find Out, Search For Your iDevice In This Page : https://www.theiphonewiki.com/wiki/Models"
read model
	echo "[***] What Board Configuration Do You Have? <EX : n71map>"
	echo "Find Your iDevice Here : https://www.theiphonewiki.com/wiki/Models"
	echo "[*] If You Have 6S(+), Download <Battery Memory System Status Monitor> On Your iDevice"
	echo "That App Will Help Find Your boardconfig"	
read boardconfig
	echo "Almost There.."
	echo "[***] What Is Your ECID?"
	echo "Your ECID Can Be Found In iTunes"
read ecid
	echo "We Are All Set!"
	echo "Fetching Blobs"
cd ~/Desktop
mv ~/Desktop/tsschecker_macos ~/Desktop/ShSh-master
cd ~/Desktop/ShSh-master
sleep 2
chmod +x tsschecker_macos
./tsschecker_macos -d "$model" --boardconfig "$boardconfig" -s -l -e "$ecid" --nocache
mv *.shsh ~/Desktop/SHSHBLOBS
mv *.shsh2 ~/Desktop/SHSHBLOBS2
echo "SHSH Files On Desktop Have Been Moved to Folder "SHSHBLOBS" On Desktop"
echo "SHSH2 Files On Desktop Have Been Moved to Folder "SHSHBLOBS2" On Desktop"
echo "Done!"
echo "Please Verify Your SHSH Blobs, Just In Case"
echo "Press Any Key To Dismiss"
read -s -n 1 key
if [[ "$key" == "" ]]
then
echo "Thanks!"
else
echo "Thanks!"
fi
fi
fi
# --------------------------------------------------------------------------------------------------------
if [ "$e" = "2" ]
	then
cd ~/Desktop
echo "Great! I Think I Found Them!"
cd ~/Desktop
	echo "Great! I Think I Found Them!"
	echo "Let's Get Started, Shall we?"
	echo "[***] What Model Is Your Device <EX: iPhone8,1>"
	echo "To Find Out, Search For Your iDevice In This Page : https://www.theiphonewiki.com/wiki/Models"
read model
	echo "[***] What Board Configuration Do You Have? <EX : n71map>"
	echo "Find Your iDevice Here : https://www.theiphonewiki.com/wiki/Models"
	echo "[*] If You Have 6S(+), Download <Battery Memory System Status Monitor> On Your iDevice"
	echo "That App Will Help Find Your boardconfig"	
read boardconfig
	echo "Almost There.."
	echo "[***] What Is Your ECID?"
	echo "Your ECID Can Be Found In iTunes"
read ecid
echo "[***] Drag The BuildManifest Found In The IPSW Of The SIGNED Firmware You Want To Save SHSH Blobs"
echo "Extract The BuildMaifest By Zipping The IPSW Then Opening, You Should See A Folder"
echo "In The Folder, You Should See The BuildManifest"
read manifest
echo "We Are All Set!"
sleep 2
cd ~/Desktop
mv ~/Desktop/tsschecker_macos ~/Desktop/ShSh-master
cd ~/Desktop/ShSh-master
chmod +x tsschecker_macos
./tsschecker_macos -d "$model" --boardconfig "$boardconfig" -m "$manifest" -s -e "$ecid1" --nocache
echo "Done!"
echo "Please Verify Your SHSH Blobs, Just In Case"
echo "@iTrickzGG"
echo "Press Any Key To Dismiss"
read -s -n 1 key
if [[ "$key" == "" ]]
then
echo "Thanks!"
else
echo "Thanks!"
fi
fi
# -------------------------------------------------------------------------------------------------------
if [ "$e" = "3" ]
	then
echo "So You Saved Your Blobs..Gotta Make Sure They Actually Work, Before It's Too Late..."
echo "Let's Start Shall we?"
echo "[***]Drag Your SHSH Blob That You Would Like To Check"
read shshloc1
echo "[***]Drag The BuildManifest Found In The IPSW Of The SIGNED Firmware You Want To Check SHSH Blobs For"
echo "[*]Extract The BuildMaifest By Zipping The IPSW Then Opening, You Should See A Folder"
echo "In The Folder, You Should See The BuildManifest"
read manifest1
echo "[***]Just Wondering..What BoardConfig Do You Have? <Ex: n71map>"
echo "It is Usually In Your SHSH Blob <ecid#deviceid_boardconfig...shsh>"
read board
echo "That's All You Have To Do"
echo "Let Me Do The Work Now.."
cd ~/Desktop
mv ~/Desktop/img4tool_macos ~/Desktop/ShSh-master
cd ~/Desktop/ShSh-master
chmod +x img4tool_macos
./img4tool_macos -s "$shshloc1" -v "$manifest1"
sleep 1
read -r -p "Do You See $board there? [y/N] " response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
	then
echo "Great! Your SHSH Blobs Are Valid With Your iDevice!"
echo "Done!"
     else
echo "Sorry..Your SHSH Blobs Will Not Be Able To Be Used For Restoring.."
echo "Did You Save Your SHSH Blobs Using This Script?"
echo "Contact @iTrickzGG On Twitter For More Questions"
echo "Done!"
echo "Press Any Key To Dismiss"
read -s -n 1 key
if [[ "$key" == "" ]]
then
echo "Thanks!"
else
echo "Thanks!"
fi
fi
fi
# ----------------------------------------------------------------------------------------------------------
if [ "$e" = "4" ]
	then
echo "Oops..Nothing To See Here..Come Again!"
sleep 2
killall Terminal
else
killall Terminal
fi
# ------------------------------------------------------------------------------------------------------------
