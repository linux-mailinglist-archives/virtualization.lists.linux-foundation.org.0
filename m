Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 613BE550E50
	for <lists.virtualization@lfdr.de>; Mon, 20 Jun 2022 03:14:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAF9260EC8;
	Mon, 20 Jun 2022 01:14:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAF9260EC8
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=fOGN4xHj;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=n2AKt7Iw
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lytYj8J5NiZ4; Mon, 20 Jun 2022 01:14:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 65C4660DFE;
	Mon, 20 Jun 2022 01:14:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65C4660DFE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D77EC0082;
	Mon, 20 Jun 2022 01:14:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B293C002D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jun 2022 01:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DB7740A2B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jun 2022 01:14:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DB7740A2B
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=fOGN4xHj; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-oracle-onmicrosoft-com header.b=n2AKt7Iw
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yf7XdOAFChT5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jun 2022 01:14:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57D7C400CE
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57D7C400CE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jun 2022 01:14:28 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25JHOmg5005310;
 Mon, 20 Jun 2022 01:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=1XNown0ZJ3G7NR4AflklOVJs9xLODizTTlE12mLIl+w=;
 b=fOGN4xHjhdN4LvDOym3z9OYYrPIQi7K9gb04zfBQvudHAty96H+hF3X8KpjWeXv0dyiI
 NrsglAkN+cQQHcMnBvfLceBGsLhv2wJ3OxjhquLf3QfVMnEx+uFw1SThDG/d4tARBIcj
 OTW/zmgJeQ1jR8rFiaYiOI46bkwCy44m4jircQD583kPxT17/1sRJPUQaYOmjjbmCaUp
 7QJEbi/RO4wm5EWa+H6rnf7Y0zN+JyCgLlgpBUrtxQkB4ObGsAVYCMcrn6yJ1AU5I9v9
 H+BRkUuiQUYKZtIX2CvGOpu0MqyFTOnytdXGyd/XpX0zgIjZUZc2jPYR/EqVQXAXyfjS jg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs5a0a05d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jun 2022 01:14:15 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25K1A3Ra038698; Mon, 20 Jun 2022 01:14:13 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2047.outbound.protection.outlook.com [104.47.56.47])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gtbu5tbf4-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jun 2022 01:14:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KpGm2epCESqcwbGbfs9AbW4x4uC/McAWWeLJCyvWjGhaeumerfsEhVadpEXf6XexQd/323afvVi4/QEs6M4JqcxsD9ADdhTVjxKZvCrfFy1+95Ac+3lKoLVr8AXvXBh3aEOPsy21Ejbuk2cQ4v0XrMK3xMHBcZhNhMIbXS6hi9GS4/EnWbBY0ADEpqhWaew5JzQpVNNTMcc/aeUlEfpPQJ0ECwE1v5rWLLWZVXSUU87wtimu4b/4uhTqIQQp4juvjTM2vMvAXlPgBjkOFoyZwBWCGH2hLQjuPP6Cat1MMNTm7VuZqyVeDfBEUWhmxn8iIk7UoxhZBs+eVTSlwIQJNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XNown0ZJ3G7NR4AflklOVJs9xLODizTTlE12mLIl+w=;
 b=Gq0NQ9PnhshnRCCg1t6FapV8kMCxz14cuaFxOF95VuD1FAmjAAUerYRkH+MHaMQmbDZVMRSQiY9iO5FgliHfC0+HIcEAzzMMBpIo751QCFg/fbSO+y5K3fOfN3PoV4/08x9+r4JcUJgVcBfKBxE6duUsujZyyWUbrVrs/nmmfuy2IlCqlOzefNDT+wF+Ye+3OHCekWPppJFT038ptVehUhb24vKoTHYEY0vjwIh/hbhsCwgvQzxaxTJ5mcwgtk6uEOkWXg7eehqTZZNYqSNpZpSx1gZWyfIdU6nxDkl2nUFs7XcC4gV3jBPmiZbtqXvZFyC5ZWA+lhhIm4iOM7lCLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XNown0ZJ3G7NR4AflklOVJs9xLODizTTlE12mLIl+w=;
 b=n2AKt7IwLNAMxHEYG+3YvzJIW2Gbpmcluk7ai3JyWSjE1iu4wQaO8EylbSku6vkDuTvuGrlofAfMku0sAv/ZD7fPOE1ifa4xDuP6CMDTwfBQrkho/604+okj0CZ3cYj8KubOekgqoWJSQd6tevIuD2dgjMJeCGUam9LfFBAhfcc=
Received: from DM5PR10MB1466.namprd10.prod.outlook.com (2603:10b6:3:b::7) by
 DM5PR10MB1466.namprd10.prod.outlook.com (2603:10b6:3:b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.18; Mon, 20 Jun 2022 01:14:07 +0000
Received: from DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::f81d:b8ef:c5a4:9c9b]) by DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::f81d:b8ef:c5a4:9c9b%3]) with mapi id 15.20.5353.018; Mon, 20 Jun 2022
 01:14:07 +0000
From: Mike Christie <michael.christie@oracle.com>
To: hch@infradead.org, stefanha@redhat.com, jasowang@redhat.com,
 mst@redhat.com, sgarzare@redhat.com,
 virtualization@lists.linux-foundation.org, brauner@kernel.org,
 ebiederm@xmission.com, linux-kernel@vger.kernel.org
Subject: [PATCH v10 3/8] fork: add USER_WORKER flag to not dup/clone files
Date: Sun, 19 Jun 2022 20:13:52 -0500
Message-Id: <20220620011357.10646-4-michael.christie@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620011357.10646-1-michael.christie@oracle.com>
References: <20220620011357.10646-1-michael.christie@oracle.com>
X-ClientProxiedBy: DM6PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:5:bc::27) To DM5PR10MB1466.namprd10.prod.outlook.com
 (2603:10b6:3:b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7302b176-7ffb-4468-1db1-08da525a2cb0
X-MS-TrafficTypeDiagnostic: DM5PR10MB1466:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB1466049FFCE2EE801CB7B3F3F1B09@DM5PR10MB1466.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q/q+bZX+K0T8hRV1nUm6XoVXkc0W7+LvqyST3m3GVMTrlTUJ6z4UqowGCkFzTjlMijzJ9kDVg0XbgcID4QSmWEDaafTGr4JlcoO8/8dXflChqHorA0/bIWH5NxE+NXs9D35/5kPtwDesrX6199L/744PULntV/DuvbDpRurEQMD+oT9+YjSX6TX+qXxmiyvTJr0cYeq/3k0u9YuwDFrDhT0YHG2Lcduzne4bDOON+/u7Suxkw12gK4US8X2dd5xqvbacmW+NWVxVCcltNLd1PlkywQJeHeeG9v0DRHB5sNMk8/6vVNt3JphcICpdGm6UhT0+WrOds7cK1EpS0l5DhWJEvlNjKXynM/jYpiGfomMaEfaFFtFXgB7VqulDgyHRHE2zeTUtlynuryVW7uleaNspjYJ+d9iTfKimZWkFkLxFhXBr/Fagg9qyJprVAwv/Iogk5Sj0YUlN+F96wvZVCaUanNBrtSIYIkegj8IClaPNl6vbIe9qNG8auwZgKvQpcNgVlq3S60cCY5IMnomxYXGkD4lLZ4WdDJVc1TMARRF1+XQTy/BocRnG+Fk+ngRPywXuT9K/sQwD52AZzLKRRkW9DKLGQwJWyT2wROWj9XPSzPUxErppCuGkiBfBQFHIM9wlfQhHeEBicNWye3lFUaQONegK1SCwQUggK0fYbzK6abs74+p7n7Zi60q4dJvGNAdirwFC8UPThH9TslfCdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR10MB1466.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(54906003)(316002)(6486002)(6512007)(26005)(38100700002)(8936002)(7416002)(38350700002)(5660300002)(83380400001)(6506007)(2616005)(8676002)(36756003)(4326008)(52116002)(66556008)(498600001)(66476007)(66946007)(86362001)(1076003)(2906002)(6666004)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cH/3LCZBNvT60eeuYwMlc4QL6dIMXqs/4qCk/yK+vHJ+tj7RELRHD7KGt6fj?=
 =?us-ascii?Q?oh0sMm0+3jgDmCj2KeLXCK+zZyE14aVAupovDUw0I5ppCgtVGllcx+u6wdki?=
 =?us-ascii?Q?jpQu7ytmXwjAYg5eET4Soj5CiSbBIYjtVIuVtAe8BkxF0usTm5S5Q7XbhZfX?=
 =?us-ascii?Q?0JQtTFEdhiWwvAgEc2794HcG09fa200+O9KkRUyj8KymJZ9q4tL7/Rn/IduD?=
 =?us-ascii?Q?7CTmro543+oF5ifrastow4ZXfnoaWLwhXIvSAHMTKymo+9elsHtTd2TsanB0?=
 =?us-ascii?Q?+Y8Cx+nb8A6phi7oldiiQLjTnDtbbyTm3X+NdaB7hm+H/RCJO/W3aXPG5tKg?=
 =?us-ascii?Q?v/YxJlMifEGmqUNCkDMzPgL7O721qTB58dlmW1p9kanlksj3HEdL1hKud8R1?=
 =?us-ascii?Q?BGY6q3I+zuifNnHAJZ9Tl+LVjqOZmbGL2ekjGn7A79D6jVHp6PvCwBLI7R26?=
 =?us-ascii?Q?Pi6pxtVLbxTKlzf/VVT/XdXZ1eu5/2Dw7MxfRxHeRWAap/TjY48s1xjrCdDF?=
 =?us-ascii?Q?gJ3kl3AK+TnqFvht1P2dl6dJTZzD6BW23IayArx7TW+4wxa1J/MhbqkwDgCU?=
 =?us-ascii?Q?XuzibZrK9mhFkseqr8ncd/E4iBg58Lk2FUl2fQv4zK4KbHZy8MZNasnPXY77?=
 =?us-ascii?Q?tFmn6MbA3R+m/kd/qevIkQ+Aj3rNKNmvnwpfY7CIfx+NmKseMhAyw+WXTQRW?=
 =?us-ascii?Q?Yt4RYcEyc79kizoeQPt1vTFFsz4hMz/hkBlzgtXvBr2Xu+nOdDq40SdQvqjt?=
 =?us-ascii?Q?aFm1K4EdGkwfjlzOxyaC8b991cM5FcKm9zYcx8ywSI0BXjenB89rJB78rK3Q?=
 =?us-ascii?Q?TNmGzHWeyQqXUGGoSWTNIHFpDx3gvyO9fTbbICtyhtTXlegHnuTh5F5MGlNB?=
 =?us-ascii?Q?hRQtT2WGV3/AI2LTWvfIKMsobEL9VGZDUifrlUfNyzEsz77crTDCPu1D393Y?=
 =?us-ascii?Q?aiFWLAFov6jLWjsbi3qPS5QAZc5RKZAUZDfb1s6cy4P/IepF9FQ9ucreT1FT?=
 =?us-ascii?Q?7UwVtOSGUAcUO0/dKmwgl6IrFrDTgJ3+tyWar1ZY3V8K1dZ//tgbMA0AqGTQ?=
 =?us-ascii?Q?T0vVpoUOwapAszH+6JERT+dk2HTi6hOyO3mNG25yP+4asw9nm26gCaz1s3Ht?=
 =?us-ascii?Q?9/gR6dKIGM2iqxB/TYyBoW77HQyVzTGDFZ5hPV00WTubNqYGex+v0AQeRq8h?=
 =?us-ascii?Q?9gHAZr5PNUkUggQ7izyx1fIkCZKqo5bpapkwRaPtQNZU7CV+JnmH8xYkpDhf?=
 =?us-ascii?Q?7MBsnjtYuumJ1nGfd5FNb8ucAxVVRmwtHRmCq9PtxyWTIPH9B3Lt8AHWgmVY?=
 =?us-ascii?Q?jn5HAhNemvwztf2vLnryOAmwnQae8hKouw9AD/MEt9HBUNdlgiHAZ02K9eOp?=
 =?us-ascii?Q?GG5W76upRCjOae1+frUJLRUrLATA9XMKvZ95GExZYFYEw9JJIrtMFNN2aym3?=
 =?us-ascii?Q?Y0voLYfwzDqjQJMAo4jRvWbxg0rTetcfY2ozeS4PXQ9fASXQFLqpJl0yhqbo?=
 =?us-ascii?Q?t5PM+rb+sdeS7VwosxrOBg/CI3ju50t0fkOSlrBni7SOJdHPL5/yZxn39IE/?=
 =?us-ascii?Q?VZm2eR8uf/Jvu3yrerUOM5n66MkjVM7kwhp4ldVw4iaTxfkrkVXEIqLwDU6v?=
 =?us-ascii?Q?w8tPZXfOWw5S5RNqx68r5PyejEk7MAaJqUSYkOfZ35RXNugVUmV6vGKhwkDG?=
 =?us-ascii?Q?SkjgwG+LzONtj6M7xF8s9riLXyILSfarMPPTUov55kdm8v/pzJW/uYsQ1UVB?=
 =?us-ascii?Q?aRtWGmO8RZqMM+hncHeG6NevR1z/sbw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7302b176-7ffb-4468-1db1-08da525a2cb0
X-MS-Exchange-CrossTenant-AuthSource: DM5PR10MB1466.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 01:14:07.8338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgS0cAfjZXxSP3Z/7L81xh+BomidWCbWLiz7hcCEgmitVJkr8wWI7OFnSQvf2dOod2zjAABuaCOGblfmE8h4MHibJi9Rm45qpd7ne6V4ywk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1466
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-06-19_12:2022-06-17,
 2022-06-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 mlxscore=0 phishscore=0 suspectscore=0 malwarescore=0 mlxlogscore=844
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206200004
X-Proofpoint-ORIG-GUID: ZicX-J59G5UDImycJ2GqruC7eRyfUr6E
X-Proofpoint-GUID: ZicX-J59G5UDImycJ2GqruC7eRyfUr6E
Cc: Christoph Hellwig <hch@lst.de>
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

Each vhost device gets a thread that is used to perform IO and management
operations. Instead of a thread that is accessing a device, the thread is
part of the device, so when it creates a thread using a helper based on
copy_process we can't dup or clone the parent's files/FDS because it
would do an extra increment on ourself.

Later, when we do:

Qemu process exits:
        do_exit -> exit_files -> put_files_struct -> close_files

we would leak the device's resources because of that extra refcount
on the fd or file_struct.

This patch adds a no_files option so these worker threads can prevent
taking an extra refcount on themselves.

Signed-off-by: Mike Christie <michael.christie@oracle.com>
Acked-by: Christian Brauner <brauner@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/linux/sched/task.h |  1 +
 kernel/fork.c              | 11 +++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/linux/sched/task.h b/include/linux/sched/task.h
index 9e20fa18c41f..7f6364e5aa1a 100644
--- a/include/linux/sched/task.h
+++ b/include/linux/sched/task.h
@@ -20,6 +20,7 @@ struct css_set;
 
 #define USER_WORKER		BIT(0)
 #define USER_WORKER_IO		BIT(1)
+#define USER_WORKER_NO_FILES	BIT(2)
 
 struct kernel_clone_args {
 	u64 flags;
diff --git a/kernel/fork.c b/kernel/fork.c
index 604c7f3cdde8..0313aa9ead89 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1603,7 +1603,8 @@ static int copy_fs(unsigned long clone_flags, struct task_struct *tsk)
 	return 0;
 }
 
-static int copy_files(unsigned long clone_flags, struct task_struct *tsk)
+static int copy_files(unsigned long clone_flags, struct task_struct *tsk,
+		      int no_files)
 {
 	struct files_struct *oldf, *newf;
 	int error = 0;
@@ -1615,6 +1616,11 @@ static int copy_files(unsigned long clone_flags, struct task_struct *tsk)
 	if (!oldf)
 		goto out;
 
+	if (no_files) {
+		tsk->files = NULL;
+		goto out;
+	}
+
 	if (clone_flags & CLONE_FILES) {
 		atomic_inc(&oldf->count);
 		goto out;
@@ -2229,7 +2235,8 @@ static __latent_entropy struct task_struct *copy_process(
 	retval = copy_semundo(clone_flags, p);
 	if (retval)
 		goto bad_fork_cleanup_security;
-	retval = copy_files(clone_flags, p);
+	retval = copy_files(clone_flags, p,
+			    args->worker_flags & USER_WORKER_NO_FILES);
 	if (retval)
 		goto bad_fork_cleanup_semundo;
 	retval = copy_fs(clone_flags, p);
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
