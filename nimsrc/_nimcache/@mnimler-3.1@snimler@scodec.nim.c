/* Generated by Nim Compiler v1.3.5 */
/*   (c) 2020 Andreas Rumpf */
/* The generated code is subject to the original license. */
#define NIM_INTBITS 64

/* section: NIM_merge_HEADERS */

#include "nimbase.h"
#include <string.h>
#include "erl_nif.h"
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
typedef struct tyObject_Option__qXpOBk6YAm7MMF5pjbEt7w tyObject_Option__qXpOBk6YAm7MMF5pjbEt7w;
typedef struct tyObject_ErlAtom__a49atspohaYlyxys5xHmw1g tyObject_ErlAtom__a49atspohaYlyxys5xHmw1g;
typedef struct NimStrPayload NimStrPayload;
typedef struct NimStringV2 NimStringV2;
typedef struct tyObject_Option__rVkI1RILdi0akg69brivmzg tyObject_Option__rVkI1RILdi0akg69brivmzg;

/* section: NIM_merge_TYPES */
struct tyObject_Option__qXpOBk6YAm7MMF5pjbEt7w {
NI32 val;
NIM_BOOL has;
};
struct NimStrPayload {
NI cap;
NIM_CHAR data[SEQ_DECL_SIZE];
};
struct NimStringV2 {
NI len;
NimStrPayload* p;
};
struct tyObject_ErlAtom__a49atspohaYlyxys5xHmw1g {
NimStringV2 val;
};
struct tyObject_Option__rVkI1RILdi0akg69brivmzg {
NU32 val;
NIM_BOOL has;
};

/* section: NIM_merge_PROC_HEADERS */
static N_INLINE(void, nimZeroMem)(void* p, NI size);
static N_INLINE(void, nimSetMem__zxfKBYntu9cBapkhrCOk1fgmemory)(void* a, int v, NI size);
static N_INLINE(NIM_BOOL*, nimErrorFlag)(void);
static N_INLINE(tyObject_Option__qXpOBk6YAm7MMF5pjbEt7w, some__rLoFggCR1IB0WW10Qc9bJ8woptions)(NI32 val);
static N_INLINE(void, nimFrame)(TFrame* s);
N_LIB_PRIVATE N_NOINLINE(void, callDepthLimitReached__mMRdr4sgmnykA9aWeM9aDZlw)(void);
static N_INLINE(void, popFrame)(void);
N_LIB_PRIVATE N_NOINLINE(void, raiseRangeErrorI)(NI64 i, NI64 a, NI64 b);
static N_INLINE(NCSTRING, nimToCStringConv)(NimStringV2 s);
static N_INLINE(tyObject_Option__rVkI1RILdi0akg69brivmzg, some__3uXaIMXFnDdgZxwHKhW7igoptions)(NU32 val);
N_LIB_PRIVATE N_NIMCALL(void, eqdestroy___dS1BF3Vxjg9aJMmmhVJKSpQ)(NimStringV2* dest);

/* section: NIM_merge_VARS */
extern NIM_THREADVAR NIM_BOOL nimInErrorMode__759bT87luu8XGcbkw13FUjA;
extern NIM_THREADVAR TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern NIM_THREADVAR TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern NIM_THREADVAR TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern NIM_THREADVAR TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern NIM_THREADVAR TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;
extern NIM_THREADVAR TFrame* framePtr__HRfVMH3jYeBJz6Q6X9b6Ptw;

/* section: NIM_merge_PROCS */
static N_INLINE(void, nimSetMem__zxfKBYntu9cBapkhrCOk1fgmemory)(void* a, int v, NI size) {
	void* T1_;
	T1_ = (void*)0;
	T1_ = memset(a, v, ((size_t) (size)));
}
static N_INLINE(NIM_BOOL*, nimErrorFlag)(void) {
	NIM_BOOL* result;
	result = (NIM_BOOL*)0;
	result = (&nimInErrorMode__759bT87luu8XGcbkw13FUjA);
	return result;
}
static N_INLINE(void, nimZeroMem)(void* p, NI size) {
NIM_BOOL* nimErr_;
{nimErr_ = nimErrorFlag();
	nimSetMem__zxfKBYntu9cBapkhrCOk1fgmemory(p, ((int) 0), size);
	if (NIM_UNLIKELY(*nimErr_)) goto BeforeRet_;
	}BeforeRet_: ;
}
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
static N_INLINE(tyObject_Option__qXpOBk6YAm7MMF5pjbEt7w, some__rLoFggCR1IB0WW10Qc9bJ8woptions)(NI32 val) {
	tyObject_Option__qXpOBk6YAm7MMF5pjbEt7w result;
	nimfr_("some", "/home/elcritch/.asdf/installs/nim/devel/lib/pure/options.nim");
	nimZeroMem((void*)(&result), sizeof(tyObject_Option__qXpOBk6YAm7MMF5pjbEt7w));
	nimln_(121, "/home/elcritch/.asdf/installs/nim/devel/lib/pure/options.nim");
	result.has = NIM_TRUE;
	nimln_(122, "/home/elcritch/.asdf/installs/nim/devel/lib/pure/options.nim");
	result.val = val;
	popFrame();
	return result;
}
N_LIB_PRIVATE N_NIMCALL(tyObject_Option__qXpOBk6YAm7MMF5pjbEt7w, from_term__zyO1yRfTECDMV9a6o3d00hQ)(ErlNifEnv* env, unsigned long long term) {
	tyObject_Option__qXpOBk6YAm7MMF5pjbEt7w result;
	long res;
NIM_BOOL* nimErr_;
	nimfr_("from_term", "/home/elcritch/projects/pt/widgetlords_nifs/nimsrc/nimler-3.1/n"
"imler/codec.nim");
{nimErr_ = nimErrorFlag();
	nimZeroMem((void*)(&result), sizeof(tyObject_Option__qXpOBk6YAm7MMF5pjbEt7w));
	res = (long)0;
	nimln_(61, "/home/elcritch/projects/pt/widgetlords_nifs/nimsrc/nimler-3.1/n"
"imler/codec.nim");
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = enif_get_long(env, term, (&res));
		if (!T3_) goto LA4_;
		nimln_(62, "/home/elcritch/projects/pt/widgetlords_nifs/nimsrc/nimler-3.1/n"
"imler/codec.nim");
		if ((res) < ((NI32) (-2147483647 -1)) || (res) > ((NI32) 2147483647)){ raiseRangeErrorI(res, ((NI32) (-2147483647 -1)), ((NI32) 2147483647)); goto BeforeRet_;
}
		result = some__rLoFggCR1IB0WW10Qc9bJ8woptions(((NI32) (res)));
		if (NIM_UNLIKELY(*nimErr_)) goto BeforeRet_;
	}
	LA4_: ;
	}BeforeRet_: ;
	popFrame();
	return result;
}
N_LIB_PRIVATE N_NIMCALL(unsigned long long, to_term__pJdsNsvteHR7m7nv0yKxZQ)(ErlNifEnv* env, NI32 V) {
	unsigned long long result;
	nimfr_("to_term", "/home/elcritch/projects/pt/widgetlords_nifs/nimsrc/nimler-3.1/n"
"imler/codec.nim");
	result = (unsigned long long)0;
	nimln_(64, "/home/elcritch/projects/pt/widgetlords_nifs/nimsrc/nimler-3.1/n"
"imler/codec.nim");
	result = enif_make_long(env, ((long) (V)));
	popFrame();
	return result;
}
static N_INLINE(NCSTRING, nimToCStringConv)(NimStringV2 s) {
	NCSTRING result;
	result = (NCSTRING)0;
	{
		if (!(s.len == ((NI) 0))) goto LA3_;
		result = "";
	}
	goto LA1_;
	LA3_: ;
	{
		result = ((NCSTRING) ((*s.p).data));
	}
	LA1_: ;
	return result;
}
N_LIB_PRIVATE N_NIMCALL(unsigned long long, to_term__Ni0jSAiz9cWFkZ9aJeQUTbjg)(ErlNifEnv* env, tyObject_ErlAtom__a49atspohaYlyxys5xHmw1g V) {
	unsigned long long result;
	unsigned long long res;
	nimfr_("to_term", "/home/elcritch/projects/pt/widgetlords_nifs/nimsrc/nimler-3.1/n"
"imler/codec.nim");
	result = (unsigned long long)0;
	res = (unsigned long long)0;
	nimln_(100, "/home/elcritch/projects/pt/widgetlords_nifs/nimsrc/nimler-3.1/n"
"imler/codec.nim");
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = enif_make_existing_atom(env, nimToCStringConv(V.val), (&res), ((ErlNifCharEncoding) 1));
		if (!T3_) goto LA4_;
		nimln_(101, "/home/elcritch/projects/pt/widgetlords_nifs/nimsrc/nimler-3.1/n"
"imler/codec.nim");
		result = res;
	}
	goto LA1_;
	LA4_: ;
	{
		nimln_(103, "/home/elcritch/projects/pt/widgetlords_nifs/nimsrc/nimler-3.1/n"
"imler/codec.nim");
		result = enif_make_atom(env, nimToCStringConv(V.val));
	}
	LA1_: ;
	popFrame();
	return result;
}
N_LIB_PRIVATE N_NIMCALL(unsigned long long, to_term__cldzAvA0dkNFFgPjRQc3PA)(ErlNifEnv* env, NI V) {
	unsigned long long result;
	nimfr_("to_term", "/home/elcritch/projects/pt/widgetlords_nifs/nimsrc/nimler-3.1/n"
"imler/codec.nim");
	result = (unsigned long long)0;
	nimln_(56, "/home/elcritch/projects/pt/widgetlords_nifs/nimsrc/nimler-3.1/n"
"imler/codec.nim");
	result = enif_make_int64(env, ((long long) (V)));
	popFrame();
	return result;
}
static N_INLINE(tyObject_Option__rVkI1RILdi0akg69brivmzg, some__3uXaIMXFnDdgZxwHKhW7igoptions)(NU32 val) {
	tyObject_Option__rVkI1RILdi0akg69brivmzg result;
	nimfr_("some", "/home/elcritch/.asdf/installs/nim/devel/lib/pure/options.nim");
	nimZeroMem((void*)(&result), sizeof(tyObject_Option__rVkI1RILdi0akg69brivmzg));
	nimln_(121, "/home/elcritch/.asdf/installs/nim/devel/lib/pure/options.nim");
	result.has = NIM_TRUE;
	nimln_(122, "/home/elcritch/.asdf/installs/nim/devel/lib/pure/options.nim");
	result.val = val;
	popFrame();
	return result;
}
N_LIB_PRIVATE N_NIMCALL(tyObject_Option__rVkI1RILdi0akg69brivmzg, from_term__9adbYfMhDbRsyXc74IGc1tg)(ErlNifEnv* env, unsigned long long term) {
	tyObject_Option__rVkI1RILdi0akg69brivmzg result;
	unsigned long res;
NIM_BOOL* nimErr_;
	nimfr_("from_term", "/home/elcritch/projects/pt/widgetlords_nifs/nimsrc/nimler-3.1/n"
"imler/codec.nim");
{nimErr_ = nimErrorFlag();
	nimZeroMem((void*)(&result), sizeof(tyObject_Option__rVkI1RILdi0akg69brivmzg));
	res = (unsigned long)0;
	nimln_(69, "/home/elcritch/projects/pt/widgetlords_nifs/nimsrc/nimler-3.1/n"
"imler/codec.nim");
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = enif_get_ulong(env, term, (&res));
		if (!T3_) goto LA4_;
		nimln_(70, "/home/elcritch/projects/pt/widgetlords_nifs/nimsrc/nimler-3.1/n"
"imler/codec.nim");
		result = some__3uXaIMXFnDdgZxwHKhW7igoptions(((NU32) (res)));
		if (NIM_UNLIKELY(*nimErr_)) goto BeforeRet_;
	}
	LA4_: ;
	}BeforeRet_: ;
	popFrame();
	return result;
}
N_LIB_PRIVATE N_NIMCALL(void, eqdestroy___ZThblwUJ9bUBOAapoYTQn6A)(tyObject_ErlAtom__a49atspohaYlyxys5xHmw1g* dest) {
	eqdestroy___dS1BF3Vxjg9aJMmmhVJKSpQ((&(*dest).val));
}
