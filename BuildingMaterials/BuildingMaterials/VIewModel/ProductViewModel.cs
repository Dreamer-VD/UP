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
                var productInfoList = db.Product.Include("ProductName").Include("GoodsSupplier").Include("ProductManufacturer").Include("ProductСategory").ToList();

                productInfoList.ForEach(p => Products.Add(p));
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
        public void Sort(int type)
        {

            if (type == 1) 
            {
                using (var db = new TradeDB()) 
                {
                    var result = db.Product.Include("ProductName").Include("GoodsSupplier").Include("ProductManufacturer").Include("ProductСategory").OrderBy(r => r.ProductCost).ToList();
                    Products.Clear();
                    result.ToList().ForEach(p => Products.Add(p));
                }
            }
            if (type == 2) 
            {
                using (var db = new TradeDB())
                {
                    var result = db.Product.Include("ProductName").Include("GoodsSupplier").Include("ProductManufacturer").Include("ProductСategory").OrderByDescending(r => r.ProductCost).ToList();
                    Products.Clear();
                    result.ToList().ForEach(p => Products.Add(p));
                }
            }
        }
    }
}
