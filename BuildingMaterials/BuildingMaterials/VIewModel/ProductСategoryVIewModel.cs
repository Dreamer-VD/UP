using BuildingMaterials.DataBase;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BuildingMaterials.VIewModel
{
    public class ProductСategoryVIewModel : BaseViewModel
    {
        private int _id;
        private string _categoryName;
        private ObservableCollection<ProductСategory> _productСategorys;
        public ObservableCollection<ProductСategory> ProductСategorys
        {
            get => _productСategorys;
            set
            {
                _productСategorys = value;
                OnPropertyChanged(nameof(ProductСategorys));
            }
        }
        public ProductСategoryVIewModel()
        {
            ProductСategorys = new ObservableCollection<ProductСategory>();

            using (var db = new TradeDB())
            {
                var productСategoriesList = db.ProductСategory.ToList();
                productСategoriesList.ForEach(p => ProductСategorys.Add(p));
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
        public string CategoryName
        {
            get => _categoryName;
            set
            {
                _categoryName = value;
                OnPropertyChanged(nameof(CategoryName));
            }
        }

    }
}
