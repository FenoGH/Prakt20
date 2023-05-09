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
using System.Windows.Shapes;

namespace Prakt20
{
    /// <summary>
    /// Логика взаимодействия для СправочникРедактировать.xaml
    /// </summary>
    public partial class СправочникРедактировать : Window
    {
        ДеталиEntities db = ДеталиEntities.GetContext();
        Справочник_цен p1 = new Справочник_цен();
        int code = 0;
        public СправочникРедактировать()
        {
            InitializeComponent();
        }
        private void Отмена_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Редактировать_Click(object sender, RoutedEventArgs e)
        {

            int.TryParse(Price.Text, out int price);
            if (price > 0 && Name.Text.Length != 0) 
            {
                db.ОбновитьДеталь(Name.Text, price,code);
                db.ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                this.Close();
            }

        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            p1 = db.Справочник_цен.Find(Transmission.Id);
            Name.Text = p1.Наименование_детали;
            code = p1.Код_детали;
            Price.Text = Convert.ToString(p1.Цена);
        }
    }
}
