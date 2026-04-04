cmake_minimum_required (VERSION 3.10.0)
project (zstd)

set(zstd_dir ${CMAKE_SOURCE_DIR}/3rdparty/zstd/lib)

set(ALL_SOURCE_FILES
	${zstd_dir}/common/debug.c
	${zstd_dir}/common/entropy_common.c
	${zstd_dir}/common/error_private.c
	${zstd_dir}/common/fse_decompress.c
	${zstd_dir}/common/pool.c
	${zstd_dir}/common/threading.c
	${zstd_dir}/common/xxhash.c
	${zstd_dir}/common/zstd_common.c
	${zstd_dir}/compress/fse_compress.c
	${zstd_dir}/compress/hist.c
	${zstd_dir}/compress/huf_compress.c
	${zstd_dir}/compress/zstd_compress.c
	${zstd_dir}/compress/zstd_compress_literals.c
	${zstd_dir}/compress/zstd_compress_sequences.c
	${zstd_dir}/compress/zstd_compress_superblock.c
	${zstd_dir}/compress/zstd_double_fast.c
	${zstd_dir}/compress/zstd_fast.c
	${zstd_dir}/compress/zstd_lazy.c
	${zstd_dir}/compress/zstd_ldm.c
	${zstd_dir}/compress/zstd_opt.c
	${zstd_dir}/compress/zstdmt_compress.c
	${zstd_dir}/decompress/huf_decompress.c
	${zstd_dir}/decompress/zstd_ddict.c
	${zstd_dir}/decompress/zstd_decompress.c
	${zstd_dir}/decompress/zstd_decompress_block.c
	${zstd_dir}/dictBuilder/cover.c
	${zstd_dir}/dictBuilder/divsufsort.c
	${zstd_dir}/dictBuilder/fastcover.c
	${zstd_dir}/dictBuilder/zdict.c
)

add_compile_options(-DZSTD_DISABLE_ASM)

add_library(zstd STATIC ${ALL_SOURCE_FILES})
