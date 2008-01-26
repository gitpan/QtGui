package LCDRange;

#use blib;
use Qt;
use Qt::QLCDNumber;
use Qt::QSlider;
use Qt::QBoxLayout;
use Qt::QWidget;
use Carp;

our @ISA = qw(Qt::QWidget);
our @EXPORT = qw(LCDRange);


sub LCDRange {
    my $class = 'LCDRange';
    my @signals = ('valueChanged(int)');
    my @slots = ('setValue(int)', 'setRange(int,int)');
    my $this = QWidget(\@signals, \@slots);
    bless $this, $class;
    
    $this->{lcd} = QLCDNumber(2);
    $this->{lcd}->setSegmentStyle(Qt::QLCDNumber::Filled);
    
    $this->{slider} = QSlider(Qt::Horizontal);
    $this->{slider}->setRange(0, 99);
    $this->{slider}->setValue(0);
    
    $this->connect($this->{slider}, SIGNAL('valueChanged(int)'), $this->{lcd}, SLOT('display(int)'));
    $this->connect($this->{slider}, SIGNAL('valueChanged(int)'), $this, SIGNAL('valueChanged(int)'));
    
    $this->{layout} = QVBoxLayout();
    $this->{layout}->addWidget($this->{lcd});
    $this->{layout}->addWidget($this->{slider});
    $this->setLayout($this->{layout});
    
    $this->setFocusProxy($this->{slider});

    return $this;
}


sub value {
    my $this = shift;
    return $this->{slider}->value();
}


sub setValue {
    my $this = shift;
    my $value = shift;
    $this->{slider}->setValue($value);
}


sub setRange {
    my $this = shift;
    my $minValue = shift;
    my $maxValue = shift;
    
    if ( $minValue < 0 or $maxValue > 99 or $minValue > $maxValue ) {
	warn("LCDRange::setRange( $minValue, $maxValue )\n\tRange must be 0..99\n\tand minValue not be greate than maxValue");
    }
    
    $this->{slider}->setRange($minValue, $maxValue);
}

1;
