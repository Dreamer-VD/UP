using BuildingMaterials.DataBase;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BuildingMaterials.VIewModel
{
    public class GoodsSupplierViewModel:BaseViewModel
    {
        private int _id;
        private string _goodsSupplierName;
        private ObservableCollection<GoodsSupplier> _GoodsSuppliers;
        public ObservableCollection<GoodsSupplier> GoodsSuppliers
        {
            get => _GoodsSuppliers;
            set
            {
                _GoodsSuppliers = value;
                OnPropertyChanged(nameof(GoodsSuppliers));
            }
        }
        public GoodsSupplierViewModel()
        {
            GoodsSuppliers = new ObservableCollection<GoodsSupplier>();

            using (var db = new TradeDB())
            {
                var goodsSupplierList = db.GoodsSupplier.ToList();
                goodsSupplierList.ForEach(p => GoodsSuppliers.Add(p));
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
        public string GoodsSupplierName
        {
            get => _goodsSupplierName;
            set
            {
                _goodsSupplierName = value;
                OnPropertyChanged(nameof(GoodsSupplierName));
            }
        }
    }
}
