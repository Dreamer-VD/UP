using BuildingMaterials.DataBase;
using BuildingMaterials.View;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace BuildingMaterials.VIewModel
{
    public class AuthorizationViewModel:BaseViewModel
    {
        private string _login;
        private string _password;
        public string Login
        {
            get => _login;
            set
            {
                _login = value;
                OnPropertyChanged(nameof(Login));
            }
        }
        public string Password
        {
            get => _password;
            set
            {
                _password = value;
                OnPropertyChanged(nameof(Password));
            }
        }
        public void Verification()
        {
            try
            {
                if (_login == null || _password == null)
                {
                    MessageBox.Show("Проблема с полями. Повторите попытку", "Сообщение", MessageBoxButton.OK, MessageBoxImage.Information);
                    return;
                }
                using (var db = new TradeDB())
                {
                    var resultGuest = db.User.FirstOrDefault(u => u.UserLogin == _login && u.UserPassword == _password && u.UserRoleId == 3);
                    
                    var resultManager = db.User.FirstOrDefault(u => u.UserLogin == _login && u.UserPassword == _password && u.UserRoleId == 2);
                    
                    var resultAdmin = db.User.FirstOrDefault(u => u.UserLogin == _login && u.UserPassword == _password && u.UserRoleId == 1);
                    
                    if (resultAdmin != null && resultAdmin.UserRoleId == 1)
                    {
                        MessageBox.Show("Авторизация прошла успешно!", "Сообщение", MessageBoxButton.OK, MessageBoxImage.Information);
                        AdminWindow adminWindow = new AdminWindow();
                        adminWindow.Show();
                        foreach (Window wind in Application.Current.Windows)
                        {
                            if (wind is MainWindow)
                            {
                                App.Current.MainWindow = adminWindow;
                                wind.Close();
                            }
                        }
                    }
                    else if (resultManager != null && resultManager.UserRoleId == 2)
                    {
                        MessageBox.Show("Авторизация прошла успешно!", "Сообщение", MessageBoxButton.OK, MessageBoxImage.Information);
                        ManagerWindow managerWindow = new ManagerWindow();
                        managerWindow.Show();
                        foreach (Window wind in Application.Current.Windows)
                        {
                            if (wind is MainWindow)
                            {
                                App.Current.MainWindow = managerWindow;
                                wind.Close();
                            }
                        }
                    }
                    else if (resultGuest != null && resultGuest.UserRoleId == 3)
                    {
                        MessageBox.Show("Авторизация прошла успешно!", "Сообщение", MessageBoxButton.OK, MessageBoxImage.Information);
                        GuestWindow guestWindow = new GuestWindow();
                        guestWindow.Show();
                        foreach (Window wind in Application.Current.Windows)
                        {
                            if (wind is MainWindow)
                            {
                                App.Current.MainWindow = guestWindow;
                                wind.Close();
                            }
                        }
                    }
                    else MessageBox.Show("Неверный логин или пароль. Повторите попытку!", "Сообщение", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Проблема с подключением... Повторите попытку!");
            }
        }
    }
}
