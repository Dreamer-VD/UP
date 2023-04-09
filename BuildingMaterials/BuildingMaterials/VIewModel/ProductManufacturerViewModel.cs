using BuildingMaterials.DataBase;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BuildingMaterials.VIewModel
{
    public class ProductManufacturerViewModel:BaseViewModel
    {
        private int _id;
        private string _productManufacturerName;
        private ObservableCollection<ProductManufacturer> _productManufacturers;
        public ObservableCollection<ProductManufacturer> ProductManufacturers
        {
            get => _productManufacturers;
            set
            {
                _productManufacturers = value;
                OnPropertyChanged(nameof(ProductManufacturers));
            }
        }
        public ProductManufacturerViewModel()
        {
            ProductManufacturers = new ObservableCollection<ProductManufacturer>();

            using (var db = new TradeDB())
            {
                var productNameList = db.ProductManufacturer.ToList();
                productNameList.ForEach(p => ProductManufacturers.Add(p));
            }
        }
        public int Id
        {
            get => _id;
            set
            {
                _id = value;
                OnPropertyChanged(nameof(Id));
            }
        }
        public string ProductManufacturerName
        {
            get => _productManufacturerName;
            set
            {
                _productManufacturerName = value;
                OnPropertyChanged(nameof(ProductManufacturerName));
            }
        }
    }
}
