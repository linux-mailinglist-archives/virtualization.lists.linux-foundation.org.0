Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C078525738
	for <lists.virtualization@lfdr.de>; Thu, 12 May 2022 23:47:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C330E82C3E;
	Thu, 12 May 2022 21:47:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XqjnlhKg5tLU; Thu, 12 May 2022 21:47:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2CB428290B;
	Thu, 12 May 2022 21:47:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C67F8C0082;
	Thu, 12 May 2022 21:47:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3A7BC002D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 May 2022 21:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2D1160634
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 May 2022 21:47:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=oracle.com header.b="zoKw9v6h";
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.b="upsMDBBF"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vVpOIM3eItDp
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 May 2022 21:47:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D172F60681
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 May 2022 21:47:26 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24CL80Es003186;
 Thu, 12 May 2022 21:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=5d1du2Mt2g4sDKGSe0wrpVELREIHQvJCuKw1yc89ONw=;
 b=zoKw9v6hCGSG3Kha8B1MZ5Mfd3t1TOfaNC00jqO19nWPD6AFSZ22BG+0NdEptNB4p6WR
 SPYAr/7iZLr1JjazepuUtEpQkj+mVw38uqhrH2xkTm9L0nyr4gZXRox1g1Nqitso2V+r
 BhEJJVsboR43jEu7xznCbxC/ElzMc4muXFxNmo8aitI/mTP9crXcmK/qUq6/xw4ZzHtL
 iAr0GNHBOOWbM6SlixT1nuc1ywhW3VeuZ3P/HUnAPJsQlvZ5HTFPUX0CTk52FdB9GP2W
 SwbOWc8R+9+fWU0SJdjz4AP9C8FROrerxb6de7YXxyG6urYNkQDVAi0/+aersS3+MdF5 oQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g0a04n2hs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 May 2022 21:47:16 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24CLgIkM004728; Thu, 12 May 2022 21:47:15 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fwf7c98s9-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 May 2022 21:47:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGFmGY1913uUTfoGc4t5OXkW7/+NxoKBzTHNyGrqxVmBAwDdd71sgO1WEmOvHAlNcocBXIh2TxTY5HiV8tZGvWxgfWkEn07hWsOxBArrPQZ/jKKwm1PYnRe3TV2bf5/zBPUX4wQb8mOakML3QsgkY1pXve/dC9qfBiwG0FRvd5PudGUmiqAWfzTn9jgcCO7CxeyNRKRGuFMdc9dRD7tTxzJeVsBEt5ykXKWngUnvDqj2WCtAnfe6T+x/koRleSGBsUHY1ZeDOjFbVvbI7TMxNg+f66x3BDsIRIdNjNNeDbygP6g3Mxd/WEAPUGottmC2xbLLoxN9YfqsoK2e9s0nKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5d1du2Mt2g4sDKGSe0wrpVELREIHQvJCuKw1yc89ONw=;
 b=MnQmJCICBzYznEN6941COEwrrA1+ismjZ+Bx1t9RhpUAGpRP8lL4EY4xquJuwUbqGYu972Hyecf8uPlVHcrV3Iq8BiwvjodUJVxDrnCfWUGzpUM+SmmjMu7Q+Tc0Xea4VQgWD5f26/6yjHN4/RJTVqyDcgCw5Mil7FWL9boStYg/rdW+JmBWf28ExVKLH3hG+TwjuyjUnoxmzsj0J2RNioEIKfy806/PbPVsP2buoylR+sPz+z01FpwzU36JEiFSm3hB7Uab9NsIba6+9aZV2baRC1F/BpsE95dRnlcM9JCGjC4757MChsUnAOehxBqudNZDb6Z7Bn/W2XpnX4L8Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5d1du2Mt2g4sDKGSe0wrpVELREIHQvJCuKw1yc89ONw=;
 b=upsMDBBFYQKVk5VAoN6dhLvmkgmLlj/i+l9pyFoYsi4N8c3dNfWukAJ5YQihJrL97y0ljUjQG64s+5qdwP0ZPkPCiR+rFZcxNEFqavcU49i7WJZ+9mbRpr9R3lHto5r01LOdldXwu4WWKOk4eHDPQsFmyAi8SoPa/VuQovdguFk=
Received: from DM5PR10MB1466.namprd10.prod.outlook.com (2603:10b6:3:b::7) by
 MN2PR10MB3311.namprd10.prod.outlook.com (2603:10b6:208:121::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Thu, 12 May
 2022 21:47:13 +0000
Received: from DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::f81d:b8ef:c5a4:9c9b]) by DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::f81d:b8ef:c5a4:9c9b%3]) with mapi id 15.20.5227.023; Thu, 12 May 2022
 21:47:13 +0000
From: Mike Christie <michael.christie@oracle.com>
To: hch@infradead.org, stefanha@redhat.com, jasowang@redhat.com,
 mst@redhat.com, sgarzare@redhat.com,
 virtualization@lists.linux-foundation.org, brauner@kernel.org,
 ebiederm@xmission.com, linux-kernel@vger.kernel.org
Subject: [PATCH V9 3/8] fork: add USER_WORKER flag to not dup/clone files
Date: Thu, 12 May 2022 16:46:59 -0500
Message-Id: <20220512214704.104472-4-michael.christie@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512214704.104472-1-michael.christie@oracle.com>
References: <20220512214704.104472-1-michael.christie@oracle.com>
X-ClientProxiedBy: DM5PR07CA0089.namprd07.prod.outlook.com
 (2603:10b6:4:ae::18) To DM5PR10MB1466.namprd10.prod.outlook.com
 (2603:10b6:3:b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f56b880c-f742-497f-35ac-08da3460f96b
X-MS-TrafficTypeDiagnostic: MN2PR10MB3311:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB3311E13F360E54A89A0F5167F1CB9@MN2PR10MB3311.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e9jtMRQDTKLNQo1zubUn2MWgUraHRuzyZBnrYQ1AHO31xZNypuAC/c8b7G2Z83yz8ZOY/nLY2iTLhqZPb1H3zGzxozLxsFGQ9TI/noooVAJp0Eu2OY6YsAJ2GOxHgJyIiTTFd92W75Vm8IxyogMQ2espzMEmRTyA/IxFH0l6WUE/lFAteh1d3yBPtbApVZ91nQqB52zjbBgEfUZcryjq4HS5EAz09XreDoIdMWEi10F9vliUA+HPxK9otp8GAU0jm2488kGsgv6YZvFc+SQkFrFwz2xRMcI2tlr55pq7pQbbw9PIV8uq8/d6DXUuvzg2FtTms/KBCN6mbHHBV4Mt13U0cwRLf81mSHKnUyIrw2wTJX50z8cXLuPgx5IrzYZH3yzzTEzbV/6NH7wOrj2vZFqS5oYv8h/JK5q/kOMzoebJN4746/F4mRrsTEFcaUSa2hK45a9eZNeojsPGnid+YQHXmt/6Ls00KbwTnRTqCyRxoRgdI0f1g73i1/HVUzFhiFC/wn8GME0zQP9tzojK24WkF5hNj2H68hvWOpoMg6yr8SHJ39vxYB5Z6nsVKkXZKT+lTGNWSzsymEc7G7+byqXCeZm65ExcEGqnlF3WNfeTb+BtI+eXg0FHuOfuiv5UUpN5l11x5NvHv8O16hzz4hio2Zm+Gt2sKhedlbY7F8ERJyg5xyGV8QJjbjldxBomzEVoDqAyzNKdo/924EuszA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR10MB1466.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(7416002)(2906002)(66556008)(66476007)(316002)(66946007)(508600001)(36756003)(6486002)(26005)(6512007)(4326008)(8676002)(6666004)(6506007)(186003)(38350700002)(54906003)(38100700002)(83380400001)(8936002)(2616005)(1076003)(52116002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cTaMn9QG05gWvSyFwt4YIKR0XQwRzZg6zU9iU/fvL4iSc/MB3KxESH/PgW6q?=
 =?us-ascii?Q?qUWcDQzVvsQetoBScFsx7lssoQEapj7BybDeL6THWeKNw50GntLt/pHoDZFr?=
 =?us-ascii?Q?pUPOlDd9PQwDJ71Rr7+CO2wVZOaFTXdsx9lF2YOP6In+G2JxcGMQYmuG9qKQ?=
 =?us-ascii?Q?66sV38eSAnFSMJOxSbM/MaVn7P+GnidheTYSSV5fHulXSujPNkYs1BrP5W1M?=
 =?us-ascii?Q?XYdLR82/R4i4WnUmuBYs5NVb0wwHavr5fMd0iHCyhLIBPFZW4hmT3pRHKiNy?=
 =?us-ascii?Q?00JbK2D6L95RtExujI1Fc9dc3WPCHwdrqh6m2I2KjTD2DlL9D4CJYe2B+w1s?=
 =?us-ascii?Q?DDtzpSlfPqaxDxVS+qLOx1AkcdmS0pJkXNoCCIhcGiisbOoP1FD9MwOCx2sl?=
 =?us-ascii?Q?MC/5tDECLxh8KCZ1uIWCO0q/lTEzYBRpmAaAlCB3/XyNsu5Ykuq9dKPltYU5?=
 =?us-ascii?Q?wwFLdmruOMJJLI+LD/NAlt2r2IgkPaPE7efY7VqXCKrFSd+JlyU5S51YUlSB?=
 =?us-ascii?Q?NrFEnaHyw6EFpJ5vMwq8scE/B/p5zVaFw9jFjq57DDgJCO4rXs5otKtwuEZO?=
 =?us-ascii?Q?yw9z2gBA25JO/2GAJVBwWsxRvvauYmBQ3+NNxVUBRmQtKZ2rol0c3whHlUyo?=
 =?us-ascii?Q?nWXJfbJdr26j+U4EN/m7YsTXxKIDmqLYoBolQ2VEBA1PkIjKItnE3g3mKuk5?=
 =?us-ascii?Q?1ZdwRaGNes7qw0UNKiill2MQzrbkKQHf/6ZeuMawFPfEbqQqmbJdqn3dSPkk?=
 =?us-ascii?Q?wpnBSOL9DnVtsnknM+h3V4EAdI8yu6/pmzrEYWYgCWSlCJBcy4Q4vJq+Tdbw?=
 =?us-ascii?Q?zHEOL8yDCvKD+kOg3LuMzYo7i5ZXID0cKlMr/7+PrdOa43W5fQj1ROMZQmVz?=
 =?us-ascii?Q?xCws5FpSnjNH/DJhLixbn8A3XJO9uG+snu+HB/souy9hy4I0ArVQLs7y6WfE?=
 =?us-ascii?Q?YwGTt/j8iiKslEOUnkA6Yn+x4FRxDnHb8ZMwhb7vYzy/Krr/zjfvzYFFWIJw?=
 =?us-ascii?Q?586f3trZ+gQZy10TVYuaV7LXbxQFOhugJek9WDFELv5wqjhWNxtPuC8+X9OF?=
 =?us-ascii?Q?GOq7r7ZY5CUssZ1qM8KJCT2gXAgWsyMxR8mp9s7p/v+I91mg7nBRSjaZJfJr?=
 =?us-ascii?Q?vooResTPusBbjwl8AQtYtGAkESD8K4scVfbZwE71Pf8cgIal2e17CykdDfAO?=
 =?us-ascii?Q?vn170iFZKL0zTc40bQmhAARFA5jOCYx0CLXCEPA6gJYyuHxgpjqMvLrtYimo?=
 =?us-ascii?Q?K3Z3vCOg0mugnYrkXZRL6mQnAp30oy0p8hLVAGdFadPQm0mS64j+i/ed86qn?=
 =?us-ascii?Q?80KscX8/OiTxEmebfsUbHrLZb9/5ifb63aRSyJF3/GguEDErv+kGPNifT04G?=
 =?us-ascii?Q?fZlaTnpWelCLfekUnNB7kY23LD2uL6jTcH2IeCpCxL9X2j8LIqa/wYRAAYSM?=
 =?us-ascii?Q?m54rPtKVIxXUymjQ1jxmurpGAd+EZUshpjYjO3XA6DkpxTv8fU1B/9gWf+j7?=
 =?us-ascii?Q?JKOXrLLcevRrpGIvKiK0tDHRTN2flsdFL8LxxUSGNfk/ZHBbkCFejIg6tlmj?=
 =?us-ascii?Q?zEXIA4plLwwLlxAXeh2NDY4fefcRfE8piE8f0En2r5HcHwvsbd/raRM+Xr3G?=
 =?us-ascii?Q?4H2KcYG9NU7Trs4lo1zND9pWoTU/HS6WhyH6a6o9eSBgklw8BvXwmmAFzjE5?=
 =?us-ascii?Q?xrw5oEWQg+w7scs7yN17M6xAdd1UyXNWhztkXQTdSEcq8yACkbSzi7+XTLfR?=
 =?us-ascii?Q?/x5G+MAjF/lcSKfGitpVvFtb1vdHSDA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f56b880c-f742-497f-35ac-08da3460f96b
X-MS-Exchange-CrossTenant-AuthSource: DM5PR10MB1466.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 21:47:13.3654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dTqNItbnU/q6KuRpBCl8M52K9QZd59/bpUGpXkJ/1zuAKx7fdye5Jy+lu20SpFCCpBMPh7Qu/wBSKKHishNV+ciZHjdk3QLJ0jI1o+nS+X8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3311
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-12_13:2022-05-12,
 2022-05-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=789
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205120091
X-Proofpoint-GUID: llhbeMWt2WFpaeQ2eI50TEVfynfeVjGZ
X-Proofpoint-ORIG-GUID: llhbeMWt2WFpaeQ2eI50TEVfynfeVjGZ
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
index 19293bcca001..43213bc926c6 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1600,7 +1600,8 @@ static int copy_fs(unsigned long clone_flags, struct task_struct *tsk)
 	return 0;
 }
 
-static int copy_files(unsigned long clone_flags, struct task_struct *tsk)
+static int copy_files(unsigned long clone_flags, struct task_struct *tsk,
+		      int no_files)
 {
 	struct files_struct *oldf, *newf;
 	int error = 0;
@@ -1612,6 +1613,11 @@ static int copy_files(unsigned long clone_flags, struct task_struct *tsk)
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
@@ -2226,7 +2232,8 @@ static __latent_entropy struct task_struct *copy_process(
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
