﻿using BuildingMaterials.View;
using BuildingMaterials.VIewModel;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace BuildingMaterials
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            this.DataContext = new AuthorizationViewModel();
        }

        private void BtnSignIn_Click(object sender, RoutedEventArgs e)
        {
            (DataContext as AuthorizationViewModel).Password = PasswordBox.Password;
            (DataContext as AuthorizationViewModel).Verification();
        }

        private void BtnVisitor_Click_1(object sender, RoutedEventArgs e)
        {
            InfoWindow infoWindow = new InfoWindow();
            App.Current.MainWindow = infoWindow;
            infoWindow.Show();
            this.Close();
        }
    }
}
