using BuildingMaterials.DataBase;
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
    /// Логика взаимодействия для ManagerWindow.xaml
    /// </summary>
    public partial class ManagerWindow : Window
    {
        public ManagerWindow()
        {
            InitializeComponent();
            this.DataContext = new ProductViewModel();
        }

        private void BtnExit_Click_1(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            App.Current.MainWindow = mainWindow;
            mainWindow.Show();
            this.Close();
        }
        private void TB_Search_TextChanged(object sender, TextChangedEventArgs e)
        {
            lbProduct.ItemsSource = AppData.db.Product.Where(l => l.ProductName.NameProduct == TB_Search.Text || l.ProductName.NameProduct.Contains(TB_Search.Text)
            || l.ProductArticleNumber == TB_Search.Text || l.ProductArticleNumber.Contains(TB_Search.Text)
            || l.ProductDescription == TB_Search.Text || l.ProductDescription.Contains(TB_Search.Text)
            || l.ProductСategory.CategoryName == TB_Search.Text || l.ProductСategory.CategoryName.Contains(TB_Search.Text)
            || l.ProductManufacturer.ProductManufacturerName == TB_Search.Text || l.ProductManufacturer.ProductManufacturerName.Contains(TB_Search.Text)
            || l.GoodsSupplier.GoodsSupplierName == TB_Search.Text || l.GoodsSupplier.GoodsSupplierName.Contains(TB_Search.Text)
            ).ToList();
        }

        private void RBA_Checked(object sender, RoutedEventArgs e)
        {
            if (RBA.IsChecked == true)
            {
                (DataContext as ProductViewModel).Sort(1);
            }
            else if (RBD.IsChecked == true)
            {
                (DataContext as ProductViewModel).Sort(2);
            }
        }
    }
}
