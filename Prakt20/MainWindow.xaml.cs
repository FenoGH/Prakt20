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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Prakt20
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        ДеталиEntities db = ДеталиEntities.GetContext();
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            db.Склад.Load();
            DetailDG.ItemsSource = db.Склад.Local.ToBindingList();
        }

        private void Открыть(object sender, RoutedEventArgs e)
        {
            Справочник f = new Справочник();
            f.ShowDialog();

        }

        private void Запрос1(object sender, RoutedEventArgs e)
        {
            Запрос1 f = new Запрос1();
            f.ShowDialog();
        }

        private void Запрос2(object sender, RoutedEventArgs e)
        {
            Запрос2 f = new Запрос2();
            f.ShowDialog();
        }

        private void Find_Click(object sender, RoutedEventArgs e)
        {
            if(Finder.Text.Length == 0)
            {
                MessageBox.Show("Введите код детали");
            }
            else
            {
                for(int i = 0; i<DetailDG.Items.Count;i++)
                {
                    var row = (Склад)DetailDG.Items[i];
                    int find = row.Код_детали;
                    try
                    {
                        if(find == Convert.ToInt32(Finder.Text))
                        {
                            object item = DetailDG.Items[i];
                            DetailDG.SelectedItem= item;
                            DetailDG.ScrollIntoView(item);
                            DetailDG.Focus();
                            break;
                        }
                    }
                    catch
                    {
                        MessageBox.Show("Ничего не найдено");
                    }
                }    
            }
        }

        private void About(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Вариант 8\r\nЗадание 1.Создать таблицы:\r\nТаблица 1. Движение.\r\nСтруктура таблицы: Код детали, Наименование детали, Количество\r\nТаблица 2. Накладная на поступление.\r\nСтруктура таблицы: Номер накладной, Код детали, Количество поступило, Дата прихода\r\nТаблица 3. Требование на выдачу.\r\nСтруктура таблицы: Номер требования, Код детали, Количество выдано, Дата выдачи\r\nТаблица 4. Справочник цен.\r\nСтруктура таблицы: Код детали, Цена\r\nЗадание 2. С помощью SQL-запроса подсчитать количество деталей, которые получены\r\nскладом в течение одного месяца. Запрос должен содержать поля: Наименование детали,\r\nКоличество.\r\nЗадание 3. Создать SQL-запрос для определения стоимости всех деталей, отпущенных по\r\nодному требованию. Запрос должен содержать поля: Номер требования, Стоимость\r\nдеталей. ");
        }

        private void Close(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
