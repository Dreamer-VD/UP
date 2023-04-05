using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BuildingMaterials.VIewModel
{
    public class OrderPickupPointModel : BaseViewModel
    {
        private string _index;
        private string _street;
        private ObservableCollection<OrderPickupPoint> _orderPickupPoint;
        public ObservableCollection<OrderPickupPoint> OrderPickupPoint
        {
            get => _orderPickupPoint;
            set
            {
                _orderPickupPoint= value; 
                OnPropertyChanged(nameof(OrderPickupPoint));
            }
        }
        public OrderPickupPointModel()
        {
            OrderPickupPoint= new ObservableCollection<OrderPickupPoint>();
            using (var db = new TradeDB())
            {
                var orderPickupPointList = db.OrderPickupPoint.ToList();
                orderPickupPointList.ForEach(o => OrderPickupPoint.Add(o));
            }
        }
        public string Index
        {
            get => _index;
            set
            {
                _index = value; 
                OnPropertyChanged(nameof(Index));
            }
        }
        public string Street
        {
            get => _street;
            set
            {
                _street = value;
                OnPropertyChanged(nameof(Street));
            }
        }
    }
}
