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
        public void AdminVerification()
        {
            try
            {
                if (_login == null || _password == null)
                {
                    MessageBox.Show("Поля до конца не заполненны!", "Сообщение", MessageBoxButton.OK, MessageBoxImage.Information);
                    return;
                }
                using (var db = new TradeDB())
                {
                    var result = db.User.FirstOrDefault(u => u.UserLogin == _login && u.UserPassword == _password && u.UserRoleId == 1);
                    if (result != null)
                    {
                        MessageBox.Show("Авторизация прошла успешно!", "Сообщение", MessageBoxButton.OK, MessageBoxImage.Information);
                        AdminWindow adminWindow = new AdminWindow();
                        adminWindow.Show();
                        foreach (Window wind in Application.Current.Windows)
                        {
                            if (wind is MainWindow)
                            {
                                wind.Hide();
                            }
                        }
                    }
                    else MessageBox.Show("Неверный логин или пароль", "Сообщение", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Проблема с подключением... Повторите попытку!");
            }
        }
        public void GuestVerification()
        {
            try
            {
                if (_login == null || _password == null)
                {
                    MessageBox.Show("Поля до конца не заполненны!", "Сообщение", MessageBoxButton.OK, MessageBoxImage.Information);
                    return;
                }
                using (var db = new TradeDB())
                {
                    var result = db.User.FirstOrDefault(u => u.UserLogin == _login && u.UserPassword == _password && u.UserRoleId !=1);
                    if (result != null)
                    {
                        MessageBox.Show("Авторизация прошла успешно!", "Сообщение", MessageBoxButton.OK, MessageBoxImage.Information);
                        GuestWindow guestWindow = new GuestWindow();
                        guestWindow.Show();
                        foreach (Window wind in Application.Current.Windows)
                        {
                            if (wind is MainWindow)
                            {
                                wind.Hide();
                            }
                        }
                    }
                    else MessageBox.Show("Неверный логин или пароль", "Сообщение", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Проблема с подключением. Повторите попытку!");
            }
        }
    }
}
