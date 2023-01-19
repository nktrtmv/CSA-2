#include <iostream>
#include <fstream>
#include <vector>
#include <cstring>
#include <random>
#include <pthread.h>
#include <algorithm>
#include <unistd.h>
#define FMT_HEADER_ONLY
#include <fmt/format.h>

using namespace std;
using namespace fmt;

// файл для записи логов
ofstream logout("./logger.txt");

// Сущность структура монаха, поля: сила и id
struct Monk {
    int power;
    int id;

    Monk(int p, int i) {
        power = p;
        if (power == 0) {
            power++;
        }
        id = i;
    }

    Monk() {
        power = -1;
        id = -1;
    }

    Monk(const Monk& other) {
        this->power = other.power;
        this->id = other.id;
    }
};

// Ввод строки монахов из файла или консоли и возврат массива монахов
vector<Monk> input(istream& in) {
    vector<Monk> monks;
    int k = 1, a;
    in >> a;
    while (a != 0) {
        monks.emplace_back(a, k++);
        in >> a;
    }
    return monks;
}

// Вывод сообщения о победе
void outputAnswer(ostream& out, Monk& monk) {
    out << "Победил монах с порядковым номером первоначального массива " << monk.id << " и силой "
        << monk.power << ". Он получил великую статую боддисатвы!\n";
}

void* fight(void* m) {
    vector<Monk> monks = *(vector<Monk>*)m;  // каст void* к вектору объектов Monk
    logout << "Текущий поток производит сражение " << monks.size()
           << " монахов.\n";  // Вывод сообщения об информации потока в файл logger.txt
    if (monks.size() == 1) {  // Если в функцию передан вектор с одним Монахом, то есть у монаха нет
                              // противника - увеличиваем его силу в два раза
        monks[0].power *= 2;
        int r = rand() % 2 + 1;
        sleep(r);
        cout << format("монах {} отдыхает {} секунд(у/ы) и увеличивает свою силу до {}\n",
                       monks[0].id, r, monks[0].power);
        return new Monk(monks[0]);  // возвращается указатель на созданный объект монаха
    }

    // Если в векторе 2 монаха побеждает сильнейший
    if (monks.size() == 2) {
        if (monks[0].power < monks[1].power) {
            monks[1].power += monks[0].power;
            int r = rand() % 2 + 1;
            sleep(r);
            cout << format("монах {} побеждает монаха {} за {} секунд(у/ы) и увеличивает свою силу до {}\n", monks[1].id, monks[0].id, r, monks[1].power);
            return new Monk(monks[1]);  // возвращается указатель на созданный объект монаха
        } else {
            monks[0].power += monks[1].power;
            int r = rand() % 2 + 1;
            sleep(r);
            cout << format("монах {} побеждает монаха {} за {} секунд(у/ы) и увеличивает свою силу до {}\n", monks[0].id, monks[1].id, r, monks[0].power);
            return new Monk(monks[0]);  // возвращается указатель на созданный объект монаха
        }
    }

    // Перемешивается массив с помощью генератора случайных данных с сидом(текущее время)
    shuffle(monks.begin(), monks.end(), default_random_engine(clock()));
    Monk *m1, *m2;     // Создаются указатели Monk
    pthread_t p1, p2;  // Создание двух новых потоков для запуска двух функций с укороченными в два
                       // раза векторами монахов
    // Векторы с монахами делятся пополам, пока не дойдут до случая - 1/2 монаха
    // Создание укороченных в два раза векторов
    vector<Monk> v1 = vector<Monk>(monks.begin(), monks.end() - monks.size() / 2);
    vector<Monk> v2 = vector<Monk>(monks.end() - monks.size() / 2, monks.end());
    pthread_create(&p1, nullptr, fight,
                   &v1);  // Создание первого потока и запуск функции fight с укороченным вектором
    pthread_create(&p2, nullptr, fight,
                   &v2);  // Создание второго потока и запуск функции fight с укороченным вектором
    pthread_join(p1,
                 (void**)&m1);  // Ожидание первого потока и запись возврата функции в указатель m1
    pthread_join(p2,
                 (void**)&m2);  // Ожидание второго потока и запись возврата функции в указатель m2

    // Возврат победителя и чистка памяти
    if (m1->power < m2->power) {
        m2->power += m1->power;
        int r = rand() % 2 + 1;
        sleep(r);
        cout << format("монах {} побеждает монаха {} за {} секунд(у/ы) и увеличивает свою силу до {}\n", m2->id, m1->id, r, m2->power);
        delete m1;
        return m2;
    } else {
        m1->power += m2->power;
        int r = rand() % 2 + 1;
        sleep(r);
        cout << format("монах {} побеждает монаха {} за {} секунд(у/ы) и увеличивает свою силу до {}\n", m1->id, m2->id, r, m1->power);
        delete m2;
        return m1;
    }
}

int main(int argc, char* argv[]) {
    srand(clock());  // сид рандома - текущее время, чтобы не повторялись генерации
    vector<Monk> monks;
    ifstream fin;
    ofstream fout;
    // Создаем поток для ввода из файла в зависимости от того, введен ли путь до файла ввода в виде
    // аргумента командной строки
    if (argc > 2) {
        fin = ifstream(argv[2]);
    } else {
        fin = ifstream("./in.txt");
    }
    // Создаем поток для ввода в файл в зависимости от того, введен ли путь до файла ввода в виде
    // аргумента командной строки
    if (argc > 3) {
        fout = ofstream(argv[3]);
    } else {
        fout = ofstream("./out.txt");
    }
    // Проверка на количество аргументов командной строки
    if (argc < 2 || argc > 4) {
        cout << "Вы обязаны ввести 1,2 или 3 аргумента командной строки:\n"
                "Первый - -f/-r/-c.\n"
                "Второй и третий опциональны, "
                "это абсолютный путь к файлам ввода и вывода.\n";
        return 1;
    }

    if (strcmp(argv[1], "-f") == 0) {  // Ввод из файла
        monks = input(fin);
        if (monks.size() < 2) {
            cout << "Ошибка! Нужно ввести минимум 2 монаха.\n";
            return 1;
        }
    } else if (strcmp(argv[1], "-c") == 0) {  // Ввод из консоли
        cout << "Вводите силы монахов через пробел, 0 оканчивает ввод.\n";
        monks = input(cin);
        if (monks.size() < 2) {
            cout << "Ошибка! Нужно ввести минимум 2 монаха.\n";
            return 1;
        }
    } else if (strcmp(argv[1], "-r") == 0) {  // Генерация случайных данных
        cout << "Введите количество монахов (от 1 до 1000): ";
        int n;
        cin >> n;
        while (n < 2 || n > 1000) {
            cout << "Ошибка! Введите количество монахов (от 2 до 1000): ";
            cin >> n;
        }
        ofstream rout("./rand_in.txt");  // поток для вывода сгенерированных данных
        for (int i = 0; i < n; i++) {
            monks.emplace_back(rand() % 100, i + 1);
            rout << monks[monks.size() - 1].power << ' ';
        }
        rout << 0 << endl;
    } else {  // Если неверный аргумент командной строки - выход
        cout << "Неверный аргумент командной строки.";
        exit(1);
    }

    Monk* winner;  // Указатель на объект структуры Монах

    pthread_t p1;  // создание первого и главного потока
    pthread_create(&p1, nullptr, fight,
                   &monks);  // создание потока и запуск функции fight для решения задачи, массив
                             // монахов передается по ссылке.
    pthread_join(p1, (void**)&winner);  // ожидание потока и запись возврата из функции fight в
                                        // память по указателю winner (Monk*)

    // Вывод в зависимости от аргументов командной строки
    if (strcmp(argv[1], "-c") == 0) {
        outputAnswer(cout, *winner);
    } else {
        outputAnswer(fout, *winner);
    }
    delete winner;  // чистим память
    logout << "END OF TEST\n<============================>\n\n";
    return 0;
}