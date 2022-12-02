;0.0.1 20221203 初版完成

#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Math.au3>
#include <Array.au3>
#Region ### START Koda GUI section ### Form=c:\users\zen\documents\autoit\breakerselector\dbselectorui.kxf

Local $iDBNum																			;空きスロット数格納用変数

;ウィンドウ及びメニュー作成
Local $DBSelector = GUICreate("DevilBreakerSelector", 586, 481, 190, 145, BitOR($WS_SYSMENU,$WS_CLIPCHILDREN))
;Local $MenuItem1 = GUICtrlCreateMenu("条件を保存(&Y)")									;将来実装する
;Local $MenuItem2 = GUICtrlCreateMenu("条件を読み込む(&Z)")								;将来実装する
GUISetFont(11, 800, 0, "メイリオ")
GUISetBkColor(0xA6CAF0)

;マガジンスロット表示及び設定部
Local $DMC5Title = GUICtrlCreatePic("image\DMC5Titlelogo.jpg", 10, 7, 150, 92)
Local $MagazinSlot = GUICtrlCreateLabel("マガジン空きスロット数", 8, 192, 178, 21)
GUICtrlSetFont(-1, 13, 800, 0, "富士ポップＰ")
GUICtrlSetColor(-1, 0x000000)
Local $SlotNum = GUICtrlCreateCombo("", 192, 190, 41, 25, $CBS_DROPDOWNLIST)
GUICtrlSetData(-1, "1|2|3|4|5|6|7|8", "8")
GUICtrlSetFont(-1, 12, 400, 0, "富士ポップＰ")
GUICtrlSetColor(-1, 0x000000)

;Devil Breaker名称表示部
Local $OverTure = GUICtrlCreateLabel("OverTure", 167, 10, 140, 18)
Local $Gerbera = GUICtrlCreateLabel("Gerbera", 167, 34, 140, 18)
Local $PunchLine = GUICtrlCreateLabel("PunchLine", 167, 58, 140, 18)
Local $HelterSkelter = GUICtrlCreateLabel("HelterSkelter", 167, 82, 140, 18)
Local $TomBoy = GUICtrlCreateLabel("TomBoy", 167, 106, 140, 18)
Local $RawHide = GUICtrlCreateLabel("RawHide", 167, 130, 140, 18)
Local $BusterArm = GUICtrlCreateLabel("BusterArm", 167, 154, 140, 18)
Local $RagTime = GUICtrlCreateLabel("RagTime", 359, 10, 166, 18)
Local $GerberaGP01 = GUICtrlCreateLabel("GerberaGP01", 359, 34, 166, 18)
Local $PastaBreaker = GUICtrlCreateLabel("PastaBreaker", 359, 58, 166, 18)
Local $SweetSurrender = GUICtrlCreateLabel("SweetSurrender", 359, 82, 166, 18)
Local $RockBuster = GUICtrlCreateLabel("RockBuster", 359, 106, 166, 18)
Local $MonkeyBusiness = GUICtrlCreateLabel("MonkeyBusiness", 359, 130, 166, 18)
Local $aAllDBName = [$OverTure, $Gerbera, $PunchLine, $HelterSkelter, $TomBoy, $RawHide, $BusterArm, _
					$RagTime, $GerberaGP01, $PastaBreaker, $SweetSurrender, $RockBuster, $MonkeyBusiness]
For $idDBName In $aAllDBName
	GUICtrlSetFont($idDBName, 14, 800, 0, "富士ポップＰ")
	GUICtrlSetColor($idDBName, 0x000000)
Next

;Devil Breaker数量設定部
Local $OverTureNum = GUICtrlCreateCombo("", 319, 10, 35, 25, $CBS_DROPDOWNLIST)
Local $GerberaNum = GUICtrlCreateCombo("", 319, 34, 35, 25, $CBS_DROPDOWNLIST)
Local $PunchLineNum = GUICtrlCreateCombo("", 319, 58, 35, 25, $CBS_DROPDOWNLIST)
Local $HelterSkelterNum = GUICtrlCreateCombo("", 319, 82, 35, 25, $CBS_DROPDOWNLIST)
Local $TomBoyNum = GUICtrlCreateCombo("", 319, 106, 35, 25, $CBS_DROPDOWNLIST)
Local $RawHideNum = GUICtrlCreateCombo("", 319, 130, 35, 25, $CBS_DROPDOWNLIST)
Local $BusterArmNum = GUICtrlCreateCombo("", 319, 154, 35, 25, $CBS_DROPDOWNLIST)
Local $RagTimeNum = GUICtrlCreateCombo("", 535, 10, 35, 25, $CBS_DROPDOWNLIST)
Local $GerberaGP01Num = GUICtrlCreateCombo("", 535, 34, 35, 25, $CBS_DROPDOWNLIST)
Local $PastaBreakerNum = GUICtrlCreateCombo("", 535, 58, 35, 25, $CBS_DROPDOWNLIST)
Local $SweetSurrenderNum = GUICtrlCreateCombo("", 535, 82, 35, 25, $CBS_DROPDOWNLIST)
Local $RockBusterNum = GUICtrlCreateCombo("", 535, 106, 35, 25, $CBS_DROPDOWNLIST)
Local $MonkeyBusinessNum = GUICtrlCreateCombo("", 535, 130, 35, 25, $CBS_DROPDOWNLIST)
Local $aAllDBNum = [$OverTureNum, $GerberaNum, $PunchLineNum, $HelterSkelterNum, $TomBoyNum, $RawHideNum, $BusterArmNum, _
					$RagTimeNum, $GerberaGP01Num, $PastaBreakerNum, $SweetSurrenderNum, $RockBusterNum, $MonkeyBusinessNum]
For $idDBNum In $aAllDBNum
	GUICtrlSetFont($idDBNum, 10, 800, 0, "富士ポップＰ")
	GUICtrlSetColor($idDBNum, 0x000000)
	if $idDBNum = $MonkeyBusinessNum Then
		GUICtrlSetData($idDBNum, "0|1|2|3|4|5|6|7|8|9", "0")
		ContinueLoop
	EndIf
	GUICtrlSetData($idDBNum, "0|1|2|3|4|5|6|7|8|9", "1")
Next

;ゲームモード設定部
Local $Modeselect = GUICtrlCreateGroup("Mode select", 9, 102, 153, 80, -1, $WS_EX_TRANSPARENT)
GUICtrlSetFont(-1, 11, 800, 0, "富士ポップＰ")
GUICtrlCreateGroup("", -99, -99, 1, 1)
Local $Radio1 = GUICtrlCreateRadio("Normal play", 17, 124, 137, 25)
GUICtrlSetState(-1, $GUI_CHECKED)
Local $Radio2 = GUICtrlCreateRadio("Bloody palace", 17, 154, 137, 25)
Local $Button1 = GUICtrlCreateButton("Start!", 240, 185, 97, 33)
GUICtrlSetFont(-1, 16, 800, 0, "富士ポップＰ")
Local $aModeselectName = [$Modeselect, $Radio2, $Radio1, $Button1]
For $idModeselectName In $aModeselectName
	GUICtrlSetColor($idModeselectName, 0x000000)
	If $idModeselectName = $Radio1 Or $idModeselectName = $Radio2 Then GUICtrlSetFont($idModeselectName, 12, 800, 0, "富士ポップＰ")
Next

Local $sImageDir = "image\"
Local $aDevilBreakerName = ["OverTure", "Gerbera", "PunchLine", "HelterSkelter", "TomBoy", "RawHide", "BusterArm", _
							"RagTime", "GerberaGP01", "PastaBreaker", "SweetSurrender", "RockBuster","MonkeyBusiness"]

Local $Pic1 = GUICtrlCreatePic("image\OverTure.jpg", 48, 238, 98, 50)
Local $Pic2 = GUICtrlCreatePic("image\Gerbera.jpg", 176, 238, 98, 50)
Local $Pic3 = GUICtrlCreatePic("image\PunchLine.jpg", 304, 238, 98, 50)
Local $Pic4 = GUICtrlCreatePic("image\HelterSkelter.jpg", 432, 238, 98, 50)
Local $Pic5 = GUICtrlCreatePic("image\TomBoy.jpg", 49, 332, 98, 50)
Local $Pic6 = GUICtrlCreatePic("image\RawHide.jpg", 176, 332, 98, 50)
Local $Pic7 = GUICtrlCreatePic("image\BusterArm.jpg", 304, 332, 98, 50)
Local $Pic8 = GUICtrlCreatePic("image\RagTime.jpg", 432, 332, 98, 50)
Local $aSelectedPic = [$Pic1, $Pic2, $Pic3, $Pic4, $Pic5, $Pic6, $Pic7, $Pic8]

Local $Label1 = GUICtrlCreateLabel("OverTure", 48, 298, 106, 22)
Local $Label2 = GUICtrlCreateLabel("Gerbera", 176, 298, 106, 22)
Local $Label3 = GUICtrlCreateLabel("PunchLine", 304, 298, 106, 22)
Local $Label4 = GUICtrlCreateLabel("HelterSkelter", 432, 298, 106, 22)
Local $Label5 = GUICtrlCreateLabel("TomBoy", 48, 396, 106, 22)
Local $Label6 = GUICtrlCreateLabel("RawHide", 176, 396, 106, 22)
Local $Label7 = GUICtrlCreateLabel("BusterArm", 304, 396, 106, 22)
Local $Label8 = GUICtrlCreateLabel("RagTime", 432, 396, 106, 22)
Local $aSelectedDBLabel = [$Label1, $Label2, $Label3, $Label4, $Label5, $Label6, $Label7, $Label8]
For $idSelectedDBLabel In $aSelectedDBLabel
	GUICtrlSetFont($idSelectedDBLabel, 11, 800, 0, "Segoe Marker")
	GUICtrlSetColor($idSelectedDBLabel, 0x000000)
Next
GUISetState(@SW_SHOW)

;プログレスバー表示部
Local $Label9 = GUICtrlCreateLabel("What will come out", 353, 184, 235, 22)
GUICtrlSetFont(-1, 11, 400, 0, "Segoe Marker")
GUICtrlSetState(-1, $GUI_HIDE)
Local $Progress1 = GUICtrlCreateProgress(352, 208, 214, 9)

#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
;		Case $MenuItem1															;将来実装する
;		Case $MenuItem2															;将来実装する
		Case $SlotNum
			$iDBNum = GUICtrlRead($SlotNum)										;コンボボックスの値を取得
			For $i = 0 To UBound($aSelectedPic) - 1
				If $i < $iDBNum Then
					GUICtrlSetImage($aSelectedPic[$i], $sImageDir & $aDevilBreakerName[$i] & ".jpg")
					GUICtrlSetData($aSelectedDBLabel[$i], $aDevilBreakerName[$i])
				Else
					GUICtrlSetImage($aSelectedPic[$i], "image\Nothing.jpg")
					GUICtrlSetData($aSelectedDBLabel[$i], "Nothing")
				EndIf
			Next
		Case $Radio2
			For $i = 0 To 12
				If $i < 6 Then
					GUICtrlSetData($aAllDBNum[$i], "", "")
					GUICtrlSetData($aAllDBNum[$i], "0|1|2|3|4|5|6|7|8|9", "2")
				ElseIf $i = 6  Or $i = 7 Then
					GUICtrlSetData($aAllDBNum[$i], "", "")
					GUICtrlSetData($aAllDBNum[$i], "0|1|2|3|4|5|6|7|8|9", "1")
				Else
					GUICtrlSetData($aAllDBNum[$i], "", "")
					GUICtrlSetData($aAllDBNum[$i], "0|1|2|3|4|5|6|7|8|9", "0")
				EndIf
			Next
		Case $Radio1
			For $i = 0 To 12
				If $i < 12 Then
					GUICtrlSetData($aAllDBNum[$i], "", "")
					GUICtrlSetData($aAllDBNum[$i], "0|1|2|3|4|5|6|7|8|9", "1")
				Else
					GUICtrlSetData($aAllDBNum[$i], "", "")
					GUICtrlSetData($aAllDBNum[$i], "0|1|2|3|4|5|6|7|8|9", "0")
				EndIf
			Next
		Case $Button1
			;マガジン空きスロット分の画像をNeroに差し替える
			$iDBNum = GUICtrlRead($SlotNum)										;コンボボックスの値を取得
			For $i = 0 To $iDBNum - 1
				GUICtrlSetImage($aSelectedPic[$i], "image\nero.jpg")
				GUICtrlSetData($aSelectedDBLabel[$i], "You're a demon!?")
			Next
			;抽選候補(のindex No.)を配列に格納する
			Local $aLotteryCandidate[0]											;抽選候補Devil Breakerを格納する配列
			For $i = 0 To UBound($aAllDBNum) - 1
				Local $iDBNum = GUICtrlRead($aAllDBNum[$i])
				If Not($iDBNum) Then ContinueLoop
				For $j = 0 To $iDBNum - 1
					_ArrayAdd($aLotteryCandidate, $i)
				Next
			Next
			Local $bFlag = False												;ゲームモード判定用フラグ
			If GUICtrlRead($Radio1) = 1 Then $bFlag = True						;Normalの場合True、Bloody PalaceはFalse
			Local $iDBSlotNum = GUICtrlRead($SlotNum)
			;抽選実行し結果を配列に格納
			Local $aSelectedDB = DevilBreakerLottery($aLotteryCandidate, $iDBSlotNum, $bFlag)
			;ここから演出：文字を点滅させたりプログレスバーを伸ばしたり勿体つけたり
			GUICtrlSetData($Label9, "What will come out")
			GUICtrlSetState($Label9, $GUI_SHOW)
			For $i = 1 To 100
				GUICtrlSetData($Progress1, $i)
				If $i > 10 And $i < 21 Then
					If $i = 12 Or $i = 14 Or $i = 16 Or $i = 18 Then
						GUICtrlSetState($Label9, $GUI_HIDE)
					Else
						GUICtrlSetState($Label9, $GUI_SHOW)
					EndIf
				ElseIf $i > 22 And $i < 35 And _MathCheckDiv($i, 2) = 2 Then
					If $i = 22 Or $i = 26 Or $i = 30 Or $i = 34 Then
						GUICtrlSetState($Label9, $GUI_HIDE)
					Else
						GUICtrlSetState($Label9, $GUI_SHOW)
					EndIf
					GUICtrlSetData($Label9, "What will come out")
				ElseIf $i > 31 And $i < 56 And _MathCheckDiv($i, 5) = 2 Then
					If $i = 35 Or $i = 45 Or $i = 55 Then
						GUICtrlSetState($Label9, $GUI_HIDE)
						If  $i = 45 Then GUICtrlSetData($Label9, "What will come out...")
					Else
						GUICtrlSetState($Label9, $GUI_SHOW)
					EndIf
				ElseIf $i = 65 Then
					GUICtrlSetState($Label9, $GUI_SHOW)
					GUICtrlSetData($Label9, "What will come out......")
				ElseIf $i = 85 Then
					GUICtrlSetData($Label9, "What will come out.........")
				ElseIf $i = 100 Then
					GUICtrlSetData($Label9, "What will come out............")
				EndIf
				Sleep(30)
			Next
			;抽選結果($aSelectedDB)を表示する
			For $i = 0 to UBound($aSelectedDB) - 1
				Sleep(500)
				GUICtrlSetImage($aSelectedPic[$i], $sImageDir & $aDevilBreakerName[$aSelectedDB[$i]] & ".jpg")
				GUICtrlSetData($aSelectedDBLabel[$i], $aDevilBreakerName[$aSelectedDB[$i]])
			Next
			Sleep(1000)
			GUICtrlSetData($Label9, "Finished!")
			Sleep(1000)
			GUICtrlSetData($Progress1, 0)
			GUICtrlSetState($Label9, $GUI_HIDE)
	EndSwitch
WEnd

;/_/_/_/_/_/_以下専用関数/_/_/_/_/_/_
;配列を受け取り抽選を指定回数($iLotteryCount)行い、結果を配列で返す。$bNormalFlagがTrueなら重複あり。
;$iLotteryCountはマガジン空きスロット数を、重複無しはBloodyPalaceを想定。受け取る配列内に重複を作る事で確立を操作。
Func DevilBreakerLottery($aArray, $iLotteryCount, $bNormalFlag=True)
    Local $aDevilBreakerArray[0]                        ;念の為、$aArrayの中身をコピーする為の配列
    Local $aResultArray[0]                              ;抽選結果格納用配列
    Local $iSelectedNum                                 ;BloodyPalace当選Index除外の為の一時格納用

    For $Elem In $aArray                                ;$aArrayの中身をローカル変数にコピーする
        _ArrayAdd($aDevilBreakerArray, $Elem)
    Next
    If $bNormalFlag Then                                ;NormalPlay時の抽選。重複あり。
        For $i = 0 To $iLotteryCount - 1
            _ArrayAdd($aResultArray, $aDevilBreakerArray[Random(0, UBound($aDevilBreakerArray) - 1)], 1)
        Next
    Else                                                ;BloodyPalace時の抽選。一度当たった要素は除外して抽選する。
        For $i = 0 To $iLotteryCount - 1
            $iSelectedNum = Random(0, UBound($aDevilBreakerArray) - 1,1)
            _ArrayAdd($aResultArray, $aDevilBreakerArray[$iSelectedNum])
            _ArrayDelete($aDevilBreakerArray, $iSelectedNum)
        Next
    EndIf
    Return $aResultArray
EndFunc
