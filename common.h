#ifndef PQT4_COMMON_H
#define PQT4_COMMON_H

//#include <QtCore/qmap.h>


char ** XS_unpack_charPtrPtr( SV *rv );
void XS_pack_charPtrPtr ( SV *st, char **s );
SV * class2pobj(IV iv, const char *class_name, int no_ptr);
// IV pobj2class(SV *, const char *class_name, const char *fn_warn, const char *ptr_warn);
IV pobj2class(SV *, const char *class_name, const char *func, const char *var);
int create_meta_data (char *sss, AV *signal_av, AV *slot_av, char **stringdata, uint **data);
// void common_signals(void ***_a, AV *av_type, AV *av_data);
// void common_slots(int _id, void **_a, const char *stringdata, const uint *data, int perl_cl_ref, char *clFn);
void common_slots(int _id, void **_a, const char *stringdata, const uint *data, void *class_ptr, char *clFn);



/*
class PQt4ClList
{
    static PQt4ClList *self;
    QMap<ulong, SV *> clHash;

    PQt4ClList();
public:
    ~PQt4ClList();

    static PQt4ClList *getSelf() { return self; };
    
    bool saveCl(void *cl, SV *pcl);
    SV * getCl(void *cl);
};
*/

#endif

