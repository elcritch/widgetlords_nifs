/* Generated by Nim Compiler v1.3.5 */
/*   (c) 2020 Andreas Rumpf */
/* The generated code is subject to the original license. */
/* Compiled for: Linux, amd64, gcc */
/* Command for C compiler:
   gcc -c  -w -pthread -I/home/elcritch/.asdf/installs/erlang/22.3.2/erts-10.7.1/include/   -I/home/elcritch/.asdf/installs/nim/devel/lib -I/home/elcritch/projects/pt/widgetlords_nifs/nimsrc -o /home/elcritch/projects/pt/widgetlords_nifs/nimsrc/_nimcache/stdlib_options.nim.c.o /home/elcritch/projects/pt/widgetlords_nifs/nimsrc/_nimcache/stdlib_options.nim.c */
#define NIM_INTBITS 64

/* section: NIM_merge_HEADERS */

#include "nimbase.h"
#undef LANGUAGE_C
#undef MIPSEB
#undef MIPSEL
#undef PPC
#undef R3000
#undef R4000
#undef i386
#undef linux
#undef mips
#undef near
#undef far
#undef powerpc
#undef unix

/* section: NIM_merge_FRAME_DEFINES */
  #  define nimfr_(proc, file) \
      TFrame FR_; \
      FR_.procname = proc; FR_.filename = file; FR_.line = 0; FR_.len = 0; nimFrame(&FR_);

  #  define nimfrs_(proc, file, slots, length) \
      struct {TFrame* prev;NCSTRING procname;NI line;NCSTRING filename; NI len; VarSlot s[slots];} FR_; \
      FR_.procname = proc; FR_.filename = file; FR_.line = 0; FR_.len = length; nimFrame((TFrame*)&FR_);

  #  define nimln_(n, file) \
      FR_.line = n; FR_.filename = file;
  
/* section: NIM_merge_FORWARD_TYPES */
typedef struct TNimType TNimType;
typedef struct tyObject_UnpackDefect__bq5YFIFutDsA2ou9cpZuWAQ tyObject_UnpackDefect__bq5YFIFutDsA2ou9cpZuWAQ;
typedef struct tyObject_RefHeader__Gi7WQzlT1ZRToh9a2ueYb4A tyObject_RefHeader__Gi7WQzlT1ZRToh9a2ueYb4A;
typedef struct tyObject_Defect__LbeSGvgPzGzXnW9caIkJqMA tyObject_Defect__LbeSGvgPzGzXnW9caIkJqMA;
typedef struct Exception Exception;
typedef struct RootObj RootObj;
typedef struct NimStrPayload NimStrPayload;
typedef struct NimStringV2 NimStringV2;
typedef struct tySequence__uB9b75OUPRENsBAu4AnoePA tySequence__uB9b75OUPRENsBAu4AnoePA;
typedef struct tySequence__uB9b75OUPRENsBAu4AnoePA_Content tySequence__uB9b75OUPRENsBAu4AnoePA_Content;
typedef struct tyObject_StackTraceEntry__oLyohQ7O2XOvGnflOss8EA tyObject_StackTraceEntry__oLyohQ7O2XOvGnflOss8EA;

/* section: NIM_merge_TYPES */
struct TNimType {
void* destructor;
NI size;
NI align;
NCSTRING name;
void* traceImpl;
void* disposeImpl;
};
struct tyObject_RefHeader__Gi7WQzlT1ZRToh9a2ueYb4A {
NI rc;
};
struct RootObj {
TNimType* m_type;
};
struct NimStrPayload {
NI cap;
NIM_CHAR data[SEQ_DECL_SIZE];
};
struct NimStringV2 {
NI len;
NimStrPayload* p;
};
struct tySequence__uB9b75OUPRENsBAu4AnoePA {
  NI len; tySequence__uB9b75OUPRENsBAu4AnoePA_Content* p;
};
struct Exception {
  RootObj Sup;
Exception* parent;
NCSTRING name;
NimStringV2 message;
tySequence__uB9b75OUPRENsBAu4AnoePA trace;
Exception* up;
};
struct tyObject_Defect__LbeSGvgPzGzXnW9caIkJqMA {
  Exception Sup;
};
struct tyObject_UnpackDefect__bq5YFIFutDsA2ou9cpZuWAQ {
  tyObject_Defect__LbeSGvgPzGzXnW9caIkJqMA Sup;
};
struct tyObject_StackTraceEntry__oLyohQ7O2XOvGnflOss8EA {
NCSTRING procname;
NI line;
NCSTRING filename;
};


#ifndef tySequence__uB9b75OUPRENsBAu4AnoePA_Content_PP
#define tySequence__uB9b75OUPRENsBAu4AnoePA_Content_PP
struct tySequence__uB9b75OUPRENsBAu4AnoePA_Content { NI cap; tyObject_StackTraceEntry__oLyohQ7O2XOvGnflOss8EA data[SEQ_DECL_SIZE];};
#endif

      
/* section: NIM_merge_PROC_HEADERS */
N_LIB_PRIVATE N_NIMCALL(void, eqdestroy___A0WfCorq86FTzHcRt3nkKw)(tyObject_UnpackDefect__bq5YFIFutDsA2ou9cpZuWAQ* dest);
static N_INLINE(NIM_BOOL, nimDecRefIsLast)(void* p);
static N_INLINE(NI, minuspercent___dgYAo7RfdUVVpvkfKDym8w_2system)(NI x, NI y);
static N_INLINE(void, nimFrame)(TFrame* s);
N_LIB_PRIVATE N_NOINLINE(void, callDepthLimitReached__mMRdr4sgmnykA9aWeM9aDZlw)(void);
static N_INLINE(void, popFrame)(void);
N_LIB_PRIVATE N_NOINLINE(void, raiseOverflow)(void);
N_LIB_PRIVATE N_NIMCALL(void, nimDestroyAndDispose)(void* p);
N_LIB_PRIVATE N_NIMCALL(void, eqdestroy___dS1BF3Vxjg9aJMmmhVJKSpQ)(NimStringV2* dest);
N_LIB_PRIVATE N_NIMCALL(void, eqdestroy___4fQQqvAqifkWGVa4g39cI5A)(tySequence__uB9b75OUPRENsBAu4AnoePA* dest);

/* section: NIM_merge_DATA */
N_LIB_PRIVATE TNimType NTI__bq5YFIFutDsA2ou9cpZuWAQ_;

/* section: NIM_merge_VARS */
extern NIM_THREADVAR TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern NIM_THREADVAR TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern NIM_THREADVAR TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern NIM_THREADVAR TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern NIM_THREADVAR TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern NIM_THREADVAR TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;

/* section: NIM_merge_PROCS */
static N_INLINE(void, nimFrame)(TFrame* s) {
	{
		if (!(framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw == NIM_NIL)) goto LA3_;
		(*s).calldepth = ((NI16) 0);
	}
	goto LA1_;
	LA3_: ;
	{
		(*s).calldepth = (NI16)((*framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw).calldepth + ((NI16) 1));
	}
	LA1_: ;
	(*s).prev = framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
	framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw = s;
	{
		if (!((*s).calldepth == ((NI16) 2000))) goto LA8_;
		callDepthLimitReached__mMRdr4sgmnykA9aWeM9aDZlw();
	}
	LA8_: ;
}
static N_INLINE(void, popFrame)(void) {
	framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw = (*framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw).prev;
}
static N_INLINE(NI, minuspercent___dgYAo7RfdUVVpvkfKDym8w_2system)(NI x, NI y) {
	NI result;
	nimfr_("-%", "/home/elcritch/.asdf/installs/nim/devel/lib/system/arithmetics."
"nim");
	result = (NI)0;
	nimln_(437, "/home/elcritch/.asdf/installs/nim/devel/lib/system/arithmetics."
"nim");
	nimln_(441, "/home/elcritch/.asdf/installs/nim/devel/lib/system/arithmetics."
"nim");
	result = ((NI) ((NU)((NU64)(((NU) (x))) - (NU64)(((NU) (y))))));
	popFrame();
	return result;
}
static N_INLINE(NIM_BOOL, nimDecRefIsLast)(void* p) {
	NIM_BOOL result;
	nimfr_("nimDecRefIsLast", "/home/elcritch/.asdf/installs/nim/devel/lib/system/refs_v2.nim");
{	result = (NIM_BOOL)0;
	nimln_(188, "/home/elcritch/.asdf/installs/nim/devel/lib/system/refs_v2.nim");
	{
		tyObject_RefHeader__Gi7WQzlT1ZRToh9a2ueYb4A* cell;
		NI T5_;
		if (!!((p == NIM_NIL))) goto LA3_;
		nimln_(189, "/home/elcritch/.asdf/installs/nim/devel/lib/system/refs_v2.nim");
		nimln_(69, "/home/elcritch/.asdf/installs/nim/devel/lib/system/refs_v2.nim");
		T5_ = (NI)0;
		T5_ = minuspercent___dgYAo7RfdUVVpvkfKDym8w_2system(((NI) (ptrdiff_t) (p)), ((NI) 8));
		cell = ((tyObject_RefHeader__Gi7WQzlT1ZRToh9a2ueYb4A*) (T5_));
		nimln_(196, "/home/elcritch/.asdf/installs/nim/devel/lib/system/refs_v2.nim");
		{
			if (!((NI)((*cell).rc & ((NI) -8)) == ((NI) 0))) goto LA8_;
			nimln_(197, "/home/elcritch/.asdf/installs/nim/devel/lib/system/refs_v2.nim");
			result = NIM_TRUE;
		}
		goto LA6_;
		LA8_: ;
		{
			NI TM__4DNs4bMUkswhWc4o4dM9bbg_2;
			nimln_(201, "/home/elcritch/.asdf/installs/nim/devel/lib/system/refs_v2.nim");
			if (nimSubInt((*cell).rc, ((NI) 8), &TM__4DNs4bMUkswhWc4o4dM9bbg_2)) { raiseOverflow(); goto BeforeRet_;
};
			(*cell).rc = (NI)(TM__4DNs4bMUkswhWc4o4dM9bbg_2);
		}
		LA6_: ;
	}
	LA3_: ;
	}BeforeRet_: ;
	popFrame();
	return result;
}
N_LIB_PRIVATE N_NIMCALL(void, eqdestroy___A0WfCorq86FTzHcRt3nkKw)(tyObject_UnpackDefect__bq5YFIFutDsA2ou9cpZuWAQ* dest) {
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = nimDecRefIsLast((*dest).Sup.Sup.parent);
		if (!T3_) goto LA4_;
		nimDestroyAndDispose((*dest).Sup.Sup.parent);
	}
	LA4_: ;
	(*dest).Sup.Sup.parent = NIM_NIL;
	eqdestroy___dS1BF3Vxjg9aJMmmhVJKSpQ((&(*dest).Sup.Sup.message));
	eqdestroy___4fQQqvAqifkWGVa4g39cI5A((&(*dest).Sup.Sup.trace));
	{
		NIM_BOOL T8_;
		T8_ = (NIM_BOOL)0;
		T8_ = nimDecRefIsLast((*dest).Sup.Sup.up);
		if (!T8_) goto LA9_;
		nimDestroyAndDispose((*dest).Sup.Sup.up);
	}
	LA9_: ;
	(*dest).Sup.Sup.up = NIM_NIL;
}
N_LIB_PRIVATE N_NIMCALL(void, stdlib_optionsDatInit000)(void) {

/* section: NIM_merge_TYPE_INIT3 */
NTI__bq5YFIFutDsA2ou9cpZuWAQ_.destructor = (void*)eqdestroy___A0WfCorq86FTzHcRt3nkKw; NTI__bq5YFIFutDsA2ou9cpZuWAQ_.size = sizeof(tyObject_UnpackDefect__bq5YFIFutDsA2ou9cpZuWAQ); NTI__bq5YFIFutDsA2ou9cpZuWAQ_.align = NIM_ALIGNOF(tyObject_UnpackDefect__bq5YFIFutDsA2ou9cpZuWAQ); NTI__bq5YFIFutDsA2ou9cpZuWAQ_.name = "|stdlib.options.UnpackDefect|Defect|Exception|RootObj|";
; NTI__bq5YFIFutDsA2ou9cpZuWAQ_.traceImpl = (void*)NIM_NIL; NTI__bq5YFIFutDsA2ou9cpZuWAQ_.disposeImpl = (void*)NIM_NIL;}

