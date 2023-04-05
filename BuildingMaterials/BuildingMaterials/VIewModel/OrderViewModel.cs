using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BuildingMaterials.VIewModel
{
    public class OrderViewModel : BaseViewModel
    {
        private string _orderDate;
        private string _orderPickupPointId;
        private string _orderDeliveryDate;
        private string _amount;
        private ObservableCollection<Order> _orders;
        public ObservableCollection<Order> Orders
        {
            get => _orders;
            set
            {
                _orders = value;
                OnPropertyChanged(nameof(Orders));
            }
        }
        public OrderViewModel()
        {
            Orders = new ObservableCollection<Order>();
            using (var db = new TradeDB())
            {
                var orderInfoList = db.Order.ToList();
                orderInfoList.ForEach(o => Orders.Add(o));
            }
        }
        public string OrderDate
        {
            get => _orderDate;
            set
            {
                _orderDate = value;
                OnPropertyChanged(nameof(OrderDate));
            }
        }
        public string OrderPickupPointId
        {
            get => _orderPickupPointId;
            set 
            { 
                _orderPickupPointId = value;
                OnPropertyChanged(nameof(OrderPickupPointId));
            }
        }
        public string OrderDeliveryDate
        {
            get => _orderDeliveryDate; 
            set
            {
                _orderDeliveryDate = value;
                OnPropertyChanged(nameof(OrderDeliveryDate));
            }
        }
        public string Amount
        {
            get => _amount; 
            set
            {
                _amount = value;
                OnPropertyChanged(nameof(Amount));
            }
        }
    }
}
