using BuildingMaterials.DataBase;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace BuildingMaterials.VIewModel
{
    public class ProductViewModel : BaseViewModel
    {
        private string _productArticleNumber;
        private string _productNameId;
        private string _productDescription;
        private decimal _productCost;
        private string _productDiscountAmount;
        private string _productQuantityInStock;
        private string _productCategoryId;
        private string _productManufacturerId;
        private string _goodsSupplierId;
        private Product _selectedItem;
        private ObservableCollection<Product> _products;
        public ObservableCollection<Product> Products
        {
            get => _products;
            set
            {
                _products = value;
                OnPropertyChanged(nameof(Products));
            }
        }
        public ProductViewModel()
        {
            Products = new ObservableCollection<Product>();

            using (var db = new TradeDB())
            {
                var productInfoList = db.Product.ToList();
                productInfoList.ForEach(p => Products.Add(p));
            }
        }
        public string ProductArticleNumber
        {
            get => _productArticleNumber;
            set
            {
                _productArticleNumber = value;
                OnPropertyChanged(nameof(ProductArticleNumber));
            }
        }
        public string ProductNameId
        {
            get => _productNameId;
            set
            {
                _productNameId = value;
                OnPropertyChanged(nameof(ProductNameId));
            }
        }
        public string ProductDescription
        {
            get => _productDescription;
            set
            {
                _productDescription = value;
                OnPropertyChanged(nameof(ProductDescription));
            }
        }
        public decimal ProductCost
        {
            get => _productCost;
            set
            {
                _productCost = value;
                OnPropertyChanged(nameof(ProductCost));
            }
        }
        public string ProductDiscountAmount
        {
            get => _productDiscountAmount;
            set
            {
                _productDiscountAmount = value;
                OnPropertyChanged(nameof(ProductDiscountAmount));
            }
        }
        public string ProductQuantityInStock
        {
            get => _productQuantityInStock;
            set
            {
                _productQuantityInStock = value;
                OnPropertyChanged(nameof(ProductQuantityInStock));
            }
        }
        public string ProductCategoryId
        {
            get => _productCategoryId;
            set
            {
                _productCategoryId = value;
                OnPropertyChanged(nameof(ProductCategoryId));
            }
        }
        public string ProductManufacturerId
        {
            get => _productManufacturerId;
            set
            {
                _productManufacturerId = value;
                OnPropertyChanged(nameof(ProductManufacturerId));
            }
        }
        public string GoodsSupplierId
        {
            get => _goodsSupplierId;
            set
            {
                _goodsSupplierId = value;
                OnPropertyChanged(nameof(GoodsSupplierId));
            }
        }
        public Product SelectedItem
        {
            get => _selectedItem;
            set
            {
                _selectedItem = value;
                OnPropertyChanged(nameof(SelectedItem));
            }
        }
    }
}
