﻿using BuildingMaterials.PageWindow;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace BuildingMaterials.View
{
    /// <summary>
    /// Логика взаимодействия для InfoWindow.xaml
    /// </summary>
    public partial class InfoWindow : Window
    {
        public InfoWindow()
        {
            InitializeComponent();
        }

        private void BtnLoadProduct_Click(object sender, RoutedEventArgs e)
        {
            FrameInfo.Content = new PageProductInfo();
        }

        private void BtnLoadOrder_Click(object sender, RoutedEventArgs e)
        {
            FrameInfo.Content = new PageOrderInfo();
        }

        private void BtnLoadOrderPickupPoint_Click(object sender, RoutedEventArgs e)
        {
            FrameInfo.Content = new PageOrderPickupPointInfo();
        }

        private void BtnExit_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            App.Current.MainWindow = mainWindow;
            mainWindow.Show();
            this.Close();
        }
    }
}