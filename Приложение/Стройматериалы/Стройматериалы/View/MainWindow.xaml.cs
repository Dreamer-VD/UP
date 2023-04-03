using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Стройматериалы.Model;
using Стройматериалы.View;

namespace Стройматериалы
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void BtnSignIn_Click(object sender, RoutedEventArgs e)
        {
            var CurrentUser = AppData.db.User.FirstOrDefault(u => u.UserLogin == tbLogin.Text && u.UserPassword == tbPassword.Text);
            
            if (CurrentUser != null) 
            {
                this.Hide();
               Info info = new Info();
                info.Show();
            }
            else
            {
                MessageBox.Show("Повторите ввод логина или пароля!");
            }
        }
    }
}
