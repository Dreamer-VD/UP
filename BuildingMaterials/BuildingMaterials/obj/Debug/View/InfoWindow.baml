   M S B A M L   `   `   `  ����L  HBuildingMaterials, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null?$clr-namespace:BuildingMaterials.ViewBuildingMaterials.View  5   	   '    !BuildingMaterials.View.InfoWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   6local$clr-namespace:BuildingMaterials.View     5   	     � WindowStartupLocation$  CenterScreen=�5   	    � Title$ Гостевое окно��5	   	   $	��550��6   $	��920��6,   $	��400��68   $	��500��6H   .��5
      �  � RowDefinitions 5   
   �� 5      $��70 �6   �� 5      $��* �6   �� 5      $��30 �6   .+�5   
   �� $��0��6    �� Orientation$ 
Horizontal=�6"   $	��800��6;   $��35��6G   $	��Top=�6S   $��Center=�6k   .+�5      �� $��Поиск товара��6   $��Center=�6,   $
��Bold"�6I   $��Comic Sans MS)�6[   $��Bottom=�6v   $��20,0,0,0q�6�   �� 5      $@��:Cортировка товаратовара по цене��6   $
��Bold"�6>   $��Comic Sans MS)�6P   $��Bottom=�6k   $��Right=�6�   $��	160,0,0,0q�6�   5      �� 5   
   $ 
Horizontal=�6   $��Bottom=�6.   $	��800��6I   $��35��6U   $��Center=�6a   .+�5      �� -   5        $��	TB_Search��5      $	��150��6'   $��25��63   $��Comic Sans MS)�6?   6Z   	� 5      -   5        $	��RBA��5      $#��По возврастанию��6%   $��Comic Sans MS)�6?   $��	120,0,0,0q�6Z    d� 	IsChecked$ FalseY�6m   6   	� 5      -   5        $	��RBD��5      $��По убыванию��6&   $��Comic Sans MS)�6<   $ FalseY�6W   6i   5      �� 5   
   -   5        $��	lbProduct��5      $��1��6k   ��6$   �� *
Products+ �� SelectedItem 6E   �� *SelectedItem+��5      �� 5      .R�5       �  � Orientation$ 
Horizontal=�6    .+�5!      �� $��\Resource\picture.png��6    $	��100��6?   $	��100��6L   �� 5"      $ Vertical=�6%   $��	20 15 0 0q�6<   $	��650��6O   $
��Auto��6[   .+�5#      �� $��Название:��6(   �� 5$      $
��Bold"�6Q   ��6(   �� *ProductName.NameProduct+6Q   �� 5%      $��Описание:��6(   �� 5&      $
��Bold"�6L   ��6(   �� *ProductDescription+6L   �� 5'      $!��Производитель:��6(   �� 5(      $
��Bold"�6e   ��6(   �� *-+ProductManufacturer.ProductManufacturerName+6e   �� 5)      $��Стоимость:��6(   �� 5*      $
��Bold"�6E   ��6(   �� *ProductCost+6E   5+      �� 5-      $ Vertical=�6%   $��0 15 0 0q�6<   .+�5.      �� $$��Кол-во на складе:��6(   �� 5/      $
��Bold"�6P   ��6(   �� *ProductQuantityInStock+6P   50      51      52      54      �� 56   
   -   5         ��Name$ BtnExit��56      $��2��6"   $	��150��6/   $��30��6;   $��Bottom=�6G   $��Right=�6b   ���	#FF498C51$$��Вернуться в меню��6�   $��Comic Sans MS)�6�   6�   58      59      