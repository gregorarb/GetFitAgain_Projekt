   M S B A M L   `   `   `  ����R  NTrainingsplanerstellung, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullA%clr-namespace:TrainingsplanerstellungTrainingsplanerstellung  5   	   U QMahApps.Metro, Version=1.5.0.23, Culture=neutral, PublicKeyToken=f4fb5a3c4d1e5b4fV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls 5   	   (    "Trainingsplanerstellung.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   7local%clr-namespace:Trainingsplanerstellung     5   	   Pcontrols;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro     5   	     � Title$  Hauptfenster��5	   	    � WindowState$ 	Maximized=�6    � Icon$" Images/gfa_icon_2k3_icon.ico��66   .��5      � $��Stretch=�6   $��Stretch=�6)    � RowDefinitions 5   
   �� 5      $��* �6    � ColumnDefinitions 5   
   �� 5      $��* �6   .+�5   
   ��  �� TabStripPlacement$
 Left=�6   
������� � IsSharedSizeScope . $��0��6d    � 	Resources 5       �� 
TargetType	 �� Property
 �� Value �� 
TargetType �� CornerRadius ��Name �� Triggers P� Property P� Value �� 
TargetName��%V  '��       �� 5      " ��6   .�5      �� 	 � ��
 5      �� 5      " ��6.   .R�5   "   �� $��Border��6)   $��1,1,1,0q�67   
�������$ 4,4,0,0��6i   $	��2,0q�6�   ._�5   &   �� $ ContentSite��67   $��Center=�5   )   $��Center=�5   )   $��Header��5   )   $
��10,2q�5   )   5   #    5   "   P� 5    &    �@��
IsSelected . . �5!   *   �� $ Border��61   	 � ��
 �	#FF9C9C9C6[   5"   '   P� 5#   &    �@��
IsSelected .  . �5$   *   �� $ Border��61   	 � ��
 �	#FFF0F0F06[   5%   '   5'      5)      5*      5+      .@�5,      �� $��Kunden��6   $��Stretch=�6&   .��5-      � 
�������$��Stretch=�6.   $��Stretch=�6J    5.      �� 5/      $��0.04* �6(   �� 50      $��0.90* �6(   �� 51      $��0.06* �6(    53      �� 54      $��0.33* �6+   �� 55      $��0.33* �6+   �� 56      $��0.33* �6+   .+�58      �� -   5         ��Name$ KundeSuchen_TextBox��58      $��Suchtext eingeben��6;   $��0��6T   $��3��6a   &   System.Windows.Controls.DataGrid  59      -   5          Name$ Kundentabelle_DataGrid��59         AutoGenerateColumns .  $��1��6�   $��3��6�   ��6[   ��  �� Path$ Persons_List�   Columns 5:      0  *System.Windows.Controls.DataGridTextColumn  5;      ,  &System.Windows.Controls.DataGridColumn   Header$ Nachname��61      Width5  /System.Windows.Controls.DataGridLengthConverter$ 1* 6C   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6N   �� *	Surname+  5<      $ Vorname��61   $ 1* 6B    6M   �� *	Prename+  5=      $ Geburtsdatum��61   $
 1.2* 6G    6T   �� *	Birthdate+ �� StringFormat$ {0:dd.MM.yyyy}��  5>      $ Straße��61   $
 0.7* 6A    6N   �� *Street+  5?      $	 PLZ��61   $
 0.5* 6>    6K   �� *
Postcode+  5@      $ Stadt��61   $
 0.7* 6@    6M   �� *Town+  5A      $ Telefonnummer��61   $
 1.3* 6H    6U   �� *Phonenumber+  5B      $ Email��61   $
 1.4* 6@    6M   �� *Email+  5C      $ 
Geschlecht��61   $
 0.9* 6E    6R   �� *Sex+5E      �� 5F      -   5         ��Name$ KundeHinzufuegen_Button��5F      $��2��6>   $��0��6K   $��Kunde hinzufügen��6[   �� 5G      -   5        $ KundeEntfernen_Button��5G      $��2��6<   $��1��6I   $#��Ausgewählten Kunden löschen��6Y   �� 5H      -   5        $ Kundebearbeiten_Button��5H      $��2��6=   $��2��6J   $%��Ausgewählten Kunden bearbeiten��6Z   5I      5J      �� 5K      $��Übungen��6   $��Stretch=�6'   .��5L      � 
������� 5M      �� 5N      -   5         �Name$ 	MainPart2��5N   +   $
��0.8* �6<   �� 5O      -   5        $ 
Exercises2��5O   +   $
��0.2* �6=   5Q      5R      �� 5S      $��Trainingspläne��6   $��Stretch=�6.   .��5T      � ���	#FFE5E5E5$��Stretch=�6.    5U      �� 5V      -   5        $ 	MainPart3��5V   +   $
��0.8* �6<   �� 5W      -	   5        $ 
Exercises3��5W   +   $
��0.2* �6=   .+�5Y      � $��0��6   $��Stretch=�6+    5Z      �� 5[      $��0.05* �6,   �� 5\      $��0.38* �6,   �� 5]      $��0.04* �6,   �� 5^      $��0.04* �6,   �� 5_      $��0.30* �6,   �� 5`      $
��0.1* �6,   �� 5a      $��0.04* �6,   �� 5b      $��0.05* �6,    5d      �� 5e      $
��0.5* �6/   �� 5f      $
��0.5* �6/   .+�5h      �� -
   5        $ TrainingsplanName_TextBox��5h   "   $/��)Geben Sie einen Trainingsplannamen ein...��6E   $��Stretch=�6v   $��0��6�   $��0��6�   ���	#FFF9F9F96�   �� 5i      -   5         ��Name$ KundenName_ComboBox��5i   #    �� Text$% Wählen Sie einen Kunden aus...��5j       �� 
IsEditable .   �� IsTextSearchEnabled  .  ! �� IsTextSearchCaseSensitive! .  $��0��5k      $��1��6*   ���	#FFF9F9F9��5i   @   �� $ Persons_List�5m      �� 5n      -   5        " ��Name$" Uebungen_ListView��5n   #   $
��Auto=�6>   $��1��6n   $��2��6{   ���	#FFF9F9F95p      �� 5q      -   5        $" AnzahlWiederholungen_TextBox��5q   "   # �� 
IsReadOnly# . $��Anzahl an Wiederholungen:��6Z   $��Stretch=�6{   $��2��6�   $��0��6�   ���	#FFF9F9F96�   �� 5r      -   5        $) #AnzahlWiederholungenEingabe_TextBox��5r   "   $ �� TextWrapping$
$ Wrap=�6O   $��Stretch=�6c   $��2��6�   $��1��6�   ���	#FFF9F9F96�   �� 5s      -   5        $ Dauer_TextBox��5s   "   # . $1��+Dauer (Minuten:Sekunden oder nur Sekunden):��6K   $��Stretch=�6~   $��3��6�   $��0��6�   ���	#FFF9F9F96�   �� 5t      -   5        $ DauerEingabe_TextBox��5t   "   $
$ Wrap=�6@   $��Stretch=�6T   $��3��6p   $��1��6}   ���	#FFF9F9F96�   �� 5u      -   5        % ��Name$% UebungName_Image��5u       $��Images/logo_ronnie.png��6:   $��Stretch=�6Z   $��4��6v   $��2��6�   �� 5v      -   5        $ Kurzbeschreibung_TextBox��5v   "   $
$ Wrap=�6D   $!��Kurzbeschreibung der Übung��6X   $��Stretch=�6z   $��5��6�   $��2��6�   ���	#FFF9F9F96�   �� 5w      -   5        $ Ausgewaehlt_TextBox��5w   "   # . $��Ausgewählte Übung:��6Q   $��Stretch=�6k   $��6��6�   $��0��6�   ���	#FFF9F9F96�   �� 5x      -   5        $  AusgewaehlteUebung_TextBox��5x   "   # . $��	Kniebeuge��6X   $��Stretch=�6i   $��6��6�   $��1��6�   ���	#FFF9F9F96�   �� 5y      -   5        $ UebungHinzufuegen_Button��5y   !   $��7��6C   $��0��6P   $��Übung hinzufügen��6`   $��Stretch=�6{   $��Stretch=�6�   6�   �� 5z      -   5        $# TrainingsplanErstellen_Button��5z   !   $��7��6H   $��1��6U   $��Trainingsplan erstellen��6e   $��Stretch=�6�   $��Stretch=�6�   6�   5{      R� 5}      -   5        $��Exercises_TreeView��5}      $��Stretch=�69   $��Stretch=�6W   ���	#FFB1B4B4$��1��6�   .@�5~      Q� -   5        & Q�Name$& Header_TreeView��5~   '   
���������5      (� 5�   "   .��5�   &   �� $
��Wrap=�60   $��Übungen��6D   5�   #   5�      Q� 5�      $��Kraft��6'   $��12(�66   .@�5�      Q� $��Rumpf��6+   
�������.@�5�   "   Q� -   5        $��Übung1��5�   /   
�������6�   Q� 5�   "   -   5        $��Übung2��5�   /   
�������6�   Q� 5�   "   -   5        $��Übung3��5�   /   
�������6�   5�      Q� 5�      $��Beine��6+   
�������.@�5�   "   Q� -   5        $��Übung1��5�   /   
�������6�   Q� 5�   "   -   5        $��Übung2��5�   /   
�������6�   Q� 5�   "   -   5        $��Übung3��5�   /   
�������6�   Q� 5�   "   $��Übung4��6/   
�������6T   5�      Q� 5�      $
��Arme��6+   
�������.@�5�   "   Q� -   5        $��Übung1��5�   /   
�������6�   Q� 5�   "   -    5        $��Übung2��5�   /   
�������6�   5�      5�      Q� 5�      $��Ausdauer��6'   $��12(�69   .@�5�      Q� $��Rumpf��6+   
�������6O   Q� 5�      $��Beine��6+   
�������6O   Q� 5�      $
��Arme��6+   
�������6N   5�      Q� 5�      $��Koordination��6'   $��12(�6=   .@�5�      Q� $��Übung1��6+   
�������6P   Q� 5�      $��Übung2��6+   
�������6P   5�      5�      5�      5�      �� 5�      $��Abmelden��6   $��Stretch=�6(   .��5�      � ���	#FFE5E5E55�      5�      5�      5�      5�      