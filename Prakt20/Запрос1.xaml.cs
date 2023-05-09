using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Data.SqlClient;
using System.Data.Entity.Core.Objects;
using System.Data;

namespace Prakt20
{
    /// <summary>
    /// Логика взаимодействия для Запрос1.xaml
    /// </summary>
    public partial class Запрос1 : Window
    {
        ДеталиEntities db = ДеталиEntities.GetContext();

        public Запрос1()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            db.Накладная_на_поступление.Load();
            Zap1DG.ItemsSource = db.Накладная_на_поступление.Local.ToBindingList();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            
            try
            {
                int.TryParse(Tb1.Text, out int month);
                Zap1DG.ItemsSource = db.Задание2(month);
                string connectionString = "Data Source=ARISE\\SQLEXPRESS;Initial Catalog=Детали;Integrated Security=True";
            
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand("Количество_Деталей_По_Месяцу", connection))
                    {
                        command.CommandType = System.Data.CommandType.StoredProcedure;

                        command.Parameters.AddWithValue("@Month", month);

                        int count = (int)command.ExecuteScalar();

                        MessageBox.Show($"Количество деталей в месяце №{month}: {count}");
                    }
                }
            }
            catch
            {
                MessageBox.Show("Поступлений за этот месяц нету");
            }






        }
    }
}
