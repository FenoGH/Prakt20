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
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Prakt20
{
    /// <summary>
    /// Логика взаимодействия для Справочник.xaml
    /// </summary>
    public partial class Справочник : Window
    {
        ДеталиEntities db = ДеталиEntities.GetContext();
        public Справочник()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            db.Справочник_цен.Load();
            SpravDG.ItemsSource = db.Справочник_цен.Local.ToBindingList();
        }
        private void ДобавитьЗапись(object sender, RoutedEventArgs e)
        {
            СправочникЗапись f = new СправочникЗапись();
            f.ShowDialog();
            SpravDG.Items.Refresh();
        }

        private void РедактироватьЗапись(object sender, RoutedEventArgs e)
        {
            int indexRow = SpravDG.SelectedIndex;
            if (indexRow != -1)
            {
                Справочник_цен row = (Справочник_цен)SpravDG.Items[indexRow];
                Transmission.Id = row.Код_детали;
                СправочникРедактировать f = new СправочникРедактировать();
                f.ShowDialog();
                SpravDG.Items.Refresh();
                SpravDG.Focus();
            }
        }

        private void УдалитьЗапись(object sender, RoutedEventArgs e)
        {
            MessageBoxResult result;
            result = MessageBox.Show("Вы действительно хотите удалить запись ?", "Удаление записи", MessageBoxButton.YesNo, MessageBoxImage.Warning);
            if (result == MessageBoxResult.Yes)
            {
                try
                {
                    Справочник_цен row = (Справочник_цен)SpravDG.SelectedItems[0];
                    db.Справочник_цен.Remove(row);
                    db.SaveChanges();
                }
                catch (ArgumentOutOfRangeException)
                {
                    MessageBox.Show("Выберете запись");
                }
            }
        }
    }
}
