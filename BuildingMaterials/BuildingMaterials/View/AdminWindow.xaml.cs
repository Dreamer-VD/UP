﻿using BuildingMaterials.DataBase;
using BuildingMaterials.PageWindow;
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
using System.Windows.Shapes;

namespace BuildingMaterials.View
{
    /// <summary>
    /// Логика взаимодействия для AdminWindow.xaml
    /// </summary>
    public partial class AdminWindow : Window
    {
        public AdminWindow()
        {
            InitializeComponent();
            this.DataContext = new ProductViewModel();
        }

        private void BtnExit_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            App.Current.MainWindow = mainWindow;
            mainWindow.Show();
            this.Close();
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            AddProductWindow addProductWindow = new AddProductWindow();
            addProductWindow.Show();
        }

        private void BtnChange_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            (DataContext as ProductViewModel).DeleteProduct();
        }

        private void BtnLoadProductName_Click(object sender, RoutedEventArgs e)
        {
            FrameInfo.Content = new PageProductName();
        }

        private void BtnLoadProductСategory_Click(object sender, RoutedEventArgs e)
        {
            FrameInfo.Content = new PageProductСategory();
        }

        private void BtnLoadProductManufacturer_Click(object sender, RoutedEventArgs e)
        {
            FrameInfo.Content = new PageProductManufacturerInfo();
        }

        private void BtnLoadGoodsSupplier_Click(object sender, RoutedEventArgs e)
        {
            FrameInfo.Content = new PageGoodsSupplierInfo();
        }
    }
}
