using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
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
using System.Windows.Shapes;

namespace Prakt20
{
    /// <summary>
    /// Логика взаимодействия для Запрос2.xaml
    /// </summary>
    public partial class Запрос2 : Window
    {
        ДеталиEntities db = ДеталиEntities.GetContext();
        public Запрос2()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                int.TryParse(Tb1.Text, out int num);
                Zap2DG.ItemsSource = db.ТребованиеСтоимость(num);
                Column2.Binding = new Binding("Цена");
                string connectionString = "Data Source=ARISE\\SQLEXPRESS;Initial Catalog=Детали;Integrated Security=True";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand("Стоимость", connection))
                    {
                        command.CommandType = System.Data.CommandType.StoredProcedure;

                        command.Parameters.AddWithValue("@trebid", num);

                        double sum = (double)command.ExecuteScalar();

                        MessageBox.Show($"Стоимость деталей отпущенных по требовантю №{num}: {sum}");
                    }
                }
            }
            catch
            {
                MessageBox.Show("Деталей отпущеных по введенному требование нету");
            }
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            db.Требование_на_выдачу.Load();
            Zap2DG.ItemsSource = db.Требование_на_выдачу.Local.ToBindingList();

            
        }
    }
}
