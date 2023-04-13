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
    /// Логика взаимодействия для AdminWindow.xaml
    /// </summary>
    public partial class AdminWindow : Window
    {
        public AdminWindow()
        {
            InitializeComponent();
            this.DataContext = new ProductViewModel();
        }

        public void LoadData()
        {
            var product = AppData.db.Product.ToList();
            lbProduct.ItemsSource = product;
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
            addProductWindow.Owner = Application.Current.MainWindow;
            addProductWindow.Show();
        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var result = MessageBox.Show("Вы действительно хотите удалить товар? Изменения не обратимы.", "Сообщение", MessageBoxButton.OKCancel, MessageBoxImage.Information);
                if (result == MessageBoxResult.OK)
                {
                    var product = lbProduct.SelectedItem as Product;
                    //var order = product.Order;

                    AppData.db.Product.Attach(product);
                    //AppData.db.Product.Attach((Product)order);
                    //AppData.db.Product.Remove((Product)order);
                    AppData.db.Product.Remove(product);

                    AppData.db.SaveChanges();

                    lbProduct.ItemsSource = AppData.db.Product.ToList();

                    MessageBox.Show("Удаление успешно!");
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Удаление не возможно, потому что товар закреплён за заказом или вы его не выбрали! Ожидайте выполенение заказа!", "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Information);
            }
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

        private void RBA_Checked_1(object sender, RoutedEventArgs e)
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
