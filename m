Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DD14F73D2
	for <lists.virtualization@lfdr.de>; Thu,  7 Apr 2022 05:29:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8489582D96;
	Thu,  7 Apr 2022 03:29:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uM1UXWOKQ7nL; Thu,  7 Apr 2022 03:29:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4DB8582896;
	Thu,  7 Apr 2022 03:29:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C94E8C0012;
	Thu,  7 Apr 2022 03:29:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09F33C0012
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 03:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBFA84186D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 03:29:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=oracle.com header.b="jXI1CzYE";
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.b="CMlo+9k8"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wb9R4sOrkA8k
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 03:29:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0DB94186C
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 03:29:20 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 236M7gW2006371; 
 Thu, 7 Apr 2022 03:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=FspSHwF13B9BbpmnqcGUERmum6Re9oIDd5MfxvXKoCc=;
 b=jXI1CzYEboy0GNUF6p687VbmW9R550d6ikVNLtrqzG9nquNygNVHYrP7eoa7jctskKF4
 KeIloS+shiz5kphPTwYWc3pNDEJIw4HsW7QNmTCxbwps+wQB4YldmJn7P9mJzS23yiDV
 fqqvbkec3PqVydLqQO+y1Wn0ajviBVE0KsO5mht5RlWI0SnUfHb1FIYWN7fRxxOxwnbg
 RzCw2JiYddeM+gS6fA9duMVLmrj+YKLOGXTlWrqOBtXKQd/pZKAPX0igHD6aGPdWJyxD
 YLsXGiTgCfXwNpPSTUa2L4ZwNM4ZZfuKydW/34EIQ1j6QH499OtWj8aIkGpYfH4Gpa22 hA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f6d31jptr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:29:14 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2373KQkh014152; Thu, 7 Apr 2022 03:29:13 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f97wqsre0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:29:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBtu/oD8OttihczZFWhcEdaCWqtwVtV3jM1TVamHPpErBve4hPXNtoB6lwdJpg9pAQxunkFhKO6G0m519MX4i0q2Ht9DBkHs3O+a8ZhPk5jOFXnrfbEioR4nABnomTlu/BLcuq1VaDZ4oczWNeHEaO66juCF5+boOZ532CYqu4cdTVAYf2KIbaaf61l/fKKd/qEhUBQ28VnVq8RG41qngUC2Ss2njq2MRW7a5AirVOk3hkrUbATVnMRlPtrzKwCsGllPXy5bVS2/wEO2rlKupKPA0regNGjoUjXBwVzjB5otwWNJaOeUVeWfuacRiz5vybaxsk5N9NCbEClPhI7w8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FspSHwF13B9BbpmnqcGUERmum6Re9oIDd5MfxvXKoCc=;
 b=ffcYlZMpnQmQYtj0AQM3arsM/UL/OPytocPAtBitJCfFYCr52gSYB4+CBML4lgGsoE7Y5XGZgUdyYhS72q7CSB79SaG0ZKhyyvQnNQwujzXmlCu0rHU+vpYzm/e9eMfuI27xdtLBmyZfiGxc44Qq1uLfnXv3H5b4rTPOcTW2Wpc/s5p6qKPBoC7bhrb9PAYyaEJgr+xc7Vy3y5XZbDvQ6SsOKzziVqYfGzxfV5el/WucIk1JQCbL3O6QiDS8FsM7r8HC13D5xuCipdIdPiWED9lI4zTkBNOyZ0tSt+3zIC7Trnkp16FGWJW4sjU6Fy6jlJta4/Lf77qUE4OAmf3gDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FspSHwF13B9BbpmnqcGUERmum6Re9oIDd5MfxvXKoCc=;
 b=CMlo+9k8exY1H/xsxYRsnGoFadfUU6ixuoH9kPQVb5bvaMk14fq11ag4UNzE8dfo10i2efWZu8mH6PhR4PU95S96Jumf9NMXyeFVDn3OS/xB4EEmujB4PNmJbIhY1FrVxwwotM8ClQY3FG8lOL9ml1kzmK1+xbdgtiSyAPYwGE4=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (20.182.127.76) by
 SN6PR10MB2637.namprd10.prod.outlook.com (52.135.81.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.31; Thu, 7 Apr 2022 03:29:11 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed%4]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 03:29:11 +0000
To: Christoph Hellwig via Ocfs2-devel <ocfs2-devel@oss.oracle.com>
Subject: Re: [Ocfs2-devel] [PATCH 22/27] block: refactor discard bio size
 limiting
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1ee29h8qx.fsf@ca-mkp.ca.oracle.com>
References: <20220406060516.409838-1-hch@lst.de>
 <20220406060516.409838-23-hch@lst.de>
Date: Wed, 06 Apr 2022 23:29:08 -0400
In-Reply-To: <20220406060516.409838-23-hch@lst.de> (Christoph Hellwig via
 Ocfs2-devel's message of "Wed, 6 Apr 2022 08:05:11 +0200")
X-ClientProxiedBy: DM6PR02CA0141.namprd02.prod.outlook.com
 (2603:10b6:5:332::8) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8070910-ebee-4181-449c-08da1846c81d
X-MS-TrafficTypeDiagnostic: SN6PR10MB2637:EE_
X-Microsoft-Antispam-PRVS: <SN6PR10MB2637A3B76030A51B21A21FD68EE69@SN6PR10MB2637.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KBpq+aayhUAT1pO7O7lX4YJ5rmC/ymbcYRAvX26Z08Y8oQ5OC2BPymwjj5K76vcB4dSLDTSUvvo/dRe6V34hT3xGMvNaAlMBELuNoxgHV1PnutkOiGEzImc3I6z6D2OmQWt3+fim8uCpdG1E9RLu6N5PMnuux6W3GoJju40aZ7yfo3+MILsD7kP2NO6XAMQ2dEMGyJnKxHsnvAzvzfZWOWqENSs+ynCpHoR18aBtqIy3dN35sSw66+tsZ061H7w/WMp/CTUSb08cv69Bmz0VjFAwK0gNSynz/0zt62AbfvCOBeKllzziqiVvUzVHgFPYOrAbAyMTsIHEcY9ZmRMAU1VHuh8DYWl+Tta11PGicV3k8U2E8ncwwKkdD9IlsPFLTI2Fu/r5Sb5o6i+taQdsmizoJv/lqV4j2EOjinm4YgFw8giw3fy66BNUvHNhtkmhvt3j6YDygf+jcNyWob2Krpwck1f8LaCYEpYl+1USJs96cXikOCFvzKZmgRIBR+pcpFj92BkXVlqfGzxIvqDoKGqCnqNrTSwo7/3N64Atz82uXNL4T13nJNSz+D2cP4pMd4g3PKTIxECxfvIhH/ETamwTnk3Cy1JnNwsh+DK6Yqi0VvKt7YReYH522aX0RMpAyRdZR2jFF13NevqludULWwUeSazJ0QN4xFwxhLDdYUPyJR6fD5qWQQDokpgT3Z7hHcQCXSrZSpTicAIf49Z3vg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(54906003)(6506007)(52116002)(186003)(508600001)(6486002)(316002)(26005)(66556008)(8936002)(38350700002)(6862004)(66946007)(4326008)(2906002)(5660300002)(7416002)(38100700002)(66476007)(6512007)(6666004)(558084003)(86362001)(36916002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SPOdVXZ0+i+GnjawtDUnbmSAWLngszVdO5C8CxxotLuixJuu3IFgSAaoCNGb?=
 =?us-ascii?Q?ZWGlOaUTK+r96PcQ27XzpLW51NL4qPCdz+47SVqd/Lqggz/H2t7ChkbkuKjG?=
 =?us-ascii?Q?OZLSC7667yVg+hkfNKptOBLhNkX4js+75fK+3S1f3WqNzWujU/lCE0i4Jvff?=
 =?us-ascii?Q?orAP8outnZXpiR/+1jzkrdD1QyRdW03kQPjmex9NpTUkugW6dgaHMpfueVMJ?=
 =?us-ascii?Q?5lJe2nq9Pjx83JYh775/ujlJx/VA05ZgE1d0tA8uJ91vgm6PzUPO4n07s0mU?=
 =?us-ascii?Q?FHzcrTNHn5SfHHGBmoitQGOrzlscedQzeaQhjb3AuSGzyEePl0evWsBrYLyy?=
 =?us-ascii?Q?xBa0AJVANloyU1uKw1q1v444qulQFNGugIN0w+Cx/PCazy84MOTlxt9MWAsT?=
 =?us-ascii?Q?qmpwCAhbmJeyWLEwB1v1KpRhkvexr+XWWoNslPn+ScxmxQC8MiOwvjR5nzI3?=
 =?us-ascii?Q?Ywp7/BIcJh+9Bit58puiEHNf2W4Dulm66Dv4S+x9qJk5rxSXdzq5LJWychIY?=
 =?us-ascii?Q?tjMzrcyqm547+qJbjAODeE4re7w3ExzliRLIgGZsKalRxocNd7iS9zImfcjh?=
 =?us-ascii?Q?nX9IPOv6iIolhB7WhmWBH7l0n6ZpfSlNJgbgop0yg8OyBvKCrnKTXa7xc7Iy?=
 =?us-ascii?Q?+ivSktS1VAEnWYwY3j+sdL5AW6kBBgNWaTWh/s/8UsgEz0snP47I2sAeU2Ps?=
 =?us-ascii?Q?8WlPwpKTwKrTUg+miqG5AsBoWXjdjMPZBrwvHl57Qlr0ulHsZDTcDYYlmYJ8?=
 =?us-ascii?Q?SnmOqQiNcb6ZnPqB2YXSC/VhxJoXlT2v/rxvV9CZZjx9R84bSd/jVu2qLUMS?=
 =?us-ascii?Q?BYmKLAkGPuR2pXQwLT/3SdoRdcw0BlA8TvdrOB/04Cd+s1hMR4uaKr4lBV6O?=
 =?us-ascii?Q?PQMi3A8E+n3wyvmISSddSW0dcOl7p1ChxcRFBtTZS7fCqatTpAhGsJDPWcfb?=
 =?us-ascii?Q?30Bc7SXQn00ARZK3PMiVoIsaVKs/dbCQoSsZS+jH/AJxgVS9YzLQVzKj76WC?=
 =?us-ascii?Q?6uH1gsf1dCf0ACTdIQWGqN/nMLcVoHStsjWLbmAMtqtSo/+FluAVHFDfvHyC?=
 =?us-ascii?Q?9BqZ+LCirLAC0W6xOAua4O0X+RHlpPK6guZ8cS6RQEZVAlyDsTvNIdnmY1mc?=
 =?us-ascii?Q?LlnJ4GP/CV5Oj5DCEbMmQVv3Y8sWDtTMTx7pCnt9i4PGn3wIULCfDgKoG8Rt?=
 =?us-ascii?Q?QIW0qCQvZ6CVvp1sd/QWBs8yQa70FN/TyixcJRHvxsndkpab1ngIZDrgZlW7?=
 =?us-ascii?Q?OzmroAm6t1WWtX3vB/9sZypprpYrX4TOb6B1C2cFo9Oi7hZrw8L8+Cg8YYON?=
 =?us-ascii?Q?9ZAaGQB8tphUSKelFXFWeZqtFumcjQENNtlIk+O9xMNlKfTbVPiIcwOinw6q?=
 =?us-ascii?Q?fW0LXIARA2UgtbapzMggqC3CNr9HzGU2M+CYUY1402NTj591OG7ICbHg+nzW?=
 =?us-ascii?Q?/0NuOcbDG77Yd7lnm+mkaMZWG/AijhtgX3gtenoQzTd97CpcIMsgx5Uby9Zs?=
 =?us-ascii?Q?qUO6uisTDag8+yZNxjt9TAW6dO5QGaycBh9ehb2giX7AreedPRsgvmXr1g9I?=
 =?us-ascii?Q?FsGiOuQAnIhOsEo8RXrojUqn02esH7vPVmPSTQbQluRbCGUSx+d/tuslMbr7?=
 =?us-ascii?Q?3Yt7JknUR5F59Xl1SyifJrdH8GQnCLQljPGj7AxMFpLl7cTR/ee+O/kSyOZE?=
 =?us-ascii?Q?4Ul2IhyKbKmdok1Y/hYgp8TrtFudohXlhY48tibWOtgY2KGoSM0oV234lUU3?=
 =?us-ascii?Q?fSGDBOSWFoagbxS/Tzn4AD5YSlb00oE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8070910-ebee-4181-449c-08da1846c81d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 03:29:11.1892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gi0BFA2Ok7V3tE3LFDdJiO5tuxtDLwrPwtU1KTZgJtOze8Mi+AtLFgp/5Z2pc2BPvLLQTZ5iuHjo0466k0W+Blb8S3MwLDwPCIAyDfcmlAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2637
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-06_13:2022-04-06,
 2022-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204070017
X-Proofpoint-GUID: r6gyQw1VOXHdH7f3ZbK8XF6W2k4Rmy-H
X-Proofpoint-ORIG-GUID: r6gyQw1VOXHdH7f3ZbK8XF6W2k4Rmy-H
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, linux-um@lists.infradead.org, nbd@other.debian.org,
 linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
 ceph-devel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-btrfs@vger.kernel.org
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


Christoph,

> Move all the logic to limit the discard bio size into a common helper
> so that it is better documented.

Looks OK.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
