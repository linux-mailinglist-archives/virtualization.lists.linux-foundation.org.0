Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D1A43712E
	for <lists.virtualization@lfdr.de>; Fri, 22 Oct 2021 07:19:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D294683A76;
	Fri, 22 Oct 2021 05:19:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JI4RXPAYCyST; Fri, 22 Oct 2021 05:19:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D636B80DA4;
	Fri, 22 Oct 2021 05:19:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1D168C001E;
	Fri, 22 Oct 2021 05:19:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E266C0020
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Oct 2021 05:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D8B260709
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Oct 2021 05:19:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=oracle.com header.b="yxRs3XLa";
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.b="eSCGi9cC"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3IfvPgNSaTaG
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Oct 2021 05:19:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A9E96063B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Oct 2021 05:19:30 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19M2qeuI019167; 
 Fri, 22 Oct 2021 05:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=X5HrRn/ql1GFGMZSy1m7FRy5eOe5R4RwTzYfSa4G6ew=;
 b=yxRs3XLandNJA7CViqQrrKjYN3A8NnNMxf4I2R+fUHH2QDEK4RFmApvW3ItsUmwnTeYH
 jFyiqbBpCOmgO2n4zmjAjUjyNbAMgWwL6+udSoLAFbm0yQEET1IHZk8GgAx4fTC3GdbK
 1+Bx7Qk34GzFLMYa1CxICRBveIfetASBbFzshh407uXFQUwnd4pYXQVWvasJioyJmNLh
 iRl4BMSUgfXJmkvBikes97AiqBI3Wh0xO+T+ySyl4l44WdPZiWAkOixMfC0J03K3DddM
 5BMqrWR/vJUs78cPdNKxregPb6/RvflEMZUBEZQju32J30rTVgjtWY1uN7aApyMHFdSy Yg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3btqp2s1ap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Oct 2021 05:19:29 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19M5BHIe139141;
 Fri, 22 Oct 2021 05:19:28 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
 by aserp3020.oracle.com with ESMTP id 3bqpja16nf-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Oct 2021 05:19:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRTDe2Qy9y9xPqpxWOHKjF/rU9EFMeV+yfVJ6OYHUOXxHQS5AB+fd+g6NY41HIRaaEDlBB0gMDxgo8HD6VdWbdPgMcxgVeymKw96Yr/dYxtLstus6xjjg4WMoUhSVGVH69Ov0Ho3r6c2pGCwtJ7iJz0l0PUkXNJMf59HH1R+rTQeAFmGza8A1juKFnWJgzlhOVbBDCcqzOPLAooe6UvHG7a3MwbfxCqw4O0JO7u7WnzjIEy7JtSKIh5w7UvbqPNyD1CJfSUkcIjeIYwb/fBDDwPgUZrFxpDSqGQQb9ZHIkXMAO37iN14Mvilv7bXfPys1An+YyrMWNXOas4W5A5z9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5HrRn/ql1GFGMZSy1m7FRy5eOe5R4RwTzYfSa4G6ew=;
 b=VFzr51TWJ3fHViXFbkXbhLjcPYsX1n2Y+fTfzR2VDEqOeNpRFvB4DxnQMSSvzp90vkne1wFdXmqiA5If+inNsNbbkCqhxLSoINffkkSaD8ezJA7vyrjA/LPsiRgBMo3wTgPij7Xz+uxteZvL5RepXDz5pLeGx/V5T3hXktjLIK407a9mg/Vev7lE/e4NRSa3dNDHKlMSZ+AMc+qK+7s2a5m/iOf0+8NWJzk2Y95JNViD1xucylXcfBPN2Qb6tX9PV7g+CuK1woiPKBxd2FR7Dl8SUOBtf5lDLkjJiX7l1QZs7HxQw3WQQYTHD+tH0qXtsUTD0ywwU+I5+xP0p97Ujw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5HrRn/ql1GFGMZSy1m7FRy5eOe5R4RwTzYfSa4G6ew=;
 b=eSCGi9cC7cvPF82ZXjVa8G9XQ9LP2xGIMQo3jB/d9YDetRktaKYCG/c3Cs2IBKr9HdKrUZdih2xQNIcS48bBggAmwCezX06JlrBBV6NQlXHrrAD7d9j6tEeDw5GiJ+HZnjIsqMeXO7a5lvMuBtbq/6ATCTNp7N+t3BxvcVmVJ6w=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=oracle.com; 
Received: from DM5PR10MB1466.namprd10.prod.outlook.com (2603:10b6:3:b::7) by
 DS7PR10MB4974.namprd10.prod.outlook.com (2603:10b6:5:3a0::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16; Fri, 22 Oct 2021 05:19:26 +0000
Received: from DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::195:7e6b:efcc:f531]) by DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::195:7e6b:efcc:f531%5]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 05:19:26 +0000
From: Mike Christie <michael.christie@oracle.com>
To: target-devel@vger.kernel.org, linux-scsi@vger.kernel.org,
 stefanha@redhat.com, pbonzini@redhat.com, jasowang@redhat.com,
 mst@redhat.com, sgarzare@redhat.com,
 virtualization@lists.linux-foundation.org
Subject: [PATCH V3 05/11] vhost: convert poll work to be vq based
Date: Fri, 22 Oct 2021 00:19:05 -0500
Message-Id: <20211022051911.108383-7-michael.christie@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022051911.108383-1-michael.christie@oracle.com>
References: <20211022051911.108383-1-michael.christie@oracle.com>
X-ClientProxiedBy: DM6PR08CA0012.namprd08.prod.outlook.com
 (2603:10b6:5:80::25) To DM5PR10MB1466.namprd10.prod.outlook.com
 (2603:10b6:3:b::7)
MIME-Version: 1.0
Received: from localhost.localdomain (73.88.28.6) by
 DM6PR08CA0012.namprd08.prod.outlook.com (2603:10b6:5:80::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Fri, 22 Oct 2021 05:19:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bace67b-33b6-41f3-90ce-08d9951b8456
X-MS-TrafficTypeDiagnostic: DS7PR10MB4974:
X-Microsoft-Antispam-PRVS: <DS7PR10MB497458F1A149F9952EFC4C6BF1809@DS7PR10MB4974.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8bz5AdlUW6Odr4I/jC14pwD+HI7jJP1GaXTIU7kbYfL0CsKpCS2qaa7/1QVTJ5uaw97fyqqbIpKrh3CFQ1wZYyPV9cwt63ArK2bH+G6Zbhn1mRlHX0nWZwuaAwW49kz3Tq3vNwfFDDvo9Mmom7TWDcY8sIa8hqhPILvpOFX1YTqAHjDVlTfvRD3eLPzCz8PUEaStE7X08nDn1Ri3dbSvLrUM5F3IWcC+GUb9e6oGCXimVxSNVDp9TaeeCh7QpjBSPf3k/FCgmwkdjx9vKUDbwqJ6DDq5F9T/QKmrmN1PW4f+BMOvn8fzibe+uxnLdX0l6sGADIXSlBRrCYuJx7LXHUwEQ+nB9PPf66P4mL5bvZUNRGdT7zwJu1QR7NW9KgPYC48fwG5Hf0E6rNQ5/C17UjamAQRMIv3sHC682pWPsQcXqwo0GOy+kM4mDGxbmU2z0PiGy1W98uSdopDWU/oSgsn/JSItyMx4rqsjcyWA2jb97TzQv0UizLsfKemDkX6vMP5xNzpwSa/NZv2jrvmShPE+N93G2OI1vRLiJsnPUH73M5bQU6+smt8MawZxrFiGzWEdRWjsTwbEqPZKmhT/5NH4hTW13wwEcp/4IshTdwIp1l7aIKbgLrR2v93GDrGf18VYi44OZWCt00ceabI7qbCsBiUDc+EV/kbL08QkzbFx9VRtu5c1+Xv5QIPLlbyQ3le+FheOnXdAVzFkMQNELw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR10MB1466.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(107886003)(38350700002)(66556008)(4326008)(36756003)(6666004)(1076003)(508600001)(2906002)(66476007)(66946007)(8936002)(38100700002)(316002)(6506007)(186003)(26005)(6486002)(6512007)(83380400001)(52116002)(2616005)(86362001)(5660300002)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JLPZvciVxCdpXmbziGbAghYR2o8g81ZHyHSZosw9M3xS9EszJ9Ir9XrXNWhB?=
 =?us-ascii?Q?3QpxtqTFSgMoagEszyi/Zqci7JtQK/8t66szfAFE2OKz1bLQFlhg/2xIYUNx?=
 =?us-ascii?Q?ZxZhYe/3u7XrnEpw7tg4eRrCCUfGvVFxVSPV8brFiVXBOufW7KFaqz4TsF0e?=
 =?us-ascii?Q?a07DBnJjX0Jqjg20S5Rf/2aKPlbuisH97UUXTqjgWSVaBCBRy4OEFrc27G89?=
 =?us-ascii?Q?7yV+jaME/68fRFxFgfvKT+RBiOzcOc6jz2x7/sFkcaoXl+lqYH8sSAEgqNcX?=
 =?us-ascii?Q?NNPKy7eF/YHwC65v9Vkla2/rG8COS6o3m6NZOco3jNGRKlsomv24m5gTwdyL?=
 =?us-ascii?Q?HciUn+ClCKThr/PBgLXEz4eMOYwHJnM5E8gU9DRpzayU6Jas9K8SHlS2oHtd?=
 =?us-ascii?Q?6tz2nce6uE7iAPoli269doeWmuQ8HehH2r/eb2zFGPMZRfFasagM1HdwDR06?=
 =?us-ascii?Q?wGC5G/EE/3YizGAx13MXUD20ExhYNhjIsmdPJKFunS+QYOWVXJZriLBNwztH?=
 =?us-ascii?Q?hXS1LvPeR6HX1/8IEVzyiee1+Dhgzb8jarbC4B7YmZBtcbKTfzLD7nAnT/XK?=
 =?us-ascii?Q?SIGAhaIaCaZBjKzezqyNTOCY0a3VTrfAjq22VOVd8RXGMdR+/7aO4kxDAinU?=
 =?us-ascii?Q?3NXGqr+TXzFCxp42eQcy01JyED9V4YNk2MtXrMn8MrQ4ACumSH+u6SNx7g0O?=
 =?us-ascii?Q?nxelrUgoR+requ4Aj6esnjZZG9kERlixHoE6oI0TQXy3h10gkwX41ukOIyu5?=
 =?us-ascii?Q?DHhY9AoBCqT5qu1c8E7jR6FX6Da3caxqjjz+Gezo+1USk/MacbY3BQbLSxjA?=
 =?us-ascii?Q?IVeSEbvWGD/vc4vNlUD7apFo8Wsu9eob9k98MmKGErayeeyzm2L+IEFW+P0g?=
 =?us-ascii?Q?evIuYphx/Y6dmWB/wAK7d1XcqbuaRVAzhbFDGOUQvco7QqHJ1zSffWhG/yUn?=
 =?us-ascii?Q?P0RGlYc6S/XJczx/bUWSR/TuGWTEL4bkgKOwbwS+RvzGucgVu4wwiaCDMcj2?=
 =?us-ascii?Q?wtjnuoehMz1cKm7ur7hlWvh1fs+wLk4EEtu9iAT+ByRVCUFgy9cDsen+7Fly?=
 =?us-ascii?Q?OWXZNxb3qLxL5GYjx5UcGGIeuWjHISynOJjd97KvwUMkPuiMQUUoxIgJqEga?=
 =?us-ascii?Q?7g4XR/Pfks1+NxHjsgvL7YSjh+1su5sAaz3NmUULGL4JYOhcLe0vjLMn3zSq?=
 =?us-ascii?Q?fixMApJhuPQpjJMgRxV/V9N/HyYUo5xFrhgRNIOSpBw1U/U/Am30fwq1cWFT?=
 =?us-ascii?Q?45sWhYJ0eaNWLWmIGpKE9YWgFbfmUVWcOSQvW66+EBlD5K36Myrr4c5HXxyX?=
 =?us-ascii?Q?Aar0e0P0HARaW2KgAQarUZpwOsAixJajE/CWweEixn5z0SRGaEKLmPH6F0XD?=
 =?us-ascii?Q?IWfSfcLew3EpwYRsu2kGKOwXsIf3gUOGIQTiRhaf46KlfNmi2lfKVF6Btc8r?=
 =?us-ascii?Q?O/PN01Am5VSh+gArINOoHJ2WeYOqnQkM?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bace67b-33b6-41f3-90ce-08d9951b8456
X-MS-Exchange-CrossTenant-AuthSource: DM5PR10MB1466.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 05:19:26.8056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: michael.christie@oracle.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4974
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10144
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110220028
X-Proofpoint-ORIG-GUID: wrsTdBsWTGTradeIM6sidXu3NcxzS56R
X-Proofpoint-GUID: wrsTdBsWTGTradeIM6sidXu3NcxzS56R
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

This has the drivers pass in their poll to vq mapping and then converts
the core poll code to use the vq based helpers.

Signed-off-by: Mike Christie <michael.christie@oracle.com>
---
 drivers/vhost/net.c   |  6 ++++--
 drivers/vhost/vhost.c | 10 ++++++----
 drivers/vhost/vhost.h |  4 +++-
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index 6c4b2b2158bb..2e1abab45f3c 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -1339,8 +1339,10 @@ static int vhost_net_open(struct inode *inode, struct file *f)
 		       VHOST_NET_PKT_WEIGHT, VHOST_NET_WEIGHT, true,
 		       NULL);
 
-	vhost_poll_init(n->poll + VHOST_NET_VQ_TX, handle_tx_net, EPOLLOUT, dev);
-	vhost_poll_init(n->poll + VHOST_NET_VQ_RX, handle_rx_net, EPOLLIN, dev);
+	vhost_poll_init(n->poll + VHOST_NET_VQ_TX, handle_tx_net, EPOLLOUT, dev,
+			vqs[VHOST_NET_VQ_TX]);
+	vhost_poll_init(n->poll + VHOST_NET_VQ_RX, handle_rx_net, EPOLLIN, dev,
+			vqs[VHOST_NET_VQ_RX]);
 
 	f->private_data = n;
 	n->page_frag.page = NULL;
diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index e4d765f6c821..c84024afefff 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -186,13 +186,15 @@ EXPORT_SYMBOL_GPL(vhost_work_init);
 
 /* Init poll structure */
 void vhost_poll_init(struct vhost_poll *poll, vhost_work_fn_t fn,
-		     __poll_t mask, struct vhost_dev *dev)
+		     __poll_t mask, struct vhost_dev *dev,
+		     struct vhost_virtqueue *vq)
 {
 	init_waitqueue_func_entry(&poll->wait, vhost_poll_wakeup);
 	init_poll_funcptr(&poll->table, vhost_poll_func);
 	poll->mask = mask;
 	poll->dev = dev;
 	poll->wqh = NULL;
+	poll->vq = vq;
 
 	vhost_work_init(&poll->work, fn);
 }
@@ -288,7 +290,7 @@ EXPORT_SYMBOL_GPL(vhost_work_dev_flush);
  * locks that are also used by the callback. */
 void vhost_poll_flush(struct vhost_poll *poll)
 {
-	vhost_work_dev_flush(poll->dev);
+	vhost_vq_work_flush(poll->vq);
 }
 EXPORT_SYMBOL_GPL(vhost_poll_flush);
 
@@ -301,7 +303,7 @@ EXPORT_SYMBOL_GPL(vhost_vq_has_work);
 
 void vhost_poll_queue(struct vhost_poll *poll)
 {
-	vhost_work_queue(poll->dev, &poll->work);
+	vhost_vq_work_queue(poll->vq, &poll->work);
 }
 EXPORT_SYMBOL_GPL(vhost_poll_queue);
 
@@ -526,7 +528,7 @@ void vhost_dev_init(struct vhost_dev *dev,
 		vhost_vq_reset(dev, vq);
 		if (vq->handle_kick)
 			vhost_poll_init(&vq->poll, vq->handle_kick,
-					EPOLLIN, dev);
+					EPOLLIN, dev, vq);
 	}
 }
 EXPORT_SYMBOL_GPL(vhost_dev_init);
diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
index a985caa35633..d9650da2be2c 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -46,13 +46,15 @@ struct vhost_poll {
 	struct vhost_work	work;
 	__poll_t		mask;
 	struct vhost_dev	*dev;
+	struct vhost_virtqueue	*vq;
 };
 
 void vhost_work_init(struct vhost_work *work, vhost_work_fn_t fn);
 void vhost_work_queue(struct vhost_dev *dev, struct vhost_work *work);
 
 void vhost_poll_init(struct vhost_poll *poll, vhost_work_fn_t fn,
-		     __poll_t mask, struct vhost_dev *dev);
+		     __poll_t mask, struct vhost_dev *dev,
+		     struct vhost_virtqueue *vq);
 int vhost_poll_start(struct vhost_poll *poll, struct file *file);
 void vhost_poll_stop(struct vhost_poll *poll);
 void vhost_poll_flush(struct vhost_poll *poll);
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
