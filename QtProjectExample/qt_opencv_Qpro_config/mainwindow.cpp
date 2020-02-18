#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QMainWindow>
#include <QFileDialog>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/core/core.hpp>

using namespace cv;

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_openButton_clicked()
{
    //第3个参数表示查找文件时从哪个目录开始，如果为"."的话，表示从该工程目录开始查找，最后那个参数的过滤器的名字之间
    //要用空格，否则识别不出来
    QString img_name = QFileDialog::getOpenFileName( this, tr("Open Image"), ".",
                                                     tr("Image Files(*.png *.jpg *.jpeg *.bmp)"));
    //toAscii()返回8位描述的string,为QByteArray,data()表示返回QByteArray的指针，QByteArray为字节指针
    Mat src = imread( img_name.toLatin1().data());
    cvtColor( src, src, CV_BGR2RGB );
    QImage img = QImage( (const unsigned char*)(src.data), src.cols, src.rows, QImage::Format_RGB888 );
//    namedWindow( "Image_Show", WINDOW_AUTOSIZE );
//    imshow( "Image_Show", src );
    ui->label->setPixmap( QPixmap::fromImage(img) );
 //   ui->label->resize( ui->label->pixmap()->size() );

}

void MainWindow::on_closeButton_clicked()
{
    close();
}
