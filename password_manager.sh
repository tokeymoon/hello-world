#password_manager.sh

echo "パスワードマネージャーへようこそ！"
while true; do
	read -p "次の選択肢から入力してください(Add Password/Get Password/Exit)：" choice
	case $choice in
		"Add Password")
		# Add Password が入力された場合
		read -p "サービス名を入力してください：" service
		read -p "ユーザー名を入力してください：" codename
		read -p "パスワードを入力してください：" pass
		#パスワードの記録
		echo "$service:$codename:$pass" >> TxtPassword
		echo "パスワードの追加は成功しました。"
		#次の選択肢から入力してください(Add Password/Get Password/Exit)：
		;;
		"Get Password")
		# Get Password が入力された場合
		read -p "サービス名を入力してください：" service
		if grep -q $service TxtPassword; then
		## サービス名が保存されていた場合
		#codename = $( grep $service: $TxtPassword | cut -d ":" -f 2 )
		#pass = $( grep $service: $Txtpassword | cut -d ":" -f 3 )
		#echo "サービス名：$service"
		#echo "ユーザー名：$codename"
		#echo "パスワード：$pass"
		echo "サービス名:ユーザー名:パスワード"
		grep $service TxtPassword
		else
		## サービス名が保存されていなかった場合
		echo "そのサービスは登録されていません。"
		fi
		#次の選択肢から入力してください(Add Password/Get Password/Exit)：
		;;
		"Exit")
		# Exit が入力された場合
		echo "Thank you!"
		## プログラムが終了
		exit
		;;
		*)
		# Add Password/Get Password/Exit 以外が入力された場合
		echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
		;;
	esac
done
