using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
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
    /// Логика взаимодействия для СправочникЗапись.xaml
    /// </summary>
    public partial class СправочникЗапись : Window
    {
        ДеталиEntities db = ДеталиEntities.GetContext();
        Справочник_цен p1 = new Справочник_цен();
        public СправочникЗапись()
        {
            InitializeComponent();
        }

        private void Отмена_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Добавить_Click(object sender, RoutedEventArgs e)
        {

            
            int.TryParse(Price.Text, out int price);
            if (price > 0 && Name.Text.Length != 0)
            {

                db.ДобавитьДеталь(Name.Text, price);
                this.Close();
                
            }

        }

        
    }
}
