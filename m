Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FB96B53BB
	for <lists.virtualization@lfdr.de>; Fri, 10 Mar 2023 23:04:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A299408F9;
	Fri, 10 Mar 2023 22:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A299408F9
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=Gnh/lKNq;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=mfo9/ztr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tzrhkq5qpXlK; Fri, 10 Mar 2023 22:04:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CC86541729;
	Fri, 10 Mar 2023 22:04:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC86541729
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ADC8AC008B;
	Fri, 10 Mar 2023 22:04:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE8F3C0032
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Mar 2023 22:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B06241CB3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Mar 2023 22:04:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B06241CB3
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=Gnh/lKNq; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-oracle-onmicrosoft-com header.b=mfo9/ztr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gXv5rwy4cFEf
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Mar 2023 22:04:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FBFA41C5D
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FBFA41C5D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Mar 2023 22:04:04 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32ALhsfC029162; Fri, 10 Mar 2023 22:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=corp-2022-7-12;
 bh=GoSvTZHqLtYMC0bg2d+uU9+0zDSj0dmjN7gd0Pc4X88=;
 b=Gnh/lKNqKcwQkWhBLZoXjJw9difpSc7I2JU5mfR+hX+s911MNH4jQHaSqhckrjpM9FSt
 HueJh/+/fvDprqdfNXT97PDBVRTV9I0Pgr1crsHS1rJUkBnYu7uqO7sCS7AoNXpxYcEe
 gC0KICnUfQlqC3NL6fKKemo1xNXQAY82pc1rF/R463lNh92PNLCuHeDPbKFs+uLDW/FD
 6dT2z6t2a80KZ8SF0k0NTmqNBOUPI19jvrtbhqYLM2eQPV/rNgv3C+mlscivtcX97UHY
 X90z8Tfi576rKq6D2CdNoGuMPLHZAxGzXRmNjGGkLTJRGZJH+44mSlvDjk05PDaJvcki xw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p415j6dfk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Mar 2023 22:03:55 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32ALuuYp024947; Fri, 10 Mar 2023 22:03:55 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p6frc9tw2-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Mar 2023 22:03:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpocfJLWbmhIZBPZ1SBd8jK11PDZvmEAN54zgpkIq2aS5FbXtIl03AMPhbtpBLZwFGzu3M1qHR7PWYK338bDtPX/WNVVHe663hngEXMWOvTC2+Agdavo8OCSMrgxhRc4TZ929IBWlS0VYlJR4GYWzhI98xQ2tICHAVWWa20zKT/qgqvKnVHe7/KFRJZwvjmGblLKXhr4h1qmfFGm/l3hytyF1HBJkHwbbNWfzkBDrOB79bEp1OOmjm0V+ixf+Z5qH5jp4P5R1oQbOQP+88oM17CB4/Z1WdHHT5V25tnidDSAINSrccAVd/UHi0yvgMolhCSzSwjg7MceZcePTOaO6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoSvTZHqLtYMC0bg2d+uU9+0zDSj0dmjN7gd0Pc4X88=;
 b=L9IQa9U3HexeVdhkDYdHOwcpPg4r62G9G14hkRLpeRITZ0VYyXySQNtsD890g1Ezno73B37osALIA8JY6AdZ5yGZNZNCJv7+X9Z7cuyA1hxVybC9FczJpGDw+yJOoo9iqJ+felB32OeBqUsE2u3HG4nVEZ9KykwcvRZf2dDhcXt7QKgQO9qEPivPHBge72cMcsMUQ4kMvCOVpg+jPEp2SF8lNuBYl5tzmNjrcNhQ+5UigY8imNb9EovUqAuir8wB3LXErF0rTALpgIjrtE5rSJYr0yAaqCgMrVMk4gADijWi3UsZcIqJ7o6uE88A09VqPB2A5vmxhzabXQQej32JwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoSvTZHqLtYMC0bg2d+uU9+0zDSj0dmjN7gd0Pc4X88=;
 b=mfo9/ztrF6W18PAgSEp+1huuWnqHfooVQRvmcIGT3hQFFMmMiGv7uaEpLuMkiruy30t1bigH8Zteb5+ugt3dn5qZ16zQkOsDOS3IkvFcZgO9h5+mQl4fEgfk7tFpPmEos2CApjPclJiSWciErOVIEQMAKr1gyVpzulwUzMdxmO8=
Received: from DM5PR10MB1466.namprd10.prod.outlook.com (2603:10b6:3:b::7) by
 CY8PR10MB6514.namprd10.prod.outlook.com (2603:10b6:930:5e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19; Fri, 10 Mar 2023 22:03:53 +0000
Received: from DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::7dd7:8d22:104:8d64]) by DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::7dd7:8d22:104:8d64%7]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 22:03:53 +0000
From: Mike Christie <michael.christie@oracle.com>
To: hch@infradead.org, stefanha@redhat.com, jasowang@redhat.com,
 mst@redhat.com, sgarzare@redhat.com,
 virtualization@lists.linux-foundation.org, brauner@kernel.org,
 ebiederm@xmission.com, torvalds@linux-foundation.org,
 konrad.wilk@oracle.com, linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] vhost: use vhost_tasks for worker threads
Date: Fri, 10 Mar 2023 16:03:32 -0600
Message-Id: <20230310220332.5309-12-michael.christie@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230310220332.5309-1-michael.christie@oracle.com>
References: <20230310220332.5309-1-michael.christie@oracle.com>
X-ClientProxiedBy: DS7PR03CA0130.namprd03.prod.outlook.com
 (2603:10b6:5:3b4::15) To DM5PR10MB1466.namprd10.prod.outlook.com
 (2603:10b6:3:b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR10MB1466:EE_|CY8PR10MB6514:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d69ec9c-f54d-4ce9-c8ef-08db21b3565c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p5776L/A9uprosRlrD0R+MU7XPy99FTl80Uz5Vh+ZOvrZDpX8fQCGNhel1rxn5j16WwbSDd/tRjmYuqfn1JFXd+jS7NYmRwZhglFsB808MglOtu5mCdp3AvRodVtAN5jq2T1HfgKvI8v5Q12oqcZb68ZyJjjRSTP2XHkBpac6pomUFYcSckYaqa4U1xBNIIKdHV/6/YQ57Nl51Bl4NazB8dhiZBNkYwS/enTip5D+khp7A+iPnuB6A9MPNj6XEiHDhmADc9R8a8ezZ73kvpI2ukexLOhuxV2PwBgOL9e2YrfmeBid/eNR8zREgYjfmGXIqz5tCTmHm4iOijNsbrt+JSL8q7r8Kczdvp69PAfHGq8hHIIWTzhRnLJK+hxZXwNW9d4QzArlM3LeHHh8DEWGastPmwXjed5Rr0eM8FcjcjUY7S3xufhKGN6SWstyu69JDJwD7dCyfcjmFK2jpAbpEt1TXYctIbznQhxxUr7hrpRLEyj8EP1TMgb/9UQjUuxwiu49ptkdxwtZI7YQBAxyUJl1D/34bE8ZSwaht21c+cGulasdaD3HRH5eymBoOz1sGoQXmWSxNAsuTkDyDdK15TAfXAHOPr+1IX6Y5gCEH14TUUqaYZEOu46Ma3sGJwNK2m065RZYwR6cZCrkRIqQC+lP5VYhL9lF1pbh5HuX8DqSvGjLzLaEq0p1Ya4QKnG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR10MB1466.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(376002)(396003)(39860400002)(346002)(451199018)(36756003)(6486002)(186003)(6512007)(66556008)(6666004)(2616005)(107886003)(1076003)(7416002)(83380400001)(26005)(8676002)(66946007)(4326008)(41300700001)(5660300002)(2906002)(66476007)(8936002)(478600001)(6506007)(86362001)(316002)(38100700002)(921005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TxEYri2/IZbZVLidpoEVk4uBrhZ8PhwuskknDbHaDR6Rk2wAHOc8Ztv3nJke?=
 =?us-ascii?Q?YfUoW9rgCjtU60evjjcz+KkceDH575jGunfxE8qiLTtCPrlWt9ii589UHNgh?=
 =?us-ascii?Q?09ddi1ydIdSyh3s2iNNpje3318tob3q3lDl2eatILwZGibkJ/rP98CE9WJor?=
 =?us-ascii?Q?QjVPzvWEw1f2WV4XMtG9Skcdqd8y7MOECvDd4nxP4fTEHH/AL1ghBg7RPZCX?=
 =?us-ascii?Q?4zjmt56GgDTcE8jm6nPp14u85cwdxUvp704Dpmfrze1oE0Hl1A+NmIS1ovK7?=
 =?us-ascii?Q?fBi26bwXl5IrGNOIu83A1d9td58p9aRUDC4eCkTDW7CeTEmvmoKhI8vyPTe7?=
 =?us-ascii?Q?W9nigshVcq2q9tDDgcSqloPGDw8DlBlkCRhXdhfZt37azqwXEK3qLXAYkGH7?=
 =?us-ascii?Q?5Jaac/rSOe1zhZO/Z6wKaMY7IYRRaO/zuJW6omoUIP3kbtDQPeOtjbpj98Vp?=
 =?us-ascii?Q?EfrggeOuHpEFFdiOeoD4sPCVM5xfSl92+8AOUqv4j3ebSbaqBucMnVglXOWB?=
 =?us-ascii?Q?R7blWrVjUvn3RxNcsOERO7daLe2F8n4rZCBiD+k97tqW1SmjAcTt8aAnamvD?=
 =?us-ascii?Q?PXDYdimOjwjzUGWCrQvNIfu4fUK0tm46h0uC6zpQC0yMPkhi3NaqZEy83T/8?=
 =?us-ascii?Q?3Nb50FSna6cXJgKww1h7rQUdrsUcTYEfuW3MZ3RCGuGYPtV6fA4dcjQWoepJ?=
 =?us-ascii?Q?37Ac3u1ALXMKtBR+DyKCXNHkargjaKRHYkVcU0aaU4A+uacmo9ByXAYYQRPp?=
 =?us-ascii?Q?3eSxNqGZA9Ap6iWjhXFZ+nBNhAhsafNOIn+luvYs7kNzkR/MJxWm+FxGAcOw?=
 =?us-ascii?Q?+MIUH4kV5BtWWiruSRE0cFukGrPz0IUWUSTCX6g9L/6a3xYokkAD/7pMOpWW?=
 =?us-ascii?Q?O6j2mtm6MsHJrW07l1NJ2bDzDc5YGjOjtxd+uk/NQLm43F2PpgZwM6SnVB2z?=
 =?us-ascii?Q?AOE4WUlncTKAtWEmnTYqveOTfDj17ht+5M6cFisVGvZkFKCJq5SYmoihfxPB?=
 =?us-ascii?Q?yrh2Uj9704U1CnYFHJ69fdapNk4vXJgCJKLczvw9MQg5QO7Ci5SqVaW+RIAx?=
 =?us-ascii?Q?AN7bGZGNx2w1yt2nJn/fT7QUUUB+UkkazpmwbxC2Y32NWScB/td9+JvazLJi?=
 =?us-ascii?Q?NDhz9v7ts5ubpZXDqU3DO3nUjeDsRNOx8RSYp5j4NFqFD1zFZUtluKHAj+eW?=
 =?us-ascii?Q?EZGIdfdrj10FkOyD0ggFUAkKZHzbq302FWPKWlEDrF9pblNUvP5WpPAdDHfF?=
 =?us-ascii?Q?UOWjbkM4AYfr7GyFnD8Gk8+x2ykX1GWnl9FOzOMVxJErDd9UpU6gupP0f4N7?=
 =?us-ascii?Q?RNey5o6rKGeNgGHMRqHqUyhZ1vaZuzAkq3TnWNHe/k2X97Sz8ztLiC84TYhk?=
 =?us-ascii?Q?q+BsJSIzoQt+KQUs5z6bgCR9w8sWl69W7RhOq3PhX99/k1xK4c45G3BkRwBt?=
 =?us-ascii?Q?VULjgol0cj9fURuhRszjeiIm5o/ZLru+8SXe4JJQNzojidCw1Zc/aUCfVZDy?=
 =?us-ascii?Q?b0/jHk55XqHJVpXIizalue9KjgSFh7gEZ5Lds3XddX0HOguOe366O3CE/WHu?=
 =?us-ascii?Q?qr9Z0/U6CrOwLhgfLTIcimzzd5pOGcl1YsFE5D+KZU3DALbROTbch2QmZZPc?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?8zZaqeaBU35HDhpIwluQAQsjSG1f2FQ4AasQjZiDXDhLBk5R50dehenrBIUv?=
 =?us-ascii?Q?qqjeTgVPwhWmaEJ53hO28teVVFSWVZciVPRrxcWOB0ixvRTaS69Pi2yTFnf/?=
 =?us-ascii?Q?Z/1PNWXzxp2sKKEaowS/wvYtNKGRTQPCB3dBm6RO9DRvO+s/MCJlPZoJ2v/s?=
 =?us-ascii?Q?E58rIUbiXhlyK+xeZZ73xIaFic6h9cBitj3bMMFmMk3/Ng3yrZVFdlHqapqL?=
 =?us-ascii?Q?maTGhV7dKEz4M80BfLVyMrgnONLzw9DMzx6w3ifhLG5O13duWeSa0uwMeFtv?=
 =?us-ascii?Q?wQOwJPu6MG0BnM/Gay5ikgCraMCB44JfgNvmuKp1B9LC9BnirAcgp+wcofUi?=
 =?us-ascii?Q?JLXJ5r9ojppiPqMoRPO8BNuCZj8IGL4iFOoNzZ1T/gADdWV2JEjywdh6iYgP?=
 =?us-ascii?Q?NcJy1Dqg/4cBSVBysRdg5QXMx+K6XWdoYU42rh5+SsvUDRezS11odG7x9lL3?=
 =?us-ascii?Q?r1f3pIyivioTlozSP5yVRgoqreU1i+zdkdrnNFQSWgdCJin+CEy2Dl+1Do+8?=
 =?us-ascii?Q?7U9RrCgZJ/hi2I0Y4HEfwbOvlaUByjGjUAr/pipU+WoqiewUZhwEyLGnAQwD?=
 =?us-ascii?Q?gtrgb1eT10JmEN6O+F5eh3P/YeiBm7U1d2ozOtcLDREY80RV9LqHNcabgDBD?=
 =?us-ascii?Q?dzEm84Kf/7bfdpRBS2B+ewPRdWTtS3p0tpb7kwfivuxLYEKZckT/C1yIj1Hb?=
 =?us-ascii?Q?W9jA/sy4ZLcsPQZw/D0K+QoHDFaJwJa2g/7LMgsLyePKohPjrwCL+VeVxgP6?=
 =?us-ascii?Q?ovTBGrlTqXXzq2FWmQHdzMVNFV5d/5SC1AzEFWr/O1TL0IsdXkVDOwA11nnH?=
 =?us-ascii?Q?N+YT4dZoYEfalDAIZJUvSA7Z2wPWiDc84IxYfccMDs8CWRBkzV/fQVlCEUpG?=
 =?us-ascii?Q?XYaDM1+MXWH3xkPHtJChNmwsiTgKrfRcj58isTZj43I7Sd/zsJimQqRrmH5Q?=
 =?us-ascii?Q?MQ8odWyePolZO01U7550d2rWNEFYwb/kXGLeiNdPUUe+jwI3Tf5QcVbjowIG?=
 =?us-ascii?Q?RphwcMyLytTXmEWzO5Q3GhBKhQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d69ec9c-f54d-4ce9-c8ef-08db21b3565c
X-MS-Exchange-CrossTenant-AuthSource: DM5PR10MB1466.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 22:03:53.6403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eiwQXqYmOMI+KxOi6pgeiDJYgcx9hhhknLobEeGNAIaRBJuOiPBh7xp5dcOlWLrJJseejZf7zQRuUe3OtMjt/nc5QB0v32PBZZQF8S4aV94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6514
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-10_10,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303100176
X-Proofpoint-GUID: hVXbMEim_msSlCLmIVgpUyAScbJp04dL
X-Proofpoint-ORIG-GUID: hVXbMEim_msSlCLmIVgpUyAScbJp04dL
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

For vhost workers we use the kthread API which inherit's its values from
and checks against the kthreadd thread. This results in the wrong RLIMITs
being checked, so while tools like libvirt try to control the number of
threads based on the nproc rlimit setting we can end up creating more
threads than the user wanted.

This patch has us use the vhost_task helpers which will inherit its
values/checks from the thread that owns the device similar to if we did
a clone in userspace. The vhost threads will now be counted in the nproc
rlimits. And we get features like cgroups and mm sharing automatically,
so we can remove those calls.

Signed-off-by: Mike Christie <michael.christie@oracle.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/vhost.c | 60 ++++++++++---------------------------------
 drivers/vhost/vhost.h |  4 +--
 2 files changed, 15 insertions(+), 49 deletions(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 60282fe5c338..7282e0545cb2 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -22,11 +22,11 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 #include <linux/kthread.h>
-#include <linux/cgroup.h>
 #include <linux/module.h>
 #include <linux/sort.h>
 #include <linux/sched/mm.h>
 #include <linux/sched/signal.h>
+#include <linux/sched/vhost_task.h>
 #include <linux/interval_tree_generic.h>
 #include <linux/nospec.h>
 #include <linux/kcov.h>
@@ -256,7 +256,7 @@ void vhost_work_queue(struct vhost_dev *dev, struct vhost_work *work)
 		 * test_and_set_bit() implies a memory barrier.
 		 */
 		llist_add(&work->node, &dev->worker->work_list);
-		wake_up_process(dev->worker->task);
+		wake_up_process(dev->worker->vtsk->task);
 	}
 }
 EXPORT_SYMBOL_GPL(vhost_work_queue);
@@ -336,17 +336,14 @@ static void vhost_vq_reset(struct vhost_dev *dev,
 static int vhost_worker(void *data)
 {
 	struct vhost_worker *worker = data;
-	struct vhost_dev *dev = worker->dev;
 	struct vhost_work *work, *work_next;
 	struct llist_node *node;
 
-	kthread_use_mm(dev->mm);
-
 	for (;;) {
 		/* mb paired w/ kthread_stop */
 		set_current_state(TASK_INTERRUPTIBLE);
 
-		if (kthread_should_stop()) {
+		if (vhost_task_should_stop(worker->vtsk)) {
 			__set_current_state(TASK_RUNNING);
 			break;
 		}
@@ -368,7 +365,7 @@ static int vhost_worker(void *data)
 				schedule();
 		}
 	}
-	kthread_unuse_mm(dev->mm);
+
 	return 0;
 }
 
@@ -509,31 +506,6 @@ long vhost_dev_check_owner(struct vhost_dev *dev)
 }
 EXPORT_SYMBOL_GPL(vhost_dev_check_owner);
 
-struct vhost_attach_cgroups_struct {
-	struct vhost_work work;
-	struct task_struct *owner;
-	int ret;
-};
-
-static void vhost_attach_cgroups_work(struct vhost_work *work)
-{
-	struct vhost_attach_cgroups_struct *s;
-
-	s = container_of(work, struct vhost_attach_cgroups_struct, work);
-	s->ret = cgroup_attach_task_all(s->owner, current);
-}
-
-static int vhost_attach_cgroups(struct vhost_dev *dev)
-{
-	struct vhost_attach_cgroups_struct attach;
-
-	attach.owner = current;
-	vhost_work_init(&attach.work, vhost_attach_cgroups_work);
-	vhost_work_queue(dev, &attach.work);
-	vhost_dev_flush(dev);
-	return attach.ret;
-}
-
 /* Caller should have device mutex */
 bool vhost_dev_has_owner(struct vhost_dev *dev)
 {
@@ -580,14 +552,15 @@ static void vhost_worker_free(struct vhost_dev *dev)
 
 	dev->worker = NULL;
 	WARN_ON(!llist_empty(&worker->work_list));
-	kthread_stop(worker->task);
+	vhost_task_stop(worker->vtsk);
 	kfree(worker);
 }
 
 static int vhost_worker_create(struct vhost_dev *dev)
 {
 	struct vhost_worker *worker;
-	struct task_struct *task;
+	struct vhost_task *vtsk;
+	char name[TASK_COMM_LEN];
 	int ret;
 
 	worker = kzalloc(sizeof(*worker), GFP_KERNEL_ACCOUNT);
@@ -595,27 +568,20 @@ static int vhost_worker_create(struct vhost_dev *dev)
 		return -ENOMEM;
 
 	dev->worker = worker;
-	worker->dev = dev;
 	worker->kcov_handle = kcov_common_handle();
 	init_llist_head(&worker->work_list);
+	snprintf(name, sizeof(name), "vhost-%d", current->pid);
 
-	task = kthread_create(vhost_worker, worker, "vhost-%d", current->pid);
-	if (IS_ERR(task)) {
-		ret = PTR_ERR(task);
+	vtsk = vhost_task_create(vhost_worker, worker, name);
+	if (!vtsk) {
+		ret = -ENOMEM;
 		goto free_worker;
 	}
 
-	worker->task = task;
-	wake_up_process(task); /* avoid contributing to loadavg */
-
-	ret = vhost_attach_cgroups(dev);
-	if (ret)
-		goto stop_worker;
-
+	worker->vtsk = vtsk;
+	vhost_task_start(vtsk);
 	return 0;
 
-stop_worker:
-	kthread_stop(worker->task);
 free_worker:
 	kfree(worker);
 	dev->worker = NULL;
diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
index 3a98c4f06b5a..ceb590aaf418 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -16,6 +16,7 @@
 #include <linux/irqbypass.h>
 
 struct vhost_work;
+struct vhost_task;
 typedef void (*vhost_work_fn_t)(struct vhost_work *work);
 
 #define VHOST_WORK_QUEUED 1
@@ -26,9 +27,8 @@ struct vhost_work {
 };
 
 struct vhost_worker {
-	struct task_struct	*task;
+	struct vhost_task	*vtsk;
 	struct llist_head	work_list;
-	struct vhost_dev	*dev;
 	u64			kcov_handle;
 };
 
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
