Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A63A8530B15
	for <lists.virtualization@lfdr.de>; Mon, 23 May 2022 10:33:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACC2160C17;
	Mon, 23 May 2022 08:33:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ood3qjUHIbyN; Mon, 23 May 2022 08:33:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5B5EF60BEF;
	Mon, 23 May 2022 08:33:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C524BC0081;
	Mon, 23 May 2022 08:33:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 074E1C002D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 May 2022 08:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E86EC405CD
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 May 2022 08:33:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=oracle.com header.b="nWqTnHCP";
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.b="x+fJvXGJ"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id USwL5CtoI4hM
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 May 2022 08:33:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34CFF405CA
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 May 2022 08:33:42 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24N549qO031223;
 Mon, 23 May 2022 08:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=ZRW7R5kblrxUCgnnZGAMGPN/VH3QPF3CT6opcemIE7Y=;
 b=nWqTnHCPtgHABdAFiH5O1BMEDz775/Rqn050JL/MM8eK7rSl29/q9T1ukWrbOf8NKP9P
 LlfpLaRcr+6KKQe89TqHWo0TahMRIL6p15Kc6Ak4JDcM57NzZJucS02EMPwOFOx6dJqy
 RRb1xaa5JiuUM0xQnWbZ7LuIxndzVAWcITaUb5XC0HrBNC3WxMdNLnwyr6vD65bE/6N8
 K+g+pzMaY9uhrMeVgfgx5UivYbyT8P0TmDSQmO7kCWahgZU2XAKErZpG2duE0fp/SDPT
 U4zq1sAOCQAc4OFr8+eUZPlsyuKsXeXZGcjhuFRgN7XlvPhzix2OZ1zFzC0B3vUZaVu/ iw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g6qps2mbe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 May 2022 08:33:40 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24N8W3ok036795; Mon, 23 May 2022 08:33:40 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3g6ph7jxe0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 May 2022 08:33:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAmMG87IB7+Zi32XzS0YCNKhuNsy/+is+vvO0OhssDy1vragJChDOCWTDEK3TWrxW+i/fq3Bym4SE9VtDLJjP/aBBgiOfEpEiotz7S6DewXCqQrzjaUjhQ1u4uhDlow0CVfEhbP89T+3jYRKm4e+E9ui5iDedh1MXR8PObGYqSxnXWwHzRRo6536UtQtUlAv9DMZIp/NcP9GWB0kr+yvg+TKxzY4RyDxvECQBtBDUJgZ5S7LMID9eVB9lbAzkLcQEAakJR1YSyk4WI8xn5aEr1LFiZ993gTJvA6rghdKLVrfJSHiNd7n4cCVnByWuIwRU56L0zU5P1rrRjfwxRyi/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZRW7R5kblrxUCgnnZGAMGPN/VH3QPF3CT6opcemIE7Y=;
 b=DEoNFLZ4QFtQ0fofabXNYZpu/5+gE8zqdCVUvyL4fUqQkY9rXBPJzsel3j51D00xb5MpyifLJh51oK07xPApumn2lCPP3yeTYBXl07fpaKV1OywBOgqEY/TXolK7n2+JVRwUgyJXD+rpczI4msVehTiHwITQOxaRM4LrrP9irCGYSLIMxIJrB5kmtSYc3WeyXDOPP6S4maDgQnxuvyoVIuHYbRTy5AxQMO5RAUgHzAi65hc4PCk97a+ehqpJrTXSu7vVu6SQggYxQSCwPvbOG/lpil+vFq+uyt1J8RTaUOlUDNjk9VZDALAnRnrjcLdCWiQ/d7Qd6wwdiGnE18WUGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRW7R5kblrxUCgnnZGAMGPN/VH3QPF3CT6opcemIE7Y=;
 b=x+fJvXGJVbIOveTwMAYqBywQ7DH2JoRR0OT+tU4IbTN/VuaXxyk5sC+8a24Na+VgfJxXQYwYjRBKVB4yvxCipYTV929Q6cSW76DNQ1xXn4MUz7xMpvI9hJUeFyhLUFSMIaO5uiAtUDaDLDxmtQBaJFMHlNPZ3R+Ix3O2piRcVr8=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN8PR10MB3377.namprd10.prod.outlook.com
 (2603:10b6:408:cf::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Mon, 23 May
 2022 08:33:38 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e%2]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 08:33:38 +0000
Date: Mon, 23 May 2022 11:33:26 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Gautam Dawar <gautam.dawar@xilinx.com>
Subject: [PATCH] vhost-vdpa: return -EFAULT on copy_to_user() failure
Message-ID: <YotG1vXKXXSayr63@kili>
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0137.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::16) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d530da3-2257-4546-9969-08da3c96eefb
X-MS-TrafficTypeDiagnostic: BN8PR10MB3377:EE_
X-Microsoft-Antispam-PRVS: <BN8PR10MB3377A83972E5E91A0B2E0EE88ED49@BN8PR10MB3377.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PUr23XY2eDX61i/SGWkc0wNwldNqZOK8obzg+x6YseRE0hk7qDs+E31IelEM7hBlslIrAXgBLwCFOXlboojmok8297foIe9TfUUJR0bwGANmElENhWiFqWXApBPyf2PjDdYKJ3NJfUs9NLG7DYxPhDGuEklgXY0e/wkigRjjYloEnVXkV7deTgm6dmc3uRXfS51oWP6rLFzzjx0I4sTayR0A4lGkh/Bm/zKCMOFJKvDmhXdpy4dLexxrw4vn1q/f8aIRGXC8x7KFO5QLECihkmRciao9xl4AI+/Pjt+DdWCYjolwfLmo+1/vxzKsw6gCZzLcuhGFZtKTbJrFgAsyTEVlrOAnBoMB65h/mxJMbGhwuOxZyGC3P4pirdyfetsYXQb0wJ9/ws5u1N+dLL6FY5egmDfgMuctba+pZeGnGFOhSqe/mDhsulzH9U3kUBO35ZEjpJa9yT9LnrBzhb8GG+DN2H9HQatDR1I3zY7lXXtjPq9TKnGdooTJ2WxqmxzmauESrXkfRplkdU9CzTiR/CRZZ3FFMF6nMzsACIM/Iz0ChrYEzu2ggw+6jp58sALavOvwJCUv043hWnhAMqWNsfo4t8QAsAc52ARsnb0xI+br2z5X1IRZlzg/vnigLlpqUaKXN1oHJDHCnnDEyCGxVLRRIMefIjP5Jv5M+qBrpMRsIkdhn3y5Gejm/BMzYt5q+PP6j/tEBpcuTtSQo04A/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(38350700002)(38100700002)(66556008)(66476007)(66946007)(8936002)(2906002)(316002)(54906003)(4326008)(5660300002)(110136005)(186003)(86362001)(44832011)(8676002)(6506007)(6486002)(83380400001)(33716001)(52116002)(6666004)(508600001)(26005)(9686003)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?irkvkUKWNbzIcAiM01pIEU/P8sR53a1tjAWftD4rIL5ydHqcDq5iJfNq//U/?=
 =?us-ascii?Q?5/F7bK4XqyY6GZkrbBIqBSXlUS01Lo8qxjHv67gccVbtZa065/DxCsH45Gq4?=
 =?us-ascii?Q?fL/liuXPjwxVIQAIbyllp2roy+/USYCb/TUWxd3D4g6fvUC+zxXPYh1yTI3A?=
 =?us-ascii?Q?kvncMnkfiZKMH9DUkZA5fZDD/pE3Zu6ofztmi05Hq12ryT9ZsP9AIlBJkAQ7?=
 =?us-ascii?Q?Z5r2eE+QuqMayjylOxA5+iBihFC0rkC5ECLJrxKR9EaCQCtHOcfzz48rlvGi?=
 =?us-ascii?Q?4pYNIjMP5M1Z5JJGUgR1J6kPw4aY3F6prux03zy5thqnU6f1mg7/8B4u7xcg?=
 =?us-ascii?Q?HD73MlweAfw1F5+5VuiXwvxivdOIA6wiXtMgvdERGZ86jz4yeTbpxVa/EzTK?=
 =?us-ascii?Q?WODnRDlNjE1mE1Hqh9Pzj8ON6E4eAoWZ5aRVact78csjeARdgRPzJeSPJXzy?=
 =?us-ascii?Q?qs6BOGqp57nxa/0G3rH3T/A0DcvQhN/YN55kFqLruG9Bu5jClDeWvYrzCLpW?=
 =?us-ascii?Q?P2kESG8TRX50ihGxVTYJQWXKsnvkJeyjO2zAuCed/kRJ/FFJ5MZynETKsNW5?=
 =?us-ascii?Q?3XyvAsmHHA/j/ci87eoYKlMVqYq+6J1UWsx5J0BkJ7Df4N4IRlp3mMqJPMSU?=
 =?us-ascii?Q?5O74u4BfYWGyzObSM13Jxf6H0t2aAgK6sE0X2z1EbsOOe1D1JtXaTPbz6e9U?=
 =?us-ascii?Q?zK7xnlq56NvNvsY9TWjLTejOnfSGeBI7PITX5VqJnx6jpRRkXOKK7W+A8u+/?=
 =?us-ascii?Q?iDVG+q5QLWTmncOy3K2pZKL+Zt7CosrgtQN2HwxpDa56486bkUdtla/BDlRX?=
 =?us-ascii?Q?KuIVqJ7WBrHRQ8G+mxkvrAjm+GUKeVURRRIJRyVKxIEOUgUMBSEdoALp5ZOH?=
 =?us-ascii?Q?/JUlKlafH3iRayTZWHpwlBa1UDCKcm5vjzn4SmzzMRnddbBZ/wvi9GUVooTz?=
 =?us-ascii?Q?GCP6hedFfedCAnHae/Txza+Yfh0akIQL3i9V6OJk0i0WD6rvX8NKnc1CuJnX?=
 =?us-ascii?Q?aprdeLTMS40+DKSzknjsj+YK5fU6O7dA1FoW0ibafoaiGVKxtVXgGSouXbXh?=
 =?us-ascii?Q?8MZYYw70JR/OGIVVH3xmb123FUo33Bb6MawufFLx0yoJ0z7qDAfho8wRVbPb?=
 =?us-ascii?Q?pDDLs1g2PEu3Wo7tdVsEn9Pjkoa1jPjis8H4BgDOp9gqb57bLtrpB7dr/ssE?=
 =?us-ascii?Q?xa6zUMIOr2Y8FVHC15BvvxKRKcSf5HzXJ30iNLYfmq5OOr5Fs4rT+kqKDzqx?=
 =?us-ascii?Q?2B2P3zvDLUJoOCnUlRAxi2cERSGzy2sjpDgFaEDXnCXRmJm46zWNe024ERBf?=
 =?us-ascii?Q?q3aYOl7FkicYWpVKi6xi7kBKaGCPOVX/6HpmI/fP1B9A/dQjx5ADXwN/7pSC?=
 =?us-ascii?Q?jak7orGkA/1EYdHgoK7AvItQqbhNdywFMPUN8n1BRpoxkalX0ccyzpKNO8dN?=
 =?us-ascii?Q?UkYvxiwhhPSnHvDIbs7etTJcQ1KSfVcRBi7sxzbDzbPUmnD9DFJknl0Ddw0R?=
 =?us-ascii?Q?J14/LxVSgVGGkHdxdHbAly7pEwHd25P78NMejHSbZMjsucxsd4ObgRvkZyTk?=
 =?us-ascii?Q?bgHKld8sBEdFIKjqtzjDnfxXTxCgCUsCGLrp7ZZAA04WMNnI+sG8bs+nwbkO?=
 =?us-ascii?Q?ynSCuCCQ1Q+7WaXRAWwisuAhf3ARVBmzeaKgmS9iCVvnBHCKSNBT0j7n+8Ag?=
 =?us-ascii?Q?YPTWBusdx4d9eEOGW6SyhFo2BlDKO7SVnGk8q0YVaHT6uG8j/lpm2YzYlQWx?=
 =?us-ascii?Q?WFrQwdWlTi9deUQogUP+JKdSdu6WmQ8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d530da3-2257-4546-9969-08da3c96eefb
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 08:33:37.9667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: om1ilu1GcdyUBn0/51yPUi0NfPbksVQOBga/9l5wvfCud2jais9xE4CQ2sUD9MakRLiVoHNrohMc0++GkY61tD/egcUNqMtLBkb0EOP7F30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3377
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-23_03:2022-05-20,
 2022-05-23 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205230045
X-Proofpoint-ORIG-GUID: QRv88FujKx4pMTiqnF30hPAd1_pXSozy
X-Proofpoint-GUID: QRv88FujKx4pMTiqnF30hPAd1_pXSozy
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

The copy_to_user() function returns the number of bytes remaining to be
copied.  However, we need to return a negative error code, -EFAULT, to
the user.

Fixes: 87f4c217413a ("vhost-vdpa: introduce uAPI to get the number of virtqueue groups")
Fixes: e96ef636f154 ("vhost-vdpa: introduce uAPI to get the number of address spaces")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/vhost/vdpa.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index 3e86080041fc..935a1d0ddb97 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -609,11 +609,13 @@ static long vhost_vdpa_unlocked_ioctl(struct file *filep,
 		r = vhost_vdpa_get_vring_num(v, argp);
 		break;
 	case VHOST_VDPA_GET_GROUP_NUM:
-		r = copy_to_user(argp, &v->vdpa->ngroups,
-				 sizeof(v->vdpa->ngroups));
+		if (copy_to_user(argp, &v->vdpa->ngroups,
+				 sizeof(v->vdpa->ngroups)))
+			r = -EFAULT;
 		break;
 	case VHOST_VDPA_GET_AS_NUM:
-		r = copy_to_user(argp, &v->vdpa->nas, sizeof(v->vdpa->nas));
+		if (copy_to_user(argp, &v->vdpa->nas, sizeof(v->vdpa->nas)))
+			r = -EFAULT;
 		break;
 	case VHOST_SET_LOG_BASE:
 	case VHOST_SET_LOG_FD:
-- 
2.35.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
