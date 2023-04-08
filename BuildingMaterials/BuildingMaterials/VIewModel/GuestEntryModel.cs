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
    public class GuestEntryModel : BaseViewModel
    {
        private string _productName;
        private string _productDescription;
        private decimal _productCost;
        private string _productDiscountAmount;
        private string _productQuantityInStock;
        private string _productCategoryId;
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
        public GuestEntryModel()
        {
            Products = new ObservableCollection<Product>();

            using (var db = new TradeDB())
            {
                var productInfoList = db.Product.ToList();
                productInfoList.ForEach(p => Products.Add(p));
            }
        }
        public string ProductName
        {
            get => _productName;
            set
            {
                _productName = value;
                OnPropertyChanged(nameof(ProductName));
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
        public Product SelectedItem
        {
            get => _selectedItem;
            set
            {
                _selectedItem = value;
                OnPropertyChanged(nameof(SelectedItem));
            }
        }
        public void DeleteProduct()
        {
            using (var db = new TradeDB())
            {
                var message = MessageBox.Show("Вы уверены, что хотите удалить данный элемент?" + "Это действие невозможно отменить!", "Предупреждение",
                    MessageBoxButton.OKCancel, MessageBoxImage.Warning);
                if (message == MessageBoxResult.OK)
                {
                    //try
                    //{
                    var itemProductIdForDelete = db.Order.Where(o => o.Id == SelectedItem.Id).FirstOrDefault();
                    
                    var itemProductForDelete = db.Product.Where(p => p.Id == SelectedItem.Id).FirstOrDefault();
                    
                    db.Order.Remove(itemProductIdForDelete);

                    db.Product.Remove(itemProductForDelete);
                    db.SaveChanges();


                    //}
                    //catch (Exception)
                    //{
                    //    MessageBox.Show("Проблемы с удалением. Повторите попытку.", "Сообщение", MessageBoxButton.OK, MessageBoxImage.Error);
                    //}
                }
            }
        }
    }
}
