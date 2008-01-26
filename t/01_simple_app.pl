#!/usr/bin/perl -w

BEGIN{
    print "1..1\n"
}


use blib;
use Qt;
use Qt::QString; # for *.t need this module in QtGui
use Qt::QApplication;
use Qt::QFont;
use Qt::QPushButton;
use Qt::QLabel;
use Qt::QWidget;
   

my $app = QApplication(\@ARGV);

my $window = QWidget();
$window->resize(165, 100);

my $label = QLabel(QString("You see this test program?"), $window);
$label->setFont(QFont(QString("Times"), 12, Qt::QFont::Bold));

my $quit = QPushButton(QString("yes"), $window);
$quit->setFont(QFont(QString("Times"), 18, Qt::QFont::Bold));
$quit->setGeometry(10, 40, 140, 40);

$app->connect($quit, SIGNAL('clicked()'), $app, SLOT('quit()'));
$window->show();
my $retval = $app->exec();

print  "ok 1\n" if defined $retval and $retval == 0;
