using BuildingMaterials.DataBase;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BuildingMaterials.VIewModel
{
    public class ProductNameViewModel : BaseViewModel
    {
        private int _id;
        private string _name;
        private ObservableCollection<ProductName> _productName;
        public ObservableCollection<ProductName> ProductNames
        {
            get => _productName;
            set
            {
                _productName = value;
                OnPropertyChanged(nameof(ProductNames));
            }
        }
        public ProductNameViewModel()
        {
            ProductNames = new ObservableCollection<ProductName>();

            using (var db = new TradeDB())
            {
                var productNameList = db.ProductName.ToList();
                productNameList.ForEach(p => ProductNames.Add(p));
            }
        }
        public int Id
        {
            get => _id; 
            set 
            { 
                _id= value;
                OnPropertyChanged(nameof(Id));
            }
        }
        public string Name
        {
            get => _name;
            set
            {
                _name= value;
                OnPropertyChanged(nameof(Name));
            }
        }
    }
}
