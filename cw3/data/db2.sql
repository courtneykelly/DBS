DROP TABLE IF EXISTS Tracks ;
DROP TABLE IF EXISTS Albums ;
DROP TABLE IF EXISTS Artists ;
DROP DOMAIN IF EXISTS posint ;

CREATE DOMAIN posint AS smallint CHECK ( VALUE > 0 );

CREATE TABLE Artists (
    aname    varchar(20) PRIMARY KEY,
    atype    varchar(10) CHECK ( atype IN ('BAND','PERSON') ),
    country  char(3)
);

CREATE TABLE Albums (
    title   varchar(30),
    artist  varchar(20) REFERENCES Artists(aname),
    ryear   posint,
    rtype   varchar(20) CHECK ( rtype IN ('LIVE','STUDIO','COMPILATION') ),
    tracks  posint,
    rating  smallint    CHECK ( rating > 0 AND rating <= 5),
    PRIMARY KEY (title, artist)
);

CREATE TABLE Tracks (
    album_title   varchar(30),
    album_artist  varchar(20),
    track_number  posint,
    track_title   varchar(30),
    track_length  posint,
    PRIMARY KEY (album_title, album_artist, track_number),
    FOREIGN KEY (album_title, album_artist)
        REFERENCES Albums(title, artist)
);


COPY artists (aname, atype, country) FROM stdin;
artist_1_1_1_	BAND	JPN
artist_2_2_2_	BAND	JPN
artist_4_4_4_	BAND	ITA
artist_5_5_5_	BAND	JPN
artist_6_6_6_	BAND	GBR
artist_8_8_8_	BAND	GBR
artist_9_9_9_	BAND	JPN
artist_10_10_10_1	BAND	CHN
artist_11_11_	BAND	ITA
artist_12_12_12	BAND	GBR
artist_13_13_13_1	BAND	ITA
artist_16_16_16_1	BAND	JPN
artist_17_17_	BAND	USA
artist_18_18_18	BAND	GBR
artist_19_19_19_1	BAND	ITA
artist_21_21_21_2	BAND	USA
artist_22_22_	BAND	GBR
artist_25_25_	BAND	USA
artist_26_26_26	BAND	GBR
artist_27_27_27_2	BAND	GBR
artist_31_31_31	BAND	GBR
artist_32_32_32_3	BAND	USA
artist_36_36_	BAND	CHN
artist_3_3_3_	PERSON	GBR
artist_7_7_7_	PERSON	GBR
artist_14_14_	PERSON	ITA
artist_15_15_15	PERSON	CHN
artist_20_20_20	PERSON	CHN
artist_23_23_23	PERSON	USA
artist_24_24_24_2	PERSON	GBR
artist_28_28_	PERSON	JPN
artist_29_29_29	PERSON	GBR
artist_30_30_	PERSON	GBR
artist_33_33_	PERSON	JPN
artist_34_34_34	PERSON	CHN
artist_35_35_35_3	PERSON	CHN
artist_39_39_	PERSON	CHN
artist_67_67_67	PERSON	USA
artist_68_68_68_6	PERSON	GBR
artist_69_69_	PERSON	ITA
artist_73_73_73_7	PERSON	GBR
artist_74_74_	PERSON	USA
artist_75_75_75	PERSON	CHN
artist_77_77_	PERSON	JPN
artist_81_81_81_8	PERSON	GBR
artist_84_84_84_8	PERSON	CHN
artist_85_85_	PERSON	GBR
artist_86_86_86	PERSON	CHN
artist_87_87_87_8	PERSON	USA
artist_88_88_	PERSON	ITA
artist_90_90_	PERSON	ITA
artist_93_93_	PERSON	CHN
artist_96_96_	PERSON	CHN
artist_97_97_97	PERSON	CHN
artist_100_100_1	PERSON	USA
artist_38_38_38_3	BAND	ITA
artist_40_40_40_4	BAND	USA
artist_42_42_42	BAND	JPN
artist_45_45_45	BAND	USA
artist_48_48_48	BAND	USA
artist_49_49_49_4	BAND	USA
artist_50_50_50	BAND	GBR
artist_51_51_51_5	BAND	CHN
artist_52_52_	BAND	JPN
artist_56_56_56	BAND	JPN
artist_57_57_57_5	BAND	CHN
artist_58_58_	BAND	ITA
artist_60_60_	BAND	ITA
artist_61_61_61	BAND	USA
artist_63_63_	BAND	CHN
artist_70_70_70_7	BAND	CHN
artist_71_71_	BAND	USA
artist_72_72_72	BAND	GBR
artist_76_76_76_7	BAND	ITA
artist_78_78_78	BAND	GBR
artist_79_79_79_7	BAND	USA
artist_80_80_80	BAND	USA
artist_82_82_	BAND	JPN
artist_83_83_83	BAND	USA
artist_89_89_89	BAND	USA
artist_91_91_91	BAND	ITA
artist_92_92_92_9	BAND	GBR
artist_94_94_94	BAND	ITA
artist_95_95_95_9	BAND	ITA
artist_98_98_98_9	BAND	USA
artist_99_99_	BAND	GBR
artist_37_37_37	PERSON	GBR
artist_41_41_	PERSON	CHN
artist_43_43_43_4	PERSON	JPN
artist_44_44_	PERSON	JPN
artist_46_46_46_4	PERSON	ITA
artist_47_47_	PERSON	USA
artist_53_53_53	PERSON	GBR
artist_54_54_54_5	PERSON	CHN
artist_55_55_	PERSON	USA
artist_59_59_59	PERSON	GBR
artist_62_62_62_6	PERSON	JPN
artist_64_64_64	PERSON	GBR
artist_65_65_65_6	PERSON	USA
artist_66_66_	PERSON	GBR
\.


COPY albums (title, artist, ryear, rtype, tracks, rating) FROM stdin;
title_212_210_	artist_42_42_42	1978	LIVE	8	4
title_96_94_	artist_93_93_	2016	LIVE	11	2
title_496_494_	artist_59_59_59	2014	COMPILATION	7	3
title_502_500_	artist_94_94_94	2014	COMPILATION	9	2
title_35_33_	artist_59_59_59	2014	COMPILATION	8	4
title_444_442_	artist_94_94_94	2014	LIVE	10	4
title_397_395_	artist_17_17_	1976	LIVE	11	4
title_513_511_	artist_42_42_42	1990	STUDIO	12	2
title_13_11_	artist_4_4_4_	1964	STUDIO	13	4
title_448_446_	artist_34_34_34	1982	STUDIO	13	4
title_449_447_	artist_1_1_1_	1984	STUDIO	12	4
title_465_463_	artist_59_59_59	1992	STUDIO	13	2
title_411_409_	artist_21_21_21_2	1978	LIVE	12	2
title_481_479_	artist_5_5_5_	1970	LIVE	13	4
title_484_482_	artist_31_31_31	2014	LIVE	13	1
title_490_488_	artist_51_51_51_5	1968	LIVE	11	2
title_462_460_	artist_80_80_80	1988	COMPILATION	13	4
title_44_42_	artist_56_56_56	1992	COMPILATION	13	1
title_50_48_	artist_5_5_5_	1966	COMPILATION	13	4
title_64_62_	artist_87_87_87_8	1980	STUDIO	11	1
title_67_65_	artist_85_85_	2010	STUDIO	12	1
title_70_68_	artist_96_96_	2008	STUDIO	12	3
title_80_78_	artist_19_19_19_1	1958	STUDIO	13	1
title_384_382_	artist_23_23_23	1976	LIVE	6	4
title_399_397_	artist_15_15_15	1966	LIVE	10	2
title_401_399_	artist_37_37_37	1968	LIVE	9	4
title_491_489_	artist_27_27_27_2	2010	COMPILATION	6	1
title_493_491_	artist_49_49_49_4	1968	COMPILATION	11	3
title_508_506_	artist_87_87_87_8	1980	STUDIO	9	2
title_509_507_	artist_73_73_73_7	1966	STUDIO	10	1
title_494_492_	artist_19_19_19_1	1992	COMPILATION	7	2
title_30_28_	artist_58_58_	1988	STUDIO	11	4
title_499_497_	artist_79_79_79_7	2000	COMPILATION	9	4
title_500_498_	artist_72_72_72	1998	COMPILATION	8	1
title_33_31_	artist_32_32_32_3	2012	STUDIO	11	2
title_34_32_	artist_90_90_	1980	STUDIO	9	4
title_511_509_	artist_14_14_	1984	COMPILATION	10	2
title_512_510_	artist_42_42_42	2016	COMPILATION	5	2
title_446_444_	artist_47_47_	1986	COMPILATION	5	2
title_456_454_	artist_5_5_5_	2004	STUDIO	6	4
title_447_445_	artist_69_69_	1972	COMPILATION	11	4
title_452_450_	artist_19_19_19_1	1984	COMPILATION	8	3
title_455_453_	artist_52_52_	2002	COMPILATION	10	3
title_463_461_	artist_57_57_57_5	1982	STUDIO	7	4
title_457_455_	artist_63_63_	2000	COMPILATION	10	3
title_403_401_	artist_60_60_	2000	LIVE	8	1
title_406_404_	artist_47_47_	1986	LIVE	9	3
title_414_412_	artist_60_60_	2000	LIVE	8	3
title_415_413_	artist_74_74_	1984	LIVE	11	4
title_417_415_	artist_66_66_	2004	LIVE	5	4
title_424_422_	artist_17_17_	2008	LIVE	9	3
title_428_426_	artist_11_11_	2004	LIVE	9	4
title_429_427_	artist_19_19_19_1	1962	LIVE	7	2
title_430_428_	artist_36_36_	2004	LIVE	5	3
title_14_12_	artist_53_53_53	1968	LIVE	5	4
title_19_17_	artist_18_18_18	1980	LIVE	7	4
title_27_25_	artist_98_98_98_9	2016	LIVE	6	4
title_436_434_	artist_16_16_16_1	1994	LIVE	6	2
title_438_436_	artist_79_79_79_7	1976	LIVE	5	2
title_442_440_	artist_47_47_	1978	LIVE	9	4
title_479_477_	artist_29_29_29	1978	LIVE	8	1
title_482_480_	artist_91_91_91	2004	LIVE	11	4
title_492_490_	artist_32_32_32_3	2014	LIVE	8	3
title_497_495_	artist_46_46_46_4	2014	LIVE	7	1
title_504_502_	artist_48_48_48	2000	LIVE	11	4
title_459_457_	artist_59_59_59	1980	COMPILATION	5	3
title_469_467_	artist_4_4_4_	1980	STUDIO	10	4
title_471_469_	artist_41_41_	2016	STUDIO	8	3
title_464_462_	artist_88_88_	1996	COMPILATION	8	4
title_474_472_	artist_59_59_59	1984	STUDIO	5	3
title_13_11_	artist_71_71_	2006	COMPILATION	10	1
title_40_38_	artist_62_62_62_6	1970	COMPILATION	10	1
title_41_39_	artist_46_46_46_4	1968	COMPILATION	6	3
title_45_43_	artist_97_97_97	2016	COMPILATION	6	2
title_49_47_	artist_24_24_24_2	1984	COMPILATION	8	4
title_55_53_	artist_99_99_	1976	STUDIO	11	1
title_61_59_	artist_62_62_62_6	1972	STUDIO	11	1
title_65_63_	artist_90_90_	1964	STUDIO	9	4
title_66_64_	artist_55_55_	1968	STUDIO	9	2
title_68_66_	artist_2_2_2_	1968	STUDIO	8	2
title_73_71_	artist_43_43_43_4	1978	STUDIO	6	2
title_116_114_	artist_92_92_92_9	2000	LIVE	6	3
title_117_115_	artist_6_6_6_	1980	LIVE	10	4
title_120_118_	artist_76_76_76_7	1970	LIVE	6	1
title_126_124_	artist_70_70_70_7	1996	LIVE	8	3
title_131_129_	artist_37_37_37	1964	LIVE	10	4
title_134_132_	artist_46_46_46_4	1966	LIVE	8	4
title_148_146_	artist_67_67_67	2002	LIVE	9	3
title_164_162_	artist_92_92_92_9	1996	LIVE	11	4
title_166_164_	artist_19_19_19_1	1966	LIVE	6	1
title_168_166_	artist_77_77_	2014	LIVE	9	2
title_184_182_	artist_100_100_1	1962	LIVE	7	3
title_186_184_	artist_2_2_2_	2002	LIVE	7	4
title_188_186_	artist_94_94_94	1992	LIVE	11	2
title_191_189_	artist_3_3_3_	1990	LIVE	7	2
title_192_190_	artist_54_54_54_5	1986	LIVE	11	4
title_195_193_	artist_26_26_26	1996	LIVE	10	3
title_83_81_	artist_53_53_53	1998	STUDIO	11	2
title_86_84_	artist_60_60_	2000	STUDIO	8	3
title_468_466_	artist_13_13_13_1	2002	COMPILATION	6	3
title_95_93_	artist_87_87_87_8	2002	STUDIO	8	4
title_91_89_	artist_85_85_	1972	COMPILATION	5	4
title_100_98_	artist_66_66_	1982	STUDIO	10	4
title_102_100_	artist_38_38_38_3	1982	STUDIO	6	2
title_103_101_	artist_47_47_	2000	STUDIO	5	1
title_105_103_	artist_84_84_84_8	2002	STUDIO	9	4
title_107_105_	artist_29_29_29	1964	STUDIO	5	2
title_92_90_	artist_79_79_79_7	1968	COMPILATION	10	4
title_114_112_	artist_35_35_35_3	1998	STUDIO	9	1
title_93_91_	artist_92_92_92_9	1994	COMPILATION	5	4
title_97_95_	artist_11_11_	1974	COMPILATION	11	2
title_119_117_	artist_3_3_3_	1958	STUDIO	5	4
title_104_102_	artist_43_43_43_4	1990	COMPILATION	11	3
title_122_120_	artist_37_37_37	1988	STUDIO	9	1
title_123_121_	artist_26_26_26	2010	STUDIO	10	4
title_125_123_	artist_5_5_5_	1990	STUDIO	6	4
title_106_104_	artist_43_43_43_4	1974	COMPILATION	8	3
title_129_127_	artist_84_84_84_8	1966	STUDIO	5	1
title_133_131_	artist_98_98_98_9	2006	STUDIO	5	4
title_256_254_	artist_79_79_79_7	1984	STUDIO	9	3
title_253_251_	artist_84_84_84_8	1988	COMPILATION	8	4
title_259_257_	artist_70_70_70_7	2012	STUDIO	8	2
title_260_258_	artist_47_47_	1958	STUDIO	5	1
title_311_309_	artist_17_17_	2004	STUDIO	11	4
title_316_314_	artist_61_61_61	1974	COMPILATION	5	1
title_318_316_	artist_69_69_	1958	COMPILATION	9	4
title_98_96_	artist_80_80_80	2014	STUDIO	7	1
title_472_470_	artist_41_41_	1992	COMPILATION	11	1
title_99_97_	artist_3_3_3_	1962	LIVE	13	2
title_109_107_	artist_47_47_	1974	LIVE	13	4
title_136_134_	artist_61_61_61	1966	LIVE	13	2
title_140_138_	artist_80_80_80	1976	LIVE	12	1
title_144_142_	artist_77_77_	2016	LIVE	12	3
title_146_144_	artist_85_85_	1958	LIVE	13	4
title_150_148_	artist_51_51_51_5	1968	LIVE	11	3
title_157_155_	artist_42_42_42	2014	LIVE	13	4
title_161_159_	artist_36_36_	2006	LIVE	12	3
title_162_160_	artist_17_17_	2002	LIVE	13	1
title_169_167_	artist_96_96_	1968	LIVE	11	3
title_176_174_	artist_60_60_	2016	LIVE	13	4
title_180_178_	artist_66_66_	1972	LIVE	12	4
title_189_187_	artist_32_32_32_3	1978	LIVE	11	4
title_190_188_	artist_95_95_95_9	1974	LIVE	12	4
title_89_87_	artist_40_40_40_4	1968	STUDIO	11	4
title_94_92_	artist_93_93_	1996	STUDIO	13	3
title_90_88_	artist_41_41_	1986	COMPILATION	12	4
title_101_99_	artist_58_58_	2004	STUDIO	13	4
title_124_122_	artist_97_97_97	1990	STUDIO	12	4
title_128_126_	artist_40_40_40_4	1994	STUDIO	13	4
title_108_106_	artist_43_43_43_4	2000	COMPILATION	13	4
title_314_312_	artist_32_32_32_3	1964	STUDIO	12	2
title_315_313_	artist_51_51_51_5	1982	STUDIO	11	1
title_317_315_	artist_46_46_46_4	1968	COMPILATION	12	1
title_343_341_	artist_66_66_	2014	COMPILATION	9	2
title_324_322_	artist_51_51_51_5	2006	STUDIO	13	1
title_345_343_	artist_59_59_59	1964	STUDIO	11	4
title_337_335_	artist_98_98_98_9	1976	COMPILATION	12	3
title_354_352_	artist_43_43_43_4	1978	STUDIO	13	1
title_364_362_	artist_4_4_4_	1960	STUDIO	11	1
title_366_364_	artist_20_20_20	1996	STUDIO	12	1
title_346_344_	artist_7_7_7_	1982	COMPILATION	11	4
title_352_350_	artist_70_70_70_7	1992	COMPILATION	12	2
title_386_384_	artist_86_86_86	1984	STUDIO	12	3
title_219_217_	artist_12_12_12	1982	LIVE	11	2
title_235_233_	artist_36_36_	1964	LIVE	12	1
title_236_234_	artist_52_52_	2008	LIVE	13	4
title_322_320_	artist_98_98_98_9	2006	COMPILATION	7	3
title_329_327_	artist_20_20_20	1994	COMPILATION	8	4
title_325_323_	artist_79_79_79_7	2012	STUDIO	6	1
title_326_324_	artist_18_18_18	2014	STUDIO	9	3
title_330_328_	artist_34_34_34	1992	COMPILATION	6	1
title_333_331_	artist_46_46_46_4	1996	COMPILATION	5	2
title_334_332_	artist_45_45_45	1970	COMPILATION	9	1
title_335_333_	artist_56_56_56	1986	COMPILATION	10	4
title_338_336_	artist_84_84_84_8	1972	STUDIO	6	2
title_336_334_	artist_54_54_54_5	2012	COMPILATION	9	4
title_340_338_	artist_54_54_54_5	1992	STUDIO	6	1
title_344_342_	artist_65_65_65_6	1976	STUDIO	7	4
title_350_348_	artist_31_31_31	1968	STUDIO	7	1
title_341_339_	artist_45_45_45	1970	COMPILATION	10	1
title_342_340_	artist_47_47_	2002	COMPILATION	7	1
title_363_361_	artist_56_56_56	1994	STUDIO	6	1
title_347_345_	artist_71_71_	1968	COMPILATION	10	3
title_1012_1010_	artist_1_1_1_	1970	STUDIO	9	3
title_348_346_	artist_97_97_97	2000	COMPILATION	10	2
title_349_347_	artist_27_27_27_2	1988	COMPILATION	5	1
title_353_351_	artist_8_8_8_	2008	COMPILATION	6	4
title_356_354_	artist_83_83_83	1992	COMPILATION	8	4
title_381_379_	artist_65_65_65_6	2014	STUDIO	10	1
title_382_380_	artist_79_79_79_7	1992	STUDIO	10	4
title_383_381_	artist_94_94_94	2006	STUDIO	11	3
title_357_355_	artist_2_2_2_	2010	COMPILATION	7	2
title_385_383_	artist_49_49_49_4	2008	STUDIO	10	4
title_390_388_	artist_76_76_76_7	1980	STUDIO	9	1
title_391_389_	artist_15_15_15	1980	STUDIO	7	4
title_423_421_	artist_79_79_79_7	1978	STUDIO	7	4
title_422_420_	artist_40_40_40_4	1990	COMPILATION	5	4
title_213_211_	artist_23_23_23	1976	LIVE	10	4
title_214_212_	artist_12_12_12	1966	LIVE	10	4
title_218_216_	artist_49_49_49_4	1992	LIVE	9	4
title_222_220_	artist_78_78_78	1982	LIVE	6	1
title_228_226_	artist_65_65_65_6	1986	LIVE	9	4
title_231_229_	artist_83_83_83	1994	LIVE	6	2
title_232_230_	artist_77_77_	1972	LIVE	5	4
title_374_372_	artist_12_12_12	2014	COMPILATION	5	1
title_252_250_	artist_85_85_	1976	LIVE	13	4
title_266_264_	artist_85_85_	1992	LIVE	11	2
title_279_277_	artist_61_61_61	1972	LIVE	11	2
title_280_278_	artist_6_6_6_	1992	LIVE	12	1
title_283_281_	artist_83_83_83	1968	LIVE	13	3
title_287_285_	artist_23_23_23	1982	LIVE	12	2
title_305_303_	artist_91_91_91	2002	LIVE	13	4
title_307_305_	artist_30_30_	1998	LIVE	13	4
title_309_307_	artist_7_7_7_	1990	LIVE	11	4
title_313_311_	artist_58_58_	1996	LIVE	12	4
title_319_317_	artist_3_3_3_	1988	LIVE	13	3
title_321_319_	artist_10_10_10_1	1990	LIVE	12	1
title_331_329_	artist_80_80_80	1978	LIVE	11	4
title_358_356_	artist_29_29_29	1996	LIVE	11	4
title_297_295_	artist_34_34_34	1966	STUDIO	13	1
title_308_306_	artist_11_11_	1968	COMPILATION	11	3
title_306_304_	artist_35_35_35_3	2000	STUDIO	11	1
title_359_357_	artist_62_62_62_6	1988	COMPILATION	13	4
title_398_396_	artist_22_22_	1966	STUDIO	13	1
title_361_359_	artist_23_23_23	1974	COMPILATION	11	4
title_376_374_	artist_30_30_	2010	COMPILATION	12	4
title_241_239_	artist_30_30_	1958	LIVE	6	3
title_244_242_	artist_47_47_	2010	LIVE	10	4
title_249_247_	artist_27_27_27_2	1970	LIVE	6	4
title_250_248_	artist_18_18_18	1980	LIVE	7	4
title_258_256_	artist_76_76_76_7	1968	LIVE	9	2
title_264_262_	artist_13_13_13_1	1968	LIVE	9	1
title_268_266_	artist_59_59_59	1974	LIVE	7	2
title_269_267_	artist_1_1_1_	1976	LIVE	8	4
title_273_271_	artist_13_13_13_1	1960	LIVE	7	4
title_276_274_	artist_8_8_8_	1966	LIVE	5	1
title_277_275_	artist_44_44_	1986	LIVE	5	3
title_292_290_	artist_6_6_6_	2006	LIVE	6	4
title_294_292_	artist_88_88_	1998	LIVE	5	4
title_296_294_	artist_11_11_	1976	LIVE	8	4
title_304_302_	artist_60_60_	1998	LIVE	10	3
title_320_318_	artist_82_82_	1996	LIVE	11	4
title_323_321_	artist_29_29_29	1982	LIVE	6	4
title_327_325_	artist_49_49_49_4	2008	LIVE	8	4
title_328_326_	artist_63_63_	1976	LIVE	5	2
title_332_330_	artist_18_18_18	1990	LIVE	11	4
title_339_337_	artist_63_63_	2006	LIVE	11	4
title_351_349_	artist_11_11_	2006	LIVE	9	4
title_355_353_	artist_90_90_	1978	LIVE	11	4
title_365_363_	artist_51_51_51_5	1964	LIVE	9	2
title_369_367_	artist_99_99_	1988	LIVE	8	1
title_13_11_	artist_8_8_8_	1980	LIVE	9	2
title_370_368_	artist_40_40_40_4	2008	LIVE	7	4
title_291_289_	artist_60_60_	1998	STUDIO	10	2
title_289_287_	artist_72_72_72	1994	COMPILATION	9	3
title_293_291_	artist_88_88_	1972	COMPILATION	6	2
title_295_293_	artist_13_13_13_1	1988	COMPILATION	5	4
title_298_296_	artist_6_6_6_	1986	STUDIO	6	1
title_299_297_	artist_46_46_46_4	1992	STUDIO	11	4
title_300_298_	artist_92_92_92_9	1982	STUDIO	10	2
title_302_300_	artist_85_85_	1958	STUDIO	10	4
title_303_301_	artist_59_59_59	2008	STUDIO	11	1
title_301_299_	artist_51_51_51_5	1990	COMPILATION	8	4
title_310_308_	artist_69_69_	2002	STUDIO	7	3
title_392_390_	artist_62_62_62_6	1960	STUDIO	10	3
title_400_398_	artist_24_24_24_2	1970	STUDIO	5	1
title_362_360_	artist_61_61_61	1978	COMPILATION	5	4
title_402_400_	artist_72_72_72	1978	STUDIO	9	4
title_367_365_	artist_86_86_86	1994	COMPILATION	7	3
title_368_366_	artist_3_3_3_	1978	COMPILATION	7	1
title_408_406_	artist_75_75_75	1978	STUDIO	9	3
title_413_411_	artist_62_62_62_6	2008	STUDIO	8	4
title_377_375_	artist_37_37_37	2008	COMPILATION	6	2
title_378_376_	artist_7_7_7_	1966	COMPILATION	6	4
title_488_486_	artist_16_16_16_1	2014	COMPILATION	10	1
title_489_487_	artist_54_54_54_5	2014	STUDIO	5	4
title_39_37_	artist_49_49_49_4	2014	LIVE	11	3
title_418_416_	artist_54_54_54_5	2004	STUDIO	11	4
title_76_74_	artist_24_24_24_2	1964	COMPILATION	11	1
title_77_75_	artist_87_87_87_8	1974	COMPILATION	13	1
title_57_55_	artist_23_23_23	1996	LIVE	11	2
title_82_80_	artist_98_98_98_9	1984	LIVE	11	1
title_425_423_	artist_34_34_34	1982	COMPILATION	12	2
title_20_18_	artist_54_54_54_5	1966	COMPILATION	13	3
title_15_13_	artist_55_55_	1976	STUDIO	11	1
title_17_15_	artist_54_54_54_5	2008	STUDIO	12	2
title_21_19_	artist_12_12_12	2002	COMPILATION	11	4
title_25_23_	artist_5_5_5_	1964	COMPILATION	12	2
title_433_431_	artist_2_2_2_	1966	COMPILATION	12	2
title_477_475_	artist_13_13_13_1	2002	STUDIO	13	1
title_434_432_	artist_54_54_54_5	1984	COMPILATION	12	4
title_440_438_	artist_59_59_59	1982	COMPILATION	13	4
title_419_417_	artist_76_76_76_7	1982	STUDIO	7	4
title_503_501_	artist_96_96_	2008	STUDIO	9	1
title_53_51_	artist_70_70_70_7	1980	COMPILATION	10	3
title_54_52_	artist_69_69_	1972	COMPILATION	10	3
title_58_56_	artist_43_43_43_4	1992	COMPILATION	11	4
title_60_58_	artist_17_17_	1966	COMPILATION	8	4
title_88_86_	artist_49_49_49_4	1984	COMPILATION	11	1
title_37_35_	artist_14_14_	1976	LIVE	10	2
title_42_40_	artist_51_51_51_5	2016	LIVE	11	4
title_43_41_	artist_34_34_34	2010	LIVE	10	4
title_47_45_	artist_46_46_46_4	2002	LIVE	5	1
title_52_50_	artist_66_66_	1972	LIVE	11	3
title_56_54_	artist_29_29_29	2002	LIVE	10	1
title_59_57_	artist_6_6_6_	1996	LIVE	6	4
title_62_60_	artist_26_26_26	1964	LIVE	6	1
title_63_61_	artist_81_81_81_8	1968	LIVE	10	2
title_69_67_	artist_34_34_34	1988	LIVE	6	1
title_71_69_	artist_37_37_37	1982	LIVE	11	3
title_72_70_	artist_97_97_97	1970	LIVE	10	2
title_74_72_	artist_21_21_21_2	1988	LIVE	11	4
title_75_73_	artist_1_1_1_	2000	LIVE	7	2
title_78_76_	artist_75_75_75	1988	LIVE	8	1
title_79_77_	artist_38_38_38_3	1976	LIVE	11	3
title_84_82_	artist_84_84_84_8	1984	LIVE	8	1
title_87_85_	artist_91_91_91	1978	LIVE	11	4
title_13_11_	artist_18_18_18	1970	STUDIO	8	4
title_13_11_	artist_9_9_9_	1996	STUDIO	10	4
title_36_34_	artist_38_38_38_3	1994	STUDIO	7	2
title_38_36_	artist_60_60_	1982	STUDIO	5	3
title_46_44_	artist_53_53_53	1986	STUDIO	11	2
title_48_46_	artist_83_83_83	1988	STUDIO	5	4
title_51_49_	artist_19_19_19_1	1958	STUDIO	5	4
title_427_425_	artist_88_88_	2002	STUDIO	5	2
title_426_424_	artist_37_37_37	1964	COMPILATION	5	1
title_18_16_	artist_13_13_13_1	1994	COMPILATION	5	2
title_16_14_	artist_16_16_16_1	2008	STUDIO	10	4
title_22_20_	artist_5_5_5_	1970	STUDIO	7	3
title_23_21_	artist_21_21_21_2	1998	STUDIO	5	2
title_24_22_	artist_75_75_75	2010	COMPILATION	8	3
title_28_26_	artist_67_67_67	1974	STUDIO	7	4
title_437_435_	artist_39_39_	1996	STUDIO	8	3
title_26_24_	artist_60_60_	1976	COMPILATION	10	1
title_439_437_	artist_87_87_87_8	1964	STUDIO	6	2
title_441_439_	artist_37_37_37	1988	STUDIO	11	2
title_432_430_	artist_81_81_81_8	1992	COMPILATION	11	3
title_435_433_	artist_97_97_97	1982	COMPILATION	9	1
title_483_481_	artist_61_61_61	2008	STUDIO	10	3
title_443_441_	artist_17_17_	2010	COMPILATION	5	1
title_487_485_	artist_4_4_4_	1994	STUDIO	7	2
title_480_478_	artist_9_9_9_	1986	COMPILATION	9	4
title_112_110_	artist_49_49_49_4	1994	COMPILATION	7	3
title_141_139_	artist_70_70_70_7	1996	STUDIO	5	2
title_142_140_	artist_61_61_61	2010	STUDIO	11	2
title_113_111_	artist_37_37_37	1974	COMPILATION	6	4
title_199_197_	artist_74_74_	1972	STUDIO	9	3
title_200_198_	artist_10_10_10_1	1998	STUDIO	6	2
title_202_200_	artist_73_73_73_7	2004	COMPILATION	9	4
title_204_202_	artist_29_29_29	1982	STUDIO	7	3
title_206_204_	artist_20_20_20	1974	COMPILATION	11	3
title_111_109_	artist_36_36_	2014	COMPILATION	10	4
title_215_213_	artist_17_17_	1990	COMPILATION	9	3
title_110_108_	artist_69_69_	1998	COMPILATION	11	4
title_139_137_	artist_77_77_	1998	STUDIO	11	4
title_143_141_	artist_12_12_12	1988	STUDIO	13	1
title_115_113_	artist_78_78_78	1996	COMPILATION	13	3
title_205_203_	artist_37_37_37	1984	COMPILATION	13	1
title_208_206_	artist_36_36_	1974	STUDIO	13	4
title_210_208_	artist_59_59_59	1966	STUDIO	13	4
title_216_214_	artist_57_57_57_5	1970	COMPILATION	13	3
title_220_218_	artist_36_36_	1994	COMPILATION	12	1
title_221_219_	artist_12_12_12	2016	COMPILATION	13	3
title_226_224_	artist_73_73_73_7	1958	COMPILATION	12	2
title_225_223_	artist_88_88_	1968	STUDIO	12	1
title_227_225_	artist_79_79_79_7	1998	COMPILATION	11	4
title_230_228_	artist_75_75_75	1988	COMPILATION	13	1
title_233_231_	artist_22_22_	2014	STUDIO	11	4
title_238_236_	artist_15_15_15	1974	COMPILATION	11	2
title_246_244_	artist_53_53_53	1962	COMPILATION	12	2
title_495_493_	artist_35_35_35_3	1988	STUDIO	11	1
title_501_499_	artist_50_50_50	1978	STUDIO	12	3
title_217_215_	artist_20_20_20	1992	COMPILATION	7	3
title_223_221_	artist_4_4_4_	1986	COMPILATION	5	4
title_229_227_	artist_89_89_89	1984	STUDIO	9	3
title_234_232_	artist_40_40_40_4	1962	COMPILATION	7	2
title_237_235_	artist_2_2_2_	1984	COMPILATION	11	4
title_240_238_	artist_32_32_32_3	1968	COMPILATION	11	3
title_242_240_	artist_91_91_91	1958	STUDIO	9	2
title_243_241_	artist_34_34_34	1960	COMPILATION	10	4
title_245_243_	artist_56_56_56	2008	STUDIO	10	4
title_247_245_	artist_90_90_	1994	STUDIO	5	4
title_248_246_	artist_47_47_	1984	COMPILATION	6	4
title_251_249_	artist_16_16_16_1	1968	COMPILATION	10	4
title_254_252_	artist_34_34_34	1958	STUDIO	6	4
title_485_483_	artist_91_91_91	1974	COMPILATION	8	2
title_486_484_	artist_47_47_	1986	COMPILATION	6	3
title_498_496_	artist_82_82_	1990	STUDIO	9	4
title_478_476_	artist_1_1_1_	1992	COMPILATION	7	1
title_505_503_	artist_14_14_	2004	LIVE	9	2
title_507_505_	artist_36_36_	2012	LIVE	9	4
title_510_508_	artist_97_97_97	1976	LIVE	7	3
title_29_27_	artist_92_92_92_9	1988	LIVE	6	1
title_31_29_	artist_52_52_	1994	LIVE	11	1
title_32_30_	artist_21_21_21_2	1992	LIVE	9	4
title_445_443_	artist_88_88_	1972	LIVE	7	2
title_450_448_	artist_91_91_91	1996	LIVE	10	4
title_451_449_	artist_30_30_	2016	LIVE	10	2
title_454_452_	artist_68_68_68_6	2006	LIVE	9	4
title_458_456_	artist_41_41_	1964	LIVE	10	4
title_460_458_	artist_76_76_76_7	1994	LIVE	7	1
title_461_459_	artist_6_6_6_	1974	LIVE	9	2
title_466_464_	artist_4_4_4_	1980	LIVE	10	2
title_470_468_	artist_16_16_16_1	1988	LIVE	11	4
title_473_471_	artist_93_93_	2000	LIVE	9	3
title_476_474_	artist_13_13_13_1	2014	LIVE	7	3
title_121_119_	artist_87_87_87_8	2002	COMPILATION	5	4
title_151_149_	artist_76_76_76_7	1960	STUDIO	5	3
title_153_151_	artist_77_77_	1960	STUDIO	6	3
title_155_153_	artist_33_33_	1982	STUDIO	8	4
title_156_154_	artist_27_27_27_2	1958	STUDIO	7	2
title_130_128_	artist_51_51_51_5	1986	COMPILATION	6	1
title_158_156_	artist_29_29_29	1998	STUDIO	11	1
title_159_157_	artist_71_71_	1972	STUDIO	9	1
title_132_130_	artist_9_9_9_	1986	COMPILATION	5	4
title_135_133_	artist_30_30_	1964	COMPILATION	5	2
title_187_185_	artist_82_82_	1970	COMPILATION	7	2
title_193_191_	artist_72_72_72	1982	COMPILATION	10	4
title_196_194_	artist_66_66_	1964	COMPILATION	6	4
title_197_195_	artist_5_5_5_	1972	COMPILATION	11	4
title_379_377_	artist_5_5_5_	2004	COMPILATION	5	1
title_380_378_	artist_74_74_	1984	COMPILATION	11	4
title_387_385_	artist_57_57_57_5	1968	COMPILATION	8	4
title_453_451_	artist_45_45_45	1972	LIVE	13	1
title_467_465_	artist_15_15_15	1972	LIVE	11	4
title_475_473_	artist_27_27_27_2	1998	LIVE	11	1
title_118_116_	artist_51_51_51_5	2002	COMPILATION	12	1
title_152_150_	artist_76_76_76_7	1986	STUDIO	11	1
title_154_152_	artist_76_76_76_7	1972	STUDIO	13	4
title_185_183_	artist_31_31_31	2006	COMPILATION	13	3
title_194_192_	artist_35_35_35_3	1958	COMPILATION	11	3
title_388_386_	artist_81_81_81_8	1980	COMPILATION	11	2
title_395_393_	artist_60_60_	1990	COMPILATION	11	3
title_389_387_	artist_68_68_68_6	1978	COMPILATION	8	2
title_409_407_	artist_42_42_42	2012	COMPILATION	12	3
title_410_408_	artist_93_93_	1968	COMPILATION	11	4
title_420_418_	artist_79_79_79_7	1976	COMPILATION	12	3
title_421_419_	artist_84_84_84_8	2004	COMPILATION	11	3
title_167_165_	artist_52_52_	1958	STUDIO	11	1
title_201_199_	artist_68_68_68_6	1968	LIVE	12	3
title_207_205_	artist_1_1_1_	2000	LIVE	13	3
title_145_143_	artist_77_77_	2014	COMPILATION	12	1
title_175_173_	artist_78_78_78	2004	STUDIO	13	3
title_149_147_	artist_50_50_50	1996	COMPILATION	13	4
title_179_177_	artist_58_58_	1968	STUDIO	13	4
title_172_170_	artist_16_16_16_1	1986	COMPILATION	12	2
title_255_253_	artist_50_50_50	2006	COMPILATION	11	4
title_262_260_	artist_29_29_29	1976	COMPILATION	12	3
title_263_261_	artist_15_15_15	2000	COMPILATION	11	3
title_271_269_	artist_61_61_61	1980	STUDIO	11	1
title_265_263_	artist_79_79_79_7	2014	COMPILATION	11	4
title_274_272_	artist_2_2_2_	2002	STUDIO	12	3
title_267_265_	artist_23_23_23	1964	COMPILATION	11	1
title_278_276_	artist_98_98_98_9	2006	STUDIO	11	4
title_275_273_	artist_81_81_81_8	1966	COMPILATION	11	4
title_281_279_	artist_7_7_7_	1978	STUDIO	12	4
title_282_280_	artist_4_4_4_	1980	STUDIO	11	4
title_284_282_	artist_7_7_7_	1974	STUDIO	12	4
title_286_284_	artist_94_94_94	1976	STUDIO	11	4
title_290_288_	artist_27_27_27_2	1992	STUDIO	12	4
title_372_370_	artist_43_43_43_4	1990	LIVE	13	4
title_373_371_	artist_86_86_86	1968	LIVE	12	4
title_393_391_	artist_55_55_	2016	COMPILATION	8	4
title_394_392_	artist_92_92_92_9	2004	COMPILATION	8	2
title_396_394_	artist_27_27_27_2	1964	COMPILATION	8	3
title_404_402_	artist_75_75_75	2000	COMPILATION	9	4
title_405_403_	artist_60_60_	2010	COMPILATION	10	4
title_407_405_	artist_31_31_31	1958	COMPILATION	7	1
title_412_410_	artist_9_9_9_	1998	COMPILATION	9	4
title_416_414_	artist_73_73_73_7	2000	COMPILATION	10	4
title_137_135_	artist_99_99_	1964	COMPILATION	11	1
title_138_136_	artist_6_6_6_	2002	COMPILATION	6	2
title_198_196_	artist_32_32_32_3	1982	LIVE	6	4
title_209_207_	artist_75_75_75	1964	LIVE	11	3
title_211_209_	artist_20_20_20	1986	LIVE	11	3
title_147_145_	artist_20_20_20	2014	COMPILATION	7	1
title_1012_1010_	artist_75_75_75	1998	STUDIO	7	4
title_1012_1010_	artist_15_15_15	1980	STUDIO	5	2
title_173_171_	artist_33_33_	1982	STUDIO	10	4
title_177_175_	artist_25_25_	1966	STUDIO	7	2
title_160_158_	artist_89_89_89	1994	COMPILATION	8	4
title_183_181_	artist_90_90_	1972	STUDIO	11	1
title_163_161_	artist_80_80_80	1970	COMPILATION	8	4
title_165_163_	artist_79_79_79_7	2008	COMPILATION	6	1
title_170_168_	artist_40_40_40_4	1978	COMPILATION	11	2
title_171_169_	artist_53_53_53	2000	COMPILATION	8	4
title_174_172_	artist_85_85_	1978	COMPILATION	5	4
title_178_176_	artist_91_91_91	1988	COMPILATION	8	4
title_181_179_	artist_40_40_40_4	2014	COMPILATION	9	1
title_182_180_	artist_9_9_9_	1998	COMPILATION	5	3
title_261_259_	artist_42_42_42	1992	STUDIO	6	2
title_257_255_	artist_71_71_	2010	COMPILATION	7	4
title_13_11_	artist_33_33_	1966	STUDIO	8	4
title_272_270_	artist_93_93_	2006	STUDIO	10	4
title_1012_1010_	artist_51_51_51_5	2010	COMPILATION	8	3
title_270_268_	artist_20_20_20	1970	COMPILATION	5	1
title_285_283_	artist_8_8_8_	2004	COMPILATION	7	2
title_288_286_	artist_25_25_	1988	COMPILATION	5	4
title_371_369_	artist_20_20_20	2002	LIVE	10	4
title_375_373_	artist_34_34_34	1966	LIVE	7	4
\.


COPY tracks (album_title, album_artist, track_number, track_title, track_length) FROM stdin;
title_13_11_	artist_8_8_8_	5	track_title_7115_7115_	215
title_461_459_	artist_6_6_6_	1	track_title_6082_6082_	512
title_159_157_	artist_71_71_	6	track_title_6927_6927_	219
title_413_411_	artist_62_62_62_6	7	track_title_3829_3829_3829	615
title_377_375_	artist_37_37_37	1	track_title_3343_3343_	538
title_420_418_	artist_79_79_79_7	2	track_title_3187_3187_3187_318	445
title_246_244_	artist_53_53_53	3	track_title_50_50_50_50_5	165
title_39_37_	artist_49_49_49_4	5	track_title_2332_2332_2332_	276
title_246_244_	artist_53_53_53	6	track_title_4981_4981_4981_49	220
title_433_431_	artist_2_2_2_	11	track_title_6875_6875_6875	192
title_359_357_	artist_62_62_62_6	4	track_title_7009_7009_7009	501
title_65_63_	artist_90_90_	5	track_title_3077_3077_307	156
title_287_285_	artist_23_23_23	6	track_title_2231_2231_223	413
title_392_390_	artist_62_62_62_6	8	track_title_3355_3355_335	177
title_462_460_	artist_80_80_80	13	track_title_2063_2063_2063_206	274
title_110_108_	artist_69_69_	5	track_title_6316_6316_631	397
title_447_445_	artist_69_69_	5	track_title_6535_6535_6535	608
title_345_343_	artist_59_59_59	6	track_title_837_837_837_837	414
title_97_95_	artist_11_11_	9	track_title_5090_5090_50	141
title_183_181_	artist_90_90_	10	track_title_6315_6315_631	627
title_386_384_	artist_86_86_86	12	track_title_4395_4395_4395_43	332
title_291_289_	artist_60_60_	2	track_title_5223_5223_522	328
title_311_309_	artist_17_17_	4	track_title_5056_5056_5056_505	622
title_284_282_	artist_7_7_7_	9	track_title_1328_1328_1	421
title_484_482_	artist_31_31_31	10	track_title_23_23_23_23_2	572
title_270_268_	artist_20_20_20	3	track_title_4919_4919_4919	313
title_237_235_	artist_2_2_2_	4	track_title_2134_2134_2	188
title_437_435_	artist_39_39_	6	track_title_1635_1635_1	339
title_436_434_	artist_16_16_16_1	1	track_title_5374_5374_53	307
title_183_181_	artist_90_90_	2	track_title_623_623_62	558
title_70_68_	artist_96_96_	9	track_title_7035_7035_7035	543
title_471_469_	artist_41_41_	2	track_title_7179_7179_	130
title_27_25_	artist_98_98_98_9	3	track_title_7420_7420_	301
title_219_217_	artist_12_12_12	8	track_title_2312_2312_2312_231	359
title_397_395_	artist_17_17_	11	track_title_6977_6977_6977_6	496
title_135_133_	artist_30_30_	3	track_title_6_6_6_6_6_	472
title_288_286_	artist_25_25_	5	track_title_7215_7215_72	289
title_375_373_	artist_34_34_34	6	track_title_3469_3469_3469_346	444
title_283_281_	artist_83_83_83	10	track_title_2032_2032_2032_203	236
title_491_489_	artist_27_27_27_2	3	track_title_7095_7095_7095	218
title_513_511_	artist_42_42_42	9	track_title_5561_5561_556	581
title_328_326_	artist_63_63_	1	track_title_1622_1622_1622_16	564
title_338_336_	artist_84_84_84_8	2	track_title_532_532_532_	225
title_513_511_	artist_42_42_42	5	track_title_579_579_579_579_5	287
title_356_354_	artist_83_83_83	8	track_title_4738_4738_4738_4	412
title_321_319_	artist_10_10_10_1	12	track_title_5019_5019_5019_	567
title_207_205_	artist_1_1_1_	1	track_title_6022_6022_	314
title_425_423_	artist_34_34_34	3	track_title_7163_7163_7163_7	509
title_79_77_	artist_38_38_38_3	9	track_title_3328_3328_332	609
title_310_308_	artist_69_69_	1	track_title_222_222_22	182
title_404_402_	artist_75_75_75	5	track_title_67_67_67_67_6	457
title_88_86_	artist_49_49_49_4	9	track_title_2719_2719_2719_27	584
title_340_338_	artist_54_54_54_5	5	track_title_3708_3708_3708_	297
title_26_24_	artist_60_60_	3	track_title_461_461_461_461_46	453
title_332_330_	artist_18_18_18	4	track_title_7468_7468_746	298
title_318_316_	artist_69_69_	5	track_title_3018_3018_301	504
title_498_496_	artist_82_82_	7	track_title_7139_7139_7139_7	454
title_51_49_	artist_19_19_19_1	4	track_title_3704_3704_3704_	161
title_135_133_	artist_30_30_	1	track_title_3394_3394_3394_3	398
title_396_394_	artist_27_27_27_2	4	track_title_3233_3233_3233	557
title_279_277_	artist_61_61_61	5	track_title_6071_6071_6071_6	357
title_258_256_	artist_76_76_76_7	5	track_title_2036_2036_2036_203	538
title_181_179_	artist_40_40_40_4	4	track_title_6283_6283_6283	230
title_231_229_	artist_83_83_83	5	track_title_567_567_567_	383
title_205_203_	artist_37_37_37	7	track_title_5303_5303_5303_530	295
title_148_146_	artist_67_67_67	8	track_title_306_306_306_306	168
title_465_463_	artist_59_59_59	2	track_title_3324_3324_332	510
title_281_279_	artist_7_7_7_	4	track_title_3606_3606_360	154
title_194_192_	artist_35_35_35_3	10	track_title_1743_1743_1743_1	168
title_314_312_	artist_32_32_32_3	12	track_title_7376_7376_7376	223
title_481_479_	artist_5_5_5_	1	track_title_3151_3151_3151_315	167
title_221_219_	artist_12_12_12	2	track_title_446_446_446_446_4	375
title_153_151_	artist_77_77_	3	track_title_131_131_131_	474
title_343_341_	artist_66_66_	4	track_title_4615_4615_4615_46	183
title_80_78_	artist_19_19_19_1	5	track_title_2498_2498_2498_24	367
title_86_84_	artist_60_60_	6	track_title_1267_1267_12	564
title_199_197_	artist_74_74_	8	track_title_1609_1609_1	515
title_193_191_	artist_72_72_72	2	track_title_6284_6284_6284	511
title_235_233_	artist_36_36_	4	track_title_5251_5251_525	418
title_314_312_	artist_32_32_32_3	6	track_title_3827_3827_3827	191
title_205_203_	artist_37_37_37	13	track_title_3655_3655_	244
title_219_217_	artist_12_12_12	2	track_title_5203_5203_5203_5	600
title_166_164_	artist_19_19_19_1	3	track_title_1631_1631_1	374
title_468_466_	artist_13_13_13_1	4	track_title_739_739_739_739	618
title_416_414_	artist_73_73_73_7	5	track_title_6983_6983_	186
title_183_181_	artist_90_90_	6	track_title_1842_1842_1842_184	223
title_335_333_	artist_56_56_56	7	track_title_2854_2854_285	474
title_297_295_	artist_34_34_34	8	track_title_6409_6409_64	434
title_42_40_	artist_51_51_51_5	9	track_title_4399_4399_4399_43	514
title_279_277_	artist_61_61_61	10	track_title_3735_3735_3735_	245
title_496_494_	artist_59_59_59	3	track_title_3582_3582_3582_35	514
title_261_259_	artist_42_42_42	5	track_title_1007_1007_1007_10	479
title_118_116_	artist_51_51_51_5	9	track_title_7266_7266_7266_726	219
title_101_99_	artist_58_58_	10	track_title_272_272_272	431
title_386_384_	artist_86_86_86	1	track_title_4848_4848_48	590
title_455_453_	artist_52_52_	9	track_title_3472_3472_34	292
title_236_234_	artist_52_52_	11	track_title_5513_5513_5513_5	436
title_453_451_	artist_45_45_45	12	track_title_6245_6245_6	532
title_1012_1010_	artist_51_51_51_5	5	track_title_4623_4623_4	275
title_367_365_	artist_86_86_86	2	track_title_5078_5078_5078_	627
title_484_482_	artist_31_31_31	11	track_title_3790_3790_3790_	151
title_397_395_	artist_17_17_	7	track_title_389_389_389_3	202
title_220_218_	artist_36_36_	1	track_title_5607_5607_5607_	311
title_491_489_	artist_27_27_27_2	1	track_title_2641_2641_2641_	208
title_295_293_	artist_13_13_13_1	4	track_title_2450_2450_2450	558
title_57_55_	artist_23_23_23	6	track_title_3901_3901_	214
title_164_162_	artist_92_92_92_9	9	track_title_3483_3483_3483_	326
title_207_205_	artist_1_1_1_	10	track_title_2645_2645_2645_	444
title_340_338_	artist_54_54_54_5	2	track_title_6269_6269_6269_62	553
title_246_244_	artist_53_53_53	7	track_title_6518_6518_6518_65	474
title_208_206_	artist_36_36_	9	track_title_3429_3429_3429_	283
title_100_98_	artist_66_66_	2	track_title_6326_6326_6326_6	524
title_151_149_	artist_76_76_76_7	5	track_title_3702_3702_3702_	413
title_53_51_	artist_70_70_70_7	6	track_title_7116_7116_	289
title_265_263_	artist_79_79_79_7	7	track_title_4451_4451_4451_4	175
title_363_361_	artist_56_56_56	4	track_title_3823_3823_3823	476
title_444_442_	artist_94_94_94	7	track_title_5586_5586_	130
title_56_54_	artist_29_29_29	8	track_title_4518_4518_4518_	137
title_232_230_	artist_77_77_	1	track_title_2248_2248_2248_2	522
title_481_479_	artist_5_5_5_	4	track_title_3140_3140_3140_	622
title_389_387_	artist_68_68_68_6	7	track_title_563_563_563_563	613
title_184_182_	artist_100_100_1	3	track_title_6279_6279_6	545
title_367_365_	artist_86_86_86	6	track_title_490_490_490_490_49	546
title_376_374_	artist_30_30_	8	track_title_306_306_306_306	613
title_158_156_	artist_29_29_29	2	track_title_440_440_440_440_4	188
title_337_335_	artist_98_98_98_9	4	track_title_4005_4005_4	328
title_368_366_	artist_3_3_3_	7	track_title_7389_7389_7389_73	240
title_339_337_	artist_63_63_	9	track_title_862_862_862_862_86	411
title_44_42_	artist_56_56_56	11	track_title_7238_7238_7238_723	526
title_101_99_	artist_58_58_	13	track_title_87_87_87_87_87_8	297
title_114_112_	artist_35_35_35_3	2	track_title_3082_3082_3082_3	150
title_112_110_	artist_49_49_49_4	3	track_title_6122_6122_61	625
title_222_220_	artist_78_78_78	4	track_title_2585_2585_2585_2	523
title_275_273_	artist_81_81_81_8	5	track_title_5058_5058_5058_505	374
title_477_475_	artist_13_13_13_1	7	track_title_6307_6307_	274
title_201_199_	artist_68_68_68_6	12	track_title_1878_1878_1878_187	439
title_398_396_	artist_22_22_	13	track_title_1705_1705_170	257
title_296_294_	artist_11_11_	3	track_title_4603_4603_4603	131
title_185_183_	artist_31_31_31	13	track_title_5102_5102_5102	557
title_438_436_	artist_79_79_79_7	1	track_title_2303_2303_2303_	618
title_494_492_	artist_19_19_19_1	2	track_title_2348_2348_2348_234	406
title_111_109_	artist_36_36_	3	track_title_6848_6848_6848	594
title_175_173_	artist_78_78_78	4	track_title_4814_4814_48	359
title_448_446_	artist_34_34_34	5	track_title_6202_6202_6202_62	624
title_512_510_	artist_42_42_42	1	track_title_334_334_334_334_33	140
title_336_334_	artist_54_54_54_5	3	track_title_1598_1598_1598_159	288
title_145_143_	artist_77_77_	4	track_title_3490_3490_3490_349	150
title_223_221_	artist_4_4_4_	5	track_title_6428_6428_6428_642	367
title_190_188_	artist_95_95_95_9	6	track_title_1921_1921_1921	609
title_510_508_	artist_97_97_97	6	track_title_1288_1288_1288_128	211
title_109_107_	artist_47_47_	9	track_title_3191_3191_31	614
title_14_12_	artist_53_53_53	5	track_title_7014_7014_7014_70	218
title_220_218_	artist_36_36_	8	track_title_3437_3437_3437_343	311
title_46_44_	artist_53_53_53	10	track_title_5241_5241_	525
title_215_213_	artist_17_17_	1	track_title_721_721_72	413
title_184_182_	artist_100_100_1	6	track_title_4664_4664_4664	486
title_253_251_	artist_84_84_84_8	8	track_title_5226_5226_522	569
title_469_467_	artist_4_4_4_	9	track_title_1958_1958_1958	183
title_16_14_	artist_16_16_16_1	3	track_title_5706_5706_5706_57	371
title_84_82_	artist_84_84_84_8	4	track_title_4638_4638_4638	602
title_18_16_	artist_13_13_13_1	5	track_title_2334_2334_2334_	491
title_17_15_	artist_54_54_54_5	6	track_title_2120_2120_2120_21	625
title_263_261_	artist_15_15_15	10	track_title_478_478_478_478_4	266
title_365_363_	artist_51_51_51_5	2	track_title_1742_1742_1742_1	435
title_322_320_	artist_98_98_98_9	5	track_title_5551_5551_	188
title_405_403_	artist_60_60_	8	track_title_1139_1139_	298
title_54_52_	artist_69_69_	9	track_title_7172_7172_	229
title_220_218_	artist_36_36_	2	track_title_3327_3327_332	223
title_468_466_	artist_13_13_13_1	5	track_title_3773_3773_3773_377	370
title_311_309_	artist_17_17_	6	track_title_2172_2172_2172	568
title_289_287_	artist_72_72_72	8	track_title_4730_4730_4730_4	233
title_18_16_	artist_13_13_13_1	3	track_title_3941_3941_394	345
title_435_433_	artist_97_97_97	4	track_title_301_301_301_	541
title_116_114_	artist_92_92_92_9	5	track_title_6687_6687_668	438
title_97_95_	artist_11_11_	6	track_title_5432_5432_5	476
title_343_341_	artist_66_66_	7	track_title_2366_2366_2366_	616
title_357_355_	artist_2_2_2_	5	track_title_1981_1981_1981	413
title_439_437_	artist_87_87_87_8	1	track_title_5687_5687_56	349
title_278_276_	artist_98_98_98_9	11	track_title_2836_2836_2836_2	487
title_150_148_	artist_51_51_51_5	1	track_title_4021_4021_4021_40	421
title_382_380_	artist_79_79_79_7	1	track_title_764_764_764_764_76	552
title_457_455_	artist_63_63_	2	track_title_685_685_685_685_	215
title_128_126_	artist_40_40_40_4	7	track_title_5804_5804_	215
title_195_193_	artist_26_26_26	10	track_title_402_402_402_	168
title_77_75_	artist_87_87_87_8	1	track_title_7407_7407_740	283
title_492_490_	artist_32_32_32_3	2	track_title_562_562_562_562_56	522
title_75_73_	artist_1_1_1_	4	track_title_3470_3470_34	595
title_352_350_	artist_70_70_70_7	5	track_title_4638_4638_4638	350
title_426_424_	artist_37_37_37	2	track_title_2307_2307_2307_	612
title_173_171_	artist_33_33_	5	track_title_5328_5328_5328_	290
title_410_408_	artist_93_93_	8	track_title_5317_5317_53	563
title_146_144_	artist_85_85_	10	track_title_171_171_171	447
title_61_59_	artist_62_62_62_6	11	track_title_6131_6131_6131_	159
title_293_291_	artist_88_88_	5	track_title_5645_5645_5645_564	540
title_46_44_	artist_53_53_53	3	track_title_3142_3142_3142_	457
title_214_212_	artist_12_12_12	1	track_title_4647_4647_4647_46	195
title_476_474_	artist_13_13_13_1	6	track_title_6450_6450_6450_645	385
title_493_491_	artist_49_49_49_4	11	track_title_7297_7297_7297_729	309
title_92_90_	artist_79_79_79_7	4	track_title_6508_6508_6508	352
title_55_53_	artist_99_99_	7	track_title_5979_5979_5979_	189
title_192_190_	artist_54_54_54_5	10	track_title_4148_4148_4148_4	269
title_317_315_	artist_46_46_46_4	12	track_title_4317_4317_4	374
title_124_122_	artist_97_97_97	1	track_title_567_567_567_	308
title_443_441_	artist_17_17_	3	track_title_4161_4161_416	366
title_417_415_	artist_66_66_	4	track_title_6918_6918_6918_6	456
title_146_144_	artist_85_85_	6	track_title_7381_7381_7381_73	382
title_418_416_	artist_54_54_54_5	10	track_title_3522_3522_3522_35	400
title_408_406_	artist_75_75_75	1	track_title_7325_7325_7325_73	365
title_379_377_	artist_5_5_5_	3	track_title_1499_1499_1499_1	354
title_398_396_	artist_22_22_	5	track_title_6281_6281_6281	346
title_242_240_	artist_91_91_91	4	track_title_1184_1184_1184_1	288
title_43_41_	artist_34_34_34	5	track_title_1966_1966_1966_19	256
title_210_208_	artist_59_59_59	11	track_title_2298_2298_229	565
title_172_170_	artist_16_16_16_1	2	track_title_6560_6560_6560	336
title_500_498_	artist_72_72_72	3	track_title_2695_2695_26	458
title_210_208_	artist_59_59_59	4	track_title_4908_4908_4	425
title_158_156_	artist_29_29_29	7	track_title_2388_2388_23	556
title_448_446_	artist_34_34_34	11	track_title_2637_2637_26	179
title_98_96_	artist_80_80_80	2	track_title_3770_3770_3770_377	477
title_74_72_	artist_21_21_21_2	3	track_title_4569_4569_45	275
title_287_285_	artist_23_23_23	5	track_title_2475_2475_2	247
title_479_477_	artist_29_29_29	6	track_title_4523_4523_4523_452	544
title_26_24_	artist_60_60_	7	track_title_1228_1228_1228_122	355
title_304_302_	artist_60_60_	8	track_title_1446_1446_	597
title_220_218_	artist_36_36_	9	track_title_1192_1192_	227
title_173_171_	artist_33_33_	10	track_title_420_420_420_4	575
title_349_347_	artist_27_27_27_2	1	track_title_6445_6445_6445_	538
title_335_333_	artist_56_56_56	2	track_title_6937_6937_693	499
title_262_260_	artist_29_29_29	3	track_title_5940_5940_5940_	313
title_376_374_	artist_30_30_	4	track_title_6082_6082_	153
title_283_281_	artist_83_83_83	5	track_title_4229_4229_42	220
title_175_173_	artist_78_78_78	7	track_title_31_31_31_31_3	503
title_307_305_	artist_30_30_	8	track_title_379_379_379	399
title_362_360_	artist_61_61_61	1	track_title_5847_5847_584	305
title_405_403_	artist_60_60_	4	track_title_4722_4722_472	342
title_341_339_	artist_45_45_45	9	track_title_2722_2722_2	197
title_468_466_	artist_13_13_13_1	3	track_title_5582_5582_	384
title_278_276_	artist_98_98_98_9	6	track_title_852_852_852_852_	520
title_183_181_	artist_90_90_	4	track_title_6210_6210_6	244
title_423_421_	artist_79_79_79_7	5	track_title_825_825_82	483
title_83_81_	artist_53_53_53	7	track_title_6201_6201_6201_62	224
title_337_335_	artist_98_98_98_9	8	track_title_7029_7029_7	128
title_32_30_	artist_21_21_21_2	1	track_title_825_825_82	416
title_313_311_	artist_58_58_	8	track_title_208_208_208_208	536
title_122_120_	artist_37_37_37	9	track_title_325_325_325_3	286
title_483_481_	artist_61_61_61	3	track_title_48_48_48_48_4	472
title_169_167_	artist_96_96_	3	track_title_234_234_234_234	362
title_354_352_	artist_43_43_43_4	9	track_title_3820_3820_3820	610
title_92_90_	artist_79_79_79_7	2	track_title_211_211_211	525
title_174_172_	artist_85_85_	4	track_title_4516_4516_4516_	499
title_500_498_	artist_72_72_72	8	track_title_2462_2462_2462_24	616
title_119_117_	artist_3_3_3_	2	track_title_458_458_458_4	301
title_46_44_	artist_53_53_53	2	track_title_4462_4462_	223
title_163_161_	artist_80_80_80	8	track_title_3612_3612_3612_3	228
title_286_284_	artist_94_94_94	1	track_title_6435_6435_64	414
title_49_47_	artist_24_24_24_2	2	track_title_2336_2336_2336_	378
title_191_189_	artist_3_3_3_	4	track_title_852_852_852_852_	619
title_446_444_	artist_47_47_	5	track_title_1010_1010_1	473
title_492_490_	artist_32_32_32_3	7	track_title_2386_2386_23	282
title_287_285_	artist_23_23_23	4	track_title_4309_4309_4309_43	220
title_21_19_	artist_12_12_12	5	track_title_5312_5312_53	608
title_225_223_	artist_88_88_	8	track_title_7067_7067_7067	431
title_15_13_	artist_55_55_	5	track_title_4635_4635_4635	500
title_82_80_	artist_98_98_98_9	7	track_title_2750_2750_2	367
title_89_87_	artist_40_40_40_4	10	track_title_6496_6496_64	348
title_13_11_	artist_9_9_9_	6	track_title_4235_4235_4235_	576
title_233_231_	artist_22_22_	2	track_title_5196_5196_5196	330
title_484_482_	artist_31_31_31	3	track_title_200_200_200_	226
title_384_382_	artist_23_23_23	4	track_title_742_742_742	505
title_233_231_	artist_22_22_	6	track_title_6026_6026_	472
title_282_280_	artist_4_4_4_	10	track_title_2015_2015_20	324
title_92_90_	artist_79_79_79_7	5	track_title_6675_6675_	279
title_404_402_	artist_75_75_75	7	track_title_1587_1587_1587_	625
title_361_359_	artist_23_23_23	10	track_title_3245_3245_3245_32	252
title_155_153_	artist_33_33_	4	track_title_2210_2210_2210_2	179
title_464_462_	artist_88_88_	8	track_title_889_889_88	417
title_412_410_	artist_9_9_9_	9	track_title_6299_6299_6299_62	518
title_378_376_	artist_7_7_7_	1	track_title_5823_5823_5823_5	496
title_361_359_	artist_23_23_23	2	track_title_7285_7285_7285_	180
title_133_131_	artist_98_98_98_9	3	track_title_1255_1255_1255_125	310
title_100_98_	artist_66_66_	5	track_title_2419_2419_2	606
title_212_210_	artist_42_42_42	6	track_title_6372_6372_637	600
title_499_497_	artist_79_79_79_7	8	track_title_3963_3963_	387
title_70_68_	artist_96_96_	10	track_title_2415_2415_2	587
title_380_378_	artist_74_74_	5	track_title_5013_5013_5013_	538
title_463_461_	artist_57_57_57_5	6	track_title_3587_3587_3587_35	198
title_46_44_	artist_53_53_53	7	track_title_5802_5802_	361
title_235_233_	artist_36_36_	6	track_title_4633_4633_4633	536
title_352_350_	artist_70_70_70_7	8	track_title_5330_5330_5330_533	312
title_66_64_	artist_55_55_	9	track_title_464_464_464_464_46	396
title_114_112_	artist_35_35_35_3	6	track_title_732_732_732_732_73	586
title_441_439_	artist_37_37_37	2	track_title_7349_7349_7349	339
title_464_462_	artist_88_88_	4	track_title_6937_6937_693	501
title_452_450_	artist_19_19_19_1	6	track_title_2911_2911_29	431
title_248_246_	artist_47_47_	4	track_title_1752_1752_	312
title_146_144_	artist_85_85_	9	track_title_5975_5975_5975_	575
title_287_285_	artist_23_23_23	1	track_title_1799_1799_179	241
title_399_397_	artist_15_15_15	1	track_title_7204_7204_7204_720	521
title_23_21_	artist_21_21_21_2	3	track_title_2056_2056_2056_	618
title_266_264_	artist_85_85_	4	track_title_5843_5843_584	340
title_40_38_	artist_62_62_62_6	6	track_title_2977_2977_29	175
title_24_22_	artist_75_75_75	8	track_title_1575_1575_15	576
title_84_82_	artist_84_84_84_8	5	track_title_1215_1215_1215_	209
title_419_417_	artist_76_76_76_7	7	track_title_5820_5820_5820_5	434
title_31_29_	artist_52_52_	2	track_title_1847_1847_1847_184	350
title_390_388_	artist_76_76_76_7	6	track_title_6066_6066_606	448
title_181_179_	artist_40_40_40_4	9	track_title_2477_2477_2	566
title_376_374_	artist_30_30_	2	track_title_7008_7008_7008	331
title_233_231_	artist_22_22_	4	track_title_4549_4549_4549_	425
title_317_315_	artist_46_46_46_4	8	track_title_1962_1962_1962_19	391
title_243_241_	artist_34_34_34	2	track_title_2226_2226_	403
title_80_78_	artist_19_19_19_1	11	track_title_1013_1013_1	448
title_139_137_	artist_77_77_	3	track_title_4570_4570_4570_	306
title_467_465_	artist_15_15_15	4	track_title_4235_4235_4235_	201
title_359_357_	artist_62_62_62_6	11	track_title_2219_2219_2219_2	545
title_226_224_	artist_73_73_73_7	12	track_title_2762_2762_2762	159
title_43_41_	artist_34_34_34	3	track_title_1565_1565_1565_156	498
title_330_328_	artist_34_34_34	5	track_title_1447_1447_	197
title_196_194_	artist_66_66_	6	track_title_1281_1281_1281_128	192
title_168_166_	artist_77_77_	2	track_title_6456_6456_6456_645	375
title_456_454_	artist_5_5_5_	3	track_title_3202_3202_3202	508
title_297_295_	artist_34_34_34	7	track_title_6594_6594_6594	278
title_227_225_	artist_79_79_79_7	8	track_title_4974_4974_4974	411
title_109_107_	artist_47_47_	7	track_title_5912_5912_5912_	386
title_418_416_	artist_54_54_54_5	9	track_title_401_401_401_401	415
title_294_292_	artist_88_88_	2	track_title_1608_1608_1	192
title_168_166_	artist_77_77_	6	track_title_7070_7070_7070_70	480
title_70_68_	artist_96_96_	7	track_title_3716_3716_3716_371	493
title_483_481_	artist_61_61_61	8	track_title_5544_5544_5544_5	316
title_486_484_	artist_47_47_	3	track_title_5003_5003_50	411
title_434_432_	artist_54_54_54_5	1	track_title_979_979_979	457
title_213_211_	artist_23_23_23	3	track_title_3929_3929_3929_3	465
title_507_505_	artist_36_36_	6	track_title_5168_5168_5168	626
title_310_308_	artist_69_69_	3	track_title_720_720_720_7	578
title_427_425_	artist_88_88_	4	track_title_939_939_939_	163
title_305_303_	artist_91_91_91	9	track_title_7245_7245_72	594
title_418_416_	artist_54_54_54_5	1	track_title_5532_5532_553	475
title_326_324_	artist_18_18_18	4	track_title_3047_3047_304	530
title_257_255_	artist_71_71_	2	track_title_4581_4581_4581_458	285
title_220_218_	artist_36_36_	3	track_title_1390_1390_1390	462
title_38_36_	artist_60_60_	5	track_title_1431_1431_1431_1	208
title_151_149_	artist_76_76_76_7	2	track_title_4504_4504_45	143
title_196_194_	artist_66_66_	5	track_title_4286_4286_42	539
title_140_138_	artist_80_80_80	3	track_title_124_124_12	428
title_19_17_	artist_18_18_18	4	track_title_228_228_22	613
title_444_442_	artist_94_94_94	10	track_title_2255_2255_	464
title_46_44_	artist_53_53_53	11	track_title_6915_6915_6915_6	432
title_413_411_	artist_62_62_62_6	1	track_title_975_975_975_97	192
title_95_93_	artist_87_87_87_8	3	track_title_482_482_48	545
title_52_50_	artist_66_66_	4	track_title_6240_6240_6	575
title_157_155_	artist_42_42_42	5	track_title_3682_3682_	245
title_178_176_	artist_91_91_91	6	track_title_3370_3370_	284
title_228_226_	artist_65_65_65_6	7	track_title_2470_2470_2	329
title_311_309_	artist_17_17_	8	track_title_4582_4582_4582_458	295
title_499_497_	artist_79_79_79_7	1	track_title_7497_7497_749	571
title_508_506_	artist_87_87_87_8	3	track_title_7324_7324_7324_73	400
title_425_423_	artist_34_34_34	4	track_title_4788_4788_478	578
title_1012_1010_	artist_15_15_15	3	track_title_3191_3191_31	311
title_172_170_	artist_16_16_16_1	11	track_title_293_293_293_	467
title_54_52_	artist_69_69_	1	track_title_5772_5772_5	382
title_478_476_	artist_1_1_1_	6	track_title_4616_4616_4616_46	426
title_188_186_	artist_94_94_94	1	track_title_797_797_797_797	193
title_300_298_	artist_92_92_92_9	6	track_title_6551_6551_6	144
title_159_157_	artist_71_71_	3	track_title_1719_1719_1719_1	274
title_409_407_	artist_42_42_42	9	track_title_3786_3786_37	256
title_449_447_	artist_1_1_1_	11	track_title_5090_5090_50	183
title_445_443_	artist_88_88_	4	track_title_2646_2646_2646_	267
title_410_408_	artist_93_93_	4	track_title_15_15_15_15_1	291
title_488_486_	artist_16_16_16_1	10	track_title_4460_4460_	568
title_196_194_	artist_66_66_	4	track_title_6162_6162_6162_	240
title_176_174_	artist_60_60_	9	track_title_3566_3566_3	548
title_223_221_	artist_4_4_4_	4	track_title_1010_1010_1	624
title_480_478_	artist_9_9_9_	6	track_title_616_616_616_616_6	166
title_451_449_	artist_30_30_	1	track_title_1290_1290_12	551
title_194_192_	artist_35_35_35_3	5	track_title_6727_6727_6727_	176
title_75_73_	artist_1_1_1_	2	track_title_1213_1213_1213_	408
title_246_244_	artist_53_53_53	11	track_title_618_618_618	279
title_136_134_	artist_61_61_61	3	track_title_6934_6934_693	342
title_285_283_	artist_8_8_8_	4	track_title_5463_5463_5	552
title_433_431_	artist_2_2_2_	7	track_title_1840_1840_1840_184	515
title_65_63_	artist_90_90_	8	track_title_5867_5867_	242
title_347_345_	artist_71_71_	10	track_title_2441_2441_2	594
title_89_87_	artist_40_40_40_4	11	track_title_813_813_813_81	575
title_418_416_	artist_54_54_54_5	3	track_title_5093_5093_50	295
title_321_319_	artist_10_10_10_1	10	track_title_2999_2999_2999_299	260
title_147_145_	artist_20_20_20	4	track_title_2800_2800_2800_2	308
title_149_147_	artist_50_50_50	6	track_title_6935_6935_693	609
title_87_85_	artist_91_91_91	4	track_title_2696_2696_26	561
title_180_178_	artist_66_66_	6	track_title_3105_3105_31	500
title_55_53_	artist_99_99_	2	track_title_7330_7330_7	231
title_104_102_	artist_43_43_43_4	4	track_title_6936_6936_693	591
title_411_409_	artist_21_21_21_2	9	track_title_7274_7274_72	456
title_96_94_	artist_93_93_	10	track_title_6852_6852_6852_68	255
title_339_337_	artist_63_63_	7	track_title_6907_6907_690	258
title_21_19_	artist_12_12_12	10	track_title_6114_6114_6114_611	194
title_156_154_	artist_27_27_27_2	1	track_title_2683_2683_2683_268	459
title_334_332_	artist_45_45_45	2	track_title_1864_1864_1864_	514
title_219_217_	artist_12_12_12	5	track_title_6522_6522_6	535
title_47_45_	artist_46_46_46_4	2	track_title_2659_2659_2659_265	143
title_92_90_	artist_79_79_79_7	10	track_title_6514_6514_6514_65	282
title_501_499_	artist_50_50_50	2	track_title_1387_1387_1	310
title_155_153_	artist_33_33_	3	track_title_2889_2889_288	479
title_74_72_	artist_21_21_21_2	1	track_title_6314_6314_631	227
title_451_449_	artist_30_30_	5	track_title_5775_5775_5	608
title_101_99_	artist_58_58_	7	track_title_63_63_63_6	227
title_245_243_	artist_56_56_56	8	track_title_5009_5009_50	508
title_339_337_	artist_63_63_	11	track_title_2935_2935_2935_293	437
title_119_117_	artist_3_3_3_	3	track_title_7434_7434_743	451
title_114_112_	artist_35_35_35_3	4	track_title_3944_3944_394	552
title_222_220_	artist_78_78_78	6	track_title_857_857_85	228
title_444_442_	artist_94_94_94	2	track_title_2365_2365_2365_	289
title_503_501_	artist_96_96_	3	track_title_5591_5591_559	578
title_493_491_	artist_49_49_49_4	10	track_title_7494_7494_749	212
title_498_496_	artist_82_82_	5	track_title_787_787_787_7	589
title_386_384_	artist_86_86_86	6	track_title_5824_5824_5824_5	337
title_296_294_	artist_11_11_	7	track_title_3658_3658_	482
title_339_337_	artist_63_63_	8	track_title_1660_1660_1	471
title_29_27_	artist_92_92_92_9	1	track_title_2396_2396_2396_	521
title_440_438_	artist_59_59_59	11	track_title_6759_6759_6759_	401
title_290_288_	artist_27_27_27_2	5	track_title_861_861_861_	567
title_145_143_	artist_77_77_	6	track_title_1056_1056_1056	202
title_140_138_	artist_80_80_80	8	track_title_4579_4579_4579_	501
title_306_304_	artist_35_35_35_3	9	track_title_7440_7440_7440_7	211
title_226_224_	artist_73_73_73_7	10	track_title_2574_2574_257	512
title_210_208_	artist_59_59_59	12	track_title_4029_4029_4029_40	136
title_327_325_	artist_49_49_49_4	8	track_title_6079_6079_6079_6	579
title_441_439_	artist_37_37_37	9	track_title_1883_1883_18	508
title_59_57_	artist_6_6_6_	1	track_title_2147_2147_2147	260
title_146_144_	artist_85_85_	3	track_title_5296_5296_5296_5	536
title_213_211_	artist_23_23_23	6	track_title_4879_4879_48	534
title_64_62_	artist_87_87_87_8	2	track_title_199_199_199_199_19	289
title_477_475_	artist_13_13_13_1	12	track_title_2006_2006_2006_200	559
title_424_422_	artist_17_17_	6	track_title_4017_4017_4017	350
title_321_319_	artist_10_10_10_1	8	track_title_1008_1008_1008_10	399
title_477_475_	artist_13_13_13_1	2	track_title_5795_5795_5795_57	231
title_357_355_	artist_2_2_2_	3	track_title_4280_4280_42	524
title_214_212_	artist_12_12_12	7	track_title_5991_5991_59	564
title_428_426_	artist_11_11_	2	track_title_2636_2636_26	617
title_226_224_	artist_73_73_73_7	2	track_title_6764_6764_6764_676	140
title_13_11_	artist_4_4_4_	12	track_title_2139_2139_2	510
title_369_367_	artist_99_99_	3	track_title_3756_3756_37	186
title_386_384_	artist_86_86_86	4	track_title_2414_2414_2	544
title_155_153_	artist_33_33_	5	track_title_265_265_265_265_26	215
title_99_97_	artist_3_3_3_	12	track_title_3398_3398_3398_3	569
title_213_211_	artist_23_23_23	1	track_title_4980_4980_4980_49	303
title_394_392_	artist_92_92_92_9	7	track_title_174_174_174	404
title_13_11_	artist_4_4_4_	2	track_title_5261_5261_5261_5	392
title_1012_1010_	artist_1_1_1_	1	track_title_997_997_997_	561
title_405_403_	artist_60_60_	10	track_title_775_775_775_775_7	510
title_163_161_	artist_80_80_80	2	track_title_3940_3940_394	438
title_390_388_	artist_76_76_76_7	3	track_title_1120_1120_1120_1	501
title_386_384_	artist_86_86_86	3	track_title_5442_5442_5442	386
title_106_104_	artist_43_43_43_4	5	track_title_4126_4126_	270
title_336_334_	artist_54_54_54_5	7	track_title_2198_2198_2	516
title_206_204_	artist_20_20_20	4	track_title_3352_3352_335	612
title_123_121_	artist_26_26_26	1	track_title_5232_5232_5232_5	529
title_124_122_	artist_97_97_97	7	track_title_7498_7498_749	403
title_327_325_	artist_49_49_49_4	2	track_title_5086_5086_5086_508	338
title_50_48_	artist_5_5_5_	9	track_title_5481_5481_5481_54	410
title_404_402_	artist_75_75_75	1	track_title_658_658_65	445
title_60_58_	artist_17_17_	6	track_title_7292_7292_7292_729	431
title_287_285_	artist_23_23_23	7	track_title_6036_6036_603	291
title_413_411_	artist_62_62_62_6	8	track_title_4441_4441_444	544
title_195_193_	artist_26_26_26	1	track_title_2495_2495_2495_24	278
title_75_73_	artist_1_1_1_	7	track_title_5479_5479_5479	568
title_371_369_	artist_20_20_20	4	track_title_4209_4209_4209_	213
title_143_141_	artist_12_12_12	7	track_title_7106_7106_7106_7	621
title_208_206_	artist_36_36_	7	track_title_5116_5116_5116_51	155
title_334_332_	artist_45_45_45	8	track_title_4066_4066_4	543
title_33_31_	artist_32_32_32_3	9	track_title_4575_4575_4575_	145
title_376_374_	artist_30_30_	1	track_title_7252_7252_7252_	386
title_227_225_	artist_79_79_79_7	2	track_title_7217_7217_72	351
title_188_186_	artist_94_94_94	10	track_title_7454_7454_	340
title_432_430_	artist_81_81_81_8	11	track_title_4800_4800_4800_480	614
title_208_206_	artist_36_36_	4	track_title_1691_1691_1	389
title_108_106_	artist_43_43_43_4	5	track_title_2626_2626_2626_262	161
title_117_115_	artist_6_6_6_	8	track_title_2825_2825_282	521
title_21_19_	artist_12_12_12	1	track_title_3327_3327_332	615
title_212_210_	artist_42_42_42	3	track_title_6708_6708_6708_670	452
title_207_205_	artist_1_1_1_	5	track_title_2180_2180_2180_21	319
title_202_200_	artist_73_73_73_7	7	track_title_2790_2790_2790	498
title_71_69_	artist_37_37_37	6	track_title_2846_2846_	458
title_377_375_	artist_37_37_37	3	track_title_5430_5430_5	194
title_259_257_	artist_70_70_70_7	8	track_title_6810_6810_6810	151
title_100_98_	artist_66_66_	6	track_title_4454_4454_4454_4	341
title_170_168_	artist_40_40_40_4	7	track_title_5471_5471_5471	589
title_227_225_	artist_79_79_79_7	11	track_title_4929_4929_4929_49	604
title_477_475_	artist_13_13_13_1	5	track_title_4916_4916_4916	384
title_108_106_	artist_43_43_43_4	7	track_title_5009_5009_50	362
title_253_251_	artist_84_84_84_8	2	track_title_192_192_192_	146
title_399_397_	artist_15_15_15	4	track_title_7420_7420_	167
title_332_330_	artist_18_18_18	6	track_title_5151_5151_5	261
title_229_227_	artist_89_89_89	8	track_title_7165_7165_7165_7	185
title_64_62_	artist_87_87_87_8	11	track_title_5755_5755_5755	482
title_210_208_	artist_59_59_59	13	track_title_1686_1686_1686_16	294
title_499_497_	artist_79_79_79_7	3	track_title_5709_5709_5709_57	582
title_415_413_	artist_74_74_	4	track_title_7244_7244_72	272
title_466_464_	artist_4_4_4_	6	track_title_6329_6329_6329_6	134
title_145_143_	artist_77_77_	9	track_title_3871_3871_3	341
title_137_135_	artist_99_99_	10	track_title_4694_4694_4694	160
title_166_164_	artist_19_19_19_1	1	track_title_5005_5005_50	264
title_300_298_	artist_92_92_92_9	10	track_title_919_919_919_919_9	331
title_418_416_	artist_54_54_54_5	11	track_title_806_806_806_	216
title_430_428_	artist_36_36_	1	track_title_2005_2005_2005_200	395
title_109_107_	artist_47_47_	3	track_title_3716_3716_3716_371	563
title_120_118_	artist_76_76_76_7	4	track_title_6770_6770_67	453
title_34_32_	artist_90_90_	5	track_title_7447_7447_7447_7	605
title_306_304_	artist_35_35_35_3	6	track_title_3912_3912_391	350
title_185_183_	artist_31_31_31	7	track_title_1013_1013_1	476
title_209_207_	artist_75_75_75	4	track_title_532_532_532_	392
title_90_88_	artist_41_41_	5	track_title_4364_4364_4364_43	481
title_411_409_	artist_21_21_21_2	1	track_title_3163_3163_31	557
title_467_465_	artist_15_15_15	3	track_title_1136_1136_	415
title_219_217_	artist_12_12_12	3	track_title_3430_3430_3430_343	153
title_13_11_	artist_18_18_18	6	track_title_5703_5703_5703_57	559
title_205_203_	artist_37_37_37	1	track_title_7053_7053_7	509
title_293_291_	artist_88_88_	1	track_title_1067_1067_1067_10	275
title_374_372_	artist_12_12_12	1	track_title_6659_6659_665	567
title_465_463_	artist_59_59_59	8	track_title_2582_2582_2582_2	374
title_216_214_	artist_57_57_57_5	11	track_title_4283_4283_42	363
title_25_23_	artist_5_5_5_	1	track_title_2969_2969_2969_296	392
title_300_298_	artist_92_92_92_9	5	track_title_878_878_878	595
title_330_328_	artist_34_34_34	1	track_title_4820_4820_4820_	514
title_176_174_	artist_60_60_	3	track_title_3062_3062_	548
title_235_233_	artist_36_36_	8	track_title_354_354_354_3	574
title_387_385_	artist_57_57_57_5	1	track_title_1729_1729_	214
title_513_511_	artist_42_42_42	8	track_title_7251_7251_7251_	220
title_272_270_	artist_93_93_	2	track_title_4034_4034_4	450
title_211_209_	artist_20_20_20	2	track_title_4382_4382_4382	190
title_479_477_	artist_29_29_29	5	track_title_960_960_960_960_96	203
title_418_416_	artist_54_54_54_5	5	track_title_2610_2610_2610_	606
title_504_502_	artist_48_48_48	1	track_title_6703_6703_6703_670	200
title_432_430_	artist_81_81_81_8	4	track_title_598_598_598_598	621
title_246_244_	artist_53_53_53	1	track_title_6626_6626_662	243
title_158_156_	artist_29_29_29	9	track_title_2672_2672_2672_	322
title_193_191_	artist_72_72_72	5	track_title_4850_4850_4850_	314
title_171_169_	artist_53_53_53	7	track_title_6074_6074_6074_6	546
title_318_316_	artist_69_69_	4	track_title_3728_3728_37	597
title_479_477_	artist_29_29_29	7	track_title_3565_3565_3	579
title_132_130_	artist_9_9_9_	4	track_title_3333_3333_3333_3	547
title_223_221_	artist_4_4_4_	2	track_title_7233_7233_7233_723	135
title_153_151_	artist_77_77_	5	track_title_2024_2024_2024_	504
title_189_187_	artist_32_32_32_3	7	track_title_5584_5584_	485
title_392_390_	artist_62_62_62_6	6	track_title_2713_2713_2713_27	624
title_157_155_	artist_42_42_42	9	track_title_7306_7306_7	354
title_352_350_	artist_70_70_70_7	9	track_title_116_116_116	575
title_270_268_	artist_20_20_20	5	track_title_1385_1385_1	584
title_437_435_	artist_39_39_	2	track_title_5970_5970_5970_	170
title_175_173_	artist_78_78_78	10	track_title_3252_3252_3	251
title_439_437_	artist_87_87_87_8	2	track_title_4592_4592_45	366
title_366_364_	artist_20_20_20	4	track_title_4096_4096_4	624
title_207_205_	artist_1_1_1_	4	track_title_6010_6010_6010_6	158
title_126_124_	artist_70_70_70_7	5	track_title_3752_3752_37	335
title_122_120_	artist_37_37_37	6	track_title_128_128_128_128_	312
title_169_167_	artist_96_96_	7	track_title_3359_3359_335	390
title_214_212_	artist_12_12_12	9	track_title_6161_6161_6161_	471
title_143_141_	artist_12_12_12	11	track_title_132_132_132_132_13	485
title_376_374_	artist_30_30_	12	track_title_5548_5548_5548_5	621
title_280_278_	artist_6_6_6_	1	track_title_5171_5171_5171_51	401
title_258_256_	artist_76_76_76_7	4	track_title_1499_1499_1499_1	485
title_218_216_	artist_49_49_49_4	6	track_title_5481_5481_5481_54	294
title_393_391_	artist_55_55_	7	track_title_852_852_852_852_	315
title_244_242_	artist_47_47_	9	track_title_5844_5844_584	220
title_266_264_	artist_85_85_	10	track_title_4328_4328_4328	510
title_274_272_	artist_2_2_2_	12	track_title_227_227_227_2	298
title_82_80_	artist_98_98_98_9	3	track_title_4578_4578_4578_	382
title_172_170_	artist_16_16_16_1	1	track_title_4043_4043_4043	146
title_128_126_	artist_40_40_40_4	4	track_title_3833_3833_3833_38	249
title_253_251_	artist_84_84_84_8	5	track_title_6591_6591_6591	473
title_71_69_	artist_37_37_37	2	track_title_1507_1507_1507_150	443
title_428_426_	artist_11_11_	6	track_title_3973_3973_397	452
title_280_278_	artist_6_6_6_	12	track_title_5423_5423_5423_54	156
title_103_101_	artist_47_47_	2	track_title_4744_4744_	390
title_237_235_	artist_2_2_2_	11	track_title_6778_6778_67	391
title_354_352_	artist_43_43_43_4	11	track_title_3543_3543_3543	267
title_82_80_	artist_98_98_98_9	4	track_title_6931_6931_693	480
title_403_401_	artist_60_60_	2	track_title_2581_2581_2581_2	399
title_215_213_	artist_17_17_	4	track_title_2824_2824_282	366
title_418_416_	artist_54_54_54_5	6	track_title_4675_4675_4675_46	171
title_367_365_	artist_86_86_86	7	track_title_1387_1387_1	299
title_69_67_	artist_34_34_34	3	track_title_6681_6681_668	382
title_125_123_	artist_5_5_5_	5	track_title_7367_7367_7	386
title_87_85_	artist_91_91_91	1	track_title_4515_4515_4515_	286
title_232_230_	artist_77_77_	4	track_title_4791_4791_4791_4	611
title_266_264_	artist_85_85_	7	track_title_979_979_979	213
title_238_236_	artist_15_15_15	5	track_title_4663_4663_4663	569
title_295_293_	artist_13_13_13_1	2	track_title_5391_5391_5391_539	291
title_205_203_	artist_37_37_37	3	track_title_6489_6489_6489_648	605
title_286_284_	artist_94_94_94	6	track_title_4733_4733_4733_4	392
title_197_195_	artist_5_5_5_	3	track_title_4986_4986_4986_49	598
title_289_287_	artist_72_72_72	6	track_title_6617_6617_	279
title_493_491_	artist_49_49_49_4	7	track_title_2500_2500_	340
title_412_410_	artist_9_9_9_	8	track_title_2372_2372_2372_237	601
title_195_193_	artist_26_26_26	4	track_title_2674_2674_2674_	619
title_247_245_	artist_90_90_	4	track_title_7003_7003_7003	352
title_497_495_	artist_46_46_46_4	2	track_title_3961_3961_	251
title_173_171_	artist_33_33_	1	track_title_4664_4664_4664	147
title_43_41_	artist_34_34_34	6	track_title_210_210_210_21	537
title_62_60_	artist_26_26_26	3	track_title_7043_7043_7043_70	600
title_76_74_	artist_24_24_24_2	11	track_title_963_963_963_963_96	193
title_255_253_	artist_50_50_50	6	track_title_411_411_411_411_4	391
title_32_30_	artist_21_21_21_2	2	track_title_6806_6806_6	497
title_304_302_	artist_60_60_	3	track_title_4436_4436_	443
title_265_263_	artist_79_79_79_7	10	track_title_4080_4080_4080_40	151
title_290_288_	artist_27_27_27_2	11	track_title_3687_3687_	627
title_405_403_	artist_60_60_	3	track_title_3198_3198_31	264
title_472_470_	artist_41_41_	9	track_title_3386_3386_338	420
title_388_386_	artist_81_81_81_8	1	track_title_5778_5778_5	146
title_332_330_	artist_18_18_18	7	track_title_3770_3770_3770_377	589
title_395_393_	artist_60_60_	10	track_title_1094_1094_1094_10	308
title_108_106_	artist_43_43_43_4	3	track_title_6839_6839_6	208
title_141_139_	artist_70_70_70_7	5	track_title_2954_2954_2954_	294
title_471_469_	artist_41_41_	7	track_title_4034_4034_4	326
title_469_467_	artist_4_4_4_	10	track_title_2556_2556_2556_2	510
title_52_50_	artist_66_66_	1	track_title_1901_1901_1901_19	526
title_134_132_	artist_46_46_46_4	6	track_title_6889_6889_6889_68	255
title_255_253_	artist_50_50_50	7	track_title_4562_4562_45	600
title_503_501_	artist_96_96_	8	track_title_5885_5885_5885_5	254
title_319_317_	artist_3_3_3_	13	track_title_3941_3941_394	550
title_467_465_	artist_15_15_15	7	track_title_1435_1435_1435_1	250
title_341_339_	artist_45_45_45	2	track_title_2877_2877_	378
title_397_395_	artist_17_17_	8	track_title_4117_4117_4117_4	440
title_152_150_	artist_76_76_76_7	9	track_title_2950_2950_2950_	161
title_234_232_	artist_40_40_40_4	7	track_title_902_902_902_902_90	515
title_320_318_	artist_82_82_	3	track_title_1895_1895_1895_	592
title_462_460_	artist_80_80_80	8	track_title_28_28_28_2	164
title_40_38_	artist_62_62_62_6	2	track_title_1902_1902_1902_19	208
title_336_334_	artist_54_54_54_5	6	track_title_904_904_904_	566
title_340_338_	artist_54_54_54_5	4	track_title_2651_2651_2651_265	340
title_208_206_	artist_36_36_	6	track_title_6048_6048_6048_6	593
title_441_439_	artist_37_37_37	3	track_title_3989_3989_3989_3	159
title_489_487_	artist_54_54_54_5	4	track_title_5819_5819_581	543
title_407_405_	artist_31_31_31	6	track_title_6597_6597_6597	279
title_79_77_	artist_38_38_38_3	7	track_title_7258_7258_7258_	444
title_331_329_	artist_80_80_80	8	track_title_2231_2231_223	146
title_441_439_	artist_37_37_37	10	track_title_3045_3045_304	324
title_39_37_	artist_49_49_49_4	11	track_title_3914_3914_391	480
title_370_368_	artist_40_40_40_4	1	track_title_313_313_313_313_3	248
title_417_415_	artist_66_66_	3	track_title_192_192_192_	450
title_69_67_	artist_34_34_34	5	track_title_145_145_145	548
title_80_78_	artist_19_19_19_1	13	track_title_6280_6280_6280	214
title_75_73_	artist_1_1_1_	1	track_title_6380_6380_6380_6	375
title_185_183_	artist_31_31_31	3	track_title_7261_7261_7261_726	179
title_434_432_	artist_54_54_54_5	7	track_title_4377_4377_4	148
title_32_30_	artist_21_21_21_2	8	track_title_5907_5907_59	340
title_20_18_	artist_54_54_54_5	9	track_title_4784_4784_478	129
title_186_184_	artist_2_2_2_	5	track_title_6634_6634_6634_6	595
title_485_483_	artist_91_91_91	8	track_title_586_586_58	603
title_346_344_	artist_7_7_7_	3	track_title_6252_6252_6252	549
title_124_122_	artist_97_97_97	8	track_title_3100_3100_31	528
title_273_271_	artist_13_13_13_1	6	track_title_5171_5171_5171_51	613
title_335_333_	artist_56_56_56	6	track_title_3332_3332_3332_3	283
title_490_488_	artist_51_51_51_5	2	track_title_3531_3531_3	290
title_144_142_	artist_77_77_	11	track_title_5055_5055_5055_505	415
title_199_197_	artist_74_74_	2	track_title_4635_4635_4635	502
title_93_91_	artist_92_92_92_9	5	track_title_1601_1601_1	331
title_343_341_	artist_66_66_	9	track_title_4742_4742_	423
title_227_225_	artist_79_79_79_7	10	track_title_1281_1281_1281_128	360
title_47_45_	artist_46_46_46_4	5	track_title_5016_5016_5016_	467
title_412_410_	artist_9_9_9_	1	track_title_255_255_255_255_	444
title_423_421_	artist_79_79_79_7	4	track_title_4111_4111_4111_4	331
title_358_356_	artist_29_29_29	8	track_title_1744_1744_1744_1	504
title_331_329_	artist_80_80_80	9	track_title_6819_6819_6819	276
title_54_52_	artist_69_69_	10	track_title_4367_4367_4367_43	485
title_390_388_	artist_76_76_76_7	2	track_title_5292_5292_5292_5	517
title_499_497_	artist_79_79_79_7	9	track_title_5295_5295_5295_5	395
title_257_255_	artist_71_71_	6	track_title_5140_5140_5140_51	548
title_419_417_	artist_76_76_76_7	3	track_title_5202_5202_5202_5	236
title_435_433_	artist_97_97_97	9	track_title_7094_7094_7094	159
title_305_303_	artist_91_91_91	10	track_title_5084_5084_5084_508	598
title_347_345_	artist_71_71_	2	track_title_2980_2980_2980_	211
title_513_511_	artist_42_42_42	1	track_title_2030_2030_2030_203	155
title_76_74_	artist_24_24_24_2	8	track_title_5717_5717_5	199
title_324_322_	artist_51_51_51_5	2	track_title_858_858_858_858_	234
title_261_259_	artist_42_42_42	3	track_title_4269_4269_4269_	505
title_405_403_	artist_60_60_	7	track_title_992_992_992_992_99	251
title_433_431_	artist_2_2_2_	8	track_title_5885_5885_5885_5	293
title_112_110_	artist_49_49_49_4	4	track_title_3788_3788_37	307
title_1012_1010_	artist_75_75_75	2	track_title_3137_3137_31	148
title_37_35_	artist_14_14_	9	track_title_404_404_404_404	490
title_382_380_	artist_79_79_79_7	5	track_title_3399_3399_3399_3	211
title_129_127_	artist_84_84_84_8	4	track_title_5140_5140_5140_51	523
title_205_203_	artist_37_37_37	5	track_title_2661_2661_26	515
title_362_360_	artist_61_61_61	2	track_title_7279_7279_72	199
title_172_170_	artist_16_16_16_1	10	track_title_1825_1825_18	262
title_185_183_	artist_31_31_31	12	track_title_5332_5332_5332_533	540
title_91_89_	artist_85_85_	3	track_title_1259_1259_1259_125	252
title_380_378_	artist_74_74_	6	track_title_4658_4658_4	429
title_324_322_	artist_51_51_51_5	11	track_title_5327_5327_5327_	375
title_368_366_	artist_3_3_3_	5	track_title_538_538_538_	314
title_479_477_	artist_29_29_29	8	track_title_6945_6945_6945_6	590
title_282_280_	artist_4_4_4_	3	track_title_5646_5646_5646_564	620
title_207_205_	artist_1_1_1_	2	track_title_6858_6858_6858_68	621
title_495_493_	artist_35_35_35_3	8	track_title_5456_5456_5456_54	174
title_242_240_	artist_91_91_91	9	track_title_1601_1601_1	288
title_286_284_	artist_94_94_94	10	track_title_1403_1403_1403_1	385
title_436_434_	artist_16_16_16_1	2	track_title_5656_5656_56	438
title_287_285_	artist_23_23_23	3	track_title_248_248_248_24	256
title_359_357_	artist_62_62_62_6	5	track_title_6517_6517_6517_65	235
title_513_511_	artist_42_42_42	6	track_title_3079_3079_307	499
title_460_458_	artist_76_76_76_7	5	track_title_6157_6157_61	394
title_309_307_	artist_7_7_7_	7	track_title_1534_1534_1534_153	421
title_313_311_	artist_58_58_	9	track_title_1064_1064_1064_10	211
title_451_449_	artist_30_30_	10	track_title_4007_4007_4	157
title_152_150_	artist_76_76_76_7	1	track_title_4485_4485_4485_4	525
title_13_11_	artist_33_33_	7	track_title_2121_2121_2121_21	530
title_13_11_	artist_8_8_8_	3	track_title_2072_2072_20	224
title_501_499_	artist_50_50_50	1	track_title_3954_3954_3954_3	442
title_150_148_	artist_51_51_51_5	9	track_title_4560_4560_45	214
title_220_218_	artist_36_36_	10	track_title_5674_5674_5674_567	598
title_231_229_	artist_83_83_83	3	track_title_6736_6736_6736_673	605
title_425_423_	artist_34_34_34	5	track_title_1429_1429_142	401
title_342_340_	artist_47_47_	2	track_title_6760_6760_6760_676	415
title_133_131_	artist_98_98_98_9	1	track_title_5431_5431_5	373
title_384_382_	artist_23_23_23	3	track_title_2662_2662_26	276
title_459_457_	artist_59_59_59	4	track_title_679_679_679	477
title_17_15_	artist_54_54_54_5	5	track_title_2959_2959_2959_	186
title_280_278_	artist_6_6_6_	11	track_title_2931_2931_2931_293	436
title_187_185_	artist_82_82_	5	track_title_5732_5732_5732_57	421
title_289_287_	artist_72_72_72	9	track_title_1942_1942_1	276
title_385_383_	artist_49_49_49_4	10	track_title_2394_2394_2394_	196
title_413_411_	artist_62_62_62_6	4	track_title_5249_5249_	157
title_371_369_	artist_20_20_20	9	track_title_7454_7454_	151
title_179_177_	artist_58_58_	6	track_title_6838_6838_6	608
title_233_231_	artist_22_22_	1	track_title_5229_5229_522	390
title_428_426_	artist_11_11_	8	track_title_3089_3089_3089_3	217
title_176_174_	artist_60_60_	4	track_title_5366_5366_5366_536	538
title_394_392_	artist_92_92_92_9	1	track_title_4489_4489_4489_4	492
title_225_223_	artist_88_88_	2	track_title_1741_1741_1741_1	470
title_106_104_	artist_43_43_43_4	3	track_title_4066_4066_4	169
title_102_100_	artist_38_38_38_3	4	track_title_3950_3950_3950_3	377
title_365_363_	artist_51_51_51_5	8	track_title_2877_2877_	156
title_115_113_	artist_78_78_78	4	track_title_3963_3963_	487
title_179_177_	artist_58_58_	1	track_title_1444_1444_	331
title_142_140_	artist_61_61_61	3	track_title_5490_5490_5	419
title_382_380_	artist_79_79_79_7	7	track_title_5584_5584_	352
title_359_357_	artist_62_62_62_6	1	track_title_7309_7309_7	171
title_240_238_	artist_32_32_32_3	10	track_title_287_287_287_287_	559
title_277_275_	artist_44_44_	1	track_title_6828_6828_6828_68	366
title_212_210_	artist_42_42_42	5	track_title_692_692_692_692_69	224
title_258_256_	artist_76_76_76_7	9	track_title_2055_2055_2055_	259
title_509_507_	artist_73_73_73_7	2	track_title_4862_4862_4862_486	278
title_303_301_	artist_59_59_59	4	track_title_1970_1970_1	176
title_445_443_	artist_88_88_	7	track_title_6505_6505_6505	208
title_92_90_	artist_79_79_79_7	1	track_title_2402_2402_2402_24	625
title_88_86_	artist_49_49_49_4	4	track_title_4742_4742_	382
title_430_428_	artist_36_36_	2	track_title_4686_4686_4	580
title_424_422_	artist_17_17_	4	track_title_3910_3910_391	595
title_509_507_	artist_73_73_73_7	7	track_title_3677_3677_3677_3	523
title_111_109_	artist_36_36_	7	track_title_6799_6799_6799_679	315
title_225_223_	artist_88_88_	11	track_title_3426_3426_3426_	288
title_477_475_	artist_13_13_13_1	1	track_title_323_323_32	145
title_67_65_	artist_85_85_	9	track_title_3670_3670_3670_3	415
title_209_207_	artist_75_75_75	2	track_title_5972_5972_5972_	474
title_151_149_	artist_76_76_76_7	4	track_title_639_639_639_	454
title_208_206_	artist_36_36_	5	track_title_5853_5853_5853_5	304
title_416_414_	artist_73_73_73_7	2	track_title_1977_1977_1	485
title_90_88_	artist_41_41_	7	track_title_4504_4504_45	399
title_206_204_	artist_20_20_20	5	track_title_2565_2565_	255
title_280_278_	artist_6_6_6_	2	track_title_1587_1587_1587_	152
title_324_322_	artist_51_51_51_5	6	track_title_6868_6868_6	545
title_13_11_	artist_4_4_4_	3	track_title_1798_1798_179	226
title_80_78_	artist_19_19_19_1	1	track_title_5470_5470_5470	224
title_340_338_	artist_54_54_54_5	6	track_title_1410_1410_	500
title_13_11_	artist_8_8_8_	7	track_title_3993_3993_	431
title_1012_1010_	artist_75_75_75	5	track_title_7213_7213_72	577
title_1012_1010_	artist_1_1_1_	4	track_title_1097_1097_1097_10	171
title_148_146_	artist_67_67_67	2	track_title_792_792_792_	459
title_71_69_	artist_37_37_37	3	track_title_5666_5666_5666_	422
title_77_75_	artist_87_87_87_8	4	track_title_2170_2170_2170	267
title_464_462_	artist_88_88_	6	track_title_4012_4012_4012	614
title_372_370_	artist_43_43_43_4	7	track_title_526_526_526_526_	615
title_389_387_	artist_68_68_68_6	8	track_title_3639_3639_363	270
title_144_142_	artist_77_77_	12	track_title_849_849_849	527
title_283_281_	artist_83_83_83	9	track_title_359_359_359_359_	605
title_37_35_	artist_14_14_	10	track_title_6891_6891_6	382
title_457_455_	artist_63_63_	1	track_title_7111_7111_	267
title_283_281_	artist_83_83_83	8	track_title_1998_1998_1998_19	185
title_40_38_	artist_62_62_62_6	3	track_title_4602_4602_4602	420
title_174_172_	artist_85_85_	5	track_title_2594_2594_	224
title_150_148_	artist_51_51_51_5	11	track_title_3789_3789_37	256
title_475_473_	artist_27_27_27_2	3	track_title_3543_3543_3543	210
title_63_61_	artist_81_81_81_8	2	track_title_5313_5313_53	367
title_486_484_	artist_47_47_	6	track_title_2943_2943_29	192
title_484_482_	artist_31_31_31	4	track_title_5003_5003_50	392
title_183_181_	artist_90_90_	3	track_title_5506_5506_550	559
title_268_266_	artist_59_59_59	7	track_title_5563_5563_556	507
title_160_158_	artist_89_89_89	1	track_title_4722_4722_472	371
title_49_47_	artist_24_24_24_2	6	track_title_6089_6089_	286
title_308_306_	artist_11_11_	9	track_title_4545_4545_4545_	371
title_241_239_	artist_30_30_	2	track_title_1533_1533_1533_153	133
title_284_282_	artist_7_7_7_	2	track_title_3165_3165_31	203
title_139_137_	artist_77_77_	8	track_title_1295_1295_12	270
title_204_202_	artist_29_29_29	5	track_title_4824_4824_4824_	385
title_373_371_	artist_86_86_86	4	track_title_440_440_440_440_4	185
title_230_228_	artist_75_75_75	2	track_title_6795_6795_6795_679	393
title_242_240_	artist_91_91_91	8	track_title_768_768_768_768	217
title_422_420_	artist_40_40_40_4	2	track_title_4247_4247_4247_424	228
title_496_494_	artist_59_59_59	6	track_title_546_546_546	304
title_207_205_	artist_1_1_1_	3	track_title_3851_3851_3851	296
title_229_227_	artist_89_89_89	1	track_title_7226_7226_7226_	186
title_440_438_	artist_59_59_59	5	track_title_2592_2592_	260
title_100_98_	artist_66_66_	4	track_title_4595_4595_45	208
title_17_15_	artist_54_54_54_5	7	track_title_1317_1317_1317_13	268
title_461_459_	artist_6_6_6_	9	track_title_4961_4961_4	300
title_170_168_	artist_40_40_40_4	11	track_title_5947_5947_5947_	315
title_251_249_	artist_16_16_16_1	2	track_title_1427_1427_142	482
title_159_157_	artist_71_71_	9	track_title_5314_5314_53	242
title_483_481_	artist_61_61_61	4	track_title_1495_1495_1495_1	253
title_113_111_	artist_37_37_37	5	track_title_4456_4456_4456_4	196
title_17_15_	artist_54_54_54_5	8	track_title_2533_2533_	620
title_333_331_	artist_46_46_46_4	2	track_title_3157_3157_3157_315	521
title_72_70_	artist_97_97_97	5	track_title_5445_5445_5445	249
title_369_367_	artist_99_99_	1	track_title_1879_1879_1879_187	452
title_167_165_	artist_52_52_	6	track_title_6774_6774_67	223
title_220_218_	artist_36_36_	7	track_title_2358_2358_23	386
title_493_491_	artist_49_49_49_4	6	track_title_3391_3391_3391_3	167
title_143_141_	artist_12_12_12	10	track_title_563_563_563_563	483
title_260_258_	artist_47_47_	4	track_title_2573_2573_257	293
title_332_330_	artist_18_18_18	10	track_title_2044_2044_20	194
title_308_306_	artist_11_11_	8	track_title_5946_5946_5946_	550
title_105_103_	artist_84_84_84_8	9	track_title_7470_7470_7470_7	574
title_297_295_	artist_34_34_34	6	track_title_6879_6879_6879	422
title_395_393_	artist_60_60_	8	track_title_5222_5222_522	613
title_398_396_	artist_22_22_	8	track_title_5994_5994_59	576
title_301_299_	artist_51_51_51_5	4	track_title_7456_7456_	623
title_214_212_	artist_12_12_12	6	track_title_4219_4219_4219_421	179
title_156_154_	artist_27_27_27_2	2	track_title_3049_3049_304	413
title_161_159_	artist_36_36_	3	track_title_2616_2616_2616_	310
title_165_163_	artist_79_79_79_7	6	track_title_5777_5777_5	264
title_28_26_	artist_67_67_67	3	track_title_514_514_514	331
title_306_304_	artist_35_35_35_3	11	track_title_7156_7156_715	481
title_416_414_	artist_73_73_73_7	4	track_title_5783_5783_5783	241
title_330_328_	artist_34_34_34	6	track_title_2123_2123_2123_21	141
title_46_44_	artist_53_53_53	6	track_title_1822_1822_18	291
title_228_226_	artist_65_65_65_6	1	track_title_5419_5419_5419	613
title_188_186_	artist_94_94_94	9	track_title_400_400_400_400_40	623
title_118_116_	artist_51_51_51_5	7	track_title_4376_4376_4	472
title_428_426_	artist_11_11_	1	track_title_2211_2211_2211_2	356
title_402_400_	artist_72_72_72	2	track_title_1693_1693_1	484
title_407_405_	artist_31_31_31	3	track_title_5158_5158_5	278
title_106_104_	artist_43_43_43_4	6	track_title_5306_5306_5306_530	153
title_461_459_	artist_6_6_6_	8	track_title_6822_6822_6822_68	449
title_65_63_	artist_90_90_	9	track_title_6246_6246_6	145
title_206_204_	artist_20_20_20	11	track_title_5411_5411_5411	202
title_186_184_	artist_2_2_2_	2	track_title_416_416_416	199
title_290_288_	artist_27_27_27_2	3	track_title_7420_7420_	169
title_28_26_	artist_67_67_67	4	track_title_1953_1953_1953	359
title_72_70_	artist_97_97_97	6	track_title_7151_7151_715	410
title_168_166_	artist_77_77_	8	track_title_6852_6852_6852_68	357
title_488_486_	artist_16_16_16_1	9	track_title_4961_4961_4	241
title_502_500_	artist_94_94_94	1	track_title_7260_7260_7260_726	556
title_56_54_	artist_29_29_29	10	track_title_362_362_362_	534
title_88_86_	artist_49_49_49_4	1	track_title_3825_3825_3825	508
title_110_108_	artist_69_69_	2	track_title_4890_4890_4890_489	411
title_251_249_	artist_16_16_16_1	3	track_title_5719_5719_5	307
title_201_199_	artist_68_68_68_6	4	track_title_830_830_830_830_83	173
title_23_21_	artist_21_21_21_2	5	track_title_1175_1175_117	514
title_50_48_	artist_5_5_5_	7	track_title_6325_6325_6325_6	414
title_491_489_	artist_27_27_27_2	4	track_title_752_752_752_7	373
title_77_75_	artist_87_87_87_8	2	track_title_1270_1270_1270_	130
title_207_205_	artist_1_1_1_	9	track_title_3475_3475_34	132
title_414_412_	artist_60_60_	1	track_title_4327_4327_4327	416
title_497_495_	artist_46_46_46_4	5	track_title_5098_5098_50	499
title_22_20_	artist_5_5_5_	7	track_title_529_529_529_529_	447
title_317_315_	artist_46_46_46_4	4	track_title_3143_3143_3143_	277
title_235_233_	artist_36_36_	7	track_title_1549_1549_15	262
title_13_11_	artist_4_4_4_	10	track_title_2224_2224_	571
title_64_62_	artist_87_87_87_8	1	track_title_1403_1403_1403_1	354
title_136_134_	artist_61_61_61	5	track_title_889_889_88	377
title_501_499_	artist_50_50_50	12	track_title_5547_5547_5547_5	407
title_420_418_	artist_79_79_79_7	5	track_title_2895_2895_2895_2	211
title_395_393_	artist_60_60_	6	track_title_7399_7399_7	190
title_477_475_	artist_13_13_13_1	9	track_title_170_170_170_17	267
title_110_108_	artist_69_69_	11	track_title_2432_2432_2432_24	442
title_93_91_	artist_92_92_92_9	2	track_title_4330_4330_4330_43	613
title_31_29_	artist_52_52_	6	track_title_1368_1368_1368	501
title_288_286_	artist_25_25_	4	track_title_3627_3627_	501
title_130_128_	artist_51_51_51_5	4	track_title_1403_1403_1403_1	449
title_483_481_	artist_61_61_61	7	track_title_5110_5110_5110_51	327
title_245_243_	artist_56_56_56	4	track_title_5945_5945_5945_	455
title_194_192_	artist_35_35_35_3	7	track_title_5834_5834_	165
title_311_309_	artist_17_17_	3	track_title_1233_1233_12	346
title_398_396_	artist_22_22_	11	track_title_2255_2255_	579
title_52_50_	artist_66_66_	8	track_title_3024_3024_3024_3	400
title_365_363_	artist_51_51_51_5	9	track_title_7351_7351_7351_73	621
title_221_219_	artist_12_12_12	1	track_title_4272_4272_4272_427	218
title_248_246_	artist_47_47_	2	track_title_3907_3907_	187
title_102_100_	artist_38_38_38_3	6	track_title_5935_5935_59	205
title_306_304_	artist_35_35_35_3	7	track_title_3876_3876_3	154
title_253_251_	artist_84_84_84_8	1	track_title_2799_2799_2799	402
title_68_66_	artist_2_2_2_	4	track_title_1577_1577_15	437
title_413_411_	artist_62_62_62_6	2	track_title_4293_4293_4293_	373
title_241_239_	artist_30_30_	4	track_title_818_818_818_818_8	462
title_241_239_	artist_30_30_	6	track_title_4553_4553_4553_455	596
title_115_113_	artist_78_78_78	5	track_title_1086_1086_1086	369
title_300_298_	artist_92_92_92_9	3	track_title_1701_1701_170	226
title_188_186_	artist_94_94_94	11	track_title_4685_4685_4	343
title_272_270_	artist_93_93_	4	track_title_912_912_912	556
title_351_349_	artist_11_11_	2	track_title_2725_2725_2	218
title_90_88_	artist_41_41_	3	track_title_94_94_94_94_9	587
title_314_312_	artist_32_32_32_3	8	track_title_6234_6234_6234_62	302
title_237_235_	artist_2_2_2_	9	track_title_1428_1428_142	604
title_434_432_	artist_54_54_54_5	2	track_title_5878_5878_587	138
title_429_427_	artist_19_19_19_1	3	track_title_6050_6050_	319
title_490_488_	artist_51_51_51_5	4	track_title_1689_1689_1689_16	402
title_76_74_	artist_24_24_24_2	7	track_title_5354_5354_5354_	343
title_324_322_	artist_51_51_51_5	8	track_title_7132_7132_7132_7	239
title_39_37_	artist_49_49_49_4	9	track_title_3235_3235_3235	447
title_68_66_	artist_2_2_2_	1	track_title_5094_5094_50	272
title_433_431_	artist_2_2_2_	5	track_title_6333_6333_	495
title_207_205_	artist_1_1_1_	6	track_title_6647_6647_	326
title_111_109_	artist_36_36_	9	track_title_883_883_88	241
title_493_491_	artist_49_49_49_4	2	track_title_4599_4599_45	170
title_345_343_	artist_59_59_59	5	track_title_4858_4858_4858_	313
title_488_486_	artist_16_16_16_1	8	track_title_3843_3843_3	241
title_497_495_	artist_46_46_46_4	1	track_title_3970_3970_397	439
title_354_352_	artist_43_43_43_4	1	track_title_5760_5760_5760_57	607
title_418_416_	artist_54_54_54_5	8	track_title_1562_1562_1562_156	443
title_336_334_	artist_54_54_54_5	8	track_title_5947_5947_5947_	416
title_450_448_	artist_91_91_91	10	track_title_1990_1990_1990_19	347
title_447_445_	artist_69_69_	11	track_title_4110_4110_4110_4	527
title_44_42_	artist_56_56_56	12	track_title_5260_5260_5260_5	266
title_372_370_	artist_43_43_43_4	1	track_title_4179_4179_4179_4	533
title_349_347_	artist_27_27_27_2	2	track_title_6301_6301_	523
title_279_277_	artist_61_61_61	3	track_title_960_960_960_960_96	502
title_475_473_	artist_27_27_27_2	4	track_title_5957_5957_5957_595	508
title_296_294_	artist_11_11_	5	track_title_3591_3591_3	199
title_206_204_	artist_20_20_20	1	track_title_6962_6962_696	457
title_256_254_	artist_79_79_79_7	3	track_title_6775_6775_67	582
title_256_254_	artist_79_79_79_7	4	track_title_503_503_503_	403
title_46_44_	artist_53_53_53	5	track_title_5469_5469_5	401
title_140_138_	artist_80_80_80	6	track_title_4843_4843_48	433
title_123_121_	artist_26_26_26	8	track_title_3374_3374_	391
title_213_211_	artist_23_23_23	10	track_title_7198_7198_7198_7	129
title_13_11_	artist_9_9_9_	10	track_title_5853_5853_5853_5	149
title_13_11_	artist_8_8_8_	2	track_title_5024_5024_5024_502	481
title_426_424_	artist_37_37_37	1	track_title_1435_1435_1435_1	330
title_166_164_	artist_19_19_19_1	2	track_title_6163_6163_6163_	367
title_297_295_	artist_34_34_34	3	track_title_6478_6478_6478_	296
title_16_14_	artist_16_16_16_1	4	track_title_3036_3036_	612
title_170_168_	artist_40_40_40_4	5	track_title_3261_3261_3261	230
title_268_266_	artist_59_59_59	6	track_title_3466_3466_3466_346	188
title_364_362_	artist_4_4_4_	7	track_title_3426_3426_3426_	336
title_302_300_	artist_85_85_	8	track_title_5683_5683_56	463
title_153_151_	artist_77_77_	1	track_title_1499_1499_1499_1	149
title_170_168_	artist_40_40_40_4	2	track_title_4693_4693_4693	463
title_354_352_	artist_43_43_43_4	3	track_title_1967_1967_1967_19	570
title_29_27_	artist_92_92_92_9	4	track_title_3365_3365_3365_3	581
title_280_278_	artist_6_6_6_	5	track_title_5029_5029_5029_502	342
title_206_204_	artist_20_20_20	7	track_title_1055_1055_1055	476
title_358_356_	artist_29_29_29	9	track_title_6846_6846_6846	218
title_274_272_	artist_2_2_2_	1	track_title_2417_2417_2	493
title_215_213_	artist_17_17_	2	track_title_7290_7290_7290_729	463
title_362_360_	artist_61_61_61	3	track_title_2919_2919_29	197
title_273_271_	artist_13_13_13_1	5	track_title_3576_3576_3576	517
title_131_129_	artist_37_37_37	6	track_title_3983_3983_3983_3	420
title_217_215_	artist_20_20_20	7	track_title_4507_4507_45	135
title_477_475_	artist_13_13_13_1	8	track_title_5938_5938_59	438
title_308_306_	artist_11_11_	4	track_title_6065_6065_606	581
title_102_100_	artist_38_38_38_3	2	track_title_6582_6582_6	173
title_89_87_	artist_40_40_40_4	3	track_title_7271_7271_72	419
title_244_242_	artist_47_47_	4	track_title_2187_2187_2187_21	393
title_237_235_	artist_2_2_2_	5	track_title_3250_3250_3	508
title_497_495_	artist_46_46_46_4	6	track_title_7174_7174_	373
title_31_29_	artist_52_52_	7	track_title_6735_6735_6735_673	221
title_467_465_	artist_15_15_15	8	track_title_2420_2420_2420	578
title_512_510_	artist_42_42_42	2	track_title_1418_1418_	551
title_488_486_	artist_16_16_16_1	3	track_title_3932_3932_	308
title_342_340_	artist_47_47_	4	track_title_3617_3617_3617_3	171
title_422_420_	artist_40_40_40_4	5	track_title_956_956_956_956_	570
title_94_92_	artist_93_93_	6	track_title_7245_7245_72	165
title_104_102_	artist_43_43_43_4	7	track_title_7032_7032_7032	410
title_97_95_	artist_11_11_	1	track_title_6387_6387_6387_6	143
title_125_123_	artist_5_5_5_	2	track_title_7438_7438_743	599
title_178_176_	artist_91_91_91	4	track_title_4094_4094_4	584
title_362_360_	artist_61_61_61	5	track_title_1838_1838_1838_	394
title_157_155_	artist_42_42_42	6	track_title_5097_5097_50	583
title_240_238_	artist_32_32_32_3	7	track_title_6895_6895_6	324
title_385_383_	artist_49_49_49_4	9	track_title_4446_4446_444	205
title_208_206_	artist_36_36_	11	track_title_6205_6205_6205_62	190
title_470_468_	artist_16_16_16_1	1	track_title_3867_3867_3867_38	200
title_108_106_	artist_43_43_43_4	2	track_title_4236_4236_4236_	538
title_59_57_	artist_6_6_6_	3	track_title_1853_1853_18	410
title_45_43_	artist_97_97_97	4	track_title_2170_2170_2170	132
title_214_212_	artist_12_12_12	10	track_title_4342_4342_4	306
title_107_105_	artist_29_29_29	2	track_title_1894_1894_1894_	309
title_95_93_	artist_87_87_87_8	1	track_title_821_821_821_8	223
title_499_497_	artist_79_79_79_7	2	track_title_837_837_837_837	494
title_165_163_	artist_79_79_79_7	3	track_title_5551_5551_	563
title_501_499_	artist_50_50_50	4	track_title_2048_2048_20	382
title_102_100_	artist_38_38_38_3	5	track_title_4565_4565_45	349
title_97_95_	artist_11_11_	7	track_title_4069_4069_4	166
title_175_173_	artist_78_78_78	8	track_title_3635_3635_363	451
title_319_317_	artist_3_3_3_	9	track_title_2798_2798_2798	562
title_70_68_	artist_96_96_	11	track_title_5415_5415_5415	583
title_283_281_	artist_83_83_83	1	track_title_1553_1553_1553_	139
title_24_22_	artist_75_75_75	2	track_title_7026_7026_7	149
title_249_247_	artist_27_27_27_2	3	track_title_2759_2759_2	371
title_185_183_	artist_31_31_31	11	track_title_140_140_140_140_1	624
title_260_258_	artist_47_47_	1	track_title_3125_3125_3125_312	284
title_371_369_	artist_20_20_20	7	track_title_205_205_205_205	332
title_330_328_	artist_34_34_34	3	track_title_6937_6937_693	324
title_1012_1010_	artist_51_51_51_5	4	track_title_5552_5552_	192
title_229_227_	artist_89_89_89	2	track_title_3092_3092_	378
title_199_197_	artist_74_74_	3	track_title_2753_2753_2	199
title_444_442_	artist_94_94_94	4	track_title_4741_4741_	585
title_262_260_	artist_29_29_29	5	track_title_4399_4399_4399_43	141
title_29_27_	artist_92_92_92_9	6	track_title_702_702_702_	238
title_245_243_	artist_56_56_56	9	track_title_2982_2982_2982_	617
title_77_75_	artist_87_87_87_8	10	track_title_2632_2632_26	320
title_76_74_	artist_24_24_24_2	1	track_title_1964_1964_1964_19	590
title_473_471_	artist_93_93_	2	track_title_4901_4901_4	158
title_316_314_	artist_61_61_61	5	track_title_5140_5140_5140_51	210
title_352_350_	artist_70_70_70_7	2	track_title_6631_6631_6631_6	171
title_158_156_	artist_29_29_29	3	track_title_5253_5253_525	137
title_214_212_	artist_12_12_12	4	track_title_2599_2599_	370
title_202_200_	artist_73_73_73_7	5	track_title_391_391_391_	333
title_299_297_	artist_46_46_46_4	6	track_title_6211_6211_6	145
title_227_225_	artist_79_79_79_7	7	track_title_3491_3491_3491_349	543
title_240_238_	artist_32_32_32_3	8	track_title_6709_6709_6709_670	315
title_33_31_	artist_32_32_32_3	11	track_title_2671_2671_2671_	576
title_73_71_	artist_43_43_43_4	2	track_title_5394_5394_5394_539	418
title_323_321_	artist_29_29_29	3	track_title_2170_2170_2170	314
title_391_389_	artist_15_15_15	4	track_title_2021_2021_2021_	138
title_87_85_	artist_91_91_91	5	track_title_6963_6963_696	426
title_176_174_	artist_60_60_	10	track_title_3377_3377_	539
title_389_387_	artist_68_68_68_6	1	track_title_7434_7434_743	159
title_157_155_	artist_42_42_42	2	track_title_2045_2045_20	398
title_84_82_	artist_84_84_84_8	3	track_title_1103_1103_	336
title_325_323_	artist_79_79_79_7	4	track_title_2305_2305_2305_	272
title_324_322_	artist_51_51_51_5	5	track_title_6411_6411_6411_	354
title_292_290_	artist_6_6_6_	1	track_title_2032_2032_2032_203	286
title_488_486_	artist_16_16_16_1	2	track_title_6641_6641_	576
title_244_242_	artist_47_47_	3	track_title_1707_1707_170	269
title_297_295_	artist_34_34_34	5	track_title_7475_7475_7475_7	236
title_350_348_	artist_31_31_31	6	track_title_1192_1192_	516
title_373_371_	artist_86_86_86	7	track_title_3870_3870_3	339
title_180_178_	artist_66_66_	8	track_title_3239_3239_3239	567
title_15_13_	artist_55_55_	9	track_title_2240_2240_2240_2	353
title_28_26_	artist_67_67_67	2	track_title_6116_6116_6116_611	400
title_135_133_	artist_30_30_	4	track_title_2579_2579_257	247
title_308_306_	artist_11_11_	5	track_title_4558_4558_4558_455	132
title_227_225_	artist_79_79_79_7	6	track_title_3460_3460_3460_346	158
title_473_471_	artist_93_93_	7	track_title_4198_4198_419	160
title_279_277_	artist_61_61_61	9	track_title_1440_1440_	357
title_421_419_	artist_84_84_84_8	10	track_title_3202_3202_3202	332
title_354_352_	artist_43_43_43_4	12	track_title_197_197_197_197	572
title_194_192_	artist_35_35_35_3	1	track_title_3209_3209_3209	616
title_359_357_	artist_62_62_62_6	2	track_title_491_491_491_491	301
title_201_199_	artist_68_68_68_6	3	track_title_5138_5138_5138	286
title_185_183_	artist_31_31_31	4	track_title_1915_1915_1	261
title_62_60_	artist_26_26_26	5	track_title_3092_3092_	141
title_125_123_	artist_5_5_5_	6	track_title_4855_4855_4855_	169
title_287_285_	artist_23_23_23	8	track_title_4454_4454_4454_4	343
title_77_75_	artist_87_87_87_8	9	track_title_1376_1376_1376_13	162
title_485_483_	artist_91_91_91	1	track_title_2352_2352_23	536
title_44_42_	artist_56_56_56	2	track_title_6906_6906_690	412
title_292_290_	artist_6_6_6_	4	track_title_6628_6628_662	293
title_54_52_	artist_69_69_	6	track_title_2292_2292_229	358
title_266_264_	artist_85_85_	8	track_title_7256_7256_7256_	578
title_477_475_	artist_13_13_13_1	10	track_title_7415_7415_7415_7	350
title_356_354_	artist_83_83_83	2	track_title_801_801_801_801_80	447
title_234_232_	artist_40_40_40_4	3	track_title_7221_7221_7221_	298
title_278_276_	artist_98_98_98_9	4	track_title_6395_6395_	184
title_96_94_	artist_93_93_	5	track_title_3098_3098_	330
title_87_85_	artist_91_91_91	6	track_title_6846_6846_6846	206
title_307_305_	artist_30_30_	7	track_title_2579_2579_257	206
title_387_385_	artist_57_57_57_5	8	track_title_6005_6005_600	494
title_161_159_	artist_36_36_	9	track_title_33_33_33_3	363
title_262_260_	artist_29_29_29	10	track_title_6937_6937_693	217
title_262_260_	artist_29_29_29	12	track_title_2781_2781_2	221
title_448_446_	artist_34_34_34	1	track_title_2444_2444_2	401
title_144_142_	artist_77_77_	2	track_title_5938_5938_59	412
title_380_378_	artist_74_74_	3	track_title_1778_1778_1778_1	204
title_116_114_	artist_92_92_92_9	4	track_title_4955_4955_4955_49	474
title_89_87_	artist_40_40_40_4	5	track_title_5388_5388_5388_	507
title_495_493_	artist_35_35_35_3	6	track_title_1778_1778_1778_1	597
title_441_439_	artist_37_37_37	7	track_title_790_790_790_790_79	337
title_471_469_	artist_41_41_	8	track_title_4124_4124_	278
title_388_386_	artist_81_81_81_8	9	track_title_6516_6516_6516_65	478
title_197_195_	artist_5_5_5_	11	track_title_3745_3745_3745_374	232
title_352_350_	artist_70_70_70_7	12	track_title_6389_6389_6389_6	134
title_480_478_	artist_9_9_9_	7	track_title_2714_2714_2714_27	154
title_154_152_	artist_76_76_76_7	1	track_title_1196_1196_	523
title_285_283_	artist_8_8_8_	2	track_title_1647_1647_1647	212
title_477_475_	artist_13_13_13_1	3	track_title_7497_7497_749	422
title_35_33_	artist_59_59_59	7	track_title_6442_6442_6442_	524
title_206_204_	artist_20_20_20	6	track_title_1382_1382_1	216
title_504_502_	artist_48_48_48	7	track_title_2756_2756_2	515
title_437_435_	artist_39_39_	8	track_title_3574_3574_3574	441
title_197_195_	artist_5_5_5_	9	track_title_6289_6289_6289	519
title_366_364_	artist_20_20_20	2	track_title_1291_1291_12	261
title_410_408_	artist_93_93_	3	track_title_522_522_52	305
title_49_47_	artist_24_24_24_2	4	track_title_5137_5137_5137	626
title_45_43_	artist_97_97_97	5	track_title_1034_1034_1034_10	421
title_186_184_	artist_2_2_2_	6	track_title_2320_2320_23	486
title_209_207_	artist_75_75_75	8	track_title_2561_2561_	294
title_41_39_	artist_46_46_46_4	2	track_title_578_578_578	297
title_392_390_	artist_62_62_62_6	3	track_title_5415_5415_5415	382
title_240_238_	artist_32_32_32_3	4	track_title_6344_6344_634	260
title_373_371_	artist_86_86_86	5	track_title_3081_3081_3081_3	329
title_357_355_	artist_2_2_2_	6	track_title_5887_5887_5887_5	255
title_280_278_	artist_6_6_6_	7	track_title_687_687_68	406
title_163_161_	artist_80_80_80	6	track_title_153_153_15	431
title_371_369_	artist_20_20_20	8	track_title_5911_5911_5911_	556
title_179_177_	artist_58_58_	9	track_title_6352_6352_6352_6	284
title_449_447_	artist_1_1_1_	5	track_title_2173_2173_2173	322
title_173_171_	artist_33_33_	9	track_title_6767_6767_6767_676	389
title_109_107_	artist_47_47_	10	track_title_1173_1173_117	618
title_79_77_	artist_38_38_38_3	2	track_title_6144_6144_6144_614	494
title_437_435_	artist_39_39_	4	track_title_3896_3896_3896_38	250
title_377_375_	artist_37_37_37	6	track_title_3946_3946_394	550
title_15_13_	artist_55_55_	7	track_title_4818_4818_48	285
title_403_401_	artist_60_60_	8	track_title_2948_2948_29	321
title_20_18_	artist_54_54_54_5	13	track_title_6963_6963_696	594
title_242_240_	artist_91_91_91	1	track_title_5481_5481_5481_54	588
title_176_174_	artist_60_60_	1	track_title_6276_6276_6	231
title_353_351_	artist_8_8_8_	3	track_title_2573_2573_257	236
title_462_460_	artist_80_80_80	4	track_title_1847_1847_1847_184	586
title_95_93_	artist_87_87_87_8	6	track_title_5798_5798_5798_57	288
title_370_368_	artist_40_40_40_4	7	track_title_4063_4063_4	625
title_252_250_	artist_85_85_	8	track_title_2223_2223_	399
title_372_370_	artist_43_43_43_4	12	track_title_6237_6237_6237_62	600
title_13_11_	artist_71_71_	9	track_title_5225_5225_522	139
title_13_11_	artist_9_9_9_	5	track_title_2323_2323_23	289
title_1012_1010_	artist_1_1_1_	2	track_title_4197_4197_419	264
title_432_430_	artist_81_81_81_8	1	track_title_1523_1523_1523_	180
title_29_27_	artist_92_92_92_9	3	track_title_6265_6265_6265_62	386
title_484_482_	artist_31_31_31	6	track_title_5607_5607_5607_	271
title_246_244_	artist_53_53_53	10	track_title_4469_4469_	478
title_313_311_	artist_58_58_	1	track_title_5063_5063_50	547
title_380_378_	artist_74_74_	2	track_title_72_72_72_72_7	523
title_25_23_	artist_5_5_5_	3	track_title_5023_5023_5023_502	520
title_294_292_	artist_88_88_	5	track_title_6979_6979_6979_6	337
title_210_208_	artist_59_59_59	7	track_title_4581_4581_4581_458	517
title_154_152_	artist_76_76_76_7	8	track_title_2963_2963_2963_296	330
title_404_402_	artist_75_75_75	3	track_title_5339_5339_5339_533	393
title_80_78_	artist_19_19_19_1	4	track_title_4412_4412_441	127
title_264_262_	artist_13_13_13_1	5	track_title_6923_6923_	468
title_419_417_	artist_76_76_76_7	6	track_title_2855_2855_285	231
title_154_152_	artist_76_76_76_7	13	track_title_1233_1233_12	315
title_372_370_	artist_43_43_43_4	2	track_title_315_315_315	571
title_19_17_	artist_18_18_18	3	track_title_4658_4658_4	347
title_246_244_	artist_53_53_53	4	track_title_2771_2771_2771_27	462
title_477_475_	artist_13_13_13_1	6	track_title_2690_2690_26	201
title_361_359_	artist_23_23_23	7	track_title_7293_7293_7293_729	449
title_13_11_	artist_4_4_4_	8	track_title_6913_6913_6913_6	319
title_13_11_	artist_33_33_	1	track_title_5998_5998_59	548
title_237_235_	artist_2_2_2_	1	track_title_4791_4791_4791_4	612
title_310_308_	artist_69_69_	2	track_title_3356_3356_335	547
title_406_404_	artist_47_47_	3	track_title_5825_5825_5825_5	460
title_200_198_	artist_10_10_10_1	4	track_title_3679_3679_3679_3	181
title_177_175_	artist_25_25_	5	track_title_2489_2489_2489	504
title_120_118_	artist_76_76_76_7	6	track_title_7112_7112_	564
title_273_271_	artist_13_13_13_1	1	track_title_6544_6544_6544_65	297
title_336_334_	artist_54_54_54_5	2	track_title_2305_2305_2305_	385
title_415_413_	artist_74_74_	3	track_title_6467_6467_64	582
title_282_280_	artist_4_4_4_	4	track_title_6262_6262_6262_62	505
title_24_22_	artist_75_75_75	5	track_title_3743_3743_3743_374	333
title_172_170_	artist_16_16_16_1	7	track_title_1971_1971_1	271
title_26_24_	artist_60_60_	9	track_title_5649_5649_5649_564	614
title_145_143_	artist_77_77_	12	track_title_2561_2561_	510
title_178_176_	artist_91_91_91	2	track_title_5524_5524_	420
title_66_64_	artist_55_55_	6	track_title_6076_6076_6076_6	458
title_57_55_	artist_23_23_23	8	track_title_2576_2576_257	398
title_290_288_	artist_27_27_27_2	10	track_title_1691_1691_1	216
title_409_407_	artist_42_42_42	11	track_title_2040_2040_20	313
title_398_396_	artist_22_22_	1	track_title_5291_5291_5291_5	509
title_131_129_	artist_37_37_37	2	track_title_1904_1904_1904_19	219
title_267_265_	artist_23_23_23	7	track_title_4534_4534_45	507
title_434_432_	artist_54_54_54_5	11	track_title_4676_4676_4676_46	295
title_46_44_	artist_53_53_53	1	track_title_176_176_176_17	213
title_195_193_	artist_26_26_26	2	track_title_5698_5698_5698_	395
title_363_361_	artist_56_56_56	3	track_title_3396_3396_3396_3	512
title_498_496_	artist_82_82_	4	track_title_5195_5195_5195	270
title_392_390_	artist_62_62_62_6	10	track_title_3814_3814_3	280
title_252_250_	artist_85_85_	12	track_title_5557_5557_	536
title_350_348_	artist_31_31_31	1	track_title_5904_5904_59	548
title_185_183_	artist_31_31_31	2	track_title_7333_7333_7	431
title_17_15_	artist_54_54_54_5	3	track_title_1707_1707_170	445
title_179_177_	artist_58_58_	4	track_title_4708_4708_4708_4	558
title_89_87_	artist_40_40_40_4	4	track_title_3982_3982_3982_3	365
title_60_58_	artist_17_17_	5	track_title_3400_3400_3400_340	399
title_321_319_	artist_10_10_10_1	6	track_title_3415_3415_34	300
title_230_228_	artist_75_75_75	7	track_title_3892_3892_3892_38	272
title_392_390_	artist_62_62_62_6	9	track_title_6524_6524_6	544
title_313_311_	artist_58_58_	10	track_title_1006_1006_1006_10	623
title_315_313_	artist_51_51_51_5	11	track_title_2172_2172_2172	431
title_323_321_	artist_29_29_29	5	track_title_3605_3605_360	156
title_462_460_	artist_80_80_80	7	track_title_1973_1973_1	241
title_244_242_	artist_47_47_	8	track_title_6785_6785_6785_	224
title_118_116_	artist_51_51_51_5	12	track_title_2540_2540_254	141
title_222_220_	artist_78_78_78	1	track_title_874_874_874_87	164
title_335_333_	artist_56_56_56	5	track_title_1279_1279_1279_	293
title_80_78_	artist_19_19_19_1	8	track_title_4549_4549_4549_	251
title_466_464_	artist_4_4_4_	9	track_title_7388_7388_7388_73	546
title_97_95_	artist_11_11_	10	track_title_7020_7020_7	497
title_149_147_	artist_50_50_50	13	track_title_4260_4260_4260_	409
title_134_132_	artist_46_46_46_4	1	track_title_6922_6922_	386
title_274_272_	artist_2_2_2_	2	track_title_6288_6288_6288	483
title_115_113_	artist_78_78_78	3	track_title_2199_2199_2	140
title_400_398_	artist_24_24_24_2	4	track_title_6005_6005_600	597
title_306_304_	artist_35_35_35_3	5	track_title_4867_4867_4867_486	303
title_355_353_	artist_90_90_	3	track_title_4638_4638_4638	531
title_349_347_	artist_27_27_27_2	4	track_title_549_549_549	522
title_424_422_	artist_17_17_	8	track_title_775_775_775_775_7	534
title_337_335_	artist_98_98_98_9	9	track_title_7220_7220_7220_	453
title_270_268_	artist_20_20_20	1	track_title_7486_7486_	326
title_459_457_	artist_59_59_59	2	track_title_5324_5324_5324_	608
title_209_207_	artist_75_75_75	5	track_title_3355_3355_335	421
title_169_167_	artist_96_96_	6	track_title_3295_3295_3295	375
title_126_124_	artist_70_70_70_7	2	track_title_6313_6313_631	157
title_126_124_	artist_70_70_70_7	3	track_title_4130_4130_413	476
title_394_392_	artist_92_92_92_9	4	track_title_6530_6530_6530	298
title_225_223_	artist_88_88_	5	track_title_2454_2454_2454	535
title_290_288_	artist_27_27_27_2	6	track_title_4932_4932_4	253
title_63_61_	artist_81_81_81_8	8	track_title_2365_2365_2365_	508
title_282_280_	artist_4_4_4_	11	track_title_3760_3760_3760_	285
title_388_386_	artist_81_81_81_8	5	track_title_1086_1086_1086	596
title_56_54_	artist_29_29_29	9	track_title_656_656_656_656_	217
title_221_219_	artist_12_12_12	12	track_title_2956_2956_2956_	325
title_208_206_	artist_36_36_	1	track_title_3647_3647_3647_3	291
title_200_198_	artist_10_10_10_1	2	track_title_7338_7338_7	254
title_446_444_	artist_47_47_	4	track_title_3012_3012_301	569
title_391_389_	artist_15_15_15	5	track_title_5414_5414_5414	201
title_458_456_	artist_41_41_	7	track_title_907_907_907_	224
title_314_312_	artist_32_32_32_3	11	track_title_4749_4749_	298
title_143_141_	artist_12_12_12	2	track_title_4147_4147_4147_4	203
title_271_269_	artist_61_61_61	1	track_title_3854_3854_3854	179
title_386_384_	artist_86_86_86	2	track_title_5760_5760_5760_57	239
title_486_484_	artist_47_47_	4	track_title_6016_6016_6016_6	315
title_189_187_	artist_32_32_32_3	5	track_title_2047_2047_20	314
title_280_278_	artist_6_6_6_	6	track_title_1308_1308_1308	510
title_447_445_	artist_69_69_	8	track_title_3179_3179_3179_	563
title_291_289_	artist_60_60_	9	track_title_6491_6491_64	127
title_495_493_	artist_35_35_35_3	10	track_title_825_825_82	202
title_20_18_	artist_54_54_54_5	12	track_title_2489_2489_2489	194
title_465_463_	artist_59_59_59	1	track_title_879_879_879_879_8	311
title_181_179_	artist_40_40_40_4	1	track_title_3327_3327_332	216
title_326_324_	artist_18_18_18	2	track_title_10_10_10_10_10_1	237
title_411_409_	artist_21_21_21_2	4	track_title_2162_2162_2	582
title_65_63_	artist_90_90_	6	track_title_3320_3320_332	574
title_40_38_	artist_62_62_62_6	8	track_title_3422_3422_3422_	475
title_366_364_	artist_20_20_20	9	track_title_7321_7321_7321_73	607
title_220_218_	artist_36_36_	11	track_title_1697_1697_1	378
title_245_243_	artist_56_56_56	1	track_title_2541_2541_254	222
title_491_489_	artist_27_27_27_2	6	track_title_2047_2047_20	482
title_324_322_	artist_51_51_51_5	7	track_title_874_874_874_87	216
title_452_450_	artist_19_19_19_1	8	track_title_6252_6252_6252	252
title_145_143_	artist_77_77_	1	track_title_2713_2713_2713_27	332
title_165_163_	artist_79_79_79_7	2	track_title_6078_6078_6078_6	146
title_487_485_	artist_4_4_4_	3	track_title_1779_1779_1779_1	520
title_145_143_	artist_77_77_	5	track_title_6710_6710_67	349
title_339_337_	artist_63_63_	6	track_title_6548_6548_6548_65	547
title_70_68_	artist_96_96_	3	track_title_4075_4075_4075	355
title_95_93_	artist_87_87_87_8	5	track_title_2160_2160_2	244
title_320_318_	artist_82_82_	6	track_title_3568_3568_3	588
title_335_333_	artist_56_56_56	10	track_title_2372_2372_2372_237	248
title_306_304_	artist_35_35_35_3	1	track_title_3099_3099_	249
title_487_485_	artist_4_4_4_	2	track_title_3394_3394_3394_3	577
title_421_419_	artist_84_84_84_8	3	track_title_3250_3250_3	140
title_138_136_	artist_6_6_6_	4	track_title_3246_3246_3246_32	440
title_115_113_	artist_78_78_78	6	track_title_3770_3770_3770_377	367
title_454_452_	artist_68_68_68_6	8	track_title_1848_1848_1848_184	216
title_168_166_	artist_77_77_	1	track_title_4708_4708_4708_4	469
title_325_323_	artist_79_79_79_7	2	track_title_6345_6345_634	576
title_313_311_	artist_58_58_	3	track_title_6344_6344_634	417
title_438_436_	artist_79_79_79_7	4	track_title_5274_5274_	444
title_104_102_	artist_43_43_43_4	10	track_title_3261_3261_3261	509
title_144_142_	artist_77_77_	3	track_title_4423_4423_4423_4	251
title_188_186_	artist_94_94_94	5	track_title_3995_3995_	244
title_230_228_	artist_75_75_75	6	track_title_1615_1615_1615	195
title_484_482_	artist_31_31_31	8	track_title_7064_7064_7064	284
title_331_329_	artist_80_80_80	1	track_title_4222_4222_42	410
title_65_63_	artist_90_90_	2	track_title_1679_1679_1679	217
title_179_177_	artist_58_58_	3	track_title_920_920_92	227
title_79_77_	artist_38_38_38_3	4	track_title_5983_5983_5983_598	189
title_450_448_	artist_91_91_91	8	track_title_4606_4606_4606	606
title_55_53_	artist_99_99_	10	track_title_618_618_618	418
title_15_13_	artist_55_55_	2	track_title_1860_1860_1860_	258
title_91_89_	artist_85_85_	4	track_title_472_472_472_472_4	195
title_476_474_	artist_13_13_13_1	5	track_title_1929_1929_1929	583
title_354_352_	artist_43_43_43_4	6	track_title_1243_1243_1243_	304
title_232_230_	artist_77_77_	2	track_title_4065_4065_4	232
title_331_329_	artist_80_80_80	11	track_title_1466_1466_1466_1	216
title_307_305_	artist_30_30_	12	track_title_4932_4932_4	577
title_144_142_	artist_77_77_	1	track_title_5756_5756_5756	188
title_237_235_	artist_2_2_2_	3	track_title_2466_2466_2466_24	169
title_374_372_	artist_12_12_12	4	track_title_1091_1091_1091_10	298
title_171_169_	artist_53_53_53	5	track_title_1085_1085_1085	227
title_508_506_	artist_87_87_87_8	6	track_title_3563_3563_3	235
title_461_459_	artist_6_6_6_	7	track_title_1657_1657_1657_16	221
title_164_162_	artist_92_92_92_9	8	track_title_2882_2882_288	570
title_28_26_	artist_67_67_67	1	track_title_6663_6663_6663_6	171
title_478_476_	artist_1_1_1_	4	track_title_4147_4147_4147_4	218
title_263_261_	artist_15_15_15	5	track_title_4485_4485_4485_4	414
title_502_500_	artist_94_94_94	6	track_title_5040_5040_5040_	248
title_418_416_	artist_54_54_54_5	7	track_title_3115_3115_3115_	271
title_346_344_	artist_7_7_7_	4	track_title_7403_7403_740	426
title_434_432_	artist_54_54_54_5	6	track_title_6538_6538_6538	421
title_163_161_	artist_80_80_80	7	track_title_789_789_789_789_	138
title_13_11_	artist_9_9_9_	9	track_title_1098_1098_1098_10	577
title_1012_1010_	artist_1_1_1_	6	track_title_2203_2203_220	181
title_327_325_	artist_49_49_49_4	1	track_title_710_710_710	199
title_400_398_	artist_24_24_24_2	3	track_title_3510_3510_3510	184
title_237_235_	artist_2_2_2_	8	track_title_1621_1621_1621_16	467
title_403_401_	artist_60_60_	7	track_title_1720_1720_	184
title_272_270_	artist_93_93_	10	track_title_2189_2189_2189_21	415
title_71_69_	artist_37_37_37	5	track_title_5247_5247_	508
title_272_270_	artist_93_93_	7	track_title_1618_1618_1618	394
title_104_102_	artist_43_43_43_4	8	track_title_827_827_827_8	557
title_264_262_	artist_13_13_13_1	9	track_title_151_151_151_151_	157
title_13_11_	artist_71_71_	3	track_title_2725_2725_2	215
title_1012_1010_	artist_51_51_51_5	1	track_title_5480_5480_5480_54	162
title_139_137_	artist_77_77_	1	track_title_6914_6914_6914_6	562
title_342_340_	artist_47_47_	3	track_title_1673_1673_1673	131
title_204_202_	artist_29_29_29	1	track_title_1015_1015_1	170
title_35_33_	artist_59_59_59	2	track_title_1539_1539_1539_153	496
title_288_286_	artist_25_25_	3	track_title_7428_7428_	496
title_118_116_	artist_51_51_51_5	5	track_title_635_635_635_635	373
title_59_57_	artist_6_6_6_	6	track_title_5801_5801_	324
title_499_497_	artist_79_79_79_7	7	track_title_5641_5641_5641_564	480
title_415_413_	artist_74_74_	11	track_title_1972_1972_1	495
title_367_365_	artist_86_86_86	4	track_title_6078_6078_6078_6	562
title_135_133_	artist_30_30_	5	track_title_59_59_59_59_5	566
title_144_142_	artist_77_77_	7	track_title_2531_2531_	408
title_501_499_	artist_50_50_50	8	track_title_4776_4776_	623
title_71_69_	artist_37_37_37	11	track_title_2912_2912_29	418
title_14_12_	artist_53_53_53	2	track_title_6470_6470_6470_	252
title_21_19_	artist_12_12_12	3	track_title_2880_2880_288	498
title_78_76_	artist_75_75_75	5	track_title_6897_6897_6	625
title_76_74_	artist_24_24_24_2	6	track_title_5625_5625_56	244
title_258_256_	artist_76_76_76_7	7	track_title_4746_4746_	419
title_162_160_	artist_17_17_	13	track_title_1569_1569_1569_156	316
title_419_417_	artist_76_76_76_7	2	track_title_2360_2360_2360_	300
title_64_62_	artist_87_87_87_8	3	track_title_7160_7160_7160_7	267
title_66_64_	artist_55_55_	4	track_title_7264_7264_7264_726	405
title_436_434_	artist_16_16_16_1	5	track_title_5652_5652_56	523
title_415_413_	artist_74_74_	7	track_title_3420_3420_3420_	559
title_221_219_	artist_12_12_12	9	track_title_1445_1445_	416
title_306_304_	artist_35_35_35_3	10	track_title_7378_7378_7378	498
title_205_203_	artist_37_37_37	12	track_title_4906_4906_4	401
title_65_63_	artist_90_90_	7	track_title_4434_4434_	438
title_53_51_	artist_70_70_70_7	4	track_title_6745_6745_67	229
title_421_419_	artist_84_84_84_8	6	track_title_7043_7043_7043_70	626
title_306_304_	artist_35_35_35_3	8	track_title_2618_2618_2618_	259
title_299_297_	artist_46_46_46_4	9	track_title_5897_5897_	179
title_415_413_	artist_74_74_	2	track_title_4894_4894_4894_489	476
title_316_314_	artist_61_61_61	4	track_title_2020_2020_2020_	135
title_259_257_	artist_70_70_70_7	5	track_title_4791_4791_4791_4	197
title_348_346_	artist_97_97_97	5	track_title_6117_6117_6117_611	534
title_302_300_	artist_85_85_	6	track_title_6684_6684_668	222
title_340_338_	artist_54_54_54_5	1	track_title_3813_3813_3	163
title_369_367_	artist_99_99_	2	track_title_4928_4928_4928_49	491
title_351_349_	artist_11_11_	4	track_title_5744_5744_5	408
title_434_432_	artist_54_54_54_5	5	track_title_4667_4667_4667	421
title_407_405_	artist_31_31_31	7	track_title_5525_5525_	467
title_442_440_	artist_47_47_	8	track_title_5768_5768_5768_57	377
title_256_254_	artist_79_79_79_7	1	track_title_6626_6626_662	528
title_123_121_	artist_26_26_26	2	track_title_6377_6377_637	225
title_118_116_	artist_51_51_51_5	4	track_title_7154_7154_715	259
title_480_478_	artist_9_9_9_	9	track_title_5466_5466_5	604
title_136_134_	artist_61_61_61	1	track_title_2386_2386_23	308
title_45_43_	artist_97_97_97	2	track_title_2020_2020_2020_	413
title_48_46_	artist_83_83_83	5	track_title_3697_3697_369	316
title_488_486_	artist_16_16_16_1	6	track_title_4619_4619_4619_46	385
title_510_508_	artist_97_97_97	7	track_title_4382_4382_4382	235
title_219_217_	artist_12_12_12	10	track_title_1285_1285_1285_128	272
title_80_78_	artist_19_19_19_1	3	track_title_1846_1846_1846_184	595
title_30_28_	artist_58_58_	4	track_title_6562_6562_6562	568
title_152_150_	artist_76_76_76_7	8	track_title_722_722_722_722_	221
title_117_115_	artist_6_6_6_	1	track_title_2632_2632_26	477
title_202_200_	artist_73_73_73_7	2	track_title_30_30_30_3	318
title_189_187_	artist_32_32_32_3	3	track_title_3349_3349_	482
title_306_304_	artist_35_35_35_3	4	track_title_7214_7214_72	625
title_420_418_	artist_79_79_79_7	8	track_title_870_870_870_870_8	204
title_294_292_	artist_88_88_	4	track_title_1474_1474_	377
title_175_173_	artist_78_78_78	5	track_title_1286_1286_1286_128	206
title_457_455_	artist_63_63_	6	track_title_1190_1190_	619
title_173_171_	artist_33_33_	7	track_title_1420_1420_142	370
title_404_402_	artist_75_75_75	8	track_title_5222_5222_522	137
title_386_384_	artist_86_86_86	9	track_title_4435_4435_	626
title_309_307_	artist_7_7_7_	1	track_title_1776_1776_1776_1	439
title_99_97_	artist_3_3_3_	2	track_title_4536_4536_45	474
title_265_263_	artist_79_79_79_7	4	track_title_175_175_175_175_1	343
title_55_53_	artist_99_99_	6	track_title_2952_2952_2952_	366
title_447_445_	artist_69_69_	6	track_title_6665_6665_6665_6	574
title_498_496_	artist_82_82_	9	track_title_4838_4838_4838_483	327
title_337_335_	artist_98_98_98_9	10	track_title_4677_4677_4677_46	627
title_118_116_	artist_51_51_51_5	2	track_title_3151_3151_3151_315	222
title_252_250_	artist_85_85_	3	track_title_216_216_216_21	544
title_136_134_	artist_61_61_61	4	track_title_6013_6013_6013_6	197
title_254_252_	artist_34_34_34	5	track_title_3650_3650_	600
title_229_227_	artist_89_89_89	9	track_title_4880_4880_4880_	492
title_209_207_	artist_75_75_75	1	track_title_4895_4895_4895_489	377
title_435_433_	artist_97_97_97	3	track_title_1441_1441_	202
title_122_120_	artist_37_37_37	4	track_title_306_306_306_306	617
title_171_169_	artist_53_53_53	8	track_title_729_729_729_7	431
title_215_213_	artist_17_17_	3	track_title_1853_1853_18	397
title_411_409_	artist_21_21_21_2	5	track_title_6826_6826_6826_68	317
title_53_51_	artist_70_70_70_7	9	track_title_3062_3062_	589
title_34_32_	artist_90_90_	9	track_title_6575_6575_6575_65	548
title_359_357_	artist_62_62_62_6	12	track_title_4791_4791_4791_4	350
title_348_346_	artist_97_97_97	4	track_title_4967_4967_4	530
title_63_61_	artist_81_81_81_8	5	track_title_3872_3872_3	479
title_475_473_	artist_27_27_27_2	6	track_title_5657_5657_56	158
title_366_364_	artist_20_20_20	8	track_title_4635_4635_4635	462
title_358_356_	artist_29_29_29	10	track_title_6851_6851_6851_68	408
title_1012_1010_	artist_51_51_51_5	2	track_title_2093_2093_2093_209	347
title_38_36_	artist_60_60_	2	track_title_7044_7044_7044_70	187
title_283_281_	artist_83_83_83	3	track_title_2935_2935_2935_293	289
title_507_505_	artist_36_36_	5	track_title_2512_2512_251	393
title_381_379_	artist_65_65_65_6	8	track_title_7283_7283_7283_	368
title_225_223_	artist_88_88_	10	track_title_4147_4147_4147_4	130
title_124_122_	artist_97_97_97	12	track_title_3165_3165_31	468
title_151_149_	artist_76_76_76_7	3	track_title_1688_1688_1688_16	403
title_372_370_	artist_43_43_43_4	4	track_title_5586_5586_	301
title_304_302_	artist_60_60_	6	track_title_3647_3647_3647_3	594
title_54_52_	artist_69_69_	8	track_title_3077_3077_307	609
title_299_297_	artist_46_46_46_4	1	track_title_2473_2473_2	131
title_289_287_	artist_72_72_72	3	track_title_4649_4649_4649_46	354
title_216_214_	artist_57_57_57_5	4	track_title_5865_5865_	332
title_64_62_	artist_87_87_87_8	5	track_title_2966_2966_2966_296	549
title_269_267_	artist_1_1_1_	6	track_title_4513_4513_4513_	496
title_326_324_	artist_18_18_18	7	track_title_124_124_12	581
title_384_382_	artist_23_23_23	2	track_title_369_369_369_369_36	479
title_505_503_	artist_14_14_	3	track_title_347_347_347	497
title_143_141_	artist_12_12_12	4	track_title_3460_3460_3460_346	198
title_52_50_	artist_66_66_	6	track_title_4079_4079_4079	612
title_290_288_	artist_27_27_27_2	7	track_title_6428_6428_6428_642	271
title_70_68_	artist_96_96_	8	track_title_6000_6000_600	607
title_470_468_	artist_16_16_16_1	9	track_title_5959_5959_5959_595	545
title_433_431_	artist_2_2_2_	2	track_title_3667_3667_366	333
title_106_104_	artist_43_43_43_4	4	track_title_5590_5590_559	277
title_494_492_	artist_19_19_19_1	5	track_title_4499_4499_	326
title_396_394_	artist_27_27_27_2	3	track_title_4146_4146_4146_4	417
title_479_477_	artist_29_29_29	4	track_title_2151_2151_2151_21	199
title_105_103_	artist_84_84_84_8	5	track_title_5849_5849_584	452
title_315_313_	artist_51_51_51_5	6	track_title_1769_1769_176	412
title_86_84_	artist_60_60_	5	track_title_4817_4817_48	178
title_298_296_	artist_6_6_6_	6	track_title_4676_4676_4676_46	440
title_444_442_	artist_94_94_94	8	track_title_1550_1550_1550_	133
title_30_28_	artist_58_58_	11	track_title_228_228_22	182
title_33_31_	artist_32_32_32_3	1	track_title_3445_3445_34	291
title_298_296_	artist_6_6_6_	4	track_title_2289_2289_	165
title_452_450_	artist_19_19_19_1	5	track_title_4521_4521_4521_452	364
title_17_15_	artist_54_54_54_5	1	track_title_6624_6624_662	131
title_169_167_	artist_96_96_	2	track_title_3537_3537_3	463
title_422_420_	artist_40_40_40_4	3	track_title_342_342_342_342_3	452
title_328_326_	artist_63_63_	4	track_title_6802_6802_6	277
title_142_140_	artist_61_61_61	1	track_title_3134_3134_31	279
title_66_64_	artist_55_55_	2	track_title_5402_5402_5	405
title_455_453_	artist_52_52_	10	track_title_2070_2070_20	242
title_270_268_	artist_20_20_20	2	track_title_2399_2399_2399_	209
title_323_321_	artist_29_29_29	4	track_title_200_200_200_	361
title_504_502_	artist_48_48_48	6	track_title_5738_5738_5738_57	367
title_202_200_	artist_73_73_73_7	8	track_title_437_437_437_	574
title_163_161_	artist_80_80_80	5	track_title_2086_2086_2086_	159
title_416_414_	artist_73_73_73_7	7	track_title_7406_7406_740	331
title_71_69_	artist_37_37_37	9	track_title_2873_2873_	294
title_13_11_	artist_4_4_4_	11	track_title_5678_5678_5678_567	617
title_391_389_	artist_15_15_15	3	track_title_4911_4911_4911	612
title_485_483_	artist_91_91_91	4	track_title_5855_5855_5855_5	458
title_260_258_	artist_47_47_	5	track_title_4586_4586_4586_458	585
title_502_500_	artist_94_94_94	7	track_title_2591_2591_	479
title_447_445_	artist_69_69_	9	track_title_1060_1060_1060_10	523
title_481_479_	artist_5_5_5_	11	track_title_5222_5222_522	355
title_433_431_	artist_2_2_2_	12	track_title_6050_6050_	349
title_137_135_	artist_99_99_	1	track_title_5028_5028_5028_502	220
title_99_97_	artist_3_3_3_	3	track_title_6866_6866_6	474
title_119_117_	artist_3_3_3_	4	track_title_3698_3698_369	521
title_194_192_	artist_35_35_35_3	6	track_title_6546_6546_6546_65	592
title_409_407_	artist_42_42_42	1	track_title_1524_1524_1524_	549
title_348_346_	artist_97_97_97	3	track_title_3628_3628_	558
title_486_484_	artist_47_47_	5	track_title_4637_4637_4637	420
title_275_273_	artist_81_81_81_8	6	track_title_30_30_30_3	165
title_434_432_	artist_54_54_54_5	8	track_title_406_406_406_406_40	379
title_395_393_	artist_60_60_	1	track_title_3138_3138_31	250
title_157_155_	artist_42_42_42	3	track_title_5649_5649_5649_564	494
title_58_56_	artist_43_43_43_4	4	track_title_6115_6115_6115_611	369
title_473_471_	artist_93_93_	5	track_title_3431_3431_3431_343	528
title_235_233_	artist_36_36_	9	track_title_4190_4190_419	579
title_383_381_	artist_94_94_94	10	track_title_3965_3965_	603
title_160_158_	artist_89_89_89	2	track_title_564_564_564_	224
title_316_314_	artist_61_61_61	3	track_title_3219_3219_3219_32	216
title_54_52_	artist_69_69_	4	track_title_200_200_200_	529
title_301_299_	artist_51_51_51_5	5	track_title_1669_1669_1	371
title_334_332_	artist_45_45_45	6	track_title_2807_2807_2807_2	148
title_84_82_	artist_84_84_84_8	2	track_title_2300_2300_2300_	496
title_114_112_	artist_35_35_35_3	9	track_title_754_754_754_754_	300
title_504_502_	artist_48_48_48	11	track_title_7374_7374_7374	172
title_234_232_	artist_40_40_40_4	1	track_title_7415_7415_7415_7	602
title_423_421_	artist_79_79_79_7	2	track_title_940_940_940_94	590
title_333_331_	artist_46_46_46_4	3	track_title_4166_4166_416	564
title_180_178_	artist_66_66_	4	track_title_591_591_591_591_59	138
title_235_233_	artist_36_36_	5	track_title_6908_6908_690	156
title_181_179_	artist_40_40_40_4	6	track_title_4997_4997_4	166
title_275_273_	artist_81_81_81_8	8	track_title_374_374_374_374_3	444
title_351_349_	artist_11_11_	9	track_title_7409_7409_740	610
title_482_480_	artist_91_91_91	11	track_title_72_72_72_72_7	390
title_320_318_	artist_82_82_	1	track_title_3603_3603_360	274
title_278_276_	artist_98_98_98_9	2	track_title_1617_1617_1617	563
title_269_267_	artist_1_1_1_	4	track_title_2993_2993_2993_299	573
title_320_318_	artist_82_82_	5	track_title_3404_3404_3404_340	342
title_43_41_	artist_34_34_34	8	track_title_2734_2734_2734	489
title_193_191_	artist_72_72_72	9	track_title_1290_1290_12	418
title_57_55_	artist_23_23_23	10	track_title_2474_2474_2	277
title_247_245_	artist_90_90_	2	track_title_4942_4942_4942	355
title_453_451_	artist_45_45_45	4	track_title_2802_2802_2802_2	270
title_149_147_	artist_50_50_50	5	track_title_4683_4683_4	602
title_98_96_	artist_80_80_80	6	track_title_200_200_200_	246
title_291_289_	artist_60_60_	5	track_title_1868_1868_1868_	529
title_447_445_	artist_69_69_	7	track_title_7160_7160_7160_7	436
title_176_174_	artist_60_60_	8	track_title_1502_1502_1502_150	569
title_425_423_	artist_34_34_34	9	track_title_3613_3613_3613_3	458
title_321_319_	artist_10_10_10_1	2	track_title_3395_3395_3395_3	311
title_278_276_	artist_98_98_98_9	3	track_title_7241_7241_72	230
title_255_253_	artist_50_50_50	4	track_title_2255_2255_	359
title_356_354_	artist_83_83_83	5	track_title_6153_6153_61	610
title_429_427_	artist_19_19_19_1	6	track_title_432_432_432_432_43	627
title_501_499_	artist_50_50_50	7	track_title_1969_1969_1969_19	383
title_324_322_	artist_51_51_51_5	9	track_title_1229_1229_1229_122	287
title_284_282_	artist_7_7_7_	11	track_title_4487_4487_4487_4	281
title_44_42_	artist_56_56_56	7	track_title_344_344_344	263
title_291_289_	artist_60_60_	8	track_title_4755_4755_475	551
title_457_455_	artist_63_63_	9	track_title_5497_5497_5	194
title_321_319_	artist_10_10_10_1	11	track_title_1919_1919_1	198
title_101_99_	artist_58_58_	1	track_title_2410_2410_2	553
title_364_362_	artist_4_4_4_	2	track_title_279_279_279_279_2	470
title_254_252_	artist_34_34_34	3	track_title_4104_4104_410	241
title_153_151_	artist_77_77_	4	track_title_7418_7418_7418_7	492
title_292_290_	artist_6_6_6_	5	track_title_3266_3266_3266	302
title_283_281_	artist_83_83_83	7	track_title_2436_2436_2436_24	535
title_444_442_	artist_94_94_94	9	track_title_7049_7049_7049_70	199
title_426_424_	artist_37_37_37	3	track_title_3767_3767_3767_	185
title_488_486_	artist_16_16_16_1	5	track_title_6258_6258_6258	443
title_98_96_	artist_80_80_80	7	track_title_7398_7398_7	312
title_83_81_	artist_53_53_53	9	track_title_1180_1180_1180_1	420
title_513_511_	artist_42_42_42	10	track_title_3895_3895_3895_38	168
title_263_261_	artist_15_15_15	11	track_title_7059_7059_7	343
title_252_250_	artist_85_85_	13	track_title_1235_1235_12	598
title_119_117_	artist_3_3_3_	1	track_title_1211_1211_1211_	357
title_262_260_	artist_29_29_29	2	track_title_1662_1662_1	503
title_147_145_	artist_20_20_20	3	track_title_3804_3804_3804_38	433
title_386_384_	artist_86_86_86	5	track_title_6883_6883_6883_68	265
title_262_260_	artist_29_29_29	6	track_title_5425_5425_5425_54	557
title_482_480_	artist_91_91_91	7	track_title_4066_4066_4	413
title_469_467_	artist_4_4_4_	8	track_title_799_799_799_799_79	463
title_364_362_	artist_4_4_4_	11	track_title_2205_2205_220	533
title_51_49_	artist_19_19_19_1	2	track_title_5290_5290_5290_5	267
title_125_123_	artist_5_5_5_	4	track_title_7072_7072_7072_70	497
title_13_11_	artist_9_9_9_	7	track_title_2511_2511_251	416
title_313_311_	artist_58_58_	7	track_title_4889_4889_4889_	237
title_415_413_	artist_74_74_	10	track_title_1049_1049_1	421
title_467_465_	artist_15_15_15	2	track_title_6873_6873_6873	478
title_454_452_	artist_68_68_68_6	6	track_title_775_775_775_775_7	522
title_341_339_	artist_45_45_45	10	track_title_3819_3819_3	208
title_450_448_	artist_91_91_91	3	track_title_5305_5305_5305_530	469
title_111_109_	artist_36_36_	4	track_title_4822_4822_4822_	602
title_274_272_	artist_2_2_2_	5	track_title_6988_6988_	579
title_33_31_	artist_32_32_32_3	7	track_title_1615_1615_1615	246
title_87_85_	artist_91_91_91	8	track_title_7262_7262_7262_726	384
title_128_126_	artist_40_40_40_4	9	track_title_2196_2196_2	602
title_286_284_	artist_94_94_94	11	track_title_4696_4696_4696	522
title_355_353_	artist_90_90_	1	track_title_7497_7497_749	298
title_485_483_	artist_91_91_91	3	track_title_737_737_737_	571
title_334_332_	artist_45_45_45	5	track_title_4563_4563_45	500
title_311_309_	artist_17_17_	7	track_title_7231_7231_7231_723	623
title_237_235_	artist_2_2_2_	10	track_title_324_324_324_324_	427
title_440_438_	artist_59_59_59	12	track_title_1286_1286_1286_128	147
title_425_423_	artist_34_34_34	1	track_title_522_522_52	196
title_35_33_	artist_59_59_59	3	track_title_683_683_683_6	214
title_157_155_	artist_42_42_42	4	track_title_7418_7418_7418_7	492
title_119_117_	artist_3_3_3_	5	track_title_1176_1176_117	541
title_505_503_	artist_14_14_	9	track_title_5498_5498_5	362
title_22_20_	artist_5_5_5_	2	track_title_4914_4914_4914	466
title_344_342_	artist_65_65_65_6	4	track_title_6102_6102_6102_	572
title_97_95_	artist_11_11_	5	track_title_2010_2010_20	612
title_441_439_	artist_37_37_37	6	track_title_2165_2165_2	150
title_21_19_	artist_12_12_12	11	track_title_1446_1446_	256
title_100_98_	artist_66_66_	1	track_title_5594_5594_559	474
title_128_126_	artist_40_40_40_4	2	track_title_3360_3360_3360_3	616
title_253_251_	artist_84_84_84_8	4	track_title_7284_7284_7284_	520
title_492_490_	artist_32_32_32_3	5	track_title_6314_6314_631	411
title_327_325_	artist_49_49_49_4	6	track_title_3942_3942_394	338
title_201_199_	artist_68_68_68_6	10	track_title_3599_3599_3	290
title_255_253_	artist_50_50_50	3	track_title_4824_4824_4824_	417
title_484_482_	artist_31_31_31	5	track_title_3156_3156_3156_315	292
title_319_317_	artist_3_3_3_	1	track_title_4493_4493_	180
title_379_377_	artist_5_5_5_	2	track_title_1726_1726_	267
title_216_214_	artist_57_57_57_5	5	track_title_3877_3877_3	139
title_485_483_	artist_91_91_91	6	track_title_2664_2664_26	135
title_299_297_	artist_46_46_46_4	7	track_title_4589_4589_4589_458	542
title_144_142_	artist_77_77_	10	track_title_4113_4113_4113_4	519
title_381_379_	artist_65_65_65_6	1	track_title_5279_5279_	483
title_358_356_	artist_29_29_29	2	track_title_1851_1851_18	295
title_192_190_	artist_54_54_54_5	3	track_title_7330_7330_7	520
title_180_178_	artist_66_66_	5	track_title_1546_1546_15	494
title_39_37_	artist_49_49_49_4	7	track_title_313_313_313_313_3	196
title_507_505_	artist_36_36_	9	track_title_1331_1331_1331	177
title_275_273_	artist_81_81_81_8	10	track_title_4808_4808_4808_480	446
title_57_55_	artist_23_23_23	11	track_title_2438_2438_2438_24	625
title_331_329_	artist_80_80_80	2	track_title_7467_7467_746	229
title_263_261_	artist_15_15_15	4	track_title_6222_6222_6222	575
title_374_372_	artist_12_12_12	5	track_title_805_805_805_805	134
title_184_182_	artist_100_100_1	7	track_title_3647_3647_3647_3	357
title_243_241_	artist_34_34_34	8	track_title_1110_1110_111	296
title_274_272_	artist_2_2_2_	10	track_title_4386_4386_4386	241
title_407_405_	artist_31_31_31	1	track_title_6525_6525_6	497
title_98_96_	artist_80_80_80	3	track_title_1475_1475_	395
title_382_380_	artist_79_79_79_7	4	track_title_3898_3898_3898_38	335
title_383_381_	artist_94_94_94	7	track_title_6062_6062_606	500
title_159_157_	artist_71_71_	8	track_title_3847_3847_3	419
title_251_249_	artist_16_16_16_1	10	track_title_1423_1423_142	619
title_169_167_	artist_96_96_	11	track_title_1272_1272_1272_	473
title_71_69_	artist_37_37_37	1	track_title_7374_7374_7374	439
title_214_212_	artist_12_12_12	2	track_title_1078_1078_1	566
title_412_410_	artist_9_9_9_	3	track_title_2794_2794_2794	403
title_32_30_	artist_21_21_21_2	4	track_title_3218_3218_3218_32	322
title_445_443_	artist_88_88_	5	track_title_5492_5492_5	203
title_508_506_	artist_87_87_87_8	7	track_title_3706_3706_3706_	604
title_196_194_	artist_66_66_	1	track_title_576_576_576_576_5	569
title_287_285_	artist_23_23_23	2	track_title_99_99_99_9	461
title_37_35_	artist_14_14_	4	track_title_3518_3518_3518	359
title_117_115_	artist_6_6_6_	5	track_title_764_764_764_764_76	558
title_391_389_	artist_15_15_15	7	track_title_2601_2601_26	211
title_214_212_	artist_12_12_12	8	track_title_6110_6110_6110_611	244
title_505_503_	artist_14_14_	1	track_title_3527_3527_3527_35	206
title_429_427_	artist_19_19_19_1	2	track_title_7265_7265_7265_726	162
title_411_409_	artist_21_21_21_2	3	track_title_4154_4154_	172
title_330_328_	artist_34_34_34	4	track_title_1981_1981_1981	229
title_215_213_	artist_17_17_	9	track_title_4649_4649_4649_46	486
title_128_126_	artist_40_40_40_4	13	track_title_6687_6687_668	523
title_275_273_	artist_81_81_81_8	1	track_title_5308_5308_5308_530	200
title_341_339_	artist_45_45_45	3	track_title_6675_6675_	609
title_195_193_	artist_26_26_26	5	track_title_1461_1461_1461_1	570
title_238_236_	artist_15_15_15	6	track_title_7075_7075_7075_70	307
title_31_29_	artist_52_52_	1	track_title_884_884_884_884_	396
title_185_183_	artist_31_31_31	6	track_title_2105_2105_2	172
title_263_261_	artist_15_15_15	8	track_title_2512_2512_251	500
title_13_11_	artist_18_18_18	1	track_title_2636_2636_26	510
title_13_11_	artist_18_18_18	4	track_title_6741_6741_67	292
title_138_136_	artist_6_6_6_	1	track_title_2254_2254_	127
title_120_118_	artist_76_76_76_7	2	track_title_1751_1751_	461
title_436_434_	artist_16_16_16_1	3	track_title_816_816_816_81	382
title_50_48_	artist_5_5_5_	4	track_title_156_156_15	520
title_353_351_	artist_8_8_8_	2	track_title_5642_5642_5642_564	439
title_172_170_	artist_16_16_16_1	3	track_title_5807_5807_	491
title_355_353_	artist_90_90_	4	track_title_6894_6894_6	263
title_315_313_	artist_51_51_51_5	5	track_title_273_273_273_273_2	183
title_385_383_	artist_49_49_49_4	6	track_title_3760_3760_3760_	293
title_176_174_	artist_60_60_	7	track_title_6165_6165_6165_	475
title_258_256_	artist_76_76_76_7	8	track_title_6156_6156_61	391
title_155_153_	artist_33_33_	1	track_title_5682_5682_56	331
title_337_335_	artist_98_98_98_9	3	track_title_7355_7355_7355_73	287
title_348_346_	artist_97_97_97	6	track_title_5689_5689_56	234
title_341_339_	artist_45_45_45	8	track_title_6034_6034_603	385
title_317_315_	artist_46_46_46_4	9	track_title_4349_4349_4	491
title_151_149_	artist_76_76_76_7	1	track_title_5145_5145_5145_51	478
title_39_37_	artist_49_49_49_4	2	track_title_3159_3159_3159_315	577
title_439_437_	artist_87_87_87_8	4	track_title_2387_2387_23	403
title_298_296_	artist_6_6_6_	5	track_title_4135_4135_413	591
title_99_97_	artist_3_3_3_	7	track_title_4015_4015_4015	569
title_30_28_	artist_58_58_	8	track_title_1123_1123_1123_1	515
title_144_142_	artist_77_77_	5	track_title_1662_1662_1	341
title_313_311_	artist_58_58_	6	track_title_494_494_494_494	179
title_199_197_	artist_74_74_	4	track_title_1639_1639_1	578
title_505_503_	artist_14_14_	4	track_title_172_172_172_172_1	233
title_384_382_	artist_23_23_23	5	track_title_2842_2842_	161
title_228_226_	artist_65_65_65_6	6	track_title_3750_3750_37	327
title_215_213_	artist_17_17_	8	track_title_910_910_910_910_9	164
title_278_276_	artist_98_98_98_9	9	track_title_5717_5717_5	534
title_423_421_	artist_79_79_79_7	1	track_title_5021_5021_5021_502	368
title_57_55_	artist_23_23_23	3	track_title_5864_5864_	388
title_487_485_	artist_4_4_4_	5	track_title_3972_3972_397	146
title_226_224_	artist_73_73_73_7	6	track_title_7296_7296_7296_729	360
title_114_112_	artist_35_35_35_3	8	track_title_422_422_422_422_	234
title_303_301_	artist_59_59_59	9	track_title_6743_6743_67	390
title_308_306_	artist_11_11_	11	track_title_1232_1232_12	185
title_314_312_	artist_32_32_32_3	1	track_title_2091_2091_2091_209	553
title_167_165_	artist_52_52_	8	track_title_4311_4311_4	467
title_375_373_	artist_34_34_34	2	track_title_5761_5761_5761_57	322
title_480_478_	artist_9_9_9_	4	track_title_6490_6490_64	251
title_27_25_	artist_98_98_98_9	5	track_title_5604_5604_5604_	271
title_409_407_	artist_42_42_42	8	track_title_2179_2179_2179	257
title_307_305_	artist_30_30_	10	track_title_4572_4572_4572_	418
title_159_157_	artist_71_71_	2	track_title_6512_6512_6512_65	203
title_471_469_	artist_41_41_	3	track_title_1350_1350_1	414
title_104_102_	artist_43_43_43_4	5	track_title_1542_1542_15	536
title_402_400_	artist_72_72_72	7	track_title_4854_4854_4854_	625
title_154_152_	artist_76_76_76_7	11	track_title_351_351_351_3	488
title_13_11_	artist_33_33_	5	track_title_6189_6189_61	426
title_390_388_	artist_76_76_76_7	1	track_title_3855_3855_3855	263
title_234_232_	artist_40_40_40_4	2	track_title_2167_2167_2	568
title_498_496_	artist_82_82_	6	track_title_6468_6468_64	275
title_476_474_	artist_13_13_13_1	7	track_title_3321_3321_332	289
title_507_505_	artist_36_36_	8	track_title_4047_4047_4047	417
title_363_361_	artist_56_56_56	1	track_title_4538_4538_45	476
title_177_175_	artist_25_25_	2	track_title_7430_7430_743	535
title_342_340_	artist_47_47_	6	track_title_3422_3422_3422_	285
title_213_211_	artist_23_23_23	7	track_title_6976_6976_6976_6	191
title_440_438_	artist_59_59_59	8	track_title_6529_6529_6	217
title_152_150_	artist_76_76_76_7	10	track_title_3194_3194_31	183
title_455_453_	artist_52_52_	2	track_title_3599_3599_3	480
title_78_76_	artist_75_75_75	3	track_title_1304_1304_1304	209
title_413_411_	artist_62_62_62_6	5	track_title_2222_2222_	209
title_386_384_	artist_86_86_86	10	track_title_3004_3004_	613
title_421_419_	artist_84_84_84_8	5	track_title_6599_6599_6599	565
title_388_386_	artist_81_81_81_8	6	track_title_1558_1558_1558_	597
title_36_34_	artist_38_38_38_3	7	track_title_5017_5017_5017_	474
title_508_506_	artist_87_87_87_8	2	track_title_4195_4195_419	240
title_39_37_	artist_49_49_49_4	3	track_title_3752_3752_37	541
title_124_122_	artist_97_97_97	4	track_title_7126_7126_712	287
title_511_509_	artist_14_14_	5	track_title_3865_3865_3865_38	576
title_67_65_	artist_85_85_	6	track_title_5082_5082_5082_508	575
title_297_295_	artist_34_34_34	1	track_title_2502_2502_	439
title_176_174_	artist_60_60_	2	track_title_5239_5239_5239_5	352
title_190_188_	artist_95_95_95_9	3	track_title_4769_4769_4769_4	196
title_76_74_	artist_24_24_24_2	4	track_title_6315_6315_631	418
title_33_31_	artist_32_32_32_3	5	track_title_4521_4521_4521_452	301
title_126_124_	artist_70_70_70_7	7	track_title_3400_3400_3400_340	416
title_355_353_	artist_90_90_	9	track_title_5944_5944_5944_	436
title_275_273_	artist_81_81_81_8	11	track_title_2771_2771_2771_27	260
title_13_11_	artist_8_8_8_	6	track_title_3274_3274_3274_32	384
title_402_400_	artist_72_72_72	1	track_title_4979_4979_4979	424
title_452_450_	artist_19_19_19_1	3	track_title_6505_6505_6505	421
title_497_495_	artist_46_46_46_4	4	track_title_6401_6401_64	237
title_247_245_	artist_90_90_	5	track_title_6006_6006_600	191
title_210_208_	artist_59_59_59	8	track_title_3215_3215_3215_32	508
title_274_272_	artist_2_2_2_	9	track_title_4506_4506_45	446
title_447_445_	artist_69_69_	2	track_title_4750_4750_475	432
title_309_307_	artist_7_7_7_	3	track_title_1198_1198_	590
title_159_157_	artist_71_71_	4	track_title_4487_4487_4487_4	430
title_421_419_	artist_84_84_84_8	8	track_title_2186_2186_2186_21	542
title_311_309_	artist_17_17_	10	track_title_6165_6165_6165_	161
title_324_322_	artist_51_51_51_5	12	track_title_4966_4966_4	245
title_314_312_	artist_32_32_32_3	2	track_title_2513_2513_251	600
title_20_18_	artist_54_54_54_5	6	track_title_3670_3670_3670_3	370
title_218_216_	artist_49_49_49_4	7	track_title_5783_5783_5783	436
title_26_24_	artist_60_60_	10	track_title_3408_3408_3408_340	275
title_34_32_	artist_90_90_	1	track_title_7110_7110_	316
title_70_68_	artist_96_96_	2	track_title_1617_1617_1617	376
title_137_135_	artist_99_99_	4	track_title_5843_5843_584	194
title_364_362_	artist_4_4_4_	6	track_title_722_722_722_722_	312
title_458_456_	artist_41_41_	10	track_title_4342_4342_4	469
title_291_289_	artist_60_60_	3	track_title_1713_1713_1713_1	281
title_327_325_	artist_49_49_49_4	4	track_title_2101_2101_2	410
title_233_231_	artist_22_22_	7	track_title_4418_4418_441	329
title_348_346_	artist_97_97_97	9	track_title_6424_6424_6424_642	132
title_364_362_	artist_4_4_4_	1	track_title_6914_6914_6914_6	240
title_365_363_	artist_51_51_51_5	3	track_title_3668_3668_366	190
title_42_40_	artist_51_51_51_5	4	track_title_5096_5096_50	158
title_457_455_	artist_63_63_	5	track_title_178_178_178_178_1	246
title_297_295_	artist_34_34_34	2	track_title_1969_1969_1969_19	429
title_64_62_	artist_87_87_87_8	7	track_title_1791_1791_179	347
title_348_346_	artist_97_97_97	10	track_title_6769_6769_6769_676	341
title_337_335_	artist_98_98_98_9	1	track_title_5736_5736_5736_57	612
title_449_447_	artist_1_1_1_	12	track_title_6870_6870_6870	350
title_455_453_	artist_52_52_	1	track_title_827_827_827_8	262
title_263_261_	artist_15_15_15	2	track_title_307_307_307_	151
title_327_325_	artist_49_49_49_4	3	track_title_3943_3943_394	555
title_331_329_	artist_80_80_80	4	track_title_6760_6760_6760_676	182
title_230_228_	artist_75_75_75	1	track_title_5679_5679_5679_567	249
title_235_233_	artist_36_36_	2	track_title_4523_4523_4523_452	353
title_361_359_	artist_23_23_23	3	track_title_4183_4183_	149
title_139_137_	artist_77_77_	4	track_title_4960_4960_4	254
title_444_442_	artist_94_94_94	6	track_title_6272_6272_6	290
title_250_248_	artist_18_18_18	2	track_title_4969_4969_4	476
title_129_127_	artist_84_84_84_8	3	track_title_6658_6658_665	314
title_231_229_	artist_83_83_83	4	track_title_4309_4309_4309_43	552
title_42_40_	artist_51_51_51_5	5	track_title_195_195_195_	239
title_136_134_	artist_61_61_61	12	track_title_2071_2071_20	376
title_364_362_	artist_4_4_4_	10	track_title_2240_2240_2240_2	242
title_13_11_	artist_4_4_4_	1	track_title_6824_6824_6824_68	355
title_419_417_	artist_76_76_76_7	1	track_title_943_943_943_94	476
title_307_305_	artist_30_30_	4	track_title_3229_3229_3	583
title_461_459_	artist_6_6_6_	5	track_title_1102_1102_	525
title_376_374_	artist_30_30_	6	track_title_1707_1707_170	377
title_79_77_	artist_38_38_38_3	8	track_title_7081_7081_7	461
title_434_432_	artist_54_54_54_5	12	track_title_4236_4236_4236_	375
title_325_323_	artist_79_79_79_7	3	track_title_4720_4720_472	494
title_225_223_	artist_88_88_	4	track_title_4464_4464_	467
title_176_174_	artist_60_60_	5	track_title_3194_3194_31	370
title_376_374_	artist_30_30_	7	track_title_4831_4831_4831_483	554
title_128_126_	artist_40_40_40_4	3	track_title_5163_5163_5163	533
title_450_448_	artist_91_91_91	6	track_title_6627_6627_662	344
title_513_511_	artist_42_42_42	7	track_title_368_368_368_	279
title_115_113_	artist_78_78_78	1	track_title_4431_4431_	590
title_493_491_	artist_49_49_49_4	3	track_title_2612_2612_2612_	381
title_469_467_	artist_4_4_4_	4	track_title_6485_6485_6485_648	431
title_456_454_	artist_5_5_5_	6	track_title_449_449_449_449_4	594
title_279_277_	artist_61_61_61	7	track_title_7364_7364_7	303
title_116_114_	artist_92_92_92_9	3	track_title_3565_3565_3	405
title_279_277_	artist_61_61_61	4	track_title_6575_6575_6575_65	446
title_59_57_	artist_6_6_6_	5	track_title_5557_5557_	347
title_74_72_	artist_21_21_21_2	7	track_title_465_465_465_465	483
title_428_426_	artist_11_11_	7	track_title_6450_6450_6450_645	610
title_244_242_	artist_47_47_	1	track_title_203_203_203_	224
title_30_28_	artist_58_58_	3	track_title_875_875_875	379
title_310_308_	artist_69_69_	4	track_title_7383_7383_7383_73	174
title_233_231_	artist_22_22_	5	track_title_3620_3620_	585
title_444_442_	artist_94_94_94	3	track_title_2559_2559_2559_2	597
title_251_249_	artist_16_16_16_1	4	track_title_2561_2561_	265
title_199_197_	artist_74_74_	5	track_title_1487_1487_148	571
title_96_94_	artist_93_93_	7	track_title_3299_3299_3299	366
title_324_322_	artist_51_51_51_5	10	track_title_7285_7285_7285_	179
title_465_463_	artist_59_59_59	11	track_title_2656_2656_2656_265	364
title_248_246_	artist_47_47_	1	track_title_5409_5409_5	167
title_289_287_	artist_72_72_72	2	track_title_5293_5293_5293_5	234
title_509_507_	artist_73_73_73_7	3	track_title_1520_1520_1520_	187
title_112_110_	artist_49_49_49_4	6	track_title_2695_2695_26	584
title_53_51_	artist_70_70_70_7	7	track_title_7257_7257_7257_	536
title_221_219_	artist_12_12_12	5	track_title_3371_3371_	276
title_462_460_	artist_80_80_80	1	track_title_3838_3838_3838_38	237
title_125_123_	artist_5_5_5_	3	track_title_5802_5802_	460
title_311_309_	artist_17_17_	11	track_title_3168_3168_31	370
title_474_472_	artist_59_59_59	2	track_title_797_797_797_797	150
title_41_39_	artist_46_46_46_4	3	track_title_408_408_408_	418
title_122_120_	artist_37_37_37	5	track_title_6562_6562_6562	251
title_161_159_	artist_36_36_	6	track_title_4769_4769_4769_4	134
title_320_318_	artist_82_82_	11	track_title_4790_4790_4790_4	235
title_101_99_	artist_58_58_	5	track_title_1139_1139_	141
title_236_234_	artist_52_52_	7	track_title_14_14_14_1	615
title_13_11_	artist_9_9_9_	1	track_title_5586_5586_	393
title_500_498_	artist_72_72_72	2	track_title_6348_6348_634	563
title_34_32_	artist_90_90_	3	track_title_6663_6663_6663_6	362
title_500_498_	artist_72_72_72	5	track_title_3277_3277_3277_32	599
title_258_256_	artist_76_76_76_7	6	track_title_5627_5627_56	403
title_206_204_	artist_20_20_20	10	track_title_2362_2362_2362_	237
title_156_154_	artist_27_27_27_2	4	track_title_6566_6566_6566	506
title_435_433_	artist_97_97_97	6	track_title_6261_6261_6261_62	341
title_32_30_	artist_21_21_21_2	9	track_title_2699_2699_26	419
title_210_208_	artist_59_59_59	2	track_title_3040_3040_304	583
title_471_469_	artist_41_41_	4	track_title_4624_4624_4	166
title_133_131_	artist_98_98_98_9	5	track_title_2325_2325_23	356
title_258_256_	artist_76_76_76_7	2	track_title_4839_4839_4839_483	294
title_198_196_	artist_32_32_32_3	3	track_title_290_290_290_	160
title_335_333_	artist_56_56_56	4	track_title_291_291_291_291_29	423
title_495_493_	artist_35_35_35_3	7	track_title_6546_6546_6546_65	462
title_317_315_	artist_46_46_46_4	1	track_title_5852_5852_5852_5	361
title_243_241_	artist_34_34_34	3	track_title_2312_2312_2312_231	326
title_205_203_	artist_37_37_37	4	track_title_4801_4801_4801_480	415
title_218_216_	artist_49_49_49_4	5	track_title_5759_5759_5759	251
title_93_91_	artist_92_92_92_9	3	track_title_1146_1146_114	422
title_156_154_	artist_27_27_27_2	5	track_title_2438_2438_2438_24	430
title_366_364_	artist_20_20_20	6	track_title_3986_3986_3986_3	448
title_57_55_	artist_23_23_23	7	track_title_6787_6787_6787_	152
title_483_481_	artist_61_61_61	2	track_title_5555_5555_	551
title_64_62_	artist_87_87_87_8	8	track_title_7417_7417_7417_7	482
title_94_92_	artist_93_93_	11	track_title_7240_7240_72	240
title_140_138_	artist_80_80_80	1	track_title_5293_5293_5293_5	536
title_402_400_	artist_72_72_72	4	track_title_4762_4762_4762_4	290
title_266_264_	artist_85_85_	5	track_title_4043_4043_4043	295
title_457_455_	artist_63_63_	8	track_title_2270_2270_2270_2	388
title_44_42_	artist_56_56_56	13	track_title_3897_3897_3897_38	573
title_329_327_	artist_20_20_20	2	track_title_2861_2861_2861_2	524
title_99_97_	artist_3_3_3_	4	track_title_2636_2636_26	323
title_424_422_	artist_17_17_	5	track_title_692_692_692_692_69	256
title_168_166_	artist_77_77_	7	track_title_6558_6558_6	321
title_464_462_	artist_88_88_	2	track_title_5659_5659_56	425
title_364_362_	artist_4_4_4_	4	track_title_5899_5899_	424
title_449_447_	artist_1_1_1_	6	track_title_4355_4355_4355	515
title_139_137_	artist_77_77_	2	track_title_1448_1448_	160
title_172_170_	artist_16_16_16_1	4	track_title_247_247_247_247_2	612
title_448_446_	artist_34_34_34	7	track_title_6662_6662_6662_6	615
title_348_346_	artist_97_97_97	8	track_title_6832_6832_6	211
title_182_180_	artist_9_9_9_	1	track_title_5554_5554_	516
title_112_110_	artist_49_49_49_4	2	track_title_4872_4872_48	395
title_350_348_	artist_31_31_31	3	track_title_2886_2886_288	572
title_356_354_	artist_83_83_83	6	track_title_5712_5712_5	464
title_344_342_	artist_65_65_65_6	7	track_title_2743_2743_2743_27	282
title_434_432_	artist_54_54_54_5	9	track_title_3683_3683_	149
title_302_300_	artist_85_85_	5	track_title_197_197_197_197	538
title_267_265_	artist_23_23_23	8	track_title_6957_6957_	385
title_450_448_	artist_91_91_91	9	track_title_1921_1921_1921	575
title_356_354_	artist_83_83_83	1	track_title_782_782_78	555
title_197_195_	artist_5_5_5_	2	track_title_5179_5179_5179_51	151
title_168_166_	artist_77_77_	9	track_title_6189_6189_61	238
title_110_108_	artist_69_69_	10	track_title_2923_2923_2923_	439
title_230_228_	artist_75_75_75	11	track_title_3611_3611_3611_3	189
title_148_146_	artist_67_67_67	5	track_title_158_158_158_1	253
title_67_65_	artist_85_85_	7	track_title_2988_2988_2988_	280
title_99_97_	artist_3_3_3_	8	track_title_7212_7212_72	626
title_401_399_	artist_37_37_37	9	track_title_2812_2812_	554
title_13_11_	artist_18_18_18	8	track_title_3671_3671_3671_3	429
title_217_215_	artist_20_20_20	2	track_title_759_759_75	468
title_71_69_	artist_37_37_37	4	track_title_6231_6231_6231_62	320
title_343_341_	artist_66_66_	5	track_title_1029_1029_1029	385
title_252_250_	artist_85_85_	6	track_title_5637_5637_5637_	546
title_221_219_	artist_12_12_12	7	track_title_631_631_631_631_63	519
title_495_493_	artist_35_35_35_3	11	track_title_5429_5429_5429_54	192
title_185_183_	artist_31_31_31	1	track_title_2667_2667_26	384
title_269_267_	artist_1_1_1_	3	track_title_1480_1480_148	436
title_159_157_	artist_71_71_	5	track_title_7171_7171_	571
title_359_357_	artist_62_62_62_6	9	track_title_1091_1091_1091_10	277
title_158_156_	artist_29_29_29	10	track_title_3901_3901_	627
title_20_18_	artist_54_54_54_5	11	track_title_3059_3059_3059_3	340
title_482_480_	artist_91_91_91	5	track_title_456_456_45	362
title_394_392_	artist_92_92_92_9	2	track_title_7179_7179_	352
title_82_80_	artist_98_98_98_9	5	track_title_202_202_202_202	198
title_442_440_	artist_47_47_	9	track_title_4926_4926_4926_49	210
title_25_23_	artist_5_5_5_	11	track_title_4139_4139_413	540
title_328_326_	artist_63_63_	5	track_title_6283_6283_6283	133
title_399_397_	artist_15_15_15	7	track_title_4356_4356_4356	538
title_72_70_	artist_97_97_97	8	track_title_5851_5851_5851_5	470
title_118_116_	artist_51_51_51_5	10	track_title_3448_3448_34	155
title_72_70_	artist_97_97_97	2	track_title_888_888_888_8	138
title_78_76_	artist_75_75_75	6	track_title_3650_3650_	474
title_209_207_	artist_75_75_75	10	track_title_6677_6677_	361
title_410_408_	artist_93_93_	1	track_title_1285_1285_1285_128	205
title_22_20_	artist_5_5_5_	3	track_title_7113_7113_	185
title_209_207_	artist_75_75_75	7	track_title_6426_6426_6426_642	279
title_192_190_	artist_54_54_54_5	8	track_title_7180_7180_718	205
title_281_279_	artist_7_7_7_	12	track_title_596_596_596_	418
title_107_105_	artist_29_29_29	1	track_title_4766_4766_4766_4	589
title_433_431_	artist_2_2_2_	4	track_title_865_865_865_865_86	539
title_106_104_	artist_43_43_43_4	7	track_title_1099_1099_1099_10	449
title_13_11_	artist_33_33_	2	track_title_2466_2466_2466_24	278
title_355_353_	artist_90_90_	11	track_title_2281_2281_	339
title_283_281_	artist_83_83_83	12	track_title_351_351_351_3	437
title_128_126_	artist_40_40_40_4	1	track_title_6043_6043_6043_6	143
title_354_352_	artist_43_43_43_4	2	track_title_5480_5480_5480_54	619
title_75_73_	artist_1_1_1_	3	track_title_2079_2079_20	160
title_98_96_	artist_80_80_80	4	track_title_7446_7446_7446_7	386
title_121_119_	artist_87_87_87_8	5	track_title_1842_1842_1842_184	421
title_368_366_	artist_3_3_3_	2	track_title_4713_4713_	284
title_502_500_	artist_94_94_94	4	track_title_3990_3990_	390
title_501_499_	artist_50_50_50	5	track_title_5214_5214_	153
title_503_501_	artist_96_96_	6	track_title_152_152_152_1	211
title_63_61_	artist_81_81_81_8	7	track_title_21_21_21_21_21_2	625
title_455_453_	artist_52_52_	8	track_title_768_768_768_768	527
title_114_112_	artist_35_35_35_3	1	track_title_148_148_148	421
title_476_474_	artist_13_13_13_1	4	track_title_4616_4616_4616_46	212
title_244_242_	artist_47_47_	6	track_title_7305_7305_7	196
title_484_482_	artist_31_31_31	7	track_title_2803_2803_2803_2	186
title_233_231_	artist_22_22_	8	track_title_1612_1612_1612	192
title_219_217_	artist_12_12_12	9	track_title_4535_4535_45	557
title_513_511_	artist_42_42_42	12	track_title_2092_2092_2092_209	127
title_442_440_	artist_47_47_	1	track_title_1701_1701_170	584
title_344_342_	artist_65_65_65_6	3	track_title_306_306_306_306	293
title_503_501_	artist_96_96_	4	track_title_5509_5509_550	340
title_35_33_	artist_59_59_59	5	track_title_2997_2997_2997_299	554
title_169_167_	artist_96_96_	10	track_title_5410_5410_5410	128
title_94_92_	artist_93_93_	12	track_title_6516_6516_6516_65	380
title_358_356_	artist_29_29_29	1	track_title_6782_6782_6782_	207
title_228_226_	artist_65_65_65_6	4	track_title_2373_2373_2373_237	248
title_173_171_	artist_33_33_	8	track_title_4262_4262_4262_	213
title_382_380_	artist_79_79_79_7	9	track_title_7224_7224_7224_	624
title_161_159_	artist_36_36_	1	track_title_1878_1878_1878_187	168
title_47_45_	artist_46_46_46_4	3	track_title_2107_2107_2	273
title_352_350_	artist_70_70_70_7	4	track_title_1304_1304_1304	358
title_490_488_	artist_51_51_51_5	9	track_title_5447_5447_5447	227
title_58_56_	artist_43_43_43_4	2	track_title_5734_5734_5734_57	323
title_187_185_	artist_82_82_	7	track_title_7001_7001_7001	608
title_285_283_	artist_8_8_8_	1	track_title_2846_2846_	347
title_34_32_	artist_90_90_	2	track_title_2227_2227_	344
title_322_320_	artist_98_98_98_9	4	track_title_2300_2300_2300_	234
title_398_396_	artist_22_22_	6	track_title_2693_2693_26	249
title_287_285_	artist_23_23_23	11	track_title_999_999_999_999	208
title_485_483_	artist_91_91_91	5	track_title_6444_6444_6444_	375
title_229_227_	artist_89_89_89	7	track_title_6876_6876_6876	259
title_387_385_	artist_57_57_57_5	3	track_title_650_650_650_650_	152
title_296_294_	artist_11_11_	6	track_title_3736_3736_3736_	495
title_482_480_	artist_91_91_91	9	track_title_6171_6171_6171_617	620
title_140_138_	artist_80_80_80	12	track_title_3870_3870_3	623
title_486_484_	artist_47_47_	1	track_title_1578_1578_15	534
title_451_449_	artist_30_30_	3	track_title_6524_6524_6	578
title_25_23_	artist_5_5_5_	4	track_title_4303_4303_4303_43	598
title_493_491_	artist_49_49_49_4	5	track_title_5221_5221_522	370
title_473_471_	artist_93_93_	6	track_title_7195_7195_7195_7	598
title_92_90_	artist_79_79_79_7	7	track_title_321_321_321_321_	612
title_59_57_	artist_6_6_6_	4	track_title_7033_7033_7033	405
title_420_418_	artist_79_79_79_7	12	track_title_3156_3156_3156_315	580
title_350_348_	artist_31_31_31	4	track_title_7435_7435_743	449
title_215_213_	artist_17_17_	7	track_title_1671_1671_1671	165
title_13_11_	artist_18_18_18	3	track_title_5541_5541_5541_5	534
title_72_70_	artist_97_97_97	1	track_title_5738_5738_5738_57	344
title_43_41_	artist_34_34_34	4	track_title_4727_4727_472	621
title_458_456_	artist_41_41_	5	track_title_5614_5614_5614_561	467
title_190_188_	artist_95_95_95_9	10	track_title_5185_5185_5	229
title_385_383_	artist_49_49_49_4	5	track_title_3102_3102_31	626
title_191_189_	artist_3_3_3_	7	track_title_5817_5817_581	452
title_189_187_	artist_32_32_32_3	10	track_title_3096_3096_	501
title_222_220_	artist_78_78_78	2	track_title_7305_7305_7	278
title_422_420_	artist_40_40_40_4	4	track_title_3466_3466_3466_346	370
title_475_473_	artist_27_27_27_2	5	track_title_403_403_403_403_40	497
title_96_94_	artist_93_93_	6	track_title_7117_7117_	231
title_425_423_	artist_34_34_34	8	track_title_5026_5026_5026_502	336
title_304_302_	artist_60_60_	1	track_title_2828_2828_282	407
title_371_369_	artist_20_20_20	3	track_title_873_873_873_873_8	418
title_177_175_	artist_25_25_	7	track_title_15_15_15_15_1	328
title_190_188_	artist_95_95_95_9	1	track_title_1606_1606_1	584
title_440_438_	artist_59_59_59	2	track_title_4761_4761_4761_4	245
title_381_379_	artist_65_65_65_6	6	track_title_5794_5794_5794_57	224
title_145_143_	artist_77_77_	8	track_title_801_801_801_801_80	288
title_485_483_	artist_91_91_91	2	track_title_5829_5829_5829_5	187
title_340_338_	artist_54_54_54_5	3	track_title_2358_2358_23	573
title_257_255_	artist_71_71_	4	track_title_784_784_784_7	326
title_337_335_	artist_98_98_98_9	11	track_title_5407_5407_5	258
title_385_383_	artist_49_49_49_4	1	track_title_2509_2509_	160
title_134_132_	artist_46_46_46_4	2	track_title_2039_2039_2039_203	468
title_97_95_	artist_11_11_	3	track_title_6757_6757_6757_	498
title_356_354_	artist_83_83_83	7	track_title_7156_7156_715	622
title_137_135_	artist_99_99_	9	track_title_6527_6527_6	464
title_148_146_	artist_67_67_67	1	track_title_4426_4426_4426_4	277
title_274_272_	artist_2_2_2_	4	track_title_5070_5070_5070_	515
title_449_447_	artist_1_1_1_	8	track_title_5417_5417_5417	495
title_77_75_	artist_87_87_87_8	3	track_title_5728_5728_5728	315
title_146_144_	artist_85_85_	4	track_title_6445_6445_6445_	522
title_430_428_	artist_36_36_	5	track_title_1768_1768_176	399
title_161_159_	artist_36_36_	7	track_title_3221_3221_3	214
title_213_211_	artist_23_23_23	8	track_title_1037_1037_1037_10	364
title_143_141_	artist_12_12_12	5	track_title_1544_1544_15	422
title_58_56_	artist_43_43_43_4	8	track_title_278_278_278	238
title_376_374_	artist_30_30_	10	track_title_7415_7415_7415_7	142
title_77_75_	artist_87_87_87_8	5	track_title_2564_2564_	240
title_301_299_	artist_51_51_51_5	7	track_title_1938_1938_1938_19	504
title_435_433_	artist_97_97_97	8	track_title_7373_7373_7373	289
title_76_74_	artist_24_24_24_2	10	track_title_1550_1550_1550_	558
title_13_11_	artist_4_4_4_	6	track_title_4272_4272_4272_427	543
title_261_259_	artist_42_42_42	4	track_title_7124_7124_712	417
title_299_297_	artist_46_46_46_4	5	track_title_598_598_598_598	167
title_433_431_	artist_2_2_2_	9	track_title_5014_5014_5014_	181
title_13_11_	artist_33_33_	6	track_title_3100_3100_31	433
title_154_152_	artist_76_76_76_7	6	track_title_3713_3713_3713_371	394
title_406_404_	artist_47_47_	7	track_title_1791_1791_179	544
title_381_379_	artist_65_65_65_6	5	track_title_1146_1146_114	535
title_39_37_	artist_49_49_49_4	6	track_title_1708_1708_170	618
title_50_48_	artist_5_5_5_	1	track_title_3289_3289_3	335
title_52_50_	artist_66_66_	3	track_title_539_539_539_539_53	568
title_339_337_	artist_63_63_	4	track_title_4962_4962_4	616
title_252_250_	artist_85_85_	5	track_title_4131_4131_413	594
title_361_359_	artist_23_23_23	8	track_title_4115_4115_4115_4	152
title_278_276_	artist_98_98_98_9	10	track_title_6687_6687_668	528
title_162_160_	artist_17_17_	3	track_title_1430_1430_1430_1	403
title_88_86_	artist_49_49_49_4	8	track_title_6688_6688_668	401
title_303_301_	artist_59_59_59	5	track_title_7304_7304_7	606
title_211_209_	artist_20_20_20	6	track_title_3406_3406_3406_340	445
title_336_334_	artist_54_54_54_5	9	track_title_518_518_518_518_5	326
title_210_208_	artist_59_59_59	10	track_title_3482_3482_3482_	501
title_89_87_	artist_40_40_40_4	1	track_title_7141_7141_	279
title_217_215_	artist_20_20_20	3	track_title_5529_5529_	216
title_405_403_	artist_60_60_	6	track_title_1204_1204_12	130
title_462_460_	artist_80_80_80	11	track_title_500_500_500_	445
title_187_185_	artist_82_82_	1	track_title_4936_4936_4	293
title_414_412_	artist_60_60_	5	track_title_4188_4188_	425
title_503_501_	artist_96_96_	2	track_title_1524_1524_1524_	625
title_292_290_	artist_6_6_6_	3	track_title_1673_1673_1673	178
title_214_212_	artist_12_12_12	5	track_title_4439_4439_	304
title_62_60_	artist_26_26_26	6	track_title_6242_6242_6	332
title_212_210_	artist_42_42_42	7	track_title_3626_3626_	367
title_25_23_	artist_5_5_5_	10	track_title_2978_2978_29	131
title_414_412_	artist_60_60_	7	track_title_2832_2832_2832_2	544
title_334_332_	artist_45_45_45	9	track_title_3709_3709_3709_	316
title_406_404_	artist_47_47_	1	track_title_1614_1614_1614	563
title_511_509_	artist_14_14_	6	track_title_346_346_346_34	295
title_72_70_	artist_97_97_97	9	track_title_2778_2778_2778_27	211
title_465_463_	artist_59_59_59	10	track_title_6375_6375_637	330
title_136_134_	artist_61_61_61	13	track_title_612_612_612	343
title_249_247_	artist_27_27_27_2	2	track_title_3359_3359_335	521
title_248_246_	artist_47_47_	3	track_title_3514_3514_3514	422
title_426_424_	artist_37_37_37	4	track_title_5913_5913_5913_	311
title_22_20_	artist_5_5_5_	6	track_title_3631_3631_363	296
title_347_345_	artist_71_71_	8	track_title_807_807_807_807_80	349
title_61_59_	artist_62_62_62_6	9	track_title_783_783_783_783_	504
title_422_420_	artist_40_40_40_4	1	track_title_2901_2901_2901_290	300
title_398_396_	artist_22_22_	2	track_title_6025_6025_	368
title_460_458_	artist_76_76_76_7	7	track_title_5350_5350_5350_	299
title_169_167_	artist_96_96_	1	track_title_4479_4479_447	272
title_164_162_	artist_92_92_92_9	3	track_title_1695_1695_1	257
title_325_323_	artist_79_79_79_7	5	track_title_5921_5921_5921_592	537
title_63_61_	artist_81_81_81_8	9	track_title_5818_5818_581	523
title_142_140_	artist_61_61_61	10	track_title_3815_3815_3	269
title_281_279_	artist_7_7_7_	8	track_title_399_399_399_399	619
title_465_463_	artist_59_59_59	9	track_title_3908_3908_	532
title_44_42_	artist_56_56_56	10	track_title_6606_6606_6606_6	327
title_186_184_	artist_2_2_2_	1	track_title_187_187_187_1	141
title_178_176_	artist_91_91_91	3	track_title_6101_6101_6101_	391
title_188_186_	artist_94_94_94	4	track_title_7031_7031_7031	339
title_13_11_	artist_18_18_18	7	track_title_312_312_312	327
title_483_481_	artist_61_61_61	6	track_title_194_194_194_194	391
title_54_52_	artist_69_69_	7	track_title_3219_3219_3219_32	585
title_110_108_	artist_69_69_	8	track_title_386_386_386_3	408
title_279_277_	artist_61_61_61	11	track_title_5243_5243_	369
title_207_205_	artist_1_1_1_	13	track_title_3947_3947_394	149
title_405_403_	artist_60_60_	2	track_title_1536_1536_1536_153	389
title_477_475_	artist_13_13_13_1	13	track_title_2151_2151_2151_21	576
title_317_315_	artist_46_46_46_4	2	track_title_7179_7179_	313
title_92_90_	artist_79_79_79_7	3	track_title_5757_5757_5757	447
title_202_200_	artist_73_73_73_7	4	track_title_7251_7251_7251_	253
title_74_72_	artist_21_21_21_2	2	track_title_924_924_924_924_	290
title_259_257_	artist_70_70_70_7	3	track_title_7200_7200_7200_720	590
title_234_232_	artist_40_40_40_4	6	track_title_1427_1427_142	510
title_115_113_	artist_78_78_78	7	track_title_4037_4037_4	374
title_449_447_	artist_1_1_1_	1	track_title_3357_3357_335	374
title_415_413_	artist_74_74_	5	track_title_5103_5103_5103	295
title_221_219_	artist_12_12_12	10	track_title_5230_5230_5230_5	461
title_118_116_	artist_51_51_51_5	1	track_title_49_49_49_49_49_4	605
title_450_448_	artist_91_91_91	5	track_title_7034_7034_7034	473
title_470_468_	artist_16_16_16_1	6	track_title_3583_3583_3583_35	287
title_211_209_	artist_20_20_20	1	track_title_2761_2761_2761	194
title_240_238_	artist_32_32_32_3	3	track_title_277_277_277_27	608
title_66_64_	artist_55_55_	5	track_title_7111_7111_	253
title_117_115_	artist_6_6_6_	6	track_title_5426_5426_5426_54	503
title_466_464_	artist_4_4_4_	4	track_title_4584_4584_4584_458	342
title_240_238_	artist_32_32_32_3	5	track_title_4862_4862_4862_486	497
title_236_234_	artist_52_52_	9	track_title_321_321_321_321_	627
title_38_36_	artist_60_60_	1	track_title_5625_5625_56	138
title_398_396_	artist_22_22_	9	track_title_6523_6523_6	430
title_20_18_	artist_54_54_54_5	10	track_title_7293_7293_7293_729	262
title_449_447_	artist_1_1_1_	2	track_title_4661_4661_4661	198
title_114_112_	artist_35_35_35_3	3	track_title_4055_4055_4055_40	133
title_61_59_	artist_62_62_62_6	4	track_title_1800_1800_1800_	158
title_44_42_	artist_56_56_56	6	track_title_5623_5623_56	545
title_438_436_	artist_79_79_79_7	2	track_title_1804_1804_1804_	505
title_303_301_	artist_59_59_59	3	track_title_4994_4994_4	538
title_255_253_	artist_50_50_50	8	track_title_6732_6732_6732_673	486
title_143_141_	artist_12_12_12	13	track_title_6288_6288_6288	465
title_255_253_	artist_50_50_50	1	track_title_1860_1860_1860_	575
title_56_54_	artist_29_29_29	5	track_title_3617_3617_3617_3	593
title_235_233_	artist_36_36_	1	track_title_6067_6067_606	605
title_396_394_	artist_27_27_27_2	2	track_title_6637_6637_6637_6	456
title_495_493_	artist_35_35_35_3	3	track_title_4553_4553_4553_455	174
title_130_128_	artist_51_51_51_5	5	track_title_3954_3954_3954_3	292
title_437_435_	artist_39_39_	1	track_title_7382_7382_7382_73	403
title_121_119_	artist_87_87_87_8	2	track_title_1375_1375_1375_13	586
title_383_381_	artist_94_94_94	3	track_title_7374_7374_7374	244
title_177_175_	artist_25_25_	4	track_title_1389_1389_1	490
title_409_407_	artist_42_42_42	6	track_title_2256_2256_	462
title_94_92_	artist_93_93_	8	track_title_5874_5874_587	198
title_354_352_	artist_43_43_43_4	10	track_title_3925_3925_3925_3	443
title_495_493_	artist_35_35_35_3	1	track_title_4847_4847_48	359
title_361_359_	artist_23_23_23	5	track_title_4349_4349_4	207
title_170_168_	artist_40_40_40_4	6	track_title_792_792_792_	298
title_179_177_	artist_58_58_	13	track_title_5524_5524_	131
title_13_11_	artist_18_18_18	5	track_title_4886_4886_4886_	255
title_473_471_	artist_93_93_	1	track_title_487_487_487_4	265
title_237_235_	artist_2_2_2_	2	track_title_3377_3377_	340
title_284_282_	artist_7_7_7_	3	track_title_4246_4246_4246_424	490
title_96_94_	artist_93_93_	4	track_title_5054_5054_5054_505	437
title_222_220_	artist_78_78_78	5	track_title_6094_6094_609	529
title_109_107_	artist_47_47_	6	track_title_214_214_214	520
title_80_78_	artist_19_19_19_1	7	track_title_6144_6144_6144_614	233
title_332_330_	artist_18_18_18	8	track_title_828_828_82	183
title_1012_1010_	artist_15_15_15	2	track_title_2097_2097_2097_209	268
title_394_392_	artist_92_92_92_9	3	track_title_2471_2471_2	549
title_345_343_	artist_59_59_59	4	track_title_3253_3253_3	256
title_406_404_	artist_47_47_	5	track_title_1041_1041_1	465
title_77_75_	artist_87_87_87_8	7	track_title_4915_4915_4915	503
title_272_270_	artist_93_93_	3	track_title_2473_2473_2	295
title_161_159_	artist_36_36_	4	track_title_5388_5388_5388_	613
title_510_508_	artist_97_97_97	5	track_title_3674_3674_3674_3	412
title_411_409_	artist_21_21_21_2	6	track_title_1868_1868_1868_	141
title_390_388_	artist_76_76_76_7	7	track_title_4832_4832_4832_483	528
title_149_147_	artist_50_50_50	9	track_title_3579_3579_3579	227
title_124_122_	artist_97_97_97	11	track_title_3605_3605_360	367
title_442_440_	artist_47_47_	2	track_title_1310_1310_1310_13	562
title_444_442_	artist_94_94_94	5	track_title_6499_6499_64	205
title_111_109_	artist_36_36_	6	track_title_7346_7346_7346	549
title_290_288_	artist_27_27_27_2	2	track_title_3224_3224_3	446
title_464_462_	artist_88_88_	1	track_title_3375_3375_	347
title_512_510_	artist_42_42_42	3	track_title_5081_5081_5081_508	197
title_487_485_	artist_4_4_4_	6	track_title_2755_2755_2	216
title_67_65_	artist_85_85_	12	track_title_1121_1121_1121_1	374
title_171_169_	artist_53_53_53	4	track_title_6701_6701_6701_670	465
title_309_307_	artist_7_7_7_	8	track_title_2568_2568_	235
title_428_426_	artist_11_11_	9	track_title_3407_3407_3407_340	456
title_108_106_	artist_43_43_43_4	1	track_title_3804_3804_3804_38	184
title_109_107_	artist_47_47_	2	track_title_7480_7480_	165
title_435_433_	artist_97_97_97	5	track_title_1770_1770_1770_1	384
title_89_87_	artist_40_40_40_4	6	track_title_508_508_508_508	189
title_346_344_	artist_7_7_7_	11	track_title_2760_2760_2760	152
title_155_153_	artist_33_33_	2	track_title_2337_2337_2337_	555
title_133_131_	artist_98_98_98_9	4	track_title_4581_4581_4581_458	166
title_272_270_	artist_93_93_	6	track_title_1790_1790_179	536
title_476_474_	artist_13_13_13_1	1	track_title_3868_3868_3868_38	558
title_198_196_	artist_32_32_32_3	2	track_title_7105_7105_7105_7	233
title_168_166_	artist_77_77_	3	track_title_1619_1619_1619	355
title_331_329_	artist_80_80_80	5	track_title_6555_6555_6	532
title_246_244_	artist_53_53_53	9	track_title_45_45_45_45_4	286
title_265_263_	artist_79_79_79_7	11	track_title_6783_6783_6783_	322
title_294_292_	artist_88_88_	3	track_title_4902_4902_4	535
title_333_331_	artist_46_46_46_4	5	track_title_6153_6153_61	604
title_485_483_	artist_91_91_91	7	track_title_1768_1768_176	457
title_55_53_	artist_99_99_	11	track_title_4052_4052_4052_40	497
title_34_32_	artist_90_90_	8	track_title_1954_1954_1954	251
title_477_475_	artist_13_13_13_1	11	track_title_3272_3272_3272_32	272
title_467_465_	artist_15_15_15	6	track_title_372_372_372_37	508
title_49_47_	artist_24_24_24_2	1	track_title_2164_2164_2	479
title_496_494_	artist_59_59_59	4	track_title_6692_6692_6692_6	559
title_98_96_	artist_80_80_80	5	track_title_3548_3548_3548	622
title_395_393_	artist_60_60_	9	track_title_3069_3069_	372
title_481_479_	artist_5_5_5_	10	track_title_2926_2926_2926_	527
title_356_354_	artist_83_83_83	4	track_title_1867_1867_1867_	411
title_112_110_	artist_49_49_49_4	5	track_title_2307_2307_2307_	204
title_496_494_	artist_59_59_59	7	track_title_2781_2781_2	133
title_146_144_	artist_85_85_	12	track_title_6982_6982_	359
title_227_225_	artist_79_79_79_7	9	track_title_6967_6967_696	191
title_434_432_	artist_54_54_54_5	3	track_title_1361_1361_1361	451
title_49_47_	artist_24_24_24_2	8	track_title_4019_4019_4019	411
title_161_159_	artist_36_36_	5	track_title_1180_1180_1180_1	133
title_202_200_	artist_73_73_73_7	3	track_title_1943_1943_1	569
title_227_225_	artist_79_79_79_7	4	track_title_3226_3226_3	577
title_19_17_	artist_18_18_18	1	track_title_5198_5198_5198	391
title_273_271_	artist_13_13_13_1	4	track_title_782_782_78	546
title_37_35_	artist_14_14_	8	track_title_7360_7360_7	131
title_492_490_	artist_32_32_32_3	1	track_title_4370_4370_4	152
title_275_273_	artist_81_81_81_8	4	track_title_4247_4247_4247_424	267
title_242_240_	artist_91_91_91	7	track_title_2176_2176_2176	229
title_424_422_	artist_17_17_	2	track_title_2597_2597_	403
title_335_333_	artist_56_56_56	3	track_title_3242_3242_3242_32	216
title_474_472_	artist_59_59_59	5	track_title_2918_2918_29	611
title_359_357_	artist_62_62_62_6	6	track_title_1622_1622_1622_16	590
title_120_118_	artist_76_76_76_7	1	track_title_6531_6531_6531	305
title_232_230_	artist_77_77_	3	track_title_5088_5088_5088_508	527
title_257_255_	artist_71_71_	5	track_title_1352_1352_1	276
title_282_280_	artist_4_4_4_	8	track_title_7019_7019_7019_70	603
title_268_266_	artist_59_59_59	3	track_title_2783_2783_2	217
title_284_282_	artist_7_7_7_	4	track_title_5787_5787_5787	503
title_166_164_	artist_19_19_19_1	5	track_title_1982_1982_1982	335
title_99_97_	artist_3_3_3_	6	track_title_6598_6598_6598	408
title_286_284_	artist_94_94_94	7	track_title_6171_6171_6171_617	375
title_176_174_	artist_60_60_	13	track_title_2422_2422_2422	399
title_122_120_	artist_37_37_37	3	track_title_4369_4369_4369_43	569
title_358_356_	artist_29_29_29	4	track_title_5922_5922_5922_592	450
title_160_158_	artist_89_89_89	5	track_title_1517_1517_15	595
title_314_312_	artist_32_32_32_3	10	track_title_6474_6474_6474_	304
title_421_419_	artist_84_84_84_8	7	track_title_772_772_772_772_7	291
title_494_492_	artist_19_19_19_1	1	track_title_2427_2427_2427	396
title_305_303_	artist_91_91_91	2	track_title_1519_1519_15	599
title_457_455_	artist_63_63_	7	track_title_1415_1415_	203
title_469_467_	artist_4_4_4_	2	track_title_1750_1750_	412
title_399_397_	artist_15_15_15	2	track_title_6924_6924_	279
title_366_364_	artist_20_20_20	3	track_title_6406_6406_64	133
title_375_373_	artist_34_34_34	5	track_title_4537_4537_45	322
title_219_217_	artist_12_12_12	6	track_title_2361_2361_2361_	369
title_274_272_	artist_2_2_2_	8	track_title_5997_5997_59	205
title_13_11_	artist_9_9_9_	4	track_title_5326_5326_5326_	496
title_256_254_	artist_79_79_79_7	2	track_title_4716_4716_	563
title_389_387_	artist_68_68_68_6	3	track_title_1702_1702_170	447
title_58_56_	artist_43_43_43_4	5	track_title_5585_5585_	263
title_88_86_	artist_49_49_49_4	6	track_title_3926_3926_3926_3	540
title_315_313_	artist_51_51_51_5	7	track_title_6899_6899_6	337
title_90_88_	artist_41_41_	9	track_title_5379_5379_53	578
title_393_391_	artist_55_55_	3	track_title_4632_4632_4632	565
title_26_24_	artist_60_60_	5	track_title_148_148_148	386
title_254_252_	artist_34_34_34	6	track_title_6234_6234_6234_62	136
title_84_82_	artist_84_84_84_8	8	track_title_1702_1702_170	153
title_96_94_	artist_93_93_	2	track_title_5144_5144_5144_51	201
title_253_251_	artist_84_84_84_8	6	track_title_5164_5164_5164	298
title_345_343_	artist_59_59_59	9	track_title_351_351_351_3	394
title_238_236_	artist_15_15_15	10	track_title_6127_6127_61	142
title_123_121_	artist_26_26_26	3	track_title_4974_4974_4974	602
title_124_122_	artist_97_97_97	5	track_title_3661_3661_366	292
title_310_308_	artist_69_69_	6	track_title_384_384_38	527
title_47_45_	artist_46_46_46_4	1	track_title_1668_1668_1	318
title_354_352_	artist_43_43_43_4	8	track_title_5710_5710_5	321
title_295_293_	artist_13_13_13_1	3	track_title_7294_7294_7294_729	566
title_245_243_	artist_56_56_56	10	track_title_540_540_540	234
title_300_298_	artist_92_92_92_9	1	track_title_5946_5946_5946_	471
title_375_373_	artist_34_34_34	7	track_title_458_458_458_4	151
title_42_40_	artist_51_51_51_5	8	track_title_1968_1968_1968_19	134
title_238_236_	artist_15_15_15	9	track_title_3617_3617_3617_3	609
title_56_54_	artist_29_29_29	4	track_title_6391_6391_	287
title_64_62_	artist_87_87_87_8	9	track_title_3813_3813_3	206
title_439_437_	artist_87_87_87_8	5	track_title_4981_4981_4981_49	451
title_495_493_	artist_35_35_35_3	9	track_title_5392_5392_5392_539	311
title_87_85_	artist_91_91_91	2	track_title_6064_6064_606	378
title_26_24_	artist_60_60_	6	track_title_1836_1836_1836_	355
title_190_188_	artist_95_95_95_9	7	track_title_4948_4948_4948	381
title_99_97_	artist_3_3_3_	9	track_title_4062_4062_4	154
title_240_238_	artist_32_32_32_3	2	track_title_2444_2444_2	528
title_189_187_	artist_32_32_32_3	4	track_title_5199_5199_5199	377
title_220_218_	artist_36_36_	6	track_title_2406_2406_2406_24	594
title_44_42_	artist_56_56_56	9	track_title_3410_3410_34	547
title_193_191_	artist_72_72_72	10	track_title_3839_3839_3839_38	243
title_105_103_	artist_84_84_84_8	1	track_title_3709_3709_3709_	400
title_283_281_	artist_83_83_83	2	track_title_1679_1679_1679	416
title_67_65_	artist_85_85_	3	track_title_4231_4231_4231_	133
title_338_336_	artist_84_84_84_8	1	track_title_1794_1794_179	314
title_50_48_	artist_5_5_5_	2	track_title_984_984_98	507
title_25_23_	artist_5_5_5_	5	track_title_3442_3442_34	525
title_178_176_	artist_91_91_91	7	track_title_1661_1661_1	492
title_285_283_	artist_8_8_8_	3	track_title_3002_3002_	557
title_287_285_	artist_23_23_23	9	track_title_5671_5671_5671_567	337
title_83_81_	artist_53_53_53	11	track_title_5806_5806_	564
title_300_298_	artist_92_92_92_9	7	track_title_2998_2998_2998_299	540
title_255_253_	artist_50_50_50	11	track_title_1630_1630_1	260
title_468_466_	artist_13_13_13_1	1	track_title_4394_4394_4394_43	363
title_245_243_	artist_56_56_56	3	track_title_4707_4707_4707_4	272
title_113_111_	artist_37_37_37	4	track_title_5027_5027_5027_502	163
title_61_59_	artist_62_62_62_6	5	track_title_4074_4074_4074	435
title_253_251_	artist_84_84_84_8	7	track_title_3102_3102_31	169
title_143_141_	artist_12_12_12	8	track_title_3034_3034_	487
title_39_37_	artist_49_49_49_4	10	track_title_6109_6109_6109_	402
title_243_241_	artist_34_34_34	1	track_title_2422_2422_2422	345
title_103_101_	artist_47_47_	3	track_title_1743_1743_1743_1	334
title_387_385_	artist_57_57_57_5	5	track_title_266_266_266_266	419
title_149_147_	artist_50_50_50	7	track_title_5885_5885_5885_5	538
title_303_301_	artist_59_59_59	11	track_title_5297_5297_5297_5	218
title_132_130_	artist_9_9_9_	2	track_title_2650_2650_2650_265	450
title_20_18_	artist_54_54_54_5	3	track_title_4295_4295_4295_	607
title_33_31_	artist_32_32_32_3	6	track_title_736_736_736_736	450
title_136_134_	artist_61_61_61	8	track_title_5550_5550_	219
title_435_433_	artist_97_97_97	2	track_title_4604_4604_4604	558
title_364_362_	artist_4_4_4_	3	track_title_579_579_579_579_5	429
title_220_218_	artist_36_36_	5	track_title_6279_6279_6	445
title_82_80_	artist_98_98_98_9	8	track_title_2420_2420_2420	409
title_455_453_	artist_52_52_	3	track_title_1421_1421_142	499
title_467_465_	artist_15_15_15	1	track_title_3971_3971_397	168
title_447_445_	artist_69_69_	3	track_title_2075_2075_20	184
title_491_489_	artist_27_27_27_2	5	track_title_2839_2839_2839_2	397
title_180_178_	artist_66_66_	7	track_title_5502_5502_550	256
title_211_209_	artist_20_20_20	9	track_title_5568_5568_556	336
title_372_370_	artist_43_43_43_4	10	track_title_794_794_794_794	264
title_365_363_	artist_51_51_51_5	1	track_title_6054_6054_	173
title_32_30_	artist_21_21_21_2	3	track_title_704_704_704_704	136
title_302_300_	artist_85_85_	7	track_title_1026_1026_1026	185
title_252_250_	artist_85_85_	9	track_title_4137_4137_413	186
title_416_414_	artist_73_73_73_7	10	track_title_308_308_308_308_30	605
title_50_48_	artist_5_5_5_	13	track_title_4835_4835_4835_483	492
title_1012_1010_	artist_1_1_1_	3	track_title_2937_2937_2937_293	242
title_337_335_	artist_98_98_98_9	6	track_title_6735_6735_6735_673	160
title_466_464_	artist_4_4_4_	7	track_title_3644_3644_3644_3	363
title_17_15_	artist_54_54_54_5	2	track_title_4471_4471_447	524
title_148_146_	artist_67_67_67	3	track_title_4174_4174_4174_4	346
title_346_344_	artist_7_7_7_	9	track_title_4893_4893_4893_489	542
title_249_247_	artist_27_27_27_2	4	track_title_2076_2076_20	252
title_25_23_	artist_5_5_5_	8	track_title_7418_7418_7418_7	391
title_189_187_	artist_32_32_32_3	9	track_title_3724_3724_37	573
title_63_61_	artist_81_81_81_8	1	track_title_6397_6397_	588
title_243_241_	artist_34_34_34	7	track_title_3377_3377_	343
title_299_297_	artist_46_46_46_4	10	track_title_7090_7090_7090	443
title_299_297_	artist_46_46_46_4	11	track_title_419_419_419	606
title_140_138_	artist_80_80_80	4	track_title_4660_4660_4660	446
title_397_395_	artist_17_17_	6	track_title_6114_6114_6114_611	584
title_137_135_	artist_99_99_	8	track_title_6059_6059_	407
title_241_239_	artist_30_30_	1	track_title_5503_5503_550	356
title_123_121_	artist_26_26_26	5	track_title_6310_6310_631	283
title_502_500_	artist_94_94_94	8	track_title_1748_1748_1748_1	305
title_371_369_	artist_20_20_20	10	track_title_918_918_918	386
title_170_168_	artist_40_40_40_4	4	track_title_302_302_302_302_30	457
title_399_397_	artist_15_15_15	5	track_title_4006_4006_4	170
title_399_397_	artist_15_15_15	6	track_title_4187_4187_	273
title_248_246_	artist_47_47_	6	track_title_977_977_977_977_9	554
title_263_261_	artist_15_15_15	7	track_title_2179_2179_2179	313
title_26_24_	artist_60_60_	8	track_title_4318_4318_4	446
title_108_106_	artist_43_43_43_4	12	track_title_6792_6792_6792_679	532
title_258_256_	artist_76_76_76_7	3	track_title_2848_2848_	380
title_167_165_	artist_52_52_	4	track_title_3422_3422_3422_	334
title_147_145_	artist_20_20_20	6	track_title_4427_4427_4427_4	144
title_124_122_	artist_97_97_97	9	track_title_5263_5263_5263_5	342
title_219_217_	artist_12_12_12	11	track_title_6789_6789_6789_	326
title_363_361_	artist_56_56_56	2	track_title_4543_4543_4543_	324
title_482_480_	artist_91_91_91	4	track_title_4492_4492_	568
title_443_441_	artist_17_17_	5	track_title_2757_2757_2	467
title_173_171_	artist_33_33_	6	track_title_2998_2998_2998_299	321
title_424_422_	artist_17_17_	9	track_title_2144_2144_2144	394
title_462_460_	artist_80_80_80	2	track_title_2416_2416_2	134
title_342_340_	artist_47_47_	5	track_title_6063_6063_606	321
title_1012_1010_	artist_15_15_15	1	track_title_2919_2919_29	335
title_1012_1010_	artist_51_51_51_5	6	track_title_6246_6246_6	246
title_216_214_	artist_57_57_57_5	7	track_title_2581_2581_2581_2	528
title_62_60_	artist_26_26_26	2	track_title_3783_3783_37	494
title_42_40_	artist_51_51_51_5	10	track_title_3066_3066_	452
title_1012_1010_	artist_1_1_1_	5	track_title_4377_4377_4	595
title_82_80_	artist_98_98_98_9	2	track_title_3540_3540_3540	442
title_195_193_	artist_26_26_26	8	track_title_2950_2950_2950_	204
title_97_95_	artist_11_11_	11	track_title_5884_5884_5884_5	519
title_337_335_	artist_98_98_98_9	12	track_title_1452_1452_145	596
title_469_467_	artist_4_4_4_	3	track_title_606_606_606_606	232
title_403_401_	artist_60_60_	5	track_title_6955_6955_	137
title_266_264_	artist_85_85_	2	track_title_1822_1822_18	375
title_440_438_	artist_59_59_59	3	track_title_3257_3257_3	528
title_181_179_	artist_40_40_40_4	7	track_title_1328_1328_1	567
title_235_233_	artist_36_36_	12	track_title_1992_1992_1992_19	173
title_470_468_	artist_16_16_16_1	3	track_title_2936_2936_2936_293	353
title_407_405_	artist_31_31_31	5	track_title_3093_3093_	165
title_377_375_	artist_37_37_37	4	track_title_5288_5288_528	320
title_169_167_	artist_96_96_	9	track_title_6501_6501_6501	174
title_149_147_	artist_50_50_50	1	track_title_1326_1326_1	412
title_378_376_	artist_7_7_7_	2	track_title_1000_1000_1000_10	441
title_199_197_	artist_74_74_	6	track_title_4231_4231_4231_	339
title_144_142_	artist_77_77_	8	track_title_6384_6384_6384_6	321
title_452_450_	artist_19_19_19_1	7	track_title_696_696_696_696	361
title_43_41_	artist_34_34_34	1	track_title_3619_3619_3619_3	396
title_329_327_	artist_20_20_20	7	track_title_6436_6436_64	405
title_452_450_	artist_19_19_19_1	1	track_title_4173_4173_4173_4	457
title_265_263_	artist_79_79_79_7	2	track_title_4053_4053_4053_40	566
title_56_54_	artist_29_29_29	3	track_title_321_321_321_321_	483
title_290_288_	artist_27_27_27_2	12	track_title_2648_2648_2648_	579
title_488_486_	artist_16_16_16_1	1	track_title_1609_1609_1	186
title_417_415_	artist_66_66_	5	track_title_232_232_232_	371
title_494_492_	artist_19_19_19_1	6	track_title_5327_5327_5327_	536
title_286_284_	artist_94_94_94	5	track_title_2718_2718_2718_27	452
title_208_206_	artist_36_36_	8	track_title_4751_4751_475	410
title_256_254_	artist_79_79_79_7	9	track_title_5726_5726_5726	505
title_13_11_	artist_71_71_	4	track_title_3465_3465_3465_346	575
title_500_498_	artist_72_72_72	1	track_title_1193_1193_	579
title_48_46_	artist_83_83_83	3	track_title_5788_5788_5788	251
title_492_490_	artist_32_32_32_3	4	track_title_3588_3588_3588_35	198
title_336_334_	artist_54_54_54_5	1	track_title_5437_5437_5	615
title_406_404_	artist_47_47_	2	track_title_3627_3627_	271
title_302_300_	artist_85_85_	1	track_title_3569_3569_3	587
title_307_305_	artist_30_30_	2	track_title_7102_7102_7102_7	432
title_387_385_	artist_57_57_57_5	7	track_title_3941_3941_394	464
title_38_36_	artist_60_60_	3	track_title_721_721_72	354
title_27_25_	artist_98_98_98_9	6	track_title_3586_3586_3586_35	627
title_483_481_	artist_61_61_61	10	track_title_3679_3679_3679_3	282
title_189_187_	artist_32_32_32_3	1	track_title_1857_1857_18	247
title_383_381_	artist_94_94_94	2	track_title_425_425_425_425_	429
title_105_103_	artist_84_84_84_8	3	track_title_6968_6968_696	550
title_165_163_	artist_79_79_79_7	5	track_title_5392_5392_5392_539	274
title_164_162_	artist_92_92_92_9	6	track_title_7404_7404_740	298
title_453_451_	artist_45_45_45	7	track_title_7032_7032_7032	159
title_191_189_	artist_3_3_3_	3	track_title_766_766_766_	575
title_387_385_	artist_57_57_57_5	6	track_title_551_551_55	266
title_219_217_	artist_12_12_12	7	track_title_6990_6990_699	409
title_299_297_	artist_46_46_46_4	3	track_title_6081_6081_	567
title_199_197_	artist_74_74_	7	track_title_6452_6452_6452_645	213
title_240_238_	artist_32_32_32_3	9	track_title_3081_3081_3081_3	576
title_317_315_	artist_46_46_46_4	10	track_title_3768_3768_3768_	602
title_366_364_	artist_20_20_20	12	track_title_4036_4036_4	131
title_432_430_	artist_81_81_81_8	2	track_title_3044_3044_304	330
title_345_343_	artist_59_59_59	3	track_title_6199_6199_6199_	604
title_366_364_	artist_20_20_20	5	track_title_4389_4389_4389	238
title_61_59_	artist_62_62_62_6	6	track_title_4098_4098_4	547
title_259_257_	artist_70_70_70_7	7	track_title_1430_1430_1430_1	288
title_178_176_	artist_91_91_91	8	track_title_3627_3627_	619
title_410_408_	artist_93_93_	7	track_title_6145_6145_6145_614	369
title_30_28_	artist_58_58_	10	track_title_1799_1799_179	226
title_229_227_	artist_89_89_89	3	track_title_6373_6373_637	253
title_269_267_	artist_1_1_1_	7	track_title_6364_6364_	403
title_77_75_	artist_87_87_87_8	8	track_title_3003_3003_	160
title_380_378_	artist_74_74_	9	track_title_6106_6106_6106_	185
title_459_457_	artist_59_59_59	1	track_title_970_970_970	177
title_377_375_	artist_37_37_37	2	track_title_6280_6280_6280	219
title_434_432_	artist_54_54_54_5	4	track_title_2151_2151_2151_21	240
title_332_330_	artist_18_18_18	5	track_title_4711_4711_	405
title_478_476_	artist_1_1_1_	7	track_title_1975_1975_1	546
title_162_160_	artist_17_17_	2	track_title_1118_1118_111	361
title_390_388_	artist_76_76_76_7	4	track_title_6970_6970_6970_6	315
title_124_122_	artist_97_97_97	6	track_title_6005_6005_600	501
title_280_278_	artist_6_6_6_	8	track_title_4134_4134_413	216
title_108_106_	artist_43_43_43_4	11	track_title_5593_5593_559	206
title_48_46_	artist_83_83_83	1	track_title_2422_2422_2422	424
title_420_418_	artist_79_79_79_7	4	track_title_6078_6078_6078_6	617
title_345_343_	artist_59_59_59	2	track_title_2390_2390_2390_	432
title_433_431_	artist_2_2_2_	3	track_title_3415_3415_34	379
title_468_466_	artist_13_13_13_1	6	track_title_1427_1427_142	371
title_396_394_	artist_27_27_27_2	8	track_title_1807_1807_1807_	136
title_271_269_	artist_61_61_61	2	track_title_1320_1320_1	558
title_225_223_	artist_88_88_	6	track_title_5251_5251_525	594
title_415_413_	artist_74_74_	8	track_title_3407_3407_3407_340	343
title_282_280_	artist_4_4_4_	5	track_title_4330_4330_4330_43	318
title_353_351_	artist_8_8_8_	6	track_title_3146_3146_3146_	486
title_318_316_	artist_69_69_	7	track_title_1911_1911_1	253
title_15_13_	artist_55_55_	8	track_title_1205_1205_12	466
title_1012_1010_	artist_75_75_75	1	track_title_6899_6899_6	622
title_404_402_	artist_75_75_75	2	track_title_7319_7319_7319	264
title_374_372_	artist_12_12_12	3	track_title_6201_6201_6201_62	298
title_36_34_	artist_38_38_38_3	6	track_title_2791_2791_2791	205
title_346_344_	artist_7_7_7_	8	track_title_750_750_75	251
title_467_465_	artist_15_15_15	10	track_title_817_817_817	434
title_252_250_	artist_85_85_	4	track_title_4503_4503_45	398
title_164_162_	artist_92_92_92_9	5	track_title_1549_1549_15	375
title_416_414_	artist_73_73_73_7	6	track_title_6065_6065_606	148
title_279_277_	artist_61_61_61	8	track_title_970_970_970	164
title_167_165_	artist_52_52_	11	track_title_3538_3538_3	182
title_458_456_	artist_41_41_	2	track_title_3791_3791_3791_	438
title_346_344_	artist_7_7_7_	1	track_title_443_443_443_443_4	180
title_87_85_	artist_91_91_91	3	track_title_3762_3762_3762_	608
title_420_418_	artist_79_79_79_7	6	track_title_6782_6782_6782_	577
title_139_137_	artist_77_77_	7	track_title_1150_1150_1150_1	443
title_272_270_	artist_93_93_	8	track_title_6765_6765_6765_676	500
title_167_165_	artist_52_52_	9	track_title_4683_4683_4	556
title_82_80_	artist_98_98_98_9	1	track_title_2457_2457_2457	366
title_180_178_	artist_66_66_	2	track_title_6117_6117_6117_611	537
title_267_265_	artist_23_23_23	4	track_title_6197_6197_6197_	505
title_414_412_	artist_60_60_	6	track_title_4354_4354_4354	398
title_428_426_	artist_11_11_	3	track_title_5391_5391_5391_539	159
title_347_345_	artist_71_71_	1	track_title_4296_4296_4296_	584
title_322_320_	artist_98_98_98_9	3	track_title_2391_2391_2391_	627
title_13_11_	artist_71_71_	2	track_title_5901_5901_59	243
title_416_414_	artist_73_73_73_7	8	track_title_7048_7048_7048_70	248
title_432_430_	artist_81_81_81_8	9	track_title_6547_6547_6547_65	317
title_190_188_	artist_95_95_95_9	11	track_title_6451_6451_6451_645	515
title_191_189_	artist_3_3_3_	2	track_title_837_837_837_837	346
title_55_53_	artist_99_99_	3	track_title_2272_2272_2272_2	379
title_113_111_	artist_37_37_37	6	track_title_5316_5316_53	617
title_67_65_	artist_85_85_	10	track_title_5803_5803_	161
title_17_15_	artist_54_54_54_5	4	track_title_4428_4428_4428_4	586
title_496_494_	artist_59_59_59	5	track_title_815_815_815_815_8	514
title_489_487_	artist_54_54_54_5	1	track_title_7036_7036_7036	449
title_88_86_	artist_49_49_49_4	2	track_title_6152_6152_61	222
title_473_471_	artist_93_93_	3	track_title_5685_5685_56	394
title_271_269_	artist_61_61_61	10	track_title_1487_1487_148	430
title_499_497_	artist_79_79_79_7	4	track_title_2150_2150_2150_21	207
title_211_209_	artist_20_20_20	5	track_title_7197_7197_7197_7	239
title_380_378_	artist_74_74_	8	track_title_661_661_661_661	131
title_284_282_	artist_7_7_7_	10	track_title_2155_2155_2155_21	374
title_436_434_	artist_16_16_16_1	4	track_title_2811_2811_	380
title_138_136_	artist_6_6_6_	6	track_title_5749_5749_5	535
title_475_473_	artist_27_27_27_2	7	track_title_6106_6106_6106_	209
title_44_42_	artist_56_56_56	8	track_title_3847_3847_3	614
title_490_488_	artist_51_51_51_5	11	track_title_4927_4927_4927_49	474
title_16_14_	artist_16_16_16_1	1	track_title_6701_6701_6701_670	457
title_146_144_	artist_85_85_	2	track_title_4132_4132_413	541
title_216_214_	artist_57_57_57_5	3	track_title_5138_5138_5138	450
title_427_425_	artist_88_88_	5	track_title_5573_5573_5573_5	569
title_388_386_	artist_81_81_81_8	4	track_title_1115_1115_111	489
title_206_204_	artist_20_20_20	8	track_title_5176_5176_5176_51	416
title_143_141_	artist_12_12_12	9	track_title_1623_1623_1623_16	383
title_387_385_	artist_57_57_57_5	4	track_title_3283_3283_3	623
title_344_342_	artist_65_65_65_6	6	track_title_5665_5665_5665_	445
title_400_398_	artist_24_24_24_2	2	track_title_2321_2321_23	208
title_265_263_	artist_79_79_79_7	3	track_title_453_453_45	368
title_458_456_	artist_41_41_	9	track_title_359_359_359_359_	298
title_440_438_	artist_59_59_59	10	track_title_92_92_92_92_92_9	523
title_199_197_	artist_74_74_	1	track_title_6115_6115_6115_611	148
title_375_373_	artist_34_34_34	4	track_title_2786_2786_2	312
title_499_497_	artist_79_79_79_7	5	track_title_6447_6447_6447_	213
title_351_349_	artist_11_11_	7	track_title_4032_4032_4	289
title_438_436_	artist_79_79_79_7	5	track_title_2060_2060_2060_206	392
title_21_19_	artist_12_12_12	6	track_title_3483_3483_3483_	417
title_236_234_	artist_52_52_	8	track_title_2040_2040_20	208
title_498_496_	artist_82_82_	2	track_title_3906_3906_	478
title_61_59_	artist_62_62_62_6	8	track_title_3632_3632_363	416
title_113_111_	artist_37_37_37	1	track_title_3719_3719_3719_371	195
title_443_441_	artist_17_17_	4	track_title_5485_5485_5485_54	627
title_34_32_	artist_90_90_	6	track_title_4211_4211_4211_421	427
title_115_113_	artist_78_78_78	9	track_title_5935_5935_59	489
title_371_369_	artist_20_20_20	1	track_title_899_899_899_	306
title_305_303_	artist_91_91_91	7	track_title_1263_1263_12	586
title_478_476_	artist_1_1_1_	1	track_title_568_568_568_568_56	457
title_39_37_	artist_49_49_49_4	4	track_title_5823_5823_5823_5	220
title_200_198_	artist_10_10_10_1	6	track_title_2050_2050_2050_	239
title_318_316_	artist_69_69_	3	track_title_4934_4934_4	325
title_319_317_	artist_3_3_3_	4	track_title_2842_2842_	181
title_484_482_	artist_31_31_31	13	track_title_2852_2852_285	192
title_200_198_	artist_10_10_10_1	3	track_title_6742_6742_67	295
title_162_160_	artist_17_17_	4	track_title_1592_1592_1592_159	322
title_329_327_	artist_20_20_20	5	track_title_5671_5671_5671_567	492
title_461_459_	artist_6_6_6_	6	track_title_2647_2647_2647_	279
title_376_374_	artist_30_30_	9	track_title_5255_5255_525	204
title_41_39_	artist_46_46_46_4	6	track_title_3074_3074_307	607
title_31_29_	artist_52_52_	4	track_title_1842_1842_1842_184	556
title_361_359_	artist_23_23_23	9	track_title_5594_5594_559	533
title_393_391_	artist_55_55_	8	track_title_3603_3603_360	149
title_271_269_	artist_61_61_61	11	track_title_6714_6714_67	344
title_57_55_	artist_23_23_23	4	track_title_7088_7088_7	255
title_174_172_	artist_85_85_	1	track_title_6863_6863_6	244
title_341_339_	artist_45_45_45	4	track_title_2881_2881_288	478
title_243_241_	artist_34_34_34	10	track_title_3454_3454_3454_	262
title_82_80_	artist_98_98_98_9	11	track_title_913_913_913_913_9	556
title_294_292_	artist_88_88_	1	track_title_3186_3186_3186_318	409
title_380_378_	artist_74_74_	7	track_title_7305_7305_7	276
title_198_196_	artist_32_32_32_3	1	track_title_6589_6589_6	329
title_474_472_	artist_59_59_59	4	track_title_5155_5155_5	503
title_319_317_	artist_3_3_3_	8	track_title_62_62_62_62_62_6	257
title_403_401_	artist_60_60_	1	track_title_4991_4991_4	548
title_114_112_	artist_35_35_35_3	7	track_title_4609_4609_4609	369
title_259_257_	artist_70_70_70_7	2	track_title_3766_3766_3766_	558
title_67_65_	artist_85_85_	4	track_title_4740_4740_	286
title_450_448_	artist_91_91_91	4	track_title_1590_1590_1590_159	256
title_274_272_	artist_2_2_2_	6	track_title_3662_3662_366	504
title_221_219_	artist_12_12_12	3	track_title_2421_2421_2421	612
title_493_491_	artist_49_49_49_4	4	track_title_7430_7430_743	309
title_78_76_	artist_75_75_75	8	track_title_2219_2219_2219_2	159
title_449_447_	artist_1_1_1_	10	track_title_1543_1543_15	231
title_314_312_	artist_32_32_32_3	3	track_title_5361_5361_5361_536	247
title_364_362_	artist_4_4_4_	5	track_title_2603_2603_26	610
title_193_191_	artist_72_72_72	6	track_title_2887_2887_288	204
title_154_152_	artist_76_76_76_7	7	track_title_17_17_17_1	573
title_104_102_	artist_43_43_43_4	9	track_title_1646_1646_1646	554
title_122_120_	artist_37_37_37	7	track_title_231_231_231_231	596
title_501_499_	artist_50_50_50	11	track_title_6610_6610_	473
title_440_438_	artist_59_59_59	1	track_title_3568_3568_3	504
title_135_133_	artist_30_30_	2	track_title_518_518_518_518_5	187
title_237_235_	artist_2_2_2_	7	track_title_3836_3836_3836_38	367
title_42_40_	artist_51_51_51_5	1	track_title_3905_3905_	135
title_201_199_	artist_68_68_68_6	2	track_title_7097_7097_7097	423
title_492_490_	artist_32_32_32_3	8	track_title_6555_6555_6	213
title_169_167_	artist_96_96_	5	track_title_3047_3047_304	148
title_175_173_	artist_78_78_78	6	track_title_3208_3208_3208	431
title_80_78_	artist_19_19_19_1	10	track_title_4467_4467_	362
title_1012_1010_	artist_15_15_15	5	track_title_431_431_431_	161
title_457_455_	artist_63_63_	10	track_title_5742_5742_5	333
title_391_389_	artist_15_15_15	2	track_title_5560_5560_556	276
title_336_334_	artist_54_54_54_5	5	track_title_2348_2348_2348_234	177
title_216_214_	artist_57_57_57_5	10	track_title_509_509_509_	154
title_307_305_	artist_30_30_	13	track_title_565_565_565_565_56	201
title_106_104_	artist_43_43_43_4	8	track_title_3374_3374_	474
title_445_443_	artist_88_88_	2	track_title_765_765_765_765	387
title_82_80_	artist_98_98_98_9	6	track_title_4776_4776_	139
title_368_366_	artist_3_3_3_	3	track_title_1811_1811_1811_181	494
title_318_316_	artist_69_69_	8	track_title_6345_6345_634	568
title_421_419_	artist_84_84_84_8	9	track_title_4490_4490_	551
title_61_59_	artist_62_62_62_6	2	track_title_2451_2451_2451	493
title_370_368_	artist_40_40_40_4	3	track_title_6687_6687_668	248
title_45_43_	artist_97_97_97	1	track_title_5174_5174_5174_51	468
title_308_306_	artist_11_11_	3	track_title_4415_4415_441	154
title_144_142_	artist_77_77_	4	track_title_6203_6203_6203_62	347
title_408_406_	artist_75_75_75	5	track_title_6108_6108_6108_	372
title_16_14_	artist_16_16_16_1	7	track_title_3904_3904_	497
title_83_81_	artist_53_53_53	8	track_title_2741_2741_2741_27	279
title_86_84_	artist_60_60_	1	track_title_4962_4962_4	341
title_244_242_	artist_47_47_	2	track_title_3042_3042_304	188
title_502_500_	artist_94_94_94	5	track_title_3380_3380_338	554
title_211_209_	artist_20_20_20	8	track_title_1115_1115_111	168
title_245_243_	artist_56_56_56	2	track_title_3336_3336_3336_3	467
title_305_303_	artist_91_91_91	3	track_title_3126_3126_3126_312	403
title_150_148_	artist_51_51_51_5	8	track_title_5760_5760_5760_57	245
title_309_307_	artist_7_7_7_	4	track_title_5829_5829_5829_5	413
title_64_62_	artist_87_87_87_8	10	track_title_5082_5082_5082_508	389
title_247_245_	artist_90_90_	1	track_title_1527_1527_1527_	617
title_166_164_	artist_19_19_19_1	6	track_title_5952_5952_5952_595	558
title_352_350_	artist_70_70_70_7	7	track_title_2203_2203_220	447
title_139_137_	artist_77_77_	10	track_title_4092_4092_4	398
title_365_363_	artist_51_51_51_5	5	track_title_4716_4716_	147
title_381_379_	artist_65_65_65_6	7	track_title_4524_4524_4524_452	232
title_400_398_	artist_24_24_24_2	1	track_title_5850_5850_5850_5	312
title_442_440_	artist_47_47_	4	track_title_6261_6261_6261_62	564
title_230_228_	artist_75_75_75	5	track_title_2689_2689_2689_268	500
title_13_11_	artist_71_71_	7	track_title_7368_7368_7	405
title_284_282_	artist_7_7_7_	12	track_title_4590_4590_45	251
title_180_178_	artist_66_66_	1	track_title_4532_4532_45	134
title_507_505_	artist_36_36_	3	track_title_4143_4143_4143_4	431
title_372_370_	artist_43_43_43_4	8	track_title_2890_2890_2890_2	164
title_50_48_	artist_5_5_5_	10	track_title_947_947_947	384
title_392_390_	artist_62_62_62_6	1	track_title_2438_2438_2438_24	226
title_277_275_	artist_44_44_	2	track_title_5336_5336_5336_533	490
title_315_313_	artist_51_51_51_5	3	track_title_4925_4925_4925_49	454
title_429_427_	artist_19_19_19_1	5	track_title_1415_1415_	316
title_480_478_	artist_9_9_9_	8	track_title_7253_7253_7253_	470
title_262_260_	artist_29_29_29	1	track_title_3954_3954_3954_3	478
title_464_462_	artist_88_88_	5	track_title_3863_3863_3863_38	514
title_149_147_	artist_50_50_50	12	track_title_1519_1519_15	158
title_482_480_	artist_91_91_91	1	track_title_1627_1627_1627_16	485
title_513_511_	artist_42_42_42	4	track_title_2538_2538_	347
title_188_186_	artist_94_94_94	6	track_title_488_488_48	475
title_429_427_	artist_19_19_19_1	1	track_title_3632_3632_363	139
title_15_13_	artist_55_55_	3	track_title_5205_5205_5205_5	594
title_465_463_	artist_59_59_59	4	track_title_2263_2263_226	398
title_480_478_	artist_9_9_9_	5	track_title_3903_3903_	339
title_355_353_	artist_90_90_	7	track_title_2023_2023_2023_	400
title_74_72_	artist_21_21_21_2	8	track_title_6783_6783_6783_	621
title_331_329_	artist_80_80_80	10	track_title_3910_3910_391	311
title_78_76_	artist_75_75_75	4	track_title_6478_6478_6478_	288
title_49_47_	artist_24_24_24_2	5	track_title_2652_2652_2652_265	608
title_58_56_	artist_43_43_43_4	11	track_title_2061_2061_2061_206	575
title_509_507_	artist_73_73_73_7	4	track_title_2883_2883_288	440
title_232_230_	artist_77_77_	5	track_title_4838_4838_4838_483	279
title_148_146_	artist_67_67_67	7	track_title_4307_4307_4307_43	480
title_149_147_	artist_50_50_50	8	track_title_917_917_917_91	593
title_236_234_	artist_52_52_	10	track_title_458_458_458_4	195
title_391_389_	artist_15_15_15	1	track_title_6814_6814_6814	268
title_373_371_	artist_86_86_86	2	track_title_411_411_411_411_4	458
title_173_171_	artist_33_33_	3	track_title_2020_2020_2020_	483
title_484_482_	artist_31_31_31	9	track_title_2571_2571_257	222
title_375_373_	artist_34_34_34	1	track_title_7128_7128_712	162
title_125_123_	artist_5_5_5_	1	track_title_502_502_502_502	584
title_82_80_	artist_98_98_98_9	9	track_title_4278_4278_4278_427	327
title_141_139_	artist_70_70_70_7	1	track_title_3029_3029_3029_3	443
title_92_90_	artist_79_79_79_7	8	track_title_2495_2495_2495_24	298
title_462_460_	artist_80_80_80	3	track_title_3760_3760_3760_	309
title_24_22_	artist_75_75_75	7	track_title_6445_6445_6445_	331
title_264_262_	artist_13_13_13_1	4	track_title_6389_6389_6389_6	343
title_456_454_	artist_5_5_5_	2	track_title_1237_1237_12	272
title_117_115_	artist_6_6_6_	4	track_title_5771_5771_5	220
title_369_367_	artist_99_99_	5	track_title_1940_1940_1	268
title_252_250_	artist_85_85_	10	track_title_5988_5988_5988_598	516
title_441_439_	artist_37_37_37	4	track_title_1104_1104_	400
title_62_60_	artist_26_26_26	1	track_title_5303_5303_5303_530	427
title_174_172_	artist_85_85_	2	track_title_307_307_307_	393
title_466_464_	artist_4_4_4_	3	track_title_6659_6659_665	171
title_32_30_	artist_21_21_21_2	5	track_title_4291_4291_4291_	289
title_53_51_	artist_70_70_70_7	1	track_title_4976_4976_4976	493
title_141_139_	artist_70_70_70_7	2	track_title_3216_3216_3216_32	324
title_54_52_	artist_69_69_	3	track_title_1104_1104_	567
title_25_23_	artist_5_5_5_	7	track_title_2662_2662_26	597
title_316_314_	artist_61_61_61	1	track_title_2720_2720_2	493
title_392_390_	artist_62_62_62_6	4	track_title_81_81_81_81_81_8	295
title_285_283_	artist_8_8_8_	6	track_title_3981_3981_3981_3	142
title_40_38_	artist_62_62_62_6	9	track_title_2481_2481_2481	605
title_382_380_	artist_79_79_79_7	2	track_title_4873_4873_48	554
title_366_364_	artist_20_20_20	10	track_title_6584_6584_6	219
title_97_95_	artist_11_11_	2	track_title_5405_5405_5	286
title_303_301_	artist_59_59_59	7	track_title_396_396_396_396	309
title_410_408_	artist_93_93_	9	track_title_401_401_401_401	382
title_366_364_	artist_20_20_20	1	track_title_3059_3059_3059_3	239
title_116_114_	artist_92_92_92_9	6	track_title_1065_1065_1065_10	626
title_398_396_	artist_22_22_	7	track_title_154_154_154_154_	508
title_344_342_	artist_65_65_65_6	5	track_title_7102_7102_7102_7	479
title_90_88_	artist_41_41_	8	track_title_5181_5181_5	173
title_129_127_	artist_84_84_84_8	1	track_title_5552_5552_	409
title_178_176_	artist_91_91_91	1	track_title_2606_2606_26	243
title_196_194_	artist_66_66_	3	track_title_5024_5024_5024_502	493
title_91_89_	artist_85_85_	1	track_title_5438_5438_5	341
title_484_482_	artist_31_31_31	2	track_title_3404_3404_3404_340	161
title_483_481_	artist_61_61_61	9	track_title_6041_6041_6041_6	289
title_302_300_	artist_85_85_	3	track_title_5358_5358_5358_	220
title_131_129_	artist_37_37_37	4	track_title_5705_5705_5705_57	540
title_290_288_	artist_27_27_27_2	1	track_title_1851_1851_18	253
title_117_115_	artist_6_6_6_	2	track_title_3762_3762_3762_	404
title_267_265_	artist_23_23_23	5	track_title_4501_4501_45	372
title_338_336_	artist_84_84_84_8	6	track_title_3512_3512_3512	369
title_15_13_	artist_55_55_	1	track_title_5337_5337_5337_533	541
title_502_500_	artist_94_94_94	2	track_title_1483_1483_148	240
title_352_350_	artist_70_70_70_7	6	track_title_5905_5905_59	436
title_411_409_	artist_21_21_21_2	7	track_title_1037_1037_1037_10	132
title_170_168_	artist_40_40_40_4	9	track_title_4766_4766_4766_4	383
title_90_88_	artist_41_41_	12	track_title_4783_4783_478	387
title_147_145_	artist_20_20_20	1	track_title_6331_6331_	395
title_30_28_	artist_58_58_	2	track_title_2844_2844_	465
title_281_279_	artist_7_7_7_	7	track_title_4547_4547_4547_	351
title_345_343_	artist_59_59_59	10	track_title_3000_3000_	146
title_204_202_	artist_29_29_29	4	track_title_5210_5210_	487
title_189_187_	artist_32_32_32_3	6	track_title_5366_5366_5366_536	428
title_322_320_	artist_98_98_98_9	7	track_title_5424_5424_5424_54	141
title_480_478_	artist_9_9_9_	1	track_title_2295_2295_229	267
title_413_411_	artist_62_62_62_6	3	track_title_2697_2697_26	615
title_490_488_	artist_51_51_51_5	6	track_title_4886_4886_4886_	521
title_335_333_	artist_56_56_56	8	track_title_3480_3480_3480_	220
title_368_366_	artist_3_3_3_	4	track_title_4909_4909_4	148
title_182_180_	artist_9_9_9_	2	track_title_3435_3435_3435_343	199
title_1012_1010_	artist_1_1_1_	8	track_title_6810_6810_6810	457
title_379_377_	artist_5_5_5_	5	track_title_2434_2434_2434_24	578
title_478_476_	artist_1_1_1_	5	track_title_5552_5552_	281
title_473_471_	artist_93_93_	8	track_title_3459_3459_3459_	574
title_267_265_	artist_23_23_23	11	track_title_6671_6671_	224
title_460_458_	artist_76_76_76_7	1	track_title_1437_1437_1437_1	345
title_147_145_	artist_20_20_20	7	track_title_2368_2368_2368_	496
title_378_376_	artist_7_7_7_	5	track_title_6709_6709_6709_670	303
title_197_195_	artist_5_5_5_	10	track_title_2507_2507_	531
title_183_181_	artist_90_90_	11	track_title_4745_4745_	307
title_332_330_	artist_18_18_18	11	track_title_2281_2281_	161
title_392_390_	artist_62_62_62_6	2	track_title_7267_7267_7267_726	190
title_216_214_	artist_57_57_57_5	6	track_title_3949_3949_394	328
title_208_206_	artist_36_36_	13	track_title_4071_4071_4071	246
title_120_118_	artist_76_76_76_7	3	track_title_851_851_85	421
title_458_456_	artist_41_41_	6	track_title_2032_2032_2032_203	625
title_286_284_	artist_94_94_94	4	track_title_7260_7260_7260_726	182
title_68_66_	artist_2_2_2_	5	track_title_1635_1635_1	206
title_466_464_	artist_4_4_4_	2	track_title_4004_4004_4	438
title_44_42_	artist_56_56_56	5	track_title_5462_5462_5	340
title_421_419_	artist_84_84_84_8	2	track_title_6078_6078_6078_6	326
title_402_400_	artist_72_72_72	9	track_title_3164_3164_31	185
title_476_474_	artist_13_13_13_1	3	track_title_4277_4277_4277_427	618
title_68_66_	artist_2_2_2_	6	track_title_1167_1167_	520
title_157_155_	artist_42_42_42	11	track_title_822_822_82	327
title_246_244_	artist_53_53_53	12	track_title_2267_2267_226	380
title_202_200_	artist_73_73_73_7	1	track_title_4466_4466_	342
title_343_341_	artist_66_66_	2	track_title_456_456_45	376
title_159_157_	artist_71_71_	7	track_title_5886_5886_5886_5	135
title_91_89_	artist_85_85_	2	track_title_1662_1662_1	610
title_229_227_	artist_89_89_89	5	track_title_2893_2893_2893_2	141
title_409_407_	artist_42_42_42	10	track_title_5053_5053_5053_505	511
title_352_350_	artist_70_70_70_7	11	track_title_605_605_605_605_60	242
title_180_178_	artist_66_66_	11	track_title_6444_6444_6444_	598
title_266_264_	artist_85_85_	11	track_title_6399_6399_	312
title_472_470_	artist_41_41_	1	track_title_487_487_487_4	618
title_150_148_	artist_51_51_51_5	2	track_title_1844_1844_1844_184	219
title_306_304_	artist_35_35_35_3	2	track_title_2089_2089_2089_	402
title_513_511_	artist_42_42_42	3	track_title_2904_2904_2904_290	331
title_399_397_	artist_15_15_15	8	track_title_2616_2616_2616_	324
title_282_280_	artist_4_4_4_	9	track_title_949_949_949_94	443
title_332_330_	artist_18_18_18	1	track_title_4558_4558_4558_455	198
title_217_215_	artist_20_20_20	1	track_title_5096_5096_50	455
title_26_24_	artist_60_60_	4	track_title_7421_7421_	245
title_172_170_	artist_16_16_16_1	6	track_title_2454_2454_2454	461
title_13_11_	artist_9_9_9_	8	track_title_442_442_442	244
title_13_11_	artist_9_9_9_	2	track_title_1850_1850_18	500
title_289_287_	artist_72_72_72	7	track_title_5219_5219_	621
title_194_192_	artist_35_35_35_3	11	track_title_6986_6986_	272
title_466_464_	artist_4_4_4_	1	track_title_7243_7243_72	315
title_318_316_	artist_69_69_	2	track_title_3106_3106_31	476
title_420_418_	artist_79_79_79_7	3	track_title_4989_4989_4989_49	292
title_261_259_	artist_42_42_42	1	track_title_3854_3854_3854	443
title_241_239_	artist_30_30_	3	track_title_3603_3603_360	494
title_107_105_	artist_29_29_29	4	track_title_6020_6020_	529
title_462_460_	artist_80_80_80	5	track_title_5435_5435_5	340
title_242_240_	artist_91_91_91	3	track_title_5616_5616_5616_561	499
title_311_309_	artist_17_17_	9	track_title_3020_3020_3020_3	460
title_53_51_	artist_70_70_70_7	2	track_title_132_132_132_132_13	254
title_72_70_	artist_97_97_97	4	track_title_1385_1385_1	383
title_267_265_	artist_23_23_23	6	track_title_6739_6739_6739_673	263
title_396_394_	artist_27_27_27_2	7	track_title_2908_2908_2908_290	248
title_76_74_	artist_24_24_24_2	2	track_title_40_40_40_40_40_4	245
title_117_115_	artist_6_6_6_	3	track_title_3654_3654_	547
title_301_299_	artist_51_51_51_5	6	track_title_910_910_910_910_9	433
title_104_102_	artist_43_43_43_4	3	track_title_5075_5075_5075_	390
title_20_18_	artist_54_54_54_5	5	track_title_5908_5908_59	277
title_187_185_	artist_82_82_	6	track_title_5750_5750_5750	494
title_470_468_	artist_16_16_16_1	4	track_title_1571_1571_15	208
title_90_88_	artist_41_41_	11	track_title_6782_6782_6782_	262
title_245_243_	artist_56_56_56	5	track_title_4203_4203_4203_	244
title_251_249_	artist_16_16_16_1	6	track_title_1281_1281_1281_128	176
title_199_197_	artist_74_74_	9	track_title_1925_1925_1925	358
title_331_329_	artist_80_80_80	3	track_title_64_64_64_64_6	517
title_179_177_	artist_58_58_	7	track_title_1698_1698_1	176
title_359_357_	artist_62_62_62_6	8	track_title_3994_3994_	253
title_236_234_	artist_52_52_	2	track_title_256_256_256_2	534
title_217_215_	artist_20_20_20	6	track_title_3042_3042_304	405
title_219_217_	artist_12_12_12	4	track_title_6537_6537_6537	533
title_505_503_	artist_14_14_	8	track_title_3409_3409_3409_340	587
title_136_134_	artist_61_61_61	9	track_title_3441_3441_34	422
title_52_50_	artist_66_66_	5	track_title_3938_3938_	349
title_392_390_	artist_62_62_62_6	7	track_title_4510_4510_4510_	141
title_17_15_	artist_54_54_54_5	12	track_title_5613_5613_5613_561	162
title_144_142_	artist_77_77_	6	track_title_4372_4372_4	194
title_420_418_	artist_79_79_79_7	7	track_title_933_933_933_	200
title_382_380_	artist_79_79_79_7	8	track_title_6000_6000_600	342
title_420_418_	artist_79_79_79_7	10	track_title_4616_4616_4616_46	484
title_323_321_	artist_29_29_29	2	track_title_2730_2730_2730	340
title_489_487_	artist_54_54_54_5	2	track_title_5887_5887_5887_5	381
title_188_186_	artist_94_94_94	7	track_title_6097_6097_609	553
title_504_502_	artist_48_48_48	9	track_title_1360_1360_1360	272
title_389_387_	artist_68_68_68_6	2	track_title_3495_3495_3495_349	421
title_448_446_	artist_34_34_34	10	track_title_5471_5471_5471	169
title_418_416_	artist_54_54_54_5	4	track_title_1522_1522_1522_	193
title_184_182_	artist_100_100_1	5	track_title_550_550_550_5	417
title_72_70_	artist_97_97_97	3	track_title_4259_4259_42	367
title_198_196_	artist_32_32_32_3	5	track_title_6630_6630_6630_6	534
title_273_271_	artist_13_13_13_1	2	track_title_1265_1265_12	178
title_201_199_	artist_68_68_68_6	5	track_title_262_262_262_262_26	276
title_198_196_	artist_32_32_32_3	6	track_title_3837_3837_3837_38	470
title_313_311_	artist_58_58_	12	track_title_2678_2678_2678_	219
title_354_352_	artist_43_43_43_4	5	track_title_2135_2135_2	342
title_160_158_	artist_89_89_89	3	track_title_3733_3733_3733_	369
title_109_107_	artist_47_47_	4	track_title_253_253_253_2	465
title_205_203_	artist_37_37_37	10	track_title_2285_2285_	206
title_444_442_	artist_94_94_94	1	track_title_940_940_940_94	362
title_466_464_	artist_4_4_4_	5	track_title_3711_3711_3711_371	481
title_409_407_	artist_42_42_42	7	track_title_5606_5606_5606_	460
title_408_406_	artist_75_75_75	9	track_title_135_135_135_135_13	497
title_76_74_	artist_24_24_24_2	5	track_title_512_512_512_512_5	253
title_466_464_	artist_4_4_4_	10	track_title_429_429_429_4	445
title_412_410_	artist_9_9_9_	6	track_title_59_59_59_59_5	448
title_21_19_	artist_12_12_12	8	track_title_3060_3060_	195
title_257_255_	artist_71_71_	1	track_title_5434_5434_5	228
title_448_446_	artist_34_34_34	6	track_title_2997_2997_2997_299	587
title_192_190_	artist_54_54_54_5	1	track_title_1053_1053_1053	573
title_507_505_	artist_36_36_	2	track_title_122_122_122_122_	375
title_107_105_	artist_29_29_29	3	track_title_746_746_746_746_7	281
title_291_289_	artist_60_60_	4	track_title_3860_3860_3860_38	625
title_109_107_	artist_47_47_	5	track_title_1131_1131_	374
title_406_404_	artist_47_47_	9	track_title_1618_1618_1618	478
title_146_144_	artist_85_85_	11	track_title_2203_2203_220	181
title_385_383_	artist_49_49_49_4	4	track_title_5066_5066_50	518
title_410_408_	artist_93_93_	5	track_title_7053_7053_7	547
title_63_61_	artist_81_81_81_8	6	track_title_839_839_839_839_83	212
title_339_337_	artist_63_63_	2	track_title_3682_3682_	611
title_474_472_	artist_59_59_59	3	track_title_5288_5288_528	609
title_268_266_	artist_59_59_59	5	track_title_2106_2106_2	283
title_505_503_	artist_14_14_	7	track_title_3189_3189_3189_318	247
title_319_317_	artist_3_3_3_	2	track_title_4662_4662_4662	318
title_439_437_	artist_87_87_87_8	3	track_title_2489_2489_2489	388
title_40_38_	artist_62_62_62_6	10	track_title_3110_3110_3110_	234
title_258_256_	artist_76_76_76_7	1	track_title_2255_2255_	371
title_440_438_	artist_59_59_59	7	track_title_5230_5230_5230_5	249
title_238_236_	artist_15_15_15	7	track_title_6336_6336_	127
title_36_34_	artist_38_38_38_3	2	track_title_1071_1071_1	269
title_500_498_	artist_72_72_72	4	track_title_4077_4077_4077	605
title_97_95_	artist_11_11_	8	track_title_3984_3984_3984_3	401
title_102_100_	artist_38_38_38_3	3	track_title_7479_7479_7479_7	170
title_442_440_	artist_47_47_	6	track_title_5059_5059_5059_505	438
title_257_255_	artist_71_71_	3	track_title_541_541_541_541_5	606
title_369_367_	artist_99_99_	6	track_title_3218_3218_3218_32	593
title_83_81_	artist_53_53_53	2	track_title_3647_3647_3647_3	248
title_260_258_	artist_47_47_	3	track_title_638_638_638_638	449
title_283_281_	artist_83_83_83	6	track_title_2789_2789_2	471
title_40_38_	artist_62_62_62_6	1	track_title_4420_4420_4420_4	147
title_108_106_	artist_43_43_43_4	8	track_title_7395_7395_7	608
title_332_330_	artist_18_18_18	9	track_title_7470_7470_7470_7	577
title_86_84_	artist_60_60_	2	track_title_4026_4026_4026_40	377
title_184_182_	artist_100_100_1	4	track_title_265_265_265_265_26	192
title_56_54_	artist_29_29_29	7	track_title_1128_1128_1128_1	179
title_347_345_	artist_71_71_	9	track_title_5106_5106_5106	217
title_438_436_	artist_79_79_79_7	3	track_title_4776_4776_	207
title_211_209_	artist_20_20_20	4	track_title_5944_5944_5944_	258
title_463_461_	artist_57_57_57_5	1	track_title_167_167_167_167_16	527
title_108_106_	artist_43_43_43_4	9	track_title_1412_1412_	384
title_311_309_	artist_17_17_	1	track_title_3159_3159_3159_315	408
title_300_298_	artist_92_92_92_9	4	track_title_7212_7212_72	617
title_326_324_	artist_18_18_18	9	track_title_1399_1399_1399	488
title_309_307_	artist_7_7_7_	10	track_title_4081_4081_4081_40	248
title_105_103_	artist_84_84_84_8	2	track_title_4646_4646_4646_46	316
title_368_366_	artist_3_3_3_	6	track_title_4066_4066_4	464
title_396_394_	artist_27_27_27_2	6	track_title_3755_3755_37	470
title_488_486_	artist_16_16_16_1	7	track_title_5525_5525_	351
title_357_355_	artist_2_2_2_	4	track_title_6597_6597_6597	610
title_44_42_	artist_56_56_56	1	track_title_788_788_78	420
title_354_352_	artist_43_43_43_4	4	track_title_497_497_497_497	391
title_241_239_	artist_30_30_	5	track_title_2209_2209_220	308
title_412_410_	artist_9_9_9_	7	track_title_2174_2174_2174	530
title_263_261_	artist_15_15_15	3	track_title_6672_6672_	323
title_475_473_	artist_27_27_27_2	9	track_title_3500_3500_3	319
title_73_71_	artist_43_43_43_4	3	track_title_5549_5549_5549_5	591
title_442_440_	artist_47_47_	5	track_title_3842_3842_3	262
title_503_501_	artist_96_96_	1	track_title_4281_4281_42	281
title_69_67_	artist_34_34_34	4	track_title_1871_1871_1871_187	624
title_13_11_	artist_8_8_8_	4	track_title_1577_1577_15	171
title_445_443_	artist_88_88_	3	track_title_6234_6234_6234_62	182
title_504_502_	artist_48_48_48	5	track_title_6285_6285_6285	265
title_307_305_	artist_30_30_	6	track_title_6837_6837_6	128
title_349_347_	artist_27_27_27_2	3	track_title_1507_1507_1507_150	295
title_497_495_	artist_46_46_46_4	7	track_title_1857_1857_18	302
title_115_113_	artist_78_78_78	8	track_title_6168_6168_6168_	573
title_172_170_	artist_16_16_16_1	8	track_title_4958_4958_4958_49	472
title_185_183_	artist_31_31_31	9	track_title_7258_7258_7258_	312
title_179_177_	artist_58_58_	11	track_title_1875_1875_1875_187	295
title_351_349_	artist_11_11_	5	track_title_3322_3322_332	163
title_43_41_	artist_34_34_34	7	track_title_7204_7204_7204_720	461
title_414_412_	artist_60_60_	8	track_title_1950_1950_1950	143
title_175_173_	artist_78_78_78	9	track_title_5579_5579_5579_5	404
title_358_356_	artist_29_29_29	7	track_title_3984_3984_3984_3	242
title_198_196_	artist_32_32_32_3	4	track_title_6436_6436_64	318
title_118_116_	artist_51_51_51_5	8	track_title_711_711_711_711_7	622
title_194_192_	artist_35_35_35_3	4	track_title_4241_4241_4241_424	317
title_367_365_	artist_86_86_86	1	track_title_3025_3025_3025_3	516
title_331_329_	artist_80_80_80	6	track_title_5702_5702_5702_57	407
title_145_143_	artist_77_77_	2	track_title_1163_1163_	470
title_179_177_	artist_58_58_	5	track_title_2008_2008_2008_200	136
title_328_326_	artist_63_63_	2	track_title_4556_4556_4556_455	178
title_152_150_	artist_76_76_76_7	5	track_title_1526_1526_1526_	359
title_467_465_	artist_15_15_15	9	track_title_1137_1137_	300
title_454_452_	artist_68_68_68_6	2	track_title_1053_1053_1053	478
title_192_190_	artist_54_54_54_5	7	track_title_206_206_206_	451
title_406_404_	artist_47_47_	8	track_title_6907_6907_690	514
title_55_53_	artist_99_99_	9	track_title_7156_7156_715	564
title_130_128_	artist_51_51_51_5	2	track_title_4907_4907_4	492
title_471_469_	artist_41_41_	5	track_title_4824_4824_4824_	412
title_99_97_	artist_3_3_3_	13	track_title_6088_6088_	154
title_21_19_	artist_12_12_12	9	track_title_5313_5313_53	296
title_255_253_	artist_50_50_50	2	track_title_329_329_32	474
title_326_324_	artist_18_18_18	6	track_title_7032_7032_7032	194
title_408_406_	artist_75_75_75	7	track_title_7471_7471_7471_7	613
title_221_219_	artist_12_12_12	11	track_title_849_849_849	532
title_167_165_	artist_52_52_	3	track_title_5497_5497_5	485
title_257_255_	artist_71_71_	7	track_title_6515_6515_6515_65	170
title_236_234_	artist_52_52_	4	track_title_3572_3572_3572	406
title_318_316_	artist_69_69_	9	track_title_709_709_709_709_70	471
title_329_327_	artist_20_20_20	4	track_title_5297_5297_5297_5	460
title_256_254_	artist_79_79_79_7	6	track_title_6507_6507_6507	145
title_16_14_	artist_16_16_16_1	8	track_title_1587_1587_1587_	248
title_28_26_	artist_67_67_67	6	track_title_2633_2633_26	609
title_184_182_	artist_100_100_1	1	track_title_7314_7314_7314	609
title_60_58_	artist_17_17_	7	track_title_1040_1040_1	398
title_213_211_	artist_23_23_23	9	track_title_28_28_28_2	300
title_394_392_	artist_92_92_92_9	8	track_title_2289_2289_	589
title_315_313_	artist_51_51_51_5	10	track_title_2296_2296_229	597
title_30_28_	artist_58_58_	6	track_title_2119_2119_2119	223
title_507_505_	artist_36_36_	7	track_title_7028_7028_7	415
title_497_495_	artist_46_46_46_4	3	track_title_1274_1274_1274_	379
title_490_488_	artist_51_51_51_5	10	track_title_4221_4221_42	196
title_39_37_	artist_49_49_49_4	1	track_title_7444_7444_7444_7	457
title_332_330_	artist_18_18_18	3	track_title_3778_3778_3778_377	338
title_104_102_	artist_43_43_43_4	11	track_title_7422_7422_	434
title_109_107_	artist_47_47_	12	track_title_7344_7344_7344	215
title_474_472_	artist_59_59_59	1	track_title_216_216_216_21	220
title_187_185_	artist_82_82_	3	track_title_9_9_9_9_9_	380
title_286_284_	artist_94_94_94	8	track_title_2963_2963_2963_296	486
title_449_447_	artist_1_1_1_	7	track_title_5419_5419_5419	549
title_43_41_	artist_34_34_34	10	track_title_1644_1644_1644	253
title_347_345_	artist_71_71_	4	track_title_1466_1466_1466_1	419
title_337_335_	artist_98_98_98_9	5	track_title_6907_6907_690	467
title_149_147_	artist_50_50_50	11	track_title_2753_2753_2	430
title_226_224_	artist_73_73_73_7	1	track_title_4338_4338_4338_43	431
title_346_344_	artist_7_7_7_	5	track_title_1302_1302_1302	511
title_65_63_	artist_90_90_	1	track_title_116_116_116	534
title_350_348_	artist_31_31_31	2	track_title_280_280_28	570
title_234_232_	artist_40_40_40_4	5	track_title_6628_6628_662	193
title_54_52_	artist_69_69_	2	track_title_4378_4378_4	151
title_440_438_	artist_59_59_59	6	track_title_2011_2011_20	239
title_188_186_	artist_94_94_94	3	track_title_4133_4133_413	578
title_420_418_	artist_79_79_79_7	11	track_title_2706_2706_2706	152
title_131_129_	artist_37_37_37	3	track_title_6645_6645_	242
title_421_419_	artist_84_84_84_8	1	track_title_566_566_566_566	204
title_496_494_	artist_59_59_59	2	track_title_1806_1806_1806_	260
title_488_486_	artist_16_16_16_1	4	track_title_257_257_25	230
title_193_191_	artist_72_72_72	4	track_title_4366_4366_4366_43	380
title_188_186_	artist_94_94_94	8	track_title_2071_2071_20	246
title_343_341_	artist_66_66_	1	track_title_206_206_206_	360
title_193_191_	artist_72_72_72	3	track_title_2808_2808_2808_2	343
title_73_71_	artist_43_43_43_4	5	track_title_7465_7465_746	461
title_364_362_	artist_4_4_4_	9	track_title_6002_6002_600	350
title_131_129_	artist_37_37_37	7	track_title_5690_5690_5690_	370
title_252_250_	artist_85_85_	11	track_title_6258_6258_6258	213
title_405_403_	artist_60_60_	1	track_title_3614_3614_3614_3	450
title_446_444_	artist_47_47_	3	track_title_7036_7036_7036	319
title_197_195_	artist_5_5_5_	4	track_title_2666_2666_26	237
title_227_225_	artist_79_79_79_7	5	track_title_5590_5590_559	395
title_505_503_	artist_14_14_	6	track_title_6766_6766_6766_676	270
title_225_223_	artist_88_88_	12	track_title_230_230_230_230_23	171
title_58_56_	artist_43_43_43_4	1	track_title_5579_5579_5579_5	235
title_299_297_	artist_46_46_46_4	2	track_title_6985_6985_	321
title_18_16_	artist_13_13_13_1	4	track_title_5175_5175_5175_51	308
title_472_470_	artist_41_41_	5	track_title_3835_3835_3835_38	508
title_251_249_	artist_16_16_16_1	9	track_title_1882_1882_18	512
title_402_400_	artist_72_72_72	3	track_title_2587_2587_2587_2	561
title_111_109_	artist_36_36_	5	track_title_268_268_268_268_26	323
title_322_320_	artist_98_98_98_9	6	track_title_5565_5565_556	348
title_79_77_	artist_38_38_38_3	11	track_title_4197_4197_419	255
title_150_148_	artist_51_51_51_5	3	track_title_7287_7287_7287_	597
title_172_170_	artist_16_16_16_1	9	track_title_190_190_190_190_19	150
title_162_160_	artist_17_17_	6	track_title_6206_6206_6206_62	214
title_453_451_	artist_45_45_45	9	track_title_3006_3006_	512
title_13_11_	artist_8_8_8_	8	track_title_3909_3909_	325
title_22_20_	artist_5_5_5_	1	track_title_7371_7371_7371	246
title_456_454_	artist_5_5_5_	4	track_title_3631_3631_363	423
title_469_467_	artist_4_4_4_	6	track_title_4351_4351_4351	246
title_472_470_	artist_41_41_	3	track_title_6370_6370_637	197
title_246_244_	artist_53_53_53	8	track_title_2037_2037_2037_203	137
title_357_355_	artist_2_2_2_	2	track_title_7186_7186_718	421
title_115_113_	artist_78_78_78	10	track_title_1821_1821_18	489
title_454_452_	artist_68_68_68_6	1	track_title_3184_3184_3184_318	206
title_24_22_	artist_75_75_75	4	track_title_2939_2939_2939_293	225
title_379_377_	artist_5_5_5_	1	track_title_5252_5252_525	354
title_351_349_	artist_11_11_	3	track_title_2113_2113_2113	455
title_25_23_	artist_5_5_5_	6	track_title_321_321_321_321_	277
title_464_462_	artist_88_88_	7	track_title_5893_5893_	588
title_315_313_	artist_51_51_51_5	1	track_title_5817_5817_581	442
title_511_509_	artist_14_14_	3	track_title_38_38_38_38_38_3	451
title_461_459_	artist_6_6_6_	3	track_title_3720_3720_37	461
title_454_452_	artist_68_68_68_6	9	track_title_4009_4009_4	129
title_373_371_	artist_86_86_86	9	track_title_1921_1921_1921	386
title_469_467_	artist_4_4_4_	1	track_title_5720_5720_5720	161
title_226_224_	artist_73_73_73_7	5	track_title_78_78_78_78_7	362
title_297_295_	artist_34_34_34	10	track_title_3443_3443_34	269
title_414_412_	artist_60_60_	3	track_title_2156_2156_2156_21	264
title_300_298_	artist_92_92_92_9	2	track_title_922_922_922_9	328
title_121_119_	artist_87_87_87_8	3	track_title_3155_3155_3155_315	236
title_494_492_	artist_19_19_19_1	4	track_title_6781_6781_6781_	167
title_503_501_	artist_96_96_	9	track_title_1559_1559_1559_	418
title_140_138_	artist_80_80_80	11	track_title_2731_2731_2731	285
title_103_101_	artist_47_47_	1	track_title_3022_3022_3022_3	276
title_259_257_	artist_70_70_70_7	4	track_title_5876_5876_587	492
title_498_496_	artist_82_82_	8	track_title_3575_3575_3575	491
title_192_190_	artist_54_54_54_5	4	track_title_2144_2144_2144	312
title_32_30_	artist_21_21_21_2	7	track_title_6212_6212_6	323
title_475_473_	artist_27_27_27_2	11	track_title_5913_5913_5913_	142
title_216_214_	artist_57_57_57_5	13	track_title_7245_7245_72	287
title_50_48_	artist_5_5_5_	5	track_title_2750_2750_2	442
title_271_269_	artist_61_61_61	3	track_title_2866_2866_2866_2	340
title_393_391_	artist_55_55_	4	track_title_5383_5383_5383_	299
title_228_226_	artist_65_65_65_6	8	track_title_104_104_104_104	323
title_510_508_	artist_97_97_97	3	track_title_1101_1101_	202
title_186_184_	artist_2_2_2_	4	track_title_850_850_850_8	156
title_146_144_	artist_85_85_	5	track_title_7428_7428_	330
title_108_106_	artist_43_43_43_4	4	track_title_5350_5350_5350_	197
title_107_105_	artist_29_29_29	5	track_title_1445_1445_	423
title_288_286_	artist_25_25_	1	track_title_3193_3193_31	372
title_463_461_	artist_57_57_57_5	2	track_title_4046_4046_4046	581
title_194_192_	artist_35_35_35_3	8	track_title_1923_1923_1923	297
title_372_370_	artist_43_43_43_4	3	track_title_552_552_552_552_	201
title_337_335_	artist_98_98_98_9	7	track_title_5496_5496_5	495
title_458_456_	artist_41_41_	8	track_title_1844_1844_1844_184	171
title_161_159_	artist_36_36_	10	track_title_6684_6684_668	529
title_212_210_	artist_42_42_42	4	track_title_137_137_137_	515
title_300_298_	artist_92_92_92_9	9	track_title_6676_6676_	311
title_465_463_	artist_59_59_59	12	track_title_6467_6467_64	347
title_396_394_	artist_27_27_27_2	1	track_title_5382_5382_5382_	254
title_301_299_	artist_51_51_51_5	2	track_title_880_880_88	591
title_303_301_	artist_59_59_59	1	track_title_1135_1135_	339
title_89_87_	artist_40_40_40_4	2	track_title_4200_4200_4200_	402
title_307_305_	artist_30_30_	3	track_title_3134_3134_31	298
title_347_345_	artist_71_71_	5	track_title_7181_7181_718	376
title_66_64_	artist_55_55_	1	track_title_3412_3412_34	552
title_406_404_	artist_47_47_	4	track_title_1383_1383_1	601
title_282_280_	artist_4_4_4_	6	track_title_3284_3284_3	587
title_335_333_	artist_56_56_56	9	track_title_2687_2687_2687_268	155
title_298_296_	artist_6_6_6_	3	track_title_4169_4169_416	417
title_281_279_	artist_7_7_7_	11	track_title_5331_5331_5331_533	302
title_276_274_	artist_8_8_8_	2	track_title_311_311_311_31	393
title_281_279_	artist_7_7_7_	9	track_title_4187_4187_	324
title_167_165_	artist_52_52_	1	track_title_3966_3966_	176
title_367_365_	artist_86_86_86	5	track_title_4814_4814_48	139
title_329_327_	artist_20_20_20	3	track_title_3824_3824_3824	545
title_161_159_	artist_36_36_	12	track_title_4051_4051_4051_40	502
title_231_229_	artist_83_83_83	6	track_title_2251_2251_	619
title_405_403_	artist_60_60_	5	track_title_3020_3020_3020_3	317
title_101_99_	artist_58_58_	8	track_title_2540_2540_254	362
title_315_313_	artist_51_51_51_5	2	track_title_2590_2590_	278
title_377_375_	artist_37_37_37	5	track_title_3756_3756_37	200
title_265_263_	artist_79_79_79_7	8	track_title_6092_6092_609	352
title_56_54_	artist_29_29_29	1	track_title_4856_4856_4856_	328
title_386_384_	artist_86_86_86	7	track_title_4818_4818_48	247
title_351_349_	artist_11_11_	8	track_title_1209_1209_12	209
title_425_423_	artist_34_34_34	6	track_title_5048_5048_5048_	326
title_355_353_	artist_90_90_	10	track_title_3096_3096_	367
title_1012_1010_	artist_51_51_51_5	3	track_title_2081_2081_2081_	183
title_342_340_	artist_47_47_	1	track_title_911_911_911_91	313
title_206_204_	artist_20_20_20	3	track_title_5337_5337_5337_533	380
title_103_101_	artist_47_47_	5	track_title_1065_1065_1065_10	239
title_95_93_	artist_87_87_87_8	7	track_title_1760_1760_176	316
title_173_171_	artist_33_33_	2	track_title_5447_5447_5447	135
title_244_242_	artist_47_47_	7	track_title_645_645_645_645_6	262
title_57_55_	artist_23_23_23	2	track_title_6056_6056_	265
title_100_98_	artist_66_66_	3	track_title_1309_1309_1309	452
title_80_78_	artist_19_19_19_1	6	track_title_6921_6921_	614
title_306_304_	artist_35_35_35_3	3	track_title_4606_4606_4606	257
title_165_163_	artist_79_79_79_7	1	track_title_301_301_301_	378
title_251_249_	artist_16_16_16_1	8	track_title_3188_3188_3188_318	609
title_164_162_	artist_92_92_92_9	1	track_title_1333_1333_1333	215
title_217_215_	artist_20_20_20	5	track_title_1842_1842_1842_184	315
title_343_341_	artist_66_66_	8	track_title_6043_6043_6043_6	389
title_435_433_	artist_97_97_97	1	track_title_750_750_75	521
title_508_506_	artist_87_87_87_8	9	track_title_5754_5754_5754	364
title_296_294_	artist_11_11_	2	track_title_6537_6537_6537	224
title_212_210_	artist_42_42_42	1	track_title_1828_1828_18	222
title_458_456_	artist_41_41_	4	track_title_7420_7420_	460
title_25_23_	artist_5_5_5_	9	track_title_7107_7107_7107_7	377
title_375_373_	artist_34_34_34	3	track_title_1739_1739_173	210
title_343_341_	artist_66_66_	6	track_title_6441_6441_6441_	335
title_180_178_	artist_66_66_	3	track_title_6799_6799_6799_679	228
title_470_468_	artist_16_16_16_1	8	track_title_2458_2458_2458	519
title_16_14_	artist_16_16_16_1	9	track_title_5430_5430_5	524
title_155_153_	artist_33_33_	8	track_title_5170_5170_5170_51	501
title_123_121_	artist_26_26_26	4	track_title_6343_6343_634	501
title_492_490_	artist_32_32_32_3	3	track_title_6983_6983_	326
title_274_272_	artist_2_2_2_	3	track_title_656_656_656_656_	466
title_453_451_	artist_45_45_45	13	track_title_936_936_936_	484
title_299_297_	artist_46_46_46_4	8	track_title_6940_6940_6940_6	509
title_406_404_	artist_47_47_	6	track_title_6736_6736_6736_673	601
title_401_399_	artist_37_37_37	2	track_title_558_558_558_558_	474
title_401_399_	artist_37_37_37	3	track_title_7484_7484_	602
title_141_139_	artist_70_70_70_7	4	track_title_2337_2337_2337_	304
title_230_228_	artist_75_75_75	8	track_title_24_24_24_24_24_2	241
title_507_505_	artist_36_36_	4	track_title_7257_7257_7257_	450
title_55_53_	artist_99_99_	8	track_title_3151_3151_3151_315	333
title_255_253_	artist_50_50_50	10	track_title_4868_4868_4868_486	454
title_353_351_	artist_8_8_8_	4	track_title_1722_1722_	617
title_350_348_	artist_31_31_31	5	track_title_6581_6581_6	357
title_35_33_	artist_59_59_59	6	track_title_4654_4654_4	426
title_279_277_	artist_61_61_61	1	track_title_6282_6282_6282	166
title_70_68_	artist_96_96_	6	track_title_6719_6719_67	388
title_100_98_	artist_66_66_	7	track_title_2277_2277_2277_2	564
title_110_108_	artist_69_69_	6	track_title_3537_3537_3	255
title_236_234_	artist_52_52_	3	track_title_3383_3383_338	170
title_115_113_	artist_78_78_78	12	track_title_6717_6717_67	410
title_15_13_	artist_55_55_	10	track_title_1090_1090_1090_10	228
title_236_234_	artist_52_52_	1	track_title_7072_7072_7072_70	195
title_492_490_	artist_32_32_32_3	6	track_title_2372_2372_2372_237	471
title_334_332_	artist_45_45_45	3	track_title_5924_5924_5924_592	153
title_45_43_	artist_97_97_97	6	track_title_5943_5943_5943_	369
title_280_278_	artist_6_6_6_	3	track_title_1928_1928_1928	164
title_348_346_	artist_97_97_97	1	track_title_7050_7050_7	205
title_472_470_	artist_41_41_	6	track_title_3859_3859_3859	414
title_13_11_	artist_18_18_18	2	track_title_490_490_490_490_49	226
title_246_244_	artist_53_53_53	2	track_title_6548_6548_6548_65	236
title_286_284_	artist_94_94_94	3	track_title_3716_3716_3716_371	573
title_19_17_	artist_18_18_18	6	track_title_1136_1136_	368
title_408_406_	artist_75_75_75	3	track_title_2445_2445_2	221
title_388_386_	artist_81_81_81_8	10	track_title_699_699_699_699	260
title_471_469_	artist_41_41_	1	track_title_4791_4791_4791_4	495
title_177_175_	artist_25_25_	1	track_title_2877_2877_	505
title_188_186_	artist_94_94_94	2	track_title_6581_6581_6	327
title_333_331_	artist_46_46_46_4	1	track_title_3210_3210_3210_32	339
title_403_401_	artist_60_60_	4	track_title_2526_2526_2526_2	386
title_167_165_	artist_52_52_	10	track_title_3752_3752_37	482
title_67_65_	artist_85_85_	1	track_title_5633_5633_5633_	195
title_343_341_	artist_66_66_	3	track_title_6168_6168_6168_	309
title_158_156_	artist_29_29_29	11	track_title_6901_6901_690	127
title_73_71_	artist_43_43_43_4	1	track_title_1754_1754_	451
title_290_288_	artist_27_27_27_2	4	track_title_6716_6716_67	198
title_34_32_	artist_90_90_	7	track_title_5309_5309_5309_530	345
title_162_160_	artist_17_17_	11	track_title_2092_2092_2092_209	151
title_326_324_	artist_18_18_18	1	track_title_196_196_196_196_19	247
title_157_155_	artist_42_42_42	7	track_title_7215_7215_72	329
title_480_478_	artist_9_9_9_	3	track_title_5034_5034_50	404
title_175_173_	artist_78_78_78	3	track_title_1819_1819_1819_181	266
title_314_312_	artist_32_32_32_3	4	track_title_2723_2723_2	134
title_482_480_	artist_91_91_91	6	track_title_601_601_601_	492
title_164_162_	artist_92_92_92_9	7	track_title_6471_6471_6471_	407
title_449_447_	artist_1_1_1_	9	track_title_2265_2265_226	132
title_139_137_	artist_77_77_	11	track_title_4860_4860_4860_486	295
title_230_228_	artist_75_75_75	10	track_title_5164_5164_5164	280
title_209_207_	artist_75_75_75	6	track_title_1380_1380_1	505
title_30_28_	artist_58_58_	7	track_title_1494_1494_1494_1	187
title_370_368_	artist_40_40_40_4	2	track_title_6939_6939_693	135
title_183_181_	artist_90_90_	7	track_title_4068_4068_4	547
title_460_458_	artist_76_76_76_7	4	track_title_5638_5638_5638_	567
title_484_482_	artist_31_31_31	12	track_title_812_812_812_812_8	547
title_317_315_	artist_46_46_46_4	11	track_title_7390_7390_7	266
title_335_333_	artist_56_56_56	1	track_title_3315_3315_	374
title_63_61_	artist_81_81_81_8	3	track_title_6271_6271_6	471
title_150_148_	artist_51_51_51_5	10	track_title_6244_6244_6	362
title_417_415_	artist_66_66_	2	track_title_101_101_101_101	546
title_153_151_	artist_77_77_	6	track_title_6904_6904_690	603
title_287_285_	artist_23_23_23	10	track_title_1584_1584_1584_	201
title_193_191_	artist_72_72_72	1	track_title_5569_5569_556	280
title_388_386_	artist_81_81_81_8	7	track_title_1168_1168_	499
title_263_261_	artist_15_15_15	9	track_title_6690_6690_6690_6	514
title_292_290_	artist_6_6_6_	2	track_title_440_440_440_440_4	178
title_42_40_	artist_51_51_51_5	6	track_title_5822_5822_5822_5	358
title_90_88_	artist_41_41_	6	track_title_470_470_470_47	145
title_315_313_	artist_51_51_51_5	9	track_title_3528_3528_3528_35	611
title_50_48_	artist_5_5_5_	11	track_title_910_910_910_910_9	605
title_509_507_	artist_73_73_73_7	1	track_title_4740_4740_	450
title_16_14_	artist_16_16_16_1	5	track_title_1175_1175_117	242
title_156_154_	artist_27_27_27_2	6	track_title_414_414_414_414_4	550
title_264_262_	artist_13_13_13_1	7	track_title_205_205_205_205	327
title_162_160_	artist_17_17_	12	track_title_314_314_314_31	514
title_311_309_	artist_17_17_	2	track_title_568_568_568_568_56	220
title_265_263_	artist_79_79_79_7	5	track_title_4004_4004_4	539
title_145_143_	artist_77_77_	10	track_title_5616_5616_5616_561	243
title_268_266_	artist_59_59_59	1	track_title_2948_2948_29	186
title_478_476_	artist_1_1_1_	3	track_title_3005_3005_	501
title_20_18_	artist_54_54_54_5	4	track_title_4895_4895_4895_489	528
title_469_467_	artist_4_4_4_	5	track_title_604_604_604_	393
title_314_312_	artist_32_32_32_3	9	track_title_1029_1029_1029	193
title_112_110_	artist_49_49_49_4	1	track_title_6718_6718_67	608
title_317_315_	artist_46_46_46_4	5	track_title_3162_3162_31	284
title_324_322_	artist_51_51_51_5	13	track_title_4107_4107_410	164
title_219_217_	artist_12_12_12	1	track_title_246_246_246	501
title_150_148_	artist_51_51_51_5	4	track_title_4586_4586_4586_458	487
title_483_481_	artist_61_61_61	5	track_title_6047_6047_6047_6	506
title_250_248_	artist_18_18_18	3	track_title_2876_2876_	221
title_453_451_	artist_45_45_45	5	track_title_903_903_903_903	403
title_500_498_	artist_72_72_72	7	track_title_6522_6522_6	581
title_131_129_	artist_37_37_37	9	track_title_4668_4668_4668	428
title_60_58_	artist_17_17_	2	track_title_3109_3109_31	248
title_162_160_	artist_17_17_	7	track_title_7081_7081_7	491
title_305_303_	artist_91_91_91	1	track_title_7115_7115_	539
title_402_400_	artist_72_72_72	5	track_title_7141_7141_	225
title_154_152_	artist_76_76_76_7	3	track_title_3841_3841_3	236
title_388_386_	artist_81_81_81_8	3	track_title_1775_1775_1775_1	127
title_263_261_	artist_15_15_15	1	track_title_3955_3955_3955_3	248
title_213_211_	artist_23_23_23	4	track_title_6965_6965_696	337
title_323_321_	artist_29_29_29	6	track_title_188_188_18	541
title_189_187_	artist_32_32_32_3	11	track_title_7061_7061_7061	183
title_242_240_	artist_91_91_91	2	track_title_3096_3096_	185
title_136_134_	artist_61_61_61	2	track_title_7342_7342_7342	520
title_271_269_	artist_61_61_61	5	track_title_7408_7408_740	448
title_301_299_	artist_51_51_51_5	3	track_title_2142_2142_2142	135
title_452_450_	artist_19_19_19_1	2	track_title_4485_4485_4485_4	337
title_297_295_	artist_34_34_34	9	track_title_1943_1943_1	393
title_313_311_	artist_58_58_	11	track_title_165_165_165_165	598
title_214_212_	artist_12_12_12	3	track_title_7191_7191_7191_7	206
title_473_471_	artist_93_93_	9	track_title_4654_4654_4	595
title_424_422_	artist_17_17_	1	track_title_6714_6714_67	308
title_408_406_	artist_75_75_75	2	track_title_4125_4125_	157
title_185_183_	artist_31_31_31	5	track_title_2169_2169_2	306
title_499_497_	artist_79_79_79_7	6	track_title_191_191_191_191	282
title_179_177_	artist_58_58_	12	track_title_4050_4050_4050_40	168
title_486_484_	artist_47_47_	2	track_title_863_863_863_863	240
title_181_179_	artist_40_40_40_4	8	track_title_948_948_948_948_9	164
title_24_22_	artist_75_75_75	1	track_title_3694_3694_369	187
title_157_155_	artist_42_42_42	13	track_title_4173_4173_4173_4	336
title_325_323_	artist_79_79_79_7	1	track_title_361_361_361_361	485
title_398_396_	artist_22_22_	4	track_title_6084_6084_	217
title_156_154_	artist_27_27_27_2	7	track_title_955_955_95	423
title_273_271_	artist_13_13_13_1	3	track_title_6269_6269_6269_62	164
title_441_439_	artist_37_37_37	5	track_title_6793_6793_6793_679	336
title_361_359_	artist_23_23_23	6	track_title_4567_4567_45	526
title_35_33_	artist_59_59_59	8	track_title_5444_5444_5444	176
title_33_31_	artist_32_32_32_3	2	track_title_4125_4125_	273
title_202_200_	artist_73_73_73_7	6	track_title_6375_6375_637	572
title_117_115_	artist_6_6_6_	7	track_title_298_298_298_298	266
title_53_51_	artist_70_70_70_7	3	track_title_4574_4574_4574_	153
title_66_64_	artist_55_55_	7	track_title_1642_1642_1642	350
title_498_496_	artist_82_82_	1	track_title_2525_2525_2525_2	452
title_58_56_	artist_43_43_43_4	10	track_title_4108_4108_410	267
title_330_328_	artist_34_34_34	2	track_title_4074_4074_4074	223
title_123_121_	artist_26_26_26	7	track_title_500_500_500_	204
title_43_41_	artist_34_34_34	9	track_title_303_303_303_303	599
title_397_395_	artist_17_17_	10	track_title_2545_2545_254	142
title_456_454_	artist_5_5_5_	1	track_title_2204_2204_220	225
title_234_232_	artist_40_40_40_4	4	track_title_1170_1170_117	256
title_453_451_	artist_45_45_45	10	track_title_4637_4637_4637	446
title_152_150_	artist_76_76_76_7	11	track_title_4155_4155_	388
title_325_323_	artist_79_79_79_7	6	track_title_7321_7321_7321_73	315
title_180_178_	artist_66_66_	12	track_title_1945_1945_1	539
title_397_395_	artist_17_17_	4	track_title_2068_2068_2068_206	167
title_226_224_	artist_73_73_73_7	7	track_title_4553_4553_4553_455	482
title_373_371_	artist_86_86_86	12	track_title_6254_6254_6254	259
title_289_287_	artist_72_72_72	1	track_title_6746_6746_67	202
title_16_14_	artist_16_16_16_1	2	track_title_4782_4782_478	622
title_398_396_	artist_22_22_	10	track_title_5679_5679_5679_567	528
title_23_21_	artist_21_21_21_2	1	track_title_4908_4908_4	254
title_309_307_	artist_7_7_7_	5	track_title_5178_5178_5178_51	593
title_210_208_	artist_59_59_59	6	track_title_6655_6655_665	361
title_211_209_	artist_20_20_20	10	track_title_2250_2250_	249
title_358_356_	artist_29_29_29	11	track_title_5451_5451_5451_54	438
title_148_146_	artist_67_67_67	9	track_title_1007_1007_1007_10	166
title_101_99_	artist_58_58_	12	track_title_4253_4253_42	313
title_69_67_	artist_34_34_34	2	track_title_4925_4925_4925_49	446
title_84_82_	artist_84_84_84_8	1	track_title_3266_3266_3266	498
title_222_220_	artist_78_78_78	3	track_title_1425_1425_142	487
title_260_258_	artist_47_47_	2	track_title_481_481_481_4	469
title_70_68_	artist_96_96_	1	track_title_4371_4371_4	209
title_396_394_	artist_27_27_27_2	5	track_title_2424_2424_2424	425
title_238_236_	artist_15_15_15	3	track_title_432_432_432_432_43	582
title_131_129_	artist_37_37_37	1	track_title_5323_5323_5323_	407
title_233_231_	artist_22_22_	9	track_title_3055_3055_3055_3	420
title_383_381_	artist_94_94_94	1	track_title_182_182_18	584
title_30_28_	artist_58_58_	1	track_title_1549_1549_15	367
title_307_305_	artist_30_30_	5	track_title_7183_7183_718	353
title_33_31_	artist_32_32_32_3	3	track_title_1955_1955_1955	423
title_331_329_	artist_80_80_80	7	track_title_1538_1538_1538_153	552
title_221_219_	artist_12_12_12	13	track_title_6658_6658_665	374
title_401_399_	artist_37_37_37	6	track_title_6066_6066_606	178
title_448_446_	artist_34_34_34	12	track_title_4868_4868_4868_486	254
title_152_150_	artist_76_76_76_7	2	track_title_6716_6716_67	372
title_443_441_	artist_17_17_	2	track_title_7042_7042_7042_70	449
title_423_421_	artist_79_79_79_7	6	track_title_4557_4557_4557_455	250
title_479_477_	artist_29_29_29	3	track_title_2050_2050_2050_	523
title_490_488_	artist_51_51_51_5	5	track_title_7423_7423_	622
title_454_452_	artist_68_68_68_6	5	track_title_3356_3356_335	409
title_132_130_	artist_9_9_9_	3	track_title_1859_1859_18	574
title_319_317_	artist_3_3_3_	12	track_title_3504_3504_3	577
title_216_214_	artist_57_57_57_5	12	track_title_1248_1248_1248_	366
title_365_363_	artist_51_51_51_5	7	track_title_4614_4614_4614_46	327
title_393_391_	artist_55_55_	6	track_title_2527_2527_2527_2	207
title_501_499_	artist_50_50_50	3	track_title_6333_6333_	551
title_33_31_	artist_32_32_32_3	4	track_title_4897_4897_4897_489	553
title_323_321_	artist_29_29_29	1	track_title_726_726_726_7	605
title_70_68_	artist_96_96_	12	track_title_3040_3040_304	570
title_152_150_	artist_76_76_76_7	4	track_title_7130_7130_7130_7	314
title_115_113_	artist_78_78_78	2	track_title_3619_3619_3619_3	524
title_395_393_	artist_60_60_	5	track_title_6719_6719_67	522
title_345_343_	artist_59_59_59	11	track_title_5978_5978_5978_	269
title_351_349_	artist_11_11_	1	track_title_7083_7083_7	286
title_380_378_	artist_74_74_	10	track_title_3899_3899_3899_38	596
title_80_78_	artist_19_19_19_1	2	track_title_411_411_411_411_4	371
title_192_190_	artist_54_54_54_5	5	track_title_6241_6241_6	357
title_471_469_	artist_41_41_	6	track_title_4939_4939_4	336
title_158_156_	artist_29_29_29	4	track_title_3967_3967_	526
title_191_189_	artist_3_3_3_	6	track_title_1821_1821_18	617
title_26_24_	artist_60_60_	1	track_title_2123_2123_2123_21	247
title_395_393_	artist_60_60_	2	track_title_458_458_458_4	607
title_22_20_	artist_5_5_5_	4	track_title_346_346_346_34	556
title_14_12_	artist_53_53_53	3	track_title_2970_2970_29	603
title_197_195_	artist_5_5_5_	5	track_title_4143_4143_4143_4	381
title_190_188_	artist_95_95_95_9	8	track_title_5076_5076_5076_	366
title_382_380_	artist_79_79_79_7	10	track_title_4297_4297_4297_	461
title_291_289_	artist_60_60_	7	track_title_1815_1815_1815_181	249
title_209_207_	artist_75_75_75	11	track_title_3377_3377_	238
title_427_425_	artist_88_88_	2	track_title_6037_6037_603	128
title_277_275_	artist_44_44_	5	track_title_6284_6284_6284	517
title_223_221_	artist_4_4_4_	1	track_title_4196_4196_419	232
title_147_145_	artist_20_20_20	2	track_title_5122_5122_5	569
title_464_462_	artist_88_88_	3	track_title_5441_5441_5441	221
title_220_218_	artist_36_36_	4	track_title_530_530_530_530_53	346
title_354_352_	artist_43_43_43_4	7	track_title_2699_2699_26	215
title_301_299_	artist_51_51_51_5	8	track_title_5188_5188_5	175
title_509_507_	artist_73_73_73_7	6	track_title_5447_5447_5447	389
title_111_109_	artist_36_36_	2	track_title_4487_4487_4487_4	251
title_208_206_	artist_36_36_	3	track_title_5957_5957_5957_595	589
title_242_240_	artist_91_91_91	6	track_title_4853_4853_4853_	325
title_181_179_	artist_40_40_40_4	3	track_title_107_107_107_107	294
title_495_493_	artist_35_35_35_3	5	track_title_3923_3923_3923_3	368
title_74_72_	artist_21_21_21_2	10	track_title_5299_5299_5299_5	133
title_481_479_	artist_5_5_5_	12	track_title_908_908_908_908_90	246
title_442_440_	artist_47_47_	7	track_title_5181_5181_5	356
title_146_144_	artist_85_85_	13	track_title_3392_3392_3392_3	497
title_315_313_	artist_51_51_51_5	8	track_title_5626_5626_56	319
title_327_325_	artist_49_49_49_4	5	track_title_3324_3324_332	236
title_104_102_	artist_43_43_43_4	1	track_title_4716_4716_	438
title_262_260_	artist_29_29_29	11	track_title_596_596_596_	371
title_149_147_	artist_50_50_50	10	track_title_1688_1688_1688_16	501
title_420_418_	artist_79_79_79_7	1	track_title_2640_2640_2640_	237
title_318_316_	artist_69_69_	1	track_title_3100_3100_31	340
title_357_355_	artist_2_2_2_	7	track_title_6999_6999_699	184
title_79_77_	artist_38_38_38_3	6	track_title_386_386_386_3	401
title_453_451_	artist_45_45_45	1	track_title_3935_3935_	522
title_187_185_	artist_82_82_	2	track_title_1286_1286_1286_128	224
title_455_453_	artist_52_52_	6	track_title_5004_5004_50	394
title_290_288_	artist_27_27_27_2	9	track_title_2866_2866_2866_2	415
title_142_140_	artist_61_61_61	5	track_title_6153_6153_61	490
title_20_18_	artist_54_54_54_5	1	track_title_5605_5605_5605_	452
title_52_50_	artist_66_66_	11	track_title_2837_2837_2837_2	479
title_494_492_	artist_19_19_19_1	7	track_title_1961_1961_1961_19	211
title_266_264_	artist_85_85_	1	track_title_6010_6010_6010_6	587
title_1012_1010_	artist_75_75_75	3	track_title_1501_1501_1501_150	537
title_414_412_	artist_60_60_	2	track_title_855_855_855_855_	415
title_490_488_	artist_51_51_51_5	3	track_title_4934_4934_4	468
title_218_216_	artist_49_49_49_4	1	track_title_806_806_806_	575
title_369_367_	artist_99_99_	7	track_title_2152_2152_2152_21	488
title_162_160_	artist_17_17_	9	track_title_4252_4252_42	268
title_333_331_	artist_46_46_46_4	4	track_title_2816_2816_	175
title_295_293_	artist_13_13_13_1	5	track_title_6767_6767_6767_676	459
title_310_308_	artist_69_69_	7	track_title_512_512_512_512_5	232
title_181_179_	artist_40_40_40_4	2	track_title_5542_5542_5542_5	387
title_50_48_	artist_5_5_5_	3	track_title_5564_5564_556	336
title_179_177_	artist_58_58_	2	track_title_466_466_466_	534
title_478_476_	artist_1_1_1_	2	track_title_2608_2608_26	617
title_403_401_	artist_60_60_	3	track_title_3531_3531_3	418
title_94_92_	artist_93_93_	5	track_title_3824_3824_3824	434
title_51_49_	artist_19_19_19_1	3	track_title_54_54_54_54_54_5	226
title_40_38_	artist_62_62_62_6	4	track_title_6022_6022_	483
title_250_248_	artist_18_18_18	4	track_title_1358_1358_1	331
title_35_33_	artist_59_59_59	1	track_title_2829_2829_282	254
title_421_419_	artist_84_84_84_8	4	track_title_1631_1631_1	538
title_425_423_	artist_34_34_34	7	track_title_5790_5790_5790_57	294
title_21_19_	artist_12_12_12	7	track_title_4829_4829_4829_	508
title_152_150_	artist_76_76_76_7	3	track_title_4273_4273_4273_427	536
title_212_210_	artist_42_42_42	2	track_title_4853_4853_4853_	267
title_338_336_	artist_84_84_84_8	3	track_title_7324_7324_7324_73	512
title_158_156_	artist_29_29_29	1	track_title_1315_1315_1315_13	288
title_117_115_	artist_6_6_6_	9	track_title_611_611_611_61	402
title_259_257_	artist_70_70_70_7	6	track_title_5881_5881_5881_5	199
title_512_510_	artist_42_42_42	5	track_title_4508_4508_45	608
title_69_67_	artist_34_34_34	6	track_title_7290_7290_7290_729	150
title_164_162_	artist_92_92_92_9	4	track_title_5862_5862_	285
title_89_87_	artist_40_40_40_4	8	track_title_5086_5086_5086_508	201
title_27_25_	artist_98_98_98_9	1	track_title_5315_5315_53	439
title_362_360_	artist_61_61_61	4	track_title_83_83_83_83_8	158
title_13_11_	artist_33_33_	4	track_title_4925_4925_4925_49	306
title_1012_1010_	artist_75_75_75	4	track_title_6337_6337_	149
title_54_52_	artist_69_69_	5	track_title_2121_2121_2121_21	280
title_450_448_	artist_91_91_91	7	track_title_3280_3280_3	203
title_108_106_	artist_43_43_43_4	10	track_title_760_760_760_	273
title_240_238_	artist_32_32_32_3	1	track_title_2132_2132_2	613
title_37_35_	artist_14_14_	2	track_title_1936_1936_1936_19	504
title_31_29_	artist_52_52_	3	track_title_1700_1700_170	177
title_409_407_	artist_42_42_42	5	track_title_2376_2376_2376_237	169
title_319_317_	artist_3_3_3_	6	track_title_1950_1950_1950	155
title_321_319_	artist_10_10_10_1	9	track_title_5687_5687_56	231
title_137_135_	artist_99_99_	2	track_title_2723_2723_2	417
title_411_409_	artist_21_21_21_2	11	track_title_4359_4359_4359	154
title_231_229_	artist_83_83_83	2	track_title_6323_6323_6323_6	581
title_293_291_	artist_88_88_	2	track_title_770_770_770_77	541
title_356_354_	artist_83_83_83	3	track_title_694_694_694_	182
title_248_246_	artist_47_47_	5	track_title_7093_7093_7093	265
title_25_23_	artist_5_5_5_	2	track_title_2593_2593_	444
title_373_371_	artist_86_86_86	11	track_title_3987_3987_3987_3	621
title_132_130_	artist_9_9_9_	1	track_title_1544_1544_15	226
title_73_71_	artist_43_43_43_4	4	track_title_655_655_65	163
title_92_90_	artist_79_79_79_7	6	track_title_4421_4421_4421_4	514
title_95_93_	artist_87_87_87_8	4	track_title_4663_4663_4663	263
title_75_73_	artist_1_1_1_	5	track_title_5952_5952_5952_595	345
title_18_16_	artist_13_13_13_1	2	track_title_6664_6664_6664_6	449
title_408_406_	artist_75_75_75	6	track_title_3061_3061_	312
title_404_402_	artist_75_75_75	6	track_title_165_165_165_165	326
title_242_240_	artist_91_91_91	5	track_title_1257_1257_1257_125	583
title_236_234_	artist_52_52_	5	track_title_1184_1184_1184_1	297
title_41_39_	artist_46_46_46_4	4	track_title_7269_7269_7269_726	494
title_245_243_	artist_56_56_56	6	track_title_1065_1065_1065_10	322
title_68_66_	artist_2_2_2_	7	track_title_5647_5647_5647_564	424
title_481_479_	artist_5_5_5_	5	track_title_2524_2524_2524_2	484
title_493_491_	artist_49_49_49_4	8	track_title_5197_5197_5197	158
title_158_156_	artist_29_29_29	8	track_title_935_935_935_935	369
title_111_109_	artist_36_36_	8	track_title_4225_4225_42	142
title_243_241_	artist_34_34_34	9	track_title_1616_1616_1616	601
title_16_14_	artist_16_16_16_1	6	track_title_4986_4986_4986_49	345
title_109_107_	artist_47_47_	11	track_title_6611_6611_	312
title_29_27_	artist_92_92_92_9	2	track_title_2371_2371_2371_237	553
title_452_450_	artist_19_19_19_1	4	track_title_1495_1495_1495_1	508
title_13_11_	artist_8_8_8_	9	track_title_1601_1601_1	161
title_389_387_	artist_68_68_68_6	5	track_title_4804_4804_4804_480	601
title_454_452_	artist_68_68_68_6	7	track_title_5684_5684_56	457
title_413_411_	artist_62_62_62_6	6	track_title_6652_6652_665	241
title_162_160_	artist_17_17_	5	track_title_6293_6293_6293_62	503
title_511_509_	artist_14_14_	8	track_title_4843_4843_48	308
title_361_359_	artist_23_23_23	1	track_title_646_646_646_64	309
title_350_348_	artist_31_31_31	7	track_title_3308_3308_3308_3	207
title_384_382_	artist_23_23_23	1	track_title_2055_2055_2055_	445
title_74_72_	artist_21_21_21_2	4	track_title_5951_5951_5951_595	274
title_223_221_	artist_4_4_4_	3	track_title_1396_1396_1396	341
title_194_192_	artist_35_35_35_3	3	track_title_7183_7183_718	369
title_309_307_	artist_7_7_7_	2	track_title_220_220_220_220_	329
title_447_445_	artist_69_69_	1	track_title_6766_6766_6766_676	533
title_192_190_	artist_54_54_54_5	2	track_title_5148_5148_5148_51	301
title_395_393_	artist_60_60_	3	track_title_4874_4874_48	134
title_455_453_	artist_52_52_	5	track_title_5579_5579_5579_5	161
title_439_437_	artist_87_87_87_8	6	track_title_4888_4888_4888_	261
title_365_363_	artist_51_51_51_5	4	track_title_7275_7275_72	440
title_19_17_	artist_18_18_18	7	track_title_7482_7482_	389
title_78_76_	artist_75_75_75	2	track_title_3251_3251_3	248
title_458_456_	artist_41_41_	3	track_title_1255_1255_1255_125	467
title_407_405_	artist_31_31_31	4	track_title_1074_1074_1	607
title_148_146_	artist_67_67_67	6	track_title_4281_4281_42	516
title_503_501_	artist_96_96_	5	track_title_5865_5865_	540
title_364_362_	artist_4_4_4_	8	track_title_3827_3827_3827	132
title_236_234_	artist_52_52_	13	track_title_3126_3126_3126_312	332
title_419_417_	artist_76_76_76_7	5	track_title_1242_1242_1242_	356
title_394_392_	artist_92_92_92_9	6	track_title_2201_2201_220	495
title_305_303_	artist_91_91_91	12	track_title_3507_3507_3	249
title_87_85_	artist_91_91_91	9	track_title_1603_1603_1	470
title_44_42_	artist_56_56_56	3	track_title_2757_2757_2	193
title_206_204_	artist_20_20_20	2	track_title_2895_2895_2895_2	376
title_504_502_	artist_48_48_48	8	track_title_2791_2791_2791	533
title_38_36_	artist_60_60_	4	track_title_3862_3862_3862_38	554
title_167_165_	artist_52_52_	5	track_title_369_369_369_369_36	554
title_66_64_	artist_55_55_	3	track_title_7421_7421_	548
title_110_108_	artist_69_69_	4	track_title_4617_4617_4617_46	580
title_48_46_	artist_83_83_83	4	track_title_7363_7363_7	361
title_304_302_	artist_60_60_	9	track_title_6707_6707_6707_670	182
title_373_371_	artist_86_86_86	1	track_title_177_177_177	465
title_300_298_	artist_92_92_92_9	8	track_title_2239_2239_223	563
title_502_500_	artist_94_94_94	3	track_title_887_887_887_887_	625
title_71_69_	artist_37_37_37	7	track_title_4942_4942_4942	293
title_461_459_	artist_6_6_6_	4	track_title_3912_3912_391	597
title_305_303_	artist_91_91_91	13	track_title_3597_3597_3	345
title_407_405_	artist_31_31_31	2	track_title_4532_4532_45	316
title_441_439_	artist_37_37_37	8	track_title_3292_3292_3292	391
title_181_179_	artist_40_40_40_4	5	track_title_7454_7454_	608
title_280_278_	artist_6_6_6_	9	track_title_226_226_226_226_	561
title_162_160_	artist_17_17_	10	track_title_7100_7100_7100_7	563
title_189_187_	artist_32_32_32_3	8	track_title_7296_7296_7296_729	339
title_202_200_	artist_73_73_73_7	9	track_title_2352_2352_23	129
title_249_247_	artist_27_27_27_2	5	track_title_4948_4948_4948	585
title_204_202_	artist_29_29_29	3	track_title_1621_1621_1621_16	517
title_389_387_	artist_68_68_68_6	4	track_title_1116_1116_111	352
title_505_503_	artist_14_14_	5	track_title_4679_4679_4679_46	425
title_240_238_	artist_32_32_32_3	6	track_title_2232_2232_223	242
title_13_11_	artist_71_71_	5	track_title_6012_6012_6012_6	143
title_376_374_	artist_30_30_	5	track_title_477_477_477	160
title_36_34_	artist_38_38_38_3	4	track_title_4071_4071_4071	119
title_424_422_	artist_17_17_	7	track_title_4462_4462_	89
title_483_481_	artist_61_61_61	1	track_title_5866_5866_	153
title_498_496_	artist_82_82_	3	track_title_3061_3061_	140
title_207_205_	artist_1_1_1_	7	track_title_3048_3048_304	103
title_159_157_	artist_71_71_	1	track_title_6040_6040_6040_6	100
title_95_93_	artist_87_87_87_8	8	track_title_5425_5425_5425_54	105
title_414_412_	artist_60_60_	4	track_title_5923_5923_5923_592	138
title_382_380_	artist_79_79_79_7	3	track_title_7259_7259_7259_	339
title_395_393_	artist_60_60_	7	track_title_7295_7295_7295_729	268
title_301_299_	artist_51_51_51_5	1	track_title_3921_3921_3921_3	432
title_157_155_	artist_42_42_42	8	track_title_7441_7441_7441_7	454
title_220_218_	artist_36_36_	12	track_title_7044_7044_7044_70	454
title_457_455_	artist_63_63_	3	track_title_5443_5443_5443	510
title_370_368_	artist_40_40_40_4	6	track_title_7168_7168_7168_7	524
title_13_11_	artist_33_33_	8	track_title_4574_4574_4574_	577
title_401_399_	artist_37_37_37	4	track_title_1948_1948_1	385
title_213_211_	artist_23_23_23	5	track_title_93_93_93_9	164
title_201_199_	artist_68_68_68_6	11	track_title_3127_3127_3127_312	488
title_346_344_	artist_7_7_7_	2	track_title_6933_6933_693	180
title_371_369_	artist_20_20_20	5	track_title_4559_4559_4559_455	496
title_383_381_	artist_94_94_94	11	track_title_2877_2877_	578
title_277_275_	artist_44_44_	3	track_title_1680_1680_1680_16	528
title_62_60_	artist_26_26_26	4	track_title_1341_1341_1341_13	272
title_511_509_	artist_14_14_	10	track_title_5491_5491_5	254
title_352_350_	artist_70_70_70_7	1	track_title_4319_4319_4	327
title_94_92_	artist_93_93_	3	track_title_1126_1126_1126_1	87
title_297_295_	artist_34_34_34	4	track_title_1017_1017_1	176
title_182_180_	artist_9_9_9_	3	track_title_2808_2808_2808_2	106
title_208_206_	artist_36_36_	12	track_title_6887_6887_6887_68	140
title_425_423_	artist_34_34_34	12	track_title_2305_2305_2305_	127
title_344_342_	artist_65_65_65_6	2	track_title_6417_6417_6417_	131
title_401_399_	artist_37_37_37	8	track_title_1277_1277_1277_	130
title_339_337_	artist_63_63_	1	track_title_3405_3405_3405_340	85
title_67_65_	artist_85_85_	5	track_title_683_683_683_6	163
title_80_78_	artist_19_19_19_1	9	track_title_6426_6426_6426_642	158
title_83_81_	artist_53_53_53	10	track_title_2336_2336_2336_	119
title_427_425_	artist_88_88_	1	track_title_1637_1637_1	139
title_373_371_	artist_86_86_86	6	track_title_6624_6624_662	113
title_134_132_	artist_46_46_46_4	4	track_title_6177_6177_6177_617	153
title_410_408_	artist_93_93_	2	track_title_5876_5876_587	87
title_321_319_	artist_10_10_10_1	3	track_title_2644_2644_2644_	157
title_302_300_	artist_85_85_	4	track_title_405_405_405_	146
title_82_80_	artist_98_98_98_9	10	track_title_3183_3183_3183_318	151
title_510_508_	artist_97_97_97	2	track_title_2739_2739_2739	176
title_276_274_	artist_8_8_8_	5	track_title_3552_3552_3552_35	129
title_415_413_	artist_74_74_	9	track_title_7422_7422_	157
title_236_234_	artist_52_52_	12	track_title_1914_1914_1	80
title_476_474_	artist_13_13_13_1	2	track_title_194_194_194_194	139
title_389_387_	artist_68_68_68_6	6	track_title_5951_5951_5951_595	139
title_169_167_	artist_96_96_	8	track_title_3495_3495_3495_349	169
title_113_111_	artist_37_37_37	2	track_title_4346_4346_4	172
title_305_303_	artist_91_91_91	8	track_title_6290_6290_6290_62	103
title_442_440_	artist_47_47_	3	track_title_3460_3460_3460_346	110
title_142_140_	artist_61_61_61	2	track_title_599_599_599_	128
title_190_188_	artist_95_95_95_9	5	track_title_4_4_4_4_4_	144
title_238_236_	artist_15_15_15	8	track_title_7445_7445_7445_7	172
title_205_203_	artist_37_37_37	2	track_title_732_732_732_732_73	113
title_305_303_	artist_91_91_91	4	track_title_3257_3257_3	85
title_447_445_	artist_69_69_	4	track_title_94_94_94_94_9	172
title_250_248_	artist_18_18_18	5	track_title_3730_3730_3730_	149
title_460_458_	artist_76_76_76_7	6	track_title_1627_1627_1627_16	90
title_432_430_	artist_81_81_81_8	7	track_title_1366_1366_1366	79
title_83_81_	artist_53_53_53	1	track_title_1512_1512_15	154
title_265_263_	artist_79_79_79_7	1	track_title_1990_1990_1990_19	108
title_155_153_	artist_33_33_	7	track_title_3849_3849_3	176
title_57_55_	artist_23_23_23	1	track_title_840_840_840	92
title_383_381_	artist_94_94_94	6	track_title_1006_1006_1006_10	173
title_208_206_	artist_36_36_	10	track_title_6132_6132_6132_	81
title_409_407_	artist_42_42_42	12	track_title_5396_5396_5396_539	125
title_424_422_	artist_17_17_	3	track_title_6160_6160_6160_	167
title_88_86_	artist_49_49_49_4	7	track_title_1641_1641_1641	102
title_434_432_	artist_54_54_54_5	10	track_title_3895_3895_3895_38	89
title_74_72_	artist_21_21_21_2	9	track_title_2012_2012_20	105
title_175_173_	artist_78_78_78	11	track_title_1805_1805_1805_	87
title_381_379_	artist_65_65_65_6	2	track_title_6422_6422_6422_642	152
title_512_510_	artist_42_42_42	4	track_title_4424_4424_4424_4	505
title_171_169_	artist_53_53_53	6	track_title_4290_4290_4290_	287
title_496_494_	artist_59_59_59	1	track_title_365_365_365_	187
title_441_439_	artist_37_37_37	11	track_title_524_524_524_5	392
title_282_280_	artist_4_4_4_	2	track_title_2383_2383_23	215
title_189_187_	artist_32_32_32_3	2	track_title_5005_5005_50	402
title_338_336_	artist_84_84_84_8	4	track_title_1955_1955_1955	493
title_317_315_	artist_46_46_46_4	3	track_title_5023_5023_5023_502	516
title_313_311_	artist_58_58_	4	track_title_4909_4909_4	152
title_40_38_	artist_62_62_62_6	7	track_title_4187_4187_	297
title_409_407_	artist_42_42_42	4	track_title_7274_7274_72	230
title_451_449_	artist_30_30_	2	track_title_7332_7332_7	472
title_83_81_	artist_53_53_53	4	track_title_2906_2906_2906_290	254
title_225_223_	artist_88_88_	3	track_title_5027_5027_5027_502	179
title_221_219_	artist_12_12_12	6	track_title_6473_6473_6473_	175
title_190_188_	artist_95_95_95_9	12	track_title_165_165_165_165	156
title_230_228_	artist_75_75_75	3	track_title_5888_5888_5888_5	131
title_461_459_	artist_6_6_6_	2	track_title_5002_5002_50	136
title_75_73_	artist_1_1_1_	6	track_title_1572_1572_15	92
title_466_464_	artist_4_4_4_	8	track_title_1366_1366_1366	85
title_206_204_	artist_20_20_20	9	track_title_23_23_23_23_2	165
title_504_502_	artist_48_48_48	4	track_title_2599_2599_	105
title_390_388_	artist_76_76_76_7	9	track_title_5959_5959_5959_595	104
title_297_295_	artist_34_34_34	11	track_title_6968_6968_696	99
title_79_77_	artist_38_38_38_3	1	track_title_2386_2386_23	82
title_511_509_	artist_14_14_	7	track_title_3132_3132_31	142
title_283_281_	artist_83_83_83	4	track_title_2590_2590_	156
title_371_369_	artist_20_20_20	6	track_title_1781_1781_	136
title_31_29_	artist_52_52_	10	track_title_4846_4846_48	81
title_487_485_	artist_4_4_4_	7	track_title_6563_6563_6563	90
title_509_507_	artist_73_73_73_7	9	track_title_2388_2388_23	168
title_60_58_	artist_17_17_	8	track_title_2510_2510_251	172
title_90_88_	artist_41_41_	4	track_title_120_120_120_1	134
title_53_51_	artist_70_70_70_7	5	track_title_6946_6946_6946_6	128
title_399_397_	artist_15_15_15	10	track_title_2322_2322_23	147
title_272_270_	artist_93_93_	1	track_title_570_570_570_570_5	133
title_230_228_	artist_75_75_75	4	track_title_4325_4325_4325	151
title_432_430_	artist_81_81_81_8	10	track_title_3869_3869_3869_38	136
title_275_273_	artist_81_81_81_8	3	track_title_3738_3738_3738_	81
title_70_68_	artist_96_96_	5	track_title_2485_2485_2485	144
title_482_480_	artist_91_91_91	8	track_title_3251_3251_3	148
title_381_379_	artist_65_65_65_6	9	track_title_3143_3143_3143_	82
title_281_279_	artist_7_7_7_	10	track_title_1394_1394_1394	159
title_83_81_	artist_53_53_53	5	track_title_5101_5101_5101	108
title_446_444_	artist_47_47_	2	track_title_1348_1348_1348_13	171
title_100_98_	artist_66_66_	9	track_title_3241_3241_3241_32	89
title_370_368_	artist_40_40_40_4	5	track_title_2105_2105_2	89
title_279_277_	artist_61_61_61	2	track_title_7283_7283_7283_	79
title_77_75_	artist_87_87_87_8	12	track_title_2842_2842_	128
title_61_59_	artist_62_62_62_6	10	track_title_3511_3511_3511	105
title_225_223_	artist_88_88_	1	track_title_125_125_125_125_	83
title_123_121_	artist_26_26_26	6	track_title_6205_6205_6205_62	141
title_440_438_	artist_59_59_59	13	track_title_1028_1028_1028	127
title_320_318_	artist_82_82_	4	track_title_7221_7221_7221_	136
title_95_93_	artist_87_87_87_8	2	track_title_3069_3069_	156
title_93_91_	artist_92_92_92_9	4	track_title_358_358_35	78
title_358_356_	artist_29_29_29	3	track_title_4147_4147_4147_4	102
title_501_499_	artist_50_50_50	6	track_title_993_993_993_993	85
title_123_121_	artist_26_26_26	10	track_title_6346_6346_634	80
title_453_451_	artist_45_45_45	3	track_title_6078_6078_6078_6	170
title_378_376_	artist_7_7_7_	4	track_title_6394_6394_	119
title_320_318_	artist_82_82_	7	track_title_5524_5524_	172
title_94_92_	artist_93_93_	4	track_title_4714_4714_	150
title_227_225_	artist_79_79_79_7	1	track_title_3722_3722_37	85
title_446_444_	artist_47_47_	1	track_title_2797_2797_2797	169
title_355_353_	artist_90_90_	8	track_title_2237_2237_223	146
title_217_215_	artist_20_20_20	4	track_title_3271_3271_3271_32	95
title_357_355_	artist_2_2_2_	1	track_title_2938_2938_2938_293	167
title_194_192_	artist_35_35_35_3	2	track_title_812_812_812_812_8	159
title_120_118_	artist_76_76_76_7	5	track_title_7044_7044_7044_70	141
title_295_293_	artist_13_13_13_1	1	track_title_5121_5121_5	124
title_315_313_	artist_51_51_51_5	4	track_title_6072_6072_6072_6	134
title_256_254_	artist_79_79_79_7	5	track_title_2548_2548_254	151
title_281_279_	artist_7_7_7_	2	track_title_1486_1486_148	117
title_129_127_	artist_84_84_84_8	5	track_title_364_364_364_364	107
title_261_259_	artist_42_42_42	6	track_title_40_40_40_40_40_4	103
title_175_173_	artist_78_78_78	1	track_title_591_591_591_591_59	162
title_405_403_	artist_60_60_	9	track_title_5156_5156_5	120
title_68_66_	artist_2_2_2_	3	track_title_1626_1626_1626_16	120
title_289_287_	artist_72_72_72	4	track_title_2265_2265_226	130
title_90_88_	artist_41_41_	10	track_title_2712_2712_2712_27	107
title_106_104_	artist_43_43_43_4	1	track_title_1303_1303_1303	84
title_36_34_	artist_38_38_38_3	3	track_title_3616_3616_3616_3	135
title_103_101_	artist_47_47_	4	track_title_4308_4308_4308_43	116
title_112_110_	artist_49_49_49_4	7	track_title_1942_1942_1	134
title_124_122_	artist_97_97_97	3	track_title_3359_3359_335	80
title_94_92_	artist_93_93_	9	track_title_5645_5645_5645_564	82
title_216_214_	artist_57_57_57_5	2	track_title_5652_5652_56	171
title_76_74_	artist_24_24_24_2	3	track_title_6200_6200_6200_62	139
title_338_336_	artist_84_84_84_8	5	track_title_6577_6577_6577_65	80
title_17_15_	artist_54_54_54_5	11	track_title_5159_5159_5	130
title_148_146_	artist_67_67_67	4	track_title_967_967_967_967	168
title_380_378_	artist_74_74_	11	track_title_3953_3953_3953_3	116
title_472_470_	artist_41_41_	4	track_title_45_45_45_45_4	82
title_310_308_	artist_69_69_	5	track_title_3288_3288_3	135
title_296_294_	artist_11_11_	8	track_title_4951_4951_4951_49	126
title_269_267_	artist_1_1_1_	2	track_title_1312_1312_1312_13	135
title_31_29_	artist_52_52_	11	track_title_7073_7073_7073_70	170
title_347_345_	artist_71_71_	3	track_title_6154_6154_61	97
title_213_211_	artist_23_23_23	2	track_title_3981_3981_3981_3	114
title_141_139_	artist_70_70_70_7	3	track_title_3524_3524_3524_35	116
title_149_147_	artist_50_50_50	2	track_title_3044_3044_304	85
title_79_77_	artist_38_38_38_3	3	track_title_99_99_99_9	158
title_507_505_	artist_36_36_	1	track_title_2931_2931_2931_293	142
title_126_124_	artist_70_70_70_7	6	track_title_6168_6168_6168_	151
title_495_493_	artist_35_35_35_3	2	track_title_992_992_992_992_99	122
title_76_74_	artist_24_24_24_2	9	track_title_4095_4095_4	82
title_285_283_	artist_8_8_8_	7	track_title_6723_6723_6723_	85
title_109_107_	artist_47_47_	13	track_title_2457_2457_2457	126
title_121_119_	artist_87_87_87_8	4	track_title_5965_5965_59	169
title_235_233_	artist_36_36_	10	track_title_3038_3038_	118
title_87_85_	artist_91_91_91	7	track_title_7495_7495_749	117
title_505_503_	artist_14_14_	2	track_title_2202_2202_220	131
title_158_156_	artist_29_29_29	5	track_title_3603_3603_360	167
title_465_463_	artist_59_59_59	7	track_title_7397_7397_7	112
title_428_426_	artist_11_11_	4	track_title_4655_4655_4	92
title_468_466_	artist_13_13_13_1	2	track_title_4478_4478_447	172
title_99_97_	artist_3_3_3_	5	track_title_6778_6778_67	165
title_251_249_	artist_16_16_16_1	7	track_title_678_678_678_67	82
title_337_335_	artist_98_98_98_9	2	track_title_1126_1126_1126_1	165
title_210_208_	artist_59_59_59	5	track_title_5144_5144_5144_51	99
title_410_408_	artist_93_93_	6	track_title_303_303_303_303	145
title_105_103_	artist_84_84_84_8	8	track_title_601_601_601_	176
title_166_164_	artist_19_19_19_1	4	track_title_2575_2575_257	81
title_114_112_	artist_35_35_35_3	5	track_title_5344_5344_53	101
title_275_273_	artist_81_81_81_8	7	track_title_4417_4417_441	134
title_177_175_	artist_25_25_	6	track_title_4121_4121_	112
title_281_279_	artist_7_7_7_	1	track_title_6642_6642_	151
title_304_302_	artist_60_60_	2	track_title_3684_3684_	105
title_293_291_	artist_88_88_	4	track_title_3945_3945_394	134
title_385_383_	artist_49_49_49_4	7	track_title_5734_5734_5734_57	133
title_297_295_	artist_34_34_34	13	track_title_4768_4768_4768_4	108
title_334_332_	artist_45_45_45	1	track_title_5123_5123_5	154
title_168_166_	artist_77_77_	5	track_title_6364_6364_	155
title_176_174_	artist_60_60_	11	track_title_6641_6641_	135
title_236_234_	artist_52_52_	6	track_title_6330_6330_	111
title_163_161_	artist_80_80_80	1	track_title_5646_5646_5646_564	167
title_243_241_	artist_34_34_34	5	track_title_3723_3723_37	120
title_183_181_	artist_90_90_	5	track_title_37_37_37_37_3	88
title_149_147_	artist_50_50_50	4	track_title_236_236_236_236_23	91
title_372_370_	artist_43_43_43_4	5	track_title_3945_3945_394	120
title_136_134_	artist_61_61_61	6	track_title_1588_1588_1588_	121
title_329_327_	artist_20_20_20	1	track_title_945_945_945_945_9	171
title_401_399_	artist_37_37_37	5	track_title_297_297_297_297_29	128
title_92_90_	artist_79_79_79_7	9	track_title_940_940_940_94	146
title_128_126_	artist_40_40_40_4	10	track_title_3776_3776_3776_377	89
title_433_431_	artist_2_2_2_	10	track_title_4067_4067_4	143
title_98_96_	artist_80_80_80	1	track_title_5145_5145_5145_51	168
title_481_479_	artist_5_5_5_	13	track_title_4780_4780_478	159
title_215_213_	artist_17_17_	5	track_title_1486_1486_148	156
title_302_300_	artist_85_85_	10	track_title_204_204_204_204_20	166
title_201_199_	artist_68_68_68_6	9	track_title_7082_7082_7	82
title_37_35_	artist_14_14_	1	track_title_314_314_314_31	176
title_262_260_	artist_29_29_29	4	track_title_6308_6308_	98
title_345_343_	artist_59_59_59	7	track_title_3583_3583_3583_35	163
title_130_128_	artist_51_51_51_5	3	track_title_4908_4908_4	169
title_17_15_	artist_54_54_54_5	10	track_title_5125_5125_5	145
title_448_446_	artist_34_34_34	2	track_title_6854_6854_6854_68	174
title_163_161_	artist_80_80_80	3	track_title_1150_1150_1150_1	102
title_358_356_	artist_29_29_29	5	track_title_4157_4157_	105
title_386_384_	artist_86_86_86	11	track_title_4273_4273_4273_427	138
title_416_414_	artist_73_73_73_7	3	track_title_3414_3414_34	90
title_450_448_	artist_91_91_91	2	track_title_3022_3022_3022_3	145
title_427_425_	artist_88_88_	3	track_title_810_810_810_81	105
title_170_168_	artist_40_40_40_4	1	track_title_2645_2645_2645_	150
title_154_152_	artist_76_76_76_7	10	track_title_3409_3409_3409_340	155
title_346_344_	artist_7_7_7_	7	track_title_5324_5324_5324_	156
title_402_400_	artist_72_72_72	6	track_title_6178_6178_6178_617	154
title_276_274_	artist_8_8_8_	3	track_title_1216_1216_1216_	118
title_60_58_	artist_17_17_	4	track_title_1711_1711_1711_1	158
title_221_219_	artist_12_12_12	8	track_title_5928_5928_5928_592	166
title_229_227_	artist_89_89_89	6	track_title_6460_6460_64	152
title_201_199_	artist_68_68_68_6	7	track_title_4431_4431_	174
title_192_190_	artist_54_54_54_5	9	track_title_2439_2439_2439_24	119
title_432_430_	artist_81_81_81_8	6	track_title_6153_6153_61	90
title_373_371_	artist_86_86_86	3	track_title_3754_3754_37	115
title_385_383_	artist_49_49_49_4	8	track_title_5187_5187_5	89
title_50_48_	artist_5_5_5_	6	track_title_2795_2795_2795	101
title_201_199_	artist_68_68_68_6	8	track_title_5269_5269_5269_5	172
title_251_249_	artist_16_16_16_1	5	track_title_6624_6624_662	113
title_460_458_	artist_76_76_76_7	2	track_title_6754_6754_6754_	176
title_383_381_	artist_94_94_94	9	track_title_310_310_310_310_3	109
title_437_435_	artist_39_39_	3	track_title_2626_2626_2626_262	83
title_86_84_	artist_60_60_	7	track_title_1568_1568_1568_156	145
title_74_72_	artist_21_21_21_2	11	track_title_579_579_579_579_5	150
title_393_391_	artist_55_55_	2	track_title_3384_3384_338	103
title_50_48_	artist_5_5_5_	12	track_title_3944_3944_394	130
title_52_50_	artist_66_66_	9	track_title_1017_1017_1	134
title_278_276_	artist_98_98_98_9	1	track_title_1444_1444_	116
title_269_267_	artist_1_1_1_	5	track_title_7469_7469_746	135
title_74_72_	artist_21_21_21_2	6	track_title_4294_4294_4294_	115
title_303_301_	artist_59_59_59	6	track_title_5741_5741_5	149
title_267_265_	artist_23_23_23	9	track_title_5105_5105_5105	147
title_116_114_	artist_92_92_92_9	2	track_title_824_824_824_8	131
title_346_344_	artist_7_7_7_	6	track_title_5404_5404_5	124
title_393_391_	artist_55_55_	1	track_title_114_114_114_114_1	89
title_382_380_	artist_79_79_79_7	6	track_title_6329_6329_6329_6	125
title_13_11_	artist_9_9_9_	3	track_title_2273_2273_2273_2	146
title_149_147_	artist_50_50_50	3	track_title_6295_6295_6295_62	160
title_145_143_	artist_77_77_	3	track_title_1240_1240_1240_	111
title_84_82_	artist_84_84_84_8	7	track_title_1445_1445_	112
title_481_479_	artist_5_5_5_	2	track_title_7451_7451_	156
title_113_111_	artist_37_37_37	3	track_title_3986_3986_3986_3	89
title_416_414_	artist_73_73_73_7	1	track_title_5620_5620_56	82
title_376_374_	artist_30_30_	3	track_title_2465_2465_2465_24	117
title_459_457_	artist_59_59_59	3	track_title_3478_3478_34	160
title_314_312_	artist_32_32_32_3	5	track_title_6318_6318_631	116
title_410_408_	artist_93_93_	10	track_title_3851_3851_3851	107
title_456_454_	artist_5_5_5_	5	track_title_6424_6424_6424_642	169
title_136_134_	artist_61_61_61	10	track_title_4525_4525_4525_452	80
title_467_465_	artist_15_15_15	11	track_title_1319_1319_1319_13	115
title_482_480_	artist_91_91_91	3	track_title_4055_4055_4055_40	120
title_347_345_	artist_71_71_	7	track_title_6897_6897_6	172
title_218_216_	artist_49_49_49_4	9	track_title_2155_2155_2155_21	158
title_256_254_	artist_79_79_79_7	8	track_title_2672_2672_2672_	168
title_106_104_	artist_43_43_43_4	2	track_title_5377_5377_53	79
title_448_446_	artist_34_34_34	9	track_title_2516_2516_251	172
title_111_109_	artist_36_36_	1	track_title_2324_2324_23	83
title_392_390_	artist_62_62_62_6	5	track_title_3247_3247_3247_32	113
title_509_507_	artist_73_73_73_7	10	track_title_3843_3843_3	135
title_19_17_	artist_18_18_18	2	track_title_1633_1633_1	138
title_87_85_	artist_91_91_91	11	track_title_3628_3628_	167
title_160_158_	artist_89_89_89	4	track_title_5751_5751_5751	135
title_380_378_	artist_74_74_	1	track_title_693_693_693_693	81
title_193_191_	artist_72_72_72	8	track_title_3019_3019_301	163
title_172_170_	artist_16_16_16_1	5	track_title_6237_6237_6237_62	147
title_71_69_	artist_37_37_37	8	track_title_3314_3314_	94
title_194_192_	artist_35_35_35_3	9	track_title_1106_1106_	114
title_261_259_	artist_42_42_42	2	track_title_2552_2552_2552_2	84
title_313_311_	artist_58_58_	2	track_title_6622_6622_662	124
title_140_138_	artist_80_80_80	7	track_title_2573_2573_257	154
title_170_168_	artist_40_40_40_4	3	track_title_6232_6232_6232_62	114
title_37_35_	artist_14_14_	6	track_title_4198_4198_419	167
title_383_381_	artist_94_94_94	5	track_title_3637_3637_363	93
title_138_136_	artist_6_6_6_	5	track_title_4799_4799_4799_4	159
title_351_349_	artist_11_11_	6	track_title_6607_6607_6607_6	88
title_463_461_	artist_57_57_57_5	5	track_title_5010_5010_5010_	171
title_72_70_	artist_97_97_97	10	track_title_4922_4922_4922_49	116
title_1012_1010_	artist_15_15_15	4	track_title_3757_3757_37	79
title_255_253_	artist_50_50_50	9	track_title_3216_3216_3216_32	134
title_404_402_	artist_75_75_75	9	track_title_5184_5184_5	162
title_16_14_	artist_16_16_16_1	10	track_title_4156_4156_	118
title_425_423_	artist_34_34_34	10	track_title_5680_5680_56	154
title_411_409_	artist_21_21_21_2	10	track_title_4049_4049_4049	162
title_469_467_	artist_4_4_4_	7	track_title_6582_6582_6	164
title_152_150_	artist_76_76_76_7	6	track_title_2546_2546_254	112
title_504_502_	artist_48_48_48	2	track_title_2930_2930_2930_293	89
title_231_229_	artist_83_83_83	1	track_title_748_748_748	147
title_342_340_	artist_47_47_	7	track_title_6711_6711_67	167
title_262_260_	artist_29_29_29	8	track_title_7395_7395_7	103
title_272_270_	artist_93_93_	5	track_title_6157_6157_61	112
title_175_173_	artist_78_78_78	13	track_title_2130_2130_2	96
title_67_65_	artist_85_85_	2	track_title_7213_7213_72	150
title_451_449_	artist_30_30_	4	track_title_3596_3596_3	167
title_197_195_	artist_5_5_5_	7	track_title_3016_3016_301	152
title_410_408_	artist_93_93_	11	track_title_7401_7401_740	155
title_329_327_	artist_20_20_20	8	track_title_2074_2074_20	108
title_445_443_	artist_88_88_	1	track_title_1864_1864_1864_	82
title_216_214_	artist_57_57_57_5	1	track_title_1586_1586_1586_	163
title_412_410_	artist_9_9_9_	5	track_title_5392_5392_5392_539	95
title_394_392_	artist_92_92_92_9	5	track_title_5050_5050_5050_505	93
title_465_463_	artist_59_59_59	6	track_title_6423_6423_6423_642	97
title_179_177_	artist_58_58_	8	track_title_7024_7024_7	119
title_96_94_	artist_93_93_	1	track_title_3533_3533_3	132
title_56_54_	artist_29_29_29	2	track_title_5897_5897_	80
title_73_71_	artist_43_43_43_4	6	track_title_2547_2547_254	165
title_465_463_	artist_59_59_59	5	track_title_2220_2220_	104
title_133_131_	artist_98_98_98_9	2	track_title_6621_6621_662	120
title_304_302_	artist_60_60_	5	track_title_591_591_591_591_59	114
title_235_233_	artist_36_36_	3	track_title_1604_1604_1	141
title_211_209_	artist_20_20_20	11	track_title_2834_2834_2834_2	157
title_126_124_	artist_70_70_70_7	1	track_title_734_734_734_	82
title_308_306_	artist_11_11_	7	track_title_6449_6449_6449_	121
title_324_322_	artist_51_51_51_5	1	track_title_3642_3642_3642_3	120
title_355_353_	artist_90_90_	5	track_title_5342_5342_53	137
title_276_274_	artist_8_8_8_	4	track_title_5903_5903_59	139
title_72_70_	artist_97_97_97	7	track_title_5300_5300_5300_530	106
title_383_381_	artist_94_94_94	4	track_title_6639_6639_6639_6	80
title_96_94_	artist_93_93_	3	track_title_4179_4179_4179_4	97
title_341_339_	artist_45_45_45	7	track_title_2837_2837_2837_2	152
title_256_254_	artist_79_79_79_7	7	track_title_5565_5565_556	123
title_509_507_	artist_73_73_73_7	8	track_title_4577_4577_4577_	118
title_24_22_	artist_75_75_75	3	track_title_1837_1837_1837_	154
title_412_410_	artist_9_9_9_	2	track_title_3190_3190_31	100
title_509_507_	artist_73_73_73_7	5	track_title_1148_1148_114	163
title_228_226_	artist_65_65_65_6	3	track_title_4483_4483_4483_4	93
title_101_99_	artist_58_58_	9	track_title_5203_5203_5203_5	97
title_49_47_	artist_24_24_24_2	3	track_title_186_186_186_186_	175
title_511_509_	artist_14_14_	1	track_title_682_682_682_682_	123
title_367_365_	artist_86_86_86	3	track_title_1456_1456_145	107
title_508_506_	artist_87_87_87_8	4	track_title_6955_6955_	120
title_108_106_	artist_43_43_43_4	6	track_title_2013_2013_20	159
title_314_312_	artist_32_32_32_3	7	track_title_3200_3200_3200	121
title_77_75_	artist_87_87_87_8	11	track_title_4234_4234_4234_	109
title_101_99_	artist_58_58_	3	track_title_4128_4128_	157
title_27_25_	artist_98_98_98_9	4	track_title_2092_2092_2092_209	142
title_470_468_	artist_16_16_16_1	5	track_title_6920_6920_	108
title_401_399_	artist_37_37_37	7	track_title_2379_2379_2379_237	147
title_118_116_	artist_51_51_51_5	6	track_title_6856_6856_6856_68	164
title_268_266_	artist_59_59_59	4	track_title_5738_5738_5738_57	156
title_31_29_	artist_52_52_	9	track_title_4570_4570_4570_	107
title_63_61_	artist_81_81_81_8	10	track_title_5773_5773_5	103
title_297_295_	artist_34_34_34	12	track_title_4626_4626_4	139
title_271_269_	artist_61_61_61	9	track_title_1457_1457_145	79
title_269_267_	artist_1_1_1_	1	track_title_5780_5780_5780	81
title_110_108_	artist_69_69_	1	track_title_2021_2021_2021_	133
title_143_141_	artist_12_12_12	3	track_title_1420_1420_142	90
title_132_130_	artist_9_9_9_	5	track_title_3175_3175_3175_	98
title_383_381_	artist_94_94_94	8	track_title_678_678_678_67	113
title_473_471_	artist_93_93_	4	track_title_1600_1600_1	172
title_365_363_	artist_51_51_51_5	6	track_title_3446_3446_34	159
title_292_290_	artist_6_6_6_	6	track_title_3176_3176_3176_	165
title_88_86_	artist_49_49_49_4	11	track_title_4415_4415_441	88
title_204_202_	artist_29_29_29	2	track_title_4328_4328_4328	102
title_372_370_	artist_43_43_43_4	11	track_title_5070_5070_5070_	113
title_57_55_	artist_23_23_23	9	track_title_6080_6080_	143
title_249_247_	artist_27_27_27_2	1	track_title_4489_4489_4489_4	94
title_349_347_	artist_27_27_27_2	5	track_title_2609_2609_26	99
title_347_345_	artist_71_71_	6	track_title_2750_2750_2	110
title_443_441_	artist_17_17_	1	track_title_4689_4689_4	159
title_339_337_	artist_63_63_	3	track_title_316_316_316_316_3	92
title_88_86_	artist_49_49_49_4	10	track_title_1709_1709_170	91
title_388_386_	artist_81_81_81_8	2	track_title_1844_1844_1844_184	81
title_346_344_	artist_7_7_7_	10	track_title_6963_6963_696	154
title_273_271_	artist_13_13_13_1	7	track_title_2777_2777_2777_27	174
title_13_11_	artist_33_33_	3	track_title_105_105_105_	87
title_45_43_	artist_97_97_97	3	track_title_2717_2717_2717_27	137
title_97_95_	artist_11_11_	4	track_title_3579_3579_3579	153
title_207_205_	artist_1_1_1_	11	track_title_214_214_214	113
title_116_114_	artist_92_92_92_9	1	track_title_1707_1707_170	170
title_252_250_	artist_85_85_	7	track_title_2734_2734_2734	169
title_267_265_	artist_23_23_23	10	track_title_3563_3563_3	109
title_308_306_	artist_11_11_	1	track_title_7454_7454_	131
title_437_435_	artist_39_39_	7	track_title_701_701_701_701	142
title_366_364_	artist_20_20_20	7	track_title_3449_3449_34	104
title_154_152_	artist_76_76_76_7	5	track_title_4724_4724_472	151
title_1012_1010_	artist_75_75_75	7	track_title_1167_1167_	120
title_1012_1010_	artist_1_1_1_	9	track_title_2804_2804_2804_2	137
title_250_248_	artist_18_18_18	7	track_title_84_84_84_84_84_8	165
title_109_107_	artist_47_47_	1	track_title_5204_5204_5204_5	99
title_21_19_	artist_12_12_12	4	track_title_832_832_832_	140
title_195_193_	artist_26_26_26	7	track_title_7248_7248_72	145
title_432_430_	artist_81_81_81_8	3	track_title_5228_5228_522	136
title_233_231_	artist_22_22_	10	track_title_4559_4559_4559_455	144
title_184_182_	artist_100_100_1	2	track_title_2256_2256_	167
title_400_398_	artist_24_24_24_2	5	track_title_1571_1571_15	152
title_345_343_	artist_59_59_59	1	track_title_2468_2468_2468_24	175
title_448_446_	artist_34_34_34	3	track_title_576_576_576_576_5	174
title_508_506_	artist_87_87_87_8	1	track_title_7390_7390_7	161
title_33_31_	artist_32_32_32_3	8	track_title_2545_2545_254	143
title_281_279_	artist_7_7_7_	5	track_title_797_797_797_797	136
title_49_47_	artist_24_24_24_2	7	track_title_3532_3532_3	131
title_282_280_	artist_4_4_4_	1	track_title_7358_7358_7358_73	125
title_87_85_	artist_91_91_91	10	track_title_4332_4332_4332_43	170
title_463_461_	artist_57_57_57_5	7	track_title_173_173_173_17	147
title_322_320_	artist_98_98_98_9	1	track_title_606_606_606_606	146
title_24_22_	artist_75_75_75	6	track_title_6570_6570_6570_65	86
title_216_214_	artist_57_57_57_5	8	track_title_3816_3816_3	124
title_455_453_	artist_52_52_	4	track_title_4083_4083_4083_40	114
title_200_198_	artist_10_10_10_1	5	track_title_4601_4601_4601	165
title_296_294_	artist_11_11_	1	track_title_7174_7174_	160
title_218_216_	artist_49_49_49_4	4	track_title_5114_5114_5114_51	161
title_264_262_	artist_13_13_13_1	2	track_title_4244_4244_4244_424	127
title_146_144_	artist_85_85_	7	track_title_13_13_13_13_13_1	143
title_94_92_	artist_93_93_	2	track_title_5887_5887_5887_5	151
title_146_144_	artist_85_85_	8	track_title_2202_2202_220	90
title_178_176_	artist_91_91_91	5	track_title_3182_3182_3182_318	167
title_69_67_	artist_34_34_34	1	track_title_987_987_98	154
title_102_100_	artist_38_38_38_3	1	track_title_4590_4590_45	131
title_381_379_	artist_65_65_65_6	10	track_title_2446_2446_2	99
title_271_269_	artist_61_61_61	8	track_title_1511_1511_15	132
title_197_195_	artist_5_5_5_	8	track_title_27_27_27_27_27_2	82
title_243_241_	artist_34_34_34	6	track_title_5324_5324_5324_	88
title_453_451_	artist_45_45_45	2	track_title_869_869_869_869	148
title_451_449_	artist_30_30_	7	track_title_79_79_79_79_79_7	101
title_395_393_	artist_60_60_	11	track_title_3904_3904_	140
title_398_396_	artist_22_22_	12	track_title_5364_5364_5364_536	92
title_328_326_	artist_63_63_	3	track_title_5395_5395_5395_539	158
title_404_402_	artist_75_75_75	4	track_title_562_562_562_562_56	122
title_128_126_	artist_40_40_40_4	6	track_title_2054_2054_2054_	80
title_134_132_	artist_46_46_46_4	8	track_title_6128_6128_61	167
title_138_136_	artist_6_6_6_	3	track_title_96_96_96_9	89
title_494_492_	artist_19_19_19_1	3	track_title_4078_4078_4078	83
title_162_160_	artist_17_17_	1	track_title_6335_6335_	159
title_74_72_	artist_21_21_21_2	5	track_title_1750_1750_	131
title_154_152_	artist_76_76_76_7	2	track_title_6543_6543_6543_65	104
title_296_294_	artist_11_11_	4	track_title_434_434_434_	110
title_130_128_	artist_51_51_51_5	1	track_title_4895_4895_4895_489	135
title_436_434_	artist_16_16_16_1	6	track_title_4334_4334_4334_43	158
title_41_39_	artist_46_46_46_4	1	track_title_3174_3174_3174_	131
title_511_509_	artist_14_14_	4	track_title_5277_5277_	149
title_14_12_	artist_53_53_53	4	track_title_6244_6244_6	115
title_386_384_	artist_86_86_86	8	track_title_1652_1652_1652_16	101
title_101_99_	artist_58_58_	11	track_title_5219_5219_	171
title_143_141_	artist_12_12_12	12	track_title_7490_7490_749	82
title_384_382_	artist_23_23_23	6	track_title_4575_4575_4575_	129
title_218_216_	artist_49_49_49_4	8	track_title_6442_6442_6442_	154
title_319_317_	artist_3_3_3_	11	track_title_1814_1814_1814_181	99
title_291_289_	artist_60_60_	1	track_title_647_647_647	103
title_126_124_	artist_70_70_70_7	4	track_title_4067_4067_4	151
title_230_228_	artist_75_75_75	13	track_title_1701_1701_170	174
title_183_181_	artist_90_90_	1	track_title_5803_5803_	138
title_470_468_	artist_16_16_16_1	2	track_title_4169_4169_416	144
title_249_247_	artist_27_27_27_2	6	track_title_3013_3013_301	161
title_30_28_	artist_58_58_	9	track_title_645_645_645_645_6	80
title_363_361_	artist_56_56_56	5	track_title_5028_5028_5028_502	144
title_192_190_	artist_54_54_54_5	6	track_title_211_211_211	83
title_271_269_	artist_61_61_61	4	track_title_2780_2780_2	163
title_491_489_	artist_27_27_27_2	2	track_title_183_183_183_183_	105
title_419_417_	artist_76_76_76_7	4	track_title_4615_4615_4615_46	128
title_286_284_	artist_94_94_94	9	track_title_3919_3919_391	81
title_171_169_	artist_53_53_53	1	track_title_6197_6197_6197_	139
title_86_84_	artist_60_60_	4	track_title_2639_2639_26	111
title_475_473_	artist_27_27_27_2	8	track_title_5032_5032_50	89
title_327_325_	artist_49_49_49_4	7	track_title_6138_6138_6138_	152
title_269_267_	artist_1_1_1_	8	track_title_1287_1287_1287_128	97
title_470_468_	artist_16_16_16_1	11	track_title_2498_2498_2498_24	126
title_118_116_	artist_51_51_51_5	11	track_title_4126_4126_	137
title_430_428_	artist_36_36_	3	track_title_2910_2910_29	126
title_280_278_	artist_6_6_6_	10	track_title_2833_2833_2833_2	85
title_146_144_	artist_85_85_	1	track_title_6393_6393_	175
title_489_487_	artist_54_54_54_5	3	track_title_6998_6998_699	128
title_437_435_	artist_39_39_	5	track_title_1699_1699_1	122
title_317_315_	artist_46_46_46_4	7	track_title_2016_2016_20	171
title_89_87_	artist_40_40_40_4	9	track_title_6899_6899_6	90
title_487_485_	artist_4_4_4_	1	track_title_5434_5434_5	111
title_171_169_	artist_53_53_53	3	track_title_188_188_18	123
title_462_460_	artist_80_80_80	10	track_title_6881_6881_6881_68	161
title_134_132_	artist_46_46_46_4	7	track_title_3232_3232_3232	175
title_263_261_	artist_15_15_15	6	track_title_6873_6873_6873	84
title_155_153_	artist_33_33_	6	track_title_5964_5964_59	108
title_423_421_	artist_79_79_79_7	7	track_title_5025_5025_5025_502	88
title_205_203_	artist_37_37_37	8	track_title_3923_3923_3923_3	94
title_490_488_	artist_51_51_51_5	1	track_title_1923_1923_1923	160
title_52_50_	artist_66_66_	2	track_title_163_163_163_	112
title_361_359_	artist_23_23_23	4	track_title_2370_2370_2370_237	144
title_304_302_	artist_60_60_	10	track_title_83_83_83_83_8	133
title_115_113_	artist_78_78_78	11	track_title_6624_6624_662	159
title_27_25_	artist_98_98_98_9	2	track_title_1829_1829_18	83
title_55_53_	artist_99_99_	4	track_title_6039_6039_603	161
title_40_38_	artist_62_62_62_6	5	track_title_1947_1947_1	114
title_60_58_	artist_17_17_	1	track_title_2158_2158_2158_21	155
title_205_203_	artist_37_37_37	9	track_title_1481_1481_148	156
title_84_82_	artist_84_84_84_8	6	track_title_2887_2887_288	539
title_53_51_	artist_70_70_70_7	8	track_title_273_273_273_273_2	504
title_416_414_	artist_73_73_73_7	9	track_title_6011_6011_6011_6	263
title_421_419_	artist_84_84_84_8	11	track_title_4853_4853_4853_	521
title_267_265_	artist_23_23_23	1	track_title_4814_4814_48	563
title_255_253_	artist_50_50_50	5	track_title_5312_5312_53	207
title_363_361_	artist_56_56_56	6	track_title_6726_6726_6726_	584
title_326_324_	artist_18_18_18	3	track_title_7396_7396_7	527
title_28_26_	artist_67_67_67	5	track_title_6277_6277_6	335
title_287_285_	artist_23_23_23	12	track_title_7420_7420_	234
title_429_427_	artist_19_19_19_1	7	track_title_1023_1023_1023	490
title_176_174_	artist_60_60_	12	track_title_2947_2947_29	308
title_401_399_	artist_37_37_37	1	track_title_1867_1867_1867_	324
title_322_320_	artist_98_98_98_9	2	track_title_6079_6079_6079_6	546
title_307_305_	artist_30_30_	9	track_title_3125_3125_3125_312	563
title_48_46_	artist_83_83_83	2	track_title_6984_6984_	166
title_218_216_	artist_49_49_49_4	3	track_title_538_538_538_	433
title_160_158_	artist_89_89_89	6	track_title_4770_4770_	586
title_465_463_	artist_59_59_59	13	track_title_5468_5468_5	382
title_61_59_	artist_62_62_62_6	1	track_title_2812_2812_	391
title_387_385_	artist_57_57_57_5	2	track_title_7363_7363_7	198
title_195_193_	artist_26_26_26	6	track_title_337_337_337_337_33	279
title_276_274_	artist_8_8_8_	1	track_title_4785_4785_478	137
title_90_88_	artist_41_41_	2	track_title_5405_5405_5	231
title_369_367_	artist_99_99_	4	track_title_3532_3532_3	249
title_307_305_	artist_30_30_	1	track_title_4700_4700_4700_4	462
title_238_236_	artist_15_15_15	2	track_title_3267_3267_3267	611
title_460_458_	artist_76_76_76_7	3	track_title_1441_1441_	505
title_105_103_	artist_84_84_84_8	7	track_title_5453_5453_5453_54	306
title_458_456_	artist_41_41_	1	track_title_2403_2403_2403_24	514
title_385_383_	artist_49_49_49_4	2	track_title_60_60_60_6	585
title_204_202_	artist_29_29_29	6	track_title_4286_4286_42	356
title_399_397_	artist_15_15_15	3	track_title_4357_4357_4357	86
title_216_214_	artist_57_57_57_5	9	track_title_2663_2663_26	97
title_156_154_	artist_27_27_27_2	3	track_title_3426_3426_3426_	145
title_205_203_	artist_37_37_37	6	track_title_6413_6413_6413_	151
title_502_500_	artist_94_94_94	9	track_title_5834_5834_	88
title_118_116_	artist_51_51_51_5	3	track_title_6035_6035_603	95
title_403_401_	artist_60_60_	6	track_title_5167_5167_5167	163
title_212_210_	artist_42_42_42	8	track_title_7292_7292_7292_729	160
title_122_120_	artist_37_37_37	2	track_title_2860_2860_2860_2	108
title_271_269_	artist_61_61_61	6	track_title_6474_6474_6474_	99
title_91_89_	artist_85_85_	5	track_title_1599_1599_1599_159	149
title_64_62_	artist_87_87_87_8	6	track_title_809_809_809_	108
title_142_140_	artist_61_61_61	6	track_title_5577_5577_5577_5	152
title_41_39_	artist_46_46_46_4	5	track_title_1801_1801_1801_	148
title_100_98_	artist_66_66_	8	track_title_5687_5687_56	88
title_429_427_	artist_19_19_19_1	4	track_title_2058_2058_2058_	151
title_139_137_	artist_77_77_	5	track_title_5210_5210_	145
title_373_371_	artist_86_86_86	10	track_title_1196_1196_	172
title_211_209_	artist_20_20_20	3	track_title_3407_3407_3407_340	142
title_105_103_	artist_84_84_84_8	6	track_title_4623_4623_4	96
title_352_350_	artist_70_70_70_7	3	track_title_4904_4904_4	133
title_503_501_	artist_96_96_	7	track_title_3823_3823_3823	114
title_195_193_	artist_26_26_26	9	track_title_4815_4815_48	134
title_289_287_	artist_72_72_72	5	track_title_3414_3414_34	151
title_65_63_	artist_90_90_	3	track_title_3437_3437_3437_343	608
title_42_40_	artist_51_51_51_5	7	track_title_4297_4297_4297_	547
title_447_445_	artist_69_69_	10	track_title_7_7_7_7_7_	602
title_299_297_	artist_46_46_46_4	4	track_title_6909_6909_690	390
title_225_223_	artist_88_88_	7	track_title_3970_3970_397	526
title_21_19_	artist_12_12_12	2	track_title_2659_2659_2659_265	451
title_267_265_	artist_23_23_23	3	track_title_5718_5718_5	502
title_63_61_	artist_81_81_81_8	4	track_title_2027_2027_2027_	464
title_30_28_	artist_58_58_	5	track_title_7174_7174_	568
title_309_307_	artist_7_7_7_	9	track_title_4936_4936_4	482
title_450_448_	artist_91_91_91	1	track_title_2967_2967_2967_296	567
title_449_447_	artist_1_1_1_	3	track_title_4590_4590_45	411
title_415_413_	artist_74_74_	1	track_title_4404_4404_	479
title_26_24_	artist_60_60_	2	track_title_7338_7338_7	220
title_253_251_	artist_84_84_84_8	3	track_title_775_775_775_775_7	371
title_143_141_	artist_12_12_12	6	track_title_3854_3854_3854	134
title_344_342_	artist_65_65_65_6	1	track_title_1784_1784_	500
title_371_369_	artist_20_20_20	2	track_title_3599_3599_3	306
title_459_457_	artist_59_59_59	5	track_title_2101_2101_2	389
title_472_470_	artist_41_41_	8	track_title_3147_3147_3147_	587
title_308_306_	artist_11_11_	2	track_title_5079_5079_5079_	381
title_336_334_	artist_54_54_54_5	4	track_title_4108_4108_410	203
title_385_383_	artist_49_49_49_4	3	track_title_3749_3749_3749_374	234
title_86_84_	artist_60_60_	3	track_title_4985_4985_4985_49	410
title_304_302_	artist_60_60_	4	track_title_2886_2886_288	173
title_352_350_	artist_70_70_70_7	10	track_title_3609_3609_360	457
title_196_194_	artist_66_66_	2	track_title_6150_6150_61	463
title_454_452_	artist_68_68_68_6	3	track_title_4184_4184_	417
title_481_479_	artist_5_5_5_	6	track_title_1740_1740_1740_1	199
title_425_423_	artist_34_34_34	11	track_title_3850_3850_3850	520
title_153_151_	artist_77_77_	2	track_title_3348_3348_	199
title_308_306_	artist_11_11_	10	track_title_3296_3296_3296	624
title_274_272_	artist_2_2_2_	11	track_title_3040_3040_304	596
title_259_257_	artist_70_70_70_7	1	track_title_2048_2048_20	309
title_37_35_	artist_14_14_	7	track_title_3685_3685_	435
title_13_11_	artist_71_71_	1	track_title_5433_5433_5	579
title_173_171_	artist_33_33_	4	track_title_1748_1748_1748_1	122
title_205_203_	artist_37_37_37	11	track_title_2898_2898_2898_2	376
title_251_249_	artist_16_16_16_1	1	track_title_1393_1393_1393	261
title_191_189_	artist_3_3_3_	5	track_title_1825_1825_18	166
title_58_56_	artist_43_43_43_4	7	track_title_3598_3598_3	295
title_290_288_	artist_27_27_27_2	8	track_title_5119_5119_5119_51	522
title_136_134_	artist_61_61_61	11	track_title_3821_3821_3821	384
title_482_480_	artist_91_91_91	2	track_title_54_54_54_54_54_5	406
title_88_86_	artist_49_49_49_4	3	track_title_541_541_541_541_5	326
title_47_45_	artist_46_46_46_4	4	track_title_6997_6997_699	462
title_31_29_	artist_52_52_	5	track_title_1267_1267_12	183
title_501_499_	artist_50_50_50	10	track_title_4904_4904_4	239
title_463_461_	artist_57_57_57_5	3	track_title_6607_6607_6607_6	534
title_305_303_	artist_91_91_91	6	track_title_6113_6113_6113_611	468
title_303_301_	artist_59_59_59	8	track_title_4963_4963_4	552
title_320_318_	artist_82_82_	9	track_title_4603_4603_4603	462
title_425_423_	artist_34_34_34	2	track_title_2509_2509_	459
title_280_278_	artist_6_6_6_	4	track_title_2611_2611_2611_	470
title_390_388_	artist_76_76_76_7	5	track_title_618_618_618	369
title_264_262_	artist_13_13_13_1	8	track_title_4211_4211_4211_421	277
title_302_300_	artist_85_85_	9	track_title_268_268_268_268_26	456
title_94_92_	artist_93_93_	13	track_title_2788_2788_2	417
title_110_108_	artist_69_69_	9	track_title_6327_6327_6327_6	616
title_504_502_	artist_48_48_48	10	track_title_4556_4556_4556_455	411
title_145_143_	artist_77_77_	11	track_title_3383_3383_338	586
title_108_106_	artist_43_43_43_4	13	track_title_5373_5373_53	357
title_397_395_	artist_17_17_	1	track_title_4742_4742_	454
title_477_475_	artist_13_13_13_1	4	track_title_2688_2688_2688_268	428
title_215_213_	artist_17_17_	6	track_title_4840_4840_48	551
title_122_120_	artist_37_37_37	8	track_title_5935_5935_59	398
title_420_418_	artist_79_79_79_7	9	track_title_4507_4507_45	241
title_448_446_	artist_34_34_34	4	track_title_7060_7060_7060	387
title_250_248_	artist_18_18_18	6	track_title_2998_2998_2998_299	223
title_131_129_	artist_37_37_37	10	track_title_5689_5689_56	467
title_122_120_	artist_37_37_37	1	track_title_977_977_977_977_9	489
title_168_166_	artist_77_77_	4	track_title_3769_3769_3769_	550
title_128_126_	artist_40_40_40_4	12	track_title_4309_4309_4309_43	354
title_201_199_	artist_68_68_68_6	1	track_title_2949_2949_29	240
title_23_21_	artist_21_21_21_2	4	track_title_4348_4348_4	620
title_204_202_	artist_29_29_29	7	track_title_5527_5527_	538
title_472_470_	artist_41_41_	11	track_title_3558_3558_3558_35	146
title_167_165_	artist_52_52_	2	track_title_1719_1719_1719_1	174
title_266_264_	artist_85_85_	3	track_title_6382_6382_6382_6	337
title_426_424_	artist_37_37_37	5	track_title_1016_1016_1	199
title_136_134_	artist_61_61_61	7	track_title_4819_4819_48	560
title_39_37_	artist_49_49_49_4	8	track_title_2826_2826_282	299
title_510_508_	artist_97_97_97	4	track_title_1342_1342_1342_13	399
title_20_18_	artist_54_54_54_5	7	track_title_2684_2684_2684_268	484
title_140_138_	artist_80_80_80	9	track_title_728_728_728_728_	244
title_180_178_	artist_66_66_	10	track_title_4373_4373_4	354
title_83_81_	artist_53_53_53	3	track_title_39_39_39_3	184
title_454_452_	artist_68_68_68_6	4	track_title_2809_2809_2809_2	223
title_37_35_	artist_14_14_	5	track_title_3577_3577_3577	143
title_391_389_	artist_15_15_15	6	track_title_6382_6382_6382_6	347
title_186_184_	artist_2_2_2_	3	track_title_5668_5668_5668_	620
title_15_13_	artist_55_55_	4	track_title_6313_6313_631	612
title_243_241_	artist_34_34_34	4	track_title_745_745_745	167
title_368_366_	artist_3_3_3_	1	track_title_4547_4547_4547_	122
title_177_175_	artist_25_25_	3	track_title_2567_2567_	115
title_379_377_	artist_5_5_5_	4	track_title_4279_4279_4279_427	107
title_319_317_	artist_3_3_3_	7	track_title_2146_2146_2146	132
title_487_485_	artist_4_4_4_	4	track_title_6362_6362_	108
title_500_498_	artist_72_72_72	6	track_title_6439_6439_64	142
title_316_314_	artist_61_61_61	2	track_title_7240_7240_72	124
title_321_319_	artist_10_10_10_1	4	track_title_6890_6890_6	140
title_278_276_	artist_98_98_98_9	7	track_title_3686_3686_	151
title_374_372_	artist_12_12_12	2	track_title_5398_5398_5398_539	112
title_83_81_	artist_53_53_53	6	track_title_4926_4926_4926_49	139
title_170_168_	artist_40_40_40_4	10	track_title_4030_4030_4	81
title_285_283_	artist_8_8_8_	5	track_title_5966_5966_59	94
title_157_155_	artist_42_42_42	1	track_title_3063_3063_	88
title_170_168_	artist_40_40_40_4	8	track_title_379_379_379	121
title_451_449_	artist_30_30_	8	track_title_1196_1196_	151
title_372_370_	artist_43_43_43_4	13	track_title_2611_2611_2611_	160
title_508_506_	artist_87_87_87_8	8	track_title_1526_1526_1526_	172
title_17_15_	artist_54_54_54_5	9	track_title_3835_3835_3835_38	173
title_200_198_	artist_10_10_10_1	1	track_title_6793_6793_6793_679	81
title_164_162_	artist_92_92_92_9	11	track_title_4737_4737_4737_4	145
title_378_376_	artist_7_7_7_	3	track_title_1207_1207_12	98
title_77_75_	artist_87_87_87_8	6	track_title_6985_6985_	99
title_380_378_	artist_74_74_	4	track_title_2795_2795_2795	143
title_123_121_	artist_26_26_26	9	track_title_6380_6380_6380_6	152
title_32_30_	artist_21_21_21_2	6	track_title_3588_3588_3588_35	131
title_247_245_	artist_90_90_	3	track_title_6297_6297_6297_62	96
title_52_50_	artist_66_66_	7	track_title_2337_2337_2337_	161
title_240_238_	artist_32_32_32_3	11	track_title_7460_7460_746	156
title_68_66_	artist_2_2_2_	8	track_title_1683_1683_1683_16	121
title_1012_1010_	artist_1_1_1_	7	track_title_2759_2759_2	124
title_78_76_	artist_75_75_75	7	track_title_5319_5319_53	105
title_510_508_	artist_97_97_97	1	track_title_573_573_573_573_5	89
title_160_158_	artist_89_89_89	7	track_title_5481_5481_5481_54	83
title_187_185_	artist_82_82_	4	track_title_4310_4310_4	109
title_430_428_	artist_36_36_	4	track_title_1125_1125_1125_1	119
title_372_370_	artist_43_43_43_4	6	track_title_1385_1385_1	122
title_228_226_	artist_65_65_65_6	9	track_title_549_549_549	157
title_348_346_	artist_97_97_97	2	track_title_7233_7233_7233_723	159
title_319_317_	artist_3_3_3_	10	track_title_173_173_173_17	147
title_13_11_	artist_71_71_	6	track_title_4958_4958_4958_49	159
title_348_346_	artist_97_97_97	7	track_title_2887_2887_288	126
title_13_11_	artist_4_4_4_	4	track_title_381_381_38	173
title_355_353_	artist_90_90_	2	track_title_2351_2351_23	107
title_246_244_	artist_53_53_53	5	track_title_4674_4674_4674_46	143
title_326_324_	artist_18_18_18	8	track_title_3274_3274_3274_32	171
title_67_65_	artist_85_85_	8	track_title_7472_7472_7472_7	132
title_111_109_	artist_36_36_	10	track_title_1851_1851_18	142
title_423_421_	artist_79_79_79_7	3	track_title_4477_4477_447	101
title_226_224_	artist_73_73_73_7	8	track_title_2548_2548_254	169
title_190_188_	artist_95_95_95_9	4	track_title_6514_6514_6514_65	147
title_390_388_	artist_76_76_76_7	8	track_title_1254_1254_1254_125	122
title_250_248_	artist_18_18_18	1	track_title_1195_1195_	111
title_137_135_	artist_99_99_	11	track_title_4640_4640_4640_46	117
title_262_260_	artist_29_29_29	9	track_title_2788_2788_2	96
title_161_159_	artist_36_36_	11	track_title_5092_5092_50	136
title_134_132_	artist_46_46_46_4	5	track_title_3326_3326_332	133
title_490_488_	artist_51_51_51_5	8	track_title_1687_1687_1687_16	139
title_345_343_	artist_59_59_59	8	track_title_115_115_115_11	115
title_479_477_	artist_29_29_29	1	track_title_6228_6228_6228	164
title_37_35_	artist_14_14_	3	track_title_473_473_473_47	100
title_282_280_	artist_4_4_4_	7	track_title_5754_5754_5754	98
title_381_379_	artist_65_65_65_6	4	track_title_3287_3287_3	150
title_94_92_	artist_93_93_	10	track_title_2752_2752_2	109
title_393_391_	artist_55_55_	5	track_title_2063_2063_2063_206	125
title_55_53_	artist_99_99_	1	track_title_4384_4384_4384	104
title_68_66_	artist_2_2_2_	2	track_title_924_924_924_924_	172
title_164_162_	artist_92_92_92_9	10	track_title_7087_7087_7	169
title_254_252_	artist_34_34_34	1	track_title_5893_5893_	139
title_105_103_	artist_84_84_84_8	4	track_title_3779_3779_3779_377	155
title_388_386_	artist_81_81_81_8	8	track_title_7166_7166_7166_7	172
title_20_18_	artist_54_54_54_5	2	track_title_2550_2550_2550_2	119
title_353_351_	artist_8_8_8_	1	track_title_1290_1290_12	120
title_501_499_	artist_50_50_50	9	track_title_3103_3103_31	142
title_211_209_	artist_20_20_20	7	track_title_5469_5469_5	165
title_182_180_	artist_9_9_9_	4	track_title_4524_4524_4524_452	121
title_28_26_	artist_67_67_67	7	track_title_4326_4326_4326	145
title_100_98_	artist_66_66_	10	track_title_3340_3340_	79
title_134_132_	artist_46_46_46_4	3	track_title_5983_5983_5983_598	86
title_408_406_	artist_75_75_75	8	track_title_1138_1138_	100
title_104_102_	artist_43_43_43_4	6	track_title_5692_5692_5692_	126
title_264_262_	artist_13_13_13_1	1	track_title_855_855_855_855_	176
title_415_413_	artist_74_74_	6	track_title_4529_4529_4529_452	110
title_77_75_	artist_87_87_87_8	13	track_title_4549_4549_4549_	113
title_470_468_	artist_16_16_16_1	7	track_title_4806_4806_4806_480	83
title_160_158_	artist_89_89_89	8	track_title_7243_7243_72	140
title_174_172_	artist_85_85_	3	track_title_6215_6215_6	147
title_147_145_	artist_20_20_20	5	track_title_5655_5655_56	152
title_267_265_	artist_23_23_23	2	track_title_1638_1638_1	141
title_313_311_	artist_58_58_	5	track_title_1650_1650_1650_16	146
title_341_339_	artist_45_45_45	6	track_title_3194_3194_31	108
title_453_451_	artist_45_45_45	11	track_title_5919_5919_5919_	87
title_57_55_	artist_23_23_23	5	track_title_5036_5036_50	132
title_358_356_	artist_29_29_29	6	track_title_1274_1274_1274_	108
title_221_219_	artist_12_12_12	4	track_title_887_887_887_887_	105
title_319_317_	artist_3_3_3_	5	track_title_5279_5279_	165
title_288_286_	artist_25_25_	2	track_title_480_480_480_480_	85
title_66_64_	artist_55_55_	8	track_title_4447_4447_444	100
title_265_263_	artist_79_79_79_7	9	track_title_7056_7056_7	128
title_329_327_	artist_20_20_20	6	track_title_6384_6384_6384_6	171
title_453_451_	artist_45_45_45	8	track_title_702_702_702_	90
title_238_236_	artist_15_15_15	1	track_title_3075_3075_307	114
title_291_289_	artist_60_60_	10	track_title_6923_6923_	117
title_484_482_	artist_31_31_31	1	track_title_2510_2510_251	163
title_455_453_	artist_52_52_	7	track_title_4919_4919_4919	90
title_150_148_	artist_51_51_51_5	6	track_title_2267_2267_226	146
title_59_57_	artist_6_6_6_	2	track_title_2145_2145_2145	145
title_23_21_	artist_21_21_21_2	2	track_title_645_645_645_645_6	126
title_324_322_	artist_51_51_51_5	4	track_title_3552_3552_3552_35	96
title_190_188_	artist_95_95_95_9	9	track_title_3267_3267_3267	140
title_1012_1010_	artist_51_51_51_5	7	track_title_2677_2677_2677_	168
title_275_273_	artist_81_81_81_8	9	track_title_1988_1988_1988	117
title_264_262_	artist_13_13_13_1	6	track_title_202_202_202_202	153
title_60_58_	artist_17_17_	3	track_title_7248_7248_72	138
title_163_161_	artist_80_80_80	4	track_title_1538_1538_1538_153	171
title_36_34_	artist_38_38_38_3	5	track_title_2838_2838_2838_2	85
title_191_189_	artist_3_3_3_	1	track_title_6495_6495_64	154
title_165_163_	artist_79_79_79_7	4	track_title_5390_5390_5390_539	128
title_293_291_	artist_88_88_	3	track_title_23_23_23_23_2	118
title_13_11_	artist_71_71_	8	track_title_1448_1448_	159
title_298_296_	artist_6_6_6_	1	track_title_595_595_595_595	105
title_228_226_	artist_65_65_65_6	2	track_title_6005_6005_600	79
title_138_136_	artist_6_6_6_	2	track_title_4836_4836_4836_483	145
title_308_306_	artist_11_11_	6	track_title_5819_5819_581	118
title_154_152_	artist_76_76_76_7	12	track_title_4604_4604_4604	103
title_381_379_	artist_65_65_65_6	3	track_title_5125_5125_5	174
title_65_63_	artist_90_90_	4	track_title_1869_1869_1869_	100
title_180_178_	artist_66_66_	9	track_title_2469_2469_2469_24	112
title_277_275_	artist_44_44_	4	track_title_2867_2867_2867_2	102
title_457_455_	artist_63_63_	4	track_title_2593_2593_	113
title_320_318_	artist_82_82_	8	track_title_1657_1657_1657_16	111
title_142_140_	artist_61_61_61	9	track_title_2890_2890_2890_2	94
title_44_42_	artist_56_56_56	4	track_title_6593_6593_6593	146
title_511_509_	artist_14_14_	2	track_title_2647_2647_2647_	104
title_121_119_	artist_87_87_87_8	1	track_title_619_619_619_619_6	172
title_36_34_	artist_38_38_38_3	1	track_title_5784_5784_5784	131
title_218_216_	artist_49_49_49_4	2	track_title_5164_5164_5164	111
title_408_406_	artist_75_75_75	4	track_title_1962_1962_1962_19	156
title_402_400_	artist_72_72_72	8	track_title_1454_1454_145	155
title_201_199_	artist_68_68_68_6	6	track_title_4621_4621_4	80
title_435_433_	artist_97_97_97	7	track_title_1263_1263_12	144
title_19_17_	artist_18_18_18	5	track_title_507_507_507_507_50	134
title_1012_1010_	artist_75_75_75	6	track_title_3180_3180_3180_318	96
title_22_20_	artist_5_5_5_	5	track_title_4191_4191_419	165
title_264_262_	artist_13_13_13_1	3	track_title_1226_1226_1226_122	94
title_131_129_	artist_37_37_37	5	track_title_5766_5766_5766_57	90
title_278_276_	artist_98_98_98_9	8	track_title_2982_2982_2982_	86
title_448_446_	artist_34_34_34	13	track_title_6838_6838_6	121
title_334_332_	artist_45_45_45	7	track_title_6402_6402_64	121
title_398_396_	artist_22_22_	3	track_title_1228_1228_1228_122	102
title_167_165_	artist_52_52_	7	track_title_4538_4538_45	123
title_489_487_	artist_54_54_54_5	5	track_title_1375_1375_1375_13	157
title_55_53_	artist_99_99_	5	track_title_3338_3338_3338_3	94
title_321_319_	artist_10_10_10_1	1	track_title_6725_6725_6725_	173
title_281_279_	artist_7_7_7_	6	track_title_6442_6442_6442_	138
title_262_260_	artist_29_29_29	7	track_title_5398_5398_5398_539	171
title_1012_1010_	artist_51_51_51_5	8	track_title_5841_5841_584	116
title_78_76_	artist_75_75_75	1	track_title_4329_4329_4329	91
title_304_302_	artist_60_60_	7	track_title_2949_2949_29	171
title_109_107_	artist_47_47_	8	track_title_5630_5630_5630_	110
title_359_357_	artist_62_62_62_6	10	track_title_3593_3593_3	146
title_13_11_	artist_71_71_	10	track_title_1124_1124_1124_1	91
title_131_129_	artist_37_37_37	8	track_title_6831_6831_6	132
title_46_44_	artist_53_53_53	8	track_title_6926_6926_	80
title_226_224_	artist_73_73_73_7	3	track_title_4344_4344_4	84
title_42_40_	artist_51_51_51_5	2	track_title_1916_1916_1	174
title_175_173_	artist_78_78_78	2	track_title_2988_2988_2988_	115
title_495_493_	artist_35_35_35_3	4	track_title_1132_1132_	94
title_154_152_	artist_76_76_76_7	9	track_title_4900_4900_4	83
title_52_50_	artist_66_66_	10	track_title_1406_1406_1406_1	155
title_284_282_	artist_7_7_7_	6	track_title_2275_2275_2275_2	162
title_142_140_	artist_61_61_61	11	track_title_1863_1863_1863_	141
title_186_184_	artist_2_2_2_	7	track_title_1872_1872_1872_187	176
title_417_415_	artist_66_66_	1	track_title_4920_4920_4920_49	87
title_475_473_	artist_27_27_27_2	2	track_title_5828_5828_5828_5	103
title_453_451_	artist_45_45_45	6	track_title_6582_6582_6	99
title_35_33_	artist_59_59_59	4	track_title_1408_1408_1408_1	78
title_207_205_	artist_1_1_1_	8	track_title_5103_5103_5103	125
title_14_12_	artist_53_53_53	1	track_title_4684_4684_4	157
title_319_317_	artist_3_3_3_	3	track_title_2474_2474_2	153
title_209_207_	artist_75_75_75	9	track_title_4069_4069_4	174
title_42_40_	artist_51_51_51_5	11	track_title_3528_3528_3528_35	89
title_490_488_	artist_51_51_51_5	7	track_title_4762_4762_4762_4	102
title_373_371_	artist_86_86_86	8	track_title_6876_6876_6876	162
title_193_191_	artist_72_72_72	7	track_title_2796_2796_2796	164
title_412_410_	artist_9_9_9_	4	track_title_5644_5644_5644_564	85
title_117_115_	artist_6_6_6_	10	track_title_6974_6974_6974_6	147
title_432_430_	artist_81_81_81_8	8	track_title_5457_5457_5457_54	116
title_302_300_	artist_85_85_	2	track_title_6803_6803_6	102
title_370_368_	artist_40_40_40_4	4	track_title_1731_1731_173	166
title_245_243_	artist_56_56_56	7	track_title_5716_5716_5	159
title_508_506_	artist_87_87_87_8	5	track_title_253_253_253_2	120
title_511_509_	artist_14_14_	9	track_title_939_939_939_	97
title_34_32_	artist_90_90_	4	track_title_3015_3015_301	122
title_283_281_	artist_83_83_83	11	track_title_2070_2070_20	90
title_104_102_	artist_43_43_43_4	2	track_title_6972_6972_6972_6	145
title_158_156_	artist_29_29_29	6	track_title_4757_4757_475	102
title_480_478_	artist_9_9_9_	2	track_title_2154_2154_2154_21	167
title_359_357_	artist_62_62_62_6	13	track_title_6968_6968_696	97
title_481_479_	artist_5_5_5_	9	track_title_6553_6553_6	433
title_244_242_	artist_47_47_	10	track_title_5355_5355_5355_	336
title_96_94_	artist_93_93_	11	track_title_210_210_210_21	541
title_129_127_	artist_84_84_84_8	2	track_title_1279_1279_1279_	513
title_481_479_	artist_5_5_5_	3	track_title_5411_5411_5411	545
title_29_27_	artist_92_92_92_9	5	track_title_6013_6013_6013_6	428
title_58_56_	artist_43_43_43_4	6	track_title_5041_5041_5041_	405
title_252_250_	artist_85_85_	1	track_title_3995_3995_	396
title_298_296_	artist_6_6_6_	2	track_title_7025_7025_7	548
title_463_461_	artist_57_57_57_5	4	track_title_6252_6252_6252	340
title_140_138_	artist_80_80_80	5	track_title_7285_7285_7285_	575
title_445_443_	artist_88_88_	6	track_title_3188_3188_3188_318	181
title_137_135_	artist_99_99_	7	track_title_6593_6593_6593	390
title_266_264_	artist_85_85_	9	track_title_896_896_896_	523
title_341_339_	artist_45_45_45	1	track_title_624_624_624_624_	385
title_334_332_	artist_45_45_45	4	track_title_1725_1725_	272
title_428_426_	artist_11_11_	5	track_title_3660_3660_366	345
title_451_449_	artist_30_30_	6	track_title_200_200_200_	178
title_481_479_	artist_5_5_5_	7	track_title_5819_5819_581	279
title_272_270_	artist_93_93_	9	track_title_2625_2625_2625_262	492
title_18_16_	artist_13_13_13_1	1	track_title_581_581_581_581_	616
title_479_477_	artist_29_29_29	2	track_title_6430_6430_64	621
title_233_231_	artist_22_22_	3	track_title_1249_1249_1249_	551
title_228_226_	artist_65_65_65_6	5	track_title_6025_6025_	440
title_89_87_	artist_40_40_40_4	7	track_title_289_289_28	326
title_53_51_	artist_70_70_70_7	10	track_title_398_398_398_398_39	526
title_230_228_	artist_75_75_75	12	track_title_6893_6893_6	430
title_51_49_	artist_19_19_19_1	1	track_title_897_897_897_897_89	591
title_43_41_	artist_34_34_34	2	track_title_6076_6076_6076_6	562
title_395_393_	artist_60_60_	4	track_title_3744_3744_3744_374	286
title_353_351_	artist_8_8_8_	5	track_title_5244_5244_	560
title_378_376_	artist_7_7_7_	6	track_title_3842_3842_3	320
title_274_272_	artist_2_2_2_	7	track_title_7098_7098_7098	216
title_399_397_	artist_15_15_15	9	track_title_4102_4102_410	218
title_79_77_	artist_38_38_38_3	10	track_title_3194_3194_31	235
title_99_97_	artist_3_3_3_	11	track_title_3216_3216_3216_32	262
title_46_44_	artist_53_53_53	4	track_title_3667_3667_366	522
title_291_289_	artist_60_60_	6	track_title_3650_3650_	164
title_388_386_	artist_81_81_81_8	11	track_title_7175_7175_	100
title_195_193_	artist_26_26_26	3	track_title_1456_1456_145	95
title_409_407_	artist_42_42_42	2	track_title_1490_1490_1490_1	134
title_254_252_	artist_34_34_34	2	track_title_1519_1519_15	139
title_465_463_	artist_59_59_59	3	track_title_4846_4846_48	81
title_268_266_	artist_59_59_59	2	track_title_314_314_314_31	151
title_229_227_	artist_89_89_89	4	track_title_3828_3828_3828	153
title_58_56_	artist_43_43_43_4	3	track_title_7085_7085_7	140
title_254_252_	artist_34_34_34	4	track_title_7191_7191_7191_7	91
title_171_169_	artist_53_53_53	2	track_title_2585_2585_2585_2	115
title_433_431_	artist_2_2_2_	6	track_title_4428_4428_4428_4	126
title_305_303_	artist_91_91_91	11	track_title_3268_3268_3268	151
title_126_124_	artist_70_70_70_7	8	track_title_5355_5355_5355_	143
title_475_473_	artist_27_27_27_2	10	track_title_4593_4593_45	169
title_369_367_	artist_99_99_	8	track_title_6394_6394_	173
title_130_128_	artist_51_51_51_5	6	track_title_3350_3350_335	92
title_244_242_	artist_47_47_	5	track_title_4790_4790_4790_4	82
title_137_135_	artist_99_99_	5	track_title_1070_1070_1	176
title_397_395_	artist_17_17_	2	track_title_651_651_651_6	133
title_182_180_	artist_9_9_9_	5	track_title_2002_2002_2002_200	115
title_56_54_	artist_29_29_29	6	track_title_5120_5120_5	102
title_185_183_	artist_31_31_31	8	track_title_7414_7414_7414_7	169
title_318_316_	artist_69_69_	6	track_title_6281_6281_6281	120
title_271_269_	artist_61_61_61	7	track_title_4988_4988_4988_49	169
title_90_88_	artist_41_41_	1	track_title_4264_4264_4264_	166
title_13_11_	artist_8_8_8_	1	track_title_537_537_537_537	113
title_93_91_	artist_92_92_92_9	1	track_title_959_959_959_959_	129
title_361_359_	artist_23_23_23	11	track_title_5233_5233_5233_5	117
title_293_291_	artist_88_88_	6	track_title_2431_2431_2431_24	166
title_451_449_	artist_30_30_	9	track_title_3335_3335_3335_3	125
title_440_438_	artist_59_59_59	9	track_title_4458_4458_4458_4	80
title_481_479_	artist_5_5_5_	8	track_title_7138_7138_7138_7	157
title_326_324_	artist_18_18_18	5	track_title_3690_3690_369	132
title_51_49_	artist_19_19_19_1	5	track_title_4332_4332_4332_43	105
title_341_339_	artist_45_45_45	5	track_title_2932_2932_2932_293	102
title_270_268_	artist_20_20_20	4	track_title_6388_6388_6388_6	93
title_161_159_	artist_36_36_	2	track_title_7425_7425_	156
title_86_84_	artist_60_60_	8	track_title_80_80_80_80_8	83
\.


ANALYZE Artists;
ANALYZE Albums;
ANALYZE Tracks;
