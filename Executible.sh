#1/bin/bash


#cut -d "," -f1 processes.sh


#Non-Preemptive Priority
#npp_function ()

#Preemptive SJF
#psjf_function ()

#Preemptive Priority 
#pp_function ()

#Check Function (to see priority)
#prio_check ()

#File Adding
add_data()
{
	echo "Please input command in proper format IE: Process_Name,arrival_time,CPU_Burst,priority"
	read process
	echo $process >> processes.sh
}

#Array Initializing
arr_int()
{	
	index=0
	while read line ; 
	do
		proc[$index]="$line"
		index=$((index + 1))
	done < processes.sh
	#Process Title
	index=0
	while read line ; 
	do
		proc_title[$index]=`cut -d "," -f1 processes.sh`
		index=$((index + 1))
	done < processes.sh
	#Arrival Time
	index=0
	while read line ; 
	do
		time[$index]=`cut -d "," -f2 processes.sh`
		index=$((index + 1))
	done < processes.sh
	#CPU Burst
	index=0
	while read line ; 
	do
		burst[$index]=`cut -d "," -f3 processes.sh`
		index=$((index + 1))
	done < processes.sh
	#Priority
	index=0
	while read line ; 
	do
		prio[$index]=`cut -d "," -f4 processes.sh`
		index=$((index + 1))
	done < processes.sh
}

#Print Process List
print_plist ()
{
	while read line ;
	do
		echo $line
	done < processes.sh
}

#Pick function
func_func ()
{
	echo "Please Pick a run method
1) Non-Preemptive Priority
2) Preemptive SJF
3) Preemptive Priority"
	read -p "Command: " runss
	case $runss in
		1)
			echo "Non-Preemptive Priority"
			#npp_function
			;;		
		2)
			echo "Preemptive SJF"
			#psjf_function
			;;		
		3)
			echo "Preemptive Priority"
			#pp_function
			;;
	esac
}



#Printing Array
p_array ()
{
	ind=0
	while test $ind -lt ${#proc[*]}
	do
		echo ${proc[$ind]} 

		ind=$((ind + 1))

	done

	ind=0
	while test $ind -lt ${#proc_title[*]}
	do
		echo ${proc_title[$ind]}
		ind=$(($ind + 1))
	done
	ind=0
	while test $ind -lt ${#time[*]}
	do
		echo ${time[$ind]}
		ind=$((ind + 1))

	done

	ind=0
	while test $ind -lt ${#burst[1]}
	do
		echo ${burst[$ind]}
		ind=$((ind + 1))

	done
	ind=0
	while test $ind -lt ${#prio[*]}
	do
		echo ${prio[$ind]}
		ind=$((ind + 1))

	done
}

#Main File
echo "Please Enter an option
Menu
1. Add a process to scheduling
2. Run scheduler on main file
3. Run scheduler on specific file
4. Clear main file scheduler
5. Show Base File
6. Show Array
7. To Reload"

arr_int
read choice
case $choice in
	1)
		add_data

		;;
	2)
		func_func		
		;;
	3)

		;;
	4)
		> processes.sh
		echo "processes.sh is now clear"
		;;
	5)
		print_plist
		;;
	6)
		p_array
		;;
	7) 
		clear
		echo "Reloaded Executible.sh"
		./Executible.sh
		;;
esac

./Executible.sh
