using BuildingMaterials.DataBase;
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
    /// Логика взаимодействия для AddProductWindow.xaml
    /// </summary>
    public partial class AddProductWindow : Window
    {
        public AddProductWindow()
        {
            InitializeComponent();
            CmbCategory.ItemsSource = AppData.db.ProductСategory.ToList();
            CmbGoodsSupplier.ItemsSource = AppData.db.GoodsSupplier.ToList();
            CmbProductName.ItemsSource = AppData.db.ProductName.ToList();
            CmbProductManufacturer.ItemsSource = AppData.db.ProductManufacturer.ToList();
        }

        private void BtnAddProduct_Click(object sender, RoutedEventArgs e)
        {
            
            Product product = new Product();

            product.ProductArticleNumber = ProductArticleNumber.Text;

            var currentProductName = CmbProductName.SelectedItem as ProductName;
            product.ProductNameId = currentProductName.Id;

            product.ProductDescription = ProductDescription.Text;

            var currentProductCategory = CmbCategory.SelectedItem as ProductСategory;
            product.ProductCategoryId = currentProductCategory.Id;

            var currentProductManufacture = CmbProductManufacturer.SelectedItem as ProductManufacturer;
            product.ProductManufacturerId = currentProductManufacture.Id;

            var currentGoodsSupplier = CmbGoodsSupplier.SelectedItem as GoodsSupplier;
            product.GoodsSupplierId = currentGoodsSupplier.Id;

            product.ProductCost = Convert.ToDecimal(ProductCost.Text);

            product.ProductDiscountAmount = Convert.ToByte(ProductDiscountAmount.Text);

            product.ProductQuantityInStock = Convert.ToInt32(ProductQuantityInStock.Text);

            AppData.db.Product.Add(product);
            AppData.db.SaveChanges();
            (Owner as AdminWindow).LoadData();

            MessageBox.Show("Продукт добавлен в базу.", "Сообщение", MessageBoxButton.OK, MessageBoxImage.Information);
        }
    }
}
