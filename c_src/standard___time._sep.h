/* This C header file is generated by NIT to compile modules and programs that requires ../lib/standard/time. */
#ifndef standard___time_sep
#define standard___time_sep
#include "standard___string_search._sep.h"
#include <nit_common.h>
#include "time._nitni.h"
#include "standard___time._ffi.h"

extern const classtable_elt_t VFT_standard___time___TimeT[];
struct TBOX_TimeT { const classtable_elt_t * vft; bigint object_id; time_t val;};
val_t BOX_TimeT(time_t val);
#define UNBOX_TimeT(x) (((struct TBOX_TimeT *)(VAL2OBJ(x)))->val)

extern const classtable_elt_t VFT_standard___time___Tm[];
struct TBOX_Tm { const classtable_elt_t * vft; bigint object_id; struct tm * val;};
val_t BOX_Tm(struct tm * val);
#define UNBOX_Tm(x) (((struct TBOX_Tm *)(VAL2OBJ(x)))->val)
extern const char LOCATE_standard___time[];
extern const int SFT_standard___time[];
#define CALL_standard___time___Object___get_time(recv) ((standard___time___Object___get_time_t)CALL((recv), (SFT_standard___time[0] + 0)))
#define CALL_standard___time___Sys___nanosleep(recv) ((standard___time___Sys___nanosleep_t)CALL((recv), (SFT_standard___time[1] + 0)))
#define ID_standard___time___TimeT (SFT_standard___time[2])
#define COLOR_standard___time___TimeT (SFT_standard___time[3])
#define INIT_TABLE_POS_standard___time___TimeT (SFT_standard___time[4] + 0)
#define CALL_standard___time___TimeT___init(recv) ((standard___time___TimeT___init_t)CALL((recv), (SFT_standard___time[4] + 1)))
#define CALL_standard___time___TimeT___from_i(recv) ((standard___time___TimeT___from_i_t)CALL((recv), (SFT_standard___time[4] + 2)))
#define CALL_standard___time___TimeT___update(recv) ((standard___time___TimeT___update_t)CALL((recv), (SFT_standard___time[4] + 3)))
#define CALL_standard___time___TimeT___ctime(recv) ((standard___time___TimeT___ctime_t)CALL((recv), (SFT_standard___time[4] + 4)))
#define CALL_standard___time___TimeT___difftime(recv) ((standard___time___TimeT___difftime_t)CALL((recv), (SFT_standard___time[4] + 5)))
#define CALL_standard___time___TimeT___to_i(recv) ((standard___time___TimeT___to_i_t)CALL((recv), (SFT_standard___time[4] + 6)))
#define ID_standard___time___Tm (SFT_standard___time[5])
#define COLOR_standard___time___Tm (SFT_standard___time[6])
#define INIT_TABLE_POS_standard___time___Tm (SFT_standard___time[7] + 0)
#define CALL_standard___time___Tm___gmtime(recv) ((standard___time___Tm___gmtime_t)CALL((recv), (SFT_standard___time[7] + 1)))
#define CALL_standard___time___Tm___gmtime_from_timet(recv) ((standard___time___Tm___gmtime_from_timet_t)CALL((recv), (SFT_standard___time[7] + 2)))
#define CALL_standard___time___Tm___localtime(recv) ((standard___time___Tm___localtime_t)CALL((recv), (SFT_standard___time[7] + 3)))
#define CALL_standard___time___Tm___localtime_from_timet(recv) ((standard___time___Tm___localtime_from_timet_t)CALL((recv), (SFT_standard___time[7] + 4)))
#define CALL_standard___time___Tm___to_timet(recv) ((standard___time___Tm___to_timet_t)CALL((recv), (SFT_standard___time[7] + 5)))
#define CALL_standard___time___Tm___sec(recv) ((standard___time___Tm___sec_t)CALL((recv), (SFT_standard___time[7] + 6)))
#define CALL_standard___time___Tm___min(recv) ((standard___time___Tm___min_t)CALL((recv), (SFT_standard___time[7] + 7)))
#define CALL_standard___time___Tm___hour(recv) ((standard___time___Tm___hour_t)CALL((recv), (SFT_standard___time[7] + 8)))
#define CALL_standard___time___Tm___mday(recv) ((standard___time___Tm___mday_t)CALL((recv), (SFT_standard___time[7] + 9)))
#define CALL_standard___time___Tm___mon(recv) ((standard___time___Tm___mon_t)CALL((recv), (SFT_standard___time[7] + 10)))
#define CALL_standard___time___Tm___year(recv) ((standard___time___Tm___year_t)CALL((recv), (SFT_standard___time[7] + 11)))
#define CALL_standard___time___Tm___wday(recv) ((standard___time___Tm___wday_t)CALL((recv), (SFT_standard___time[7] + 12)))
#define CALL_standard___time___Tm___yday(recv) ((standard___time___Tm___yday_t)CALL((recv), (SFT_standard___time[7] + 13)))
#define CALL_standard___time___Tm___is_dst(recv) ((standard___time___Tm___is_dst_t)CALL((recv), (SFT_standard___time[7] + 14)))
#define CALL_standard___time___Tm___asctime(recv) ((standard___time___Tm___asctime_t)CALL((recv), (SFT_standard___time[7] + 15)))
#define CALL_standard___time___Tm___strftime(recv) ((standard___time___Tm___strftime_t)CALL((recv), (SFT_standard___time[7] + 16)))
val_t standard___time___Object___get_time(val_t p0);
typedef val_t (*standard___time___Object___get_time_t)(val_t p0);
void standard___time___Sys___nanosleep(val_t p0, val_t p1, val_t p2);
typedef void (*standard___time___Sys___nanosleep_t)(val_t p0, val_t p1, val_t p2);
val_t NEW_Sys_standard___kernel___Sys___init();
void standard___time___TimeT___init(val_t p0, int* init_table);
typedef void (*standard___time___TimeT___init_t)(val_t p0, int* init_table);
val_t NEW_TimeT_standard___time___TimeT___init();
void standard___time___TimeT___from_i(val_t p0, val_t p1, int* init_table);
typedef void (*standard___time___TimeT___from_i_t)(val_t p0, val_t p1, int* init_table);
val_t NEW_TimeT_standard___time___TimeT___from_i(val_t p0);
void standard___time___TimeT___update(val_t p0);
typedef void (*standard___time___TimeT___update_t)(val_t p0);
val_t standard___time___TimeT___ctime(val_t p0);
typedef val_t (*standard___time___TimeT___ctime_t)(val_t p0);
val_t standard___time___TimeT___difftime(val_t p0, val_t p1);
typedef val_t (*standard___time___TimeT___difftime_t)(val_t p0, val_t p1);
val_t standard___time___TimeT___to_s(val_t p0);
typedef val_t (*standard___time___TimeT___to_s_t)(val_t p0);
val_t standard___time___TimeT___to_i(val_t p0);
typedef val_t (*standard___time___TimeT___to_i_t)(val_t p0);
void standard___time___Tm___gmtime(val_t p0, int* init_table);
typedef void (*standard___time___Tm___gmtime_t)(val_t p0, int* init_table);
val_t NEW_Tm_standard___time___Tm___gmtime();
void standard___time___Tm___gmtime_from_timet(val_t p0, val_t p1, int* init_table);
typedef void (*standard___time___Tm___gmtime_from_timet_t)(val_t p0, val_t p1, int* init_table);
val_t NEW_Tm_standard___time___Tm___gmtime_from_timet(val_t p0);
void standard___time___Tm___localtime(val_t p0, int* init_table);
typedef void (*standard___time___Tm___localtime_t)(val_t p0, int* init_table);
val_t NEW_Tm_standard___time___Tm___localtime();
void standard___time___Tm___localtime_from_timet(val_t p0, val_t p1, int* init_table);
typedef void (*standard___time___Tm___localtime_from_timet_t)(val_t p0, val_t p1, int* init_table);
val_t NEW_Tm_standard___time___Tm___localtime_from_timet(val_t p0);
val_t standard___time___Tm___to_timet(val_t p0);
typedef val_t (*standard___time___Tm___to_timet_t)(val_t p0);
val_t standard___time___Tm___sec(val_t p0);
typedef val_t (*standard___time___Tm___sec_t)(val_t p0);
val_t standard___time___Tm___min(val_t p0);
typedef val_t (*standard___time___Tm___min_t)(val_t p0);
val_t standard___time___Tm___hour(val_t p0);
typedef val_t (*standard___time___Tm___hour_t)(val_t p0);
val_t standard___time___Tm___mday(val_t p0);
typedef val_t (*standard___time___Tm___mday_t)(val_t p0);
val_t standard___time___Tm___mon(val_t p0);
typedef val_t (*standard___time___Tm___mon_t)(val_t p0);
val_t standard___time___Tm___year(val_t p0);
typedef val_t (*standard___time___Tm___year_t)(val_t p0);
val_t standard___time___Tm___wday(val_t p0);
typedef val_t (*standard___time___Tm___wday_t)(val_t p0);
val_t standard___time___Tm___yday(val_t p0);
typedef val_t (*standard___time___Tm___yday_t)(val_t p0);
val_t standard___time___Tm___is_dst(val_t p0);
typedef val_t (*standard___time___Tm___is_dst_t)(val_t p0);
val_t standard___time___Tm___asctime(val_t p0);
typedef val_t (*standard___time___Tm___asctime_t)(val_t p0);
val_t standard___time___Tm___strftime(val_t p0, val_t p1);
typedef val_t (*standard___time___Tm___strftime_t)(val_t p0, val_t p1);
val_t standard___time___Tm___to_s(val_t p0);
typedef val_t (*standard___time___Tm___to_s_t)(val_t p0);
#endif
