
#ifndef __BASIC_TYPES_H__
#define __BASIC_TYPES_H__

typedef char			INT8;
typedef unsigned char	UINT8;

typedef short			INT16;
typedef unsigned short	UINT16;

typedef long			INT32;
typedef unsigned long	UINT32;

typedef unsigned long long UINT64;
typedef long long INT64;

//we recommand not using BOOL as return value, just use RET_CODE
typedef int				BOOL;

#ifndef FALSE
#define	FALSE			(0)
#endif
#ifndef	TRUE
#define	TRUE			(!FALSE)
#endif


#define MEMCPY(dest, src, len)			memcpy(dest, src, len)
#define MEMCMP(buf1,buf2, len)			memcmp(buf1,buf2, len)
#define MEMSET(dest, c, len)			memset(dest, c, len)
#define MEMMOVE(dest, src, len)			memmove(dest, src, len)

#define STRCPY(dest,src)				strcpy(dest,src)
#define STRCMP(dest,src)				strcmp(dest,src)
#define STRICMP(dest,src)				stricmp(dest,src)
#define STRLEN(str)						strlen(str)

#define ITOA(str, val)					itoa(str, val)
#define ATOI(str)						atoi(str)
#define ATOI16(str)						atoi16(str)

#define RAND(max_val)					rand(max_val)



#define	ASSERT(expression)				\
	{									\
		if (!(expression))				\
		{								\
			HLS_PRINTF("assertion(%s) failed: file \"%s\", line %d\n",	\
				#expression, __FILE__, __LINE__);	\
		}								\
	}

#define MALLOC(size)				malloc(size)
#define REALLOC(ptr, len)			realloc(ptr, len)
#define FREE(ptr)					free(ptr)

typedef unsigned long size_t;

#endif
