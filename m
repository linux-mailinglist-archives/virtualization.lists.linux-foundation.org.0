Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3D9437131
	for <lists.virtualization@lfdr.de>; Fri, 22 Oct 2021 07:19:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6C4E82F76;
	Fri, 22 Oct 2021 05:19:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uuRQZRQ1u0dv; Fri, 22 Oct 2021 05:19:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9CC7980D6B;
	Fri, 22 Oct 2021 05:19:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D12E3C0020;
	Fri, 22 Oct 2021 05:19:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59A96C001E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Oct 2021 05:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B079560711
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Oct 2021 05:19:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=oracle.com header.b="tj280fRq";
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.b="Wt8tBfSg"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hUEUlTYN9CMb
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Oct 2021 05:19:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA0D7606D9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Oct 2021 05:19:30 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19M3UmKk021717; 
 Fri, 22 Oct 2021 05:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=qAivgcfLGbT443JqegSAXld3F+JKJSKCnqohMp+/uyo=;
 b=tj280fRq2hNE0SxDHjYfOY1MxNuBB/6259cEuosIFrBEfH7Rkb7PMfWUD2p9EYd8Y0XE
 KVloM9f8XKG4dphWLVqMo8+tkVGRK/z9EFSdC8exNopn8gQeV33dF6sGS8gaaJRvIbAB
 gx15EM3sleuaSS80zTsOX0rRSpMu7SeKtMyUEJIuLIDtehQAtNxCQJMU6oIOnfPaG9dQ
 b2s3KHIPMG0L6HjJeXIPbrqxOSvwyts9kLx7ol8tRq05jHsDybPcM2dlXW9JxGRSgZun
 +4mQuLBCAzu6+iJKnydQ5Knb8p/DaGXDi3DEm2+aFfQSR2OEwvT/KSycckc8+sBclnzC xw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bunf988jd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Oct 2021 05:19:29 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19M5BHIf139141;
 Fri, 22 Oct 2021 05:19:29 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
 by aserp3020.oracle.com with ESMTP id 3bqpja16nf-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Oct 2021 05:19:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c36FZxo7owQkgJt4Bze+SUGaExf+bvBFScBFbeaaudJrElTvFvLOkRxk6D0eagyexqAwhCYb532yCUvOyqdisNCOU4sy/AMMLl7P243G6mMqd+KGBkhwfLBtsq0+0hGzfRH4Fcmktud+/w/r/Ix2ErExgpmMN1m6qkBjasA+0P4DySLMBUM5LmdW0aCm9b2vPCPNjfg6pD9MEcEvnpuOogGJwhcqjH5vIJ52k9MCdyZUcYROj4qQAP00l5M+V/1GG+0wcTCX0NFBn+0C26lgHiZrzoyoxMNQBgCZj4RH3mvAUIAJS1RHSGupLslcmZaKJtRLyFRQ0yB8wHaLCVdOQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAivgcfLGbT443JqegSAXld3F+JKJSKCnqohMp+/uyo=;
 b=W5rnAe/hC4Igbv/tyhbL50LCGgx2T3+5x2IQxN5aSYRyugFEo2G65Qdxnea/GzCVvqKpuhdbUCNeYSNxCyoiZuJdMKglyMUIrfaLzCsaTPGBIvs7ibIkuljzUqEMB2AusGoA9d8WBWz43xzoHqa39O7AxjbrwTvS0LCUh3+doYlSYKiFN+/KfhQkmrksB5KI4NLQJbaG6mYDBH0bxxDjJVgBFDe14wsaBgE54AdsDnk5XwfeauQ/FWaNJFA5cHvGfCzQnhRvP83Zg6IhQJRDTnxgQtFpUR4QnQrpd0h8ttCYkHiS4CuN0BI68FF0iDQ4G/GFmMrJMD99SII+xigRTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAivgcfLGbT443JqegSAXld3F+JKJSKCnqohMp+/uyo=;
 b=Wt8tBfSgbB5w5W4As+RsdqE0kYnk7IXizcRtdm7wsc0RdDe1qZ2JPDX7/03oVmxMpXLA1Oah1IvzBk+ZNoklKwwD8f6NN6z0GB1AFiWi6EgbOy6xr0dueCNxnR5GFPKLFv4y83CNuclyQB7mteAjklOr1EQFzVr1ksJ52neYTP0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=oracle.com; 
Received: from DM5PR10MB1466.namprd10.prod.outlook.com (2603:10b6:3:b::7) by
 DS7PR10MB4974.namprd10.prod.outlook.com (2603:10b6:5:3a0::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16; Fri, 22 Oct 2021 05:19:27 +0000
Received: from DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::195:7e6b:efcc:f531]) by DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::195:7e6b:efcc:f531%5]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 05:19:27 +0000
From: Mike Christie <michael.christie@oracle.com>
To: target-devel@vger.kernel.org, linux-scsi@vger.kernel.org,
 stefanha@redhat.com, pbonzini@redhat.com, jasowang@redhat.com,
 mst@redhat.com, sgarzare@redhat.com,
 virtualization@lists.linux-foundation.org
Subject: [PATCH V3 06/11] vhost-sock: convert to vq helpers
Date: Fri, 22 Oct 2021 00:19:06 -0500
Message-Id: <20211022051911.108383-8-michael.christie@oracle.com>
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
 15.20.4628.16 via Frontend Transport; Fri, 22 Oct 2021 05:19:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e91aa27-a51a-4b9a-4c1c-08d9951b84b3
X-MS-TrafficTypeDiagnostic: DS7PR10MB4974:
X-Microsoft-Antispam-PRVS: <DS7PR10MB49745AD7F4BEAF9B81C968E7F1809@DS7PR10MB4974.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fj6rok1YISsW2Hm2nsmWJ16fthESy7Dcj0t6X4h+Vz1N7iGdIDJJhaJMsdCRrRGElyUZ58Inw1Ntn2tTqpzeKIQ4rXMP4Tqg4rSX7fCR9sN30hFze6tpsGBHe3YpuYGOKKP6yO+ByRgcaQoRYV/3OcigiiIuK9EUQRHtuzKVOthJez3O9HIwD9igtKXmiIf4yl89Fktm8XPI7+HEUWRbHssma+c/tHpdro2FgvKn/a1Bs542oRYquvLD/Bmn3FTwlXh5v13jSU/ihs7U7aeXlTMS1h9S2cvwZkKhMSLIG+hC8OcfnhU3mlvWCJ5SN+S6UH9FKBP0rGjv9/clg6SD6XkxRF9KpE15cMIqf7H459MA5ZBCRt39SsBymGJnQ3dqGf8J4NzRBNJdPKxumeWb6Mr4EE/CYVjwWfPhCXpUj2zU8/70BSS83hqU64Teg1BAV+LaGHdgO0whzsJUSn6Do9IQlop9Okxw9mW7uDMb/qvPqZDhS0LTHXn68GfEuGcrKnvDGrFvH4l2ehs4fV6dIKDPmYhqaKBcQTgOM9Il3OTI5PyvFL4J6ovw0Km/u79oBe2wGhAiUW1/3rIktNTFj0x8HNVAQ1BT9pqz/r1nGu27z+J5q/5Rn2SpEsOhlxyGPqGXbAyEr5llU/0Z64KNkNiLLgANc88m8mZLLu8AK5TKRo3bcanrNnAWzs4emzNf+Cs3SNM1GjPZZP8FmsGEyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR10MB1466.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(107886003)(38350700002)(66556008)(4326008)(36756003)(6666004)(1076003)(508600001)(2906002)(66476007)(66946007)(8936002)(38100700002)(316002)(6506007)(186003)(26005)(6486002)(6512007)(83380400001)(52116002)(2616005)(86362001)(5660300002)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yzj1VVPV5EoiGY0AzdAh+Y/9QXKDaVfk3fE0v6xCpmzE+l2rSFDhDuOPW2z3?=
 =?us-ascii?Q?BKgBt2yusV5uq4CNEqho/HNHAXj8HvTRMzkuebvt76ucPY527cxA2+xabsdb?=
 =?us-ascii?Q?8LJlkP3xkD9Ndtd/zXAmpNJFjF56Us/oO2cI1FNd9449IQvVDKr9EF/gOebD?=
 =?us-ascii?Q?95uW3fdwPWyYOrdDosA98GJaYIBAJ7o18AXyq9FhNYfRiF7LA0qAuooQAQlX?=
 =?us-ascii?Q?AV6Ez7tEkBeIEdmlVqVxbWLiHD8aVOWlLng8RAnzxRusEDNNsgY0yBpXndh5?=
 =?us-ascii?Q?zePedtwIDSj0g7Xgw9e5ZyomuEwfZsKtZFNKxcS+Ga33NpTncKxk7PZ4kiQz?=
 =?us-ascii?Q?PbS1AaPlSQ+fTuBnxPtLSq7A4jSCPrjb2IBeHM4nbDVRUcui0lAewyO8u1nF?=
 =?us-ascii?Q?/Fl1mDIiSIBUmv2+u5RHHrmACZHQWTQ++FcUYLh5b9dc+APn6zqztTwDUsX3?=
 =?us-ascii?Q?djQbTYN9TcV54NL3oA7opvWSrEqzewHhG3NiC9m6Om3jq1ZG5MRsa5vT9xcI?=
 =?us-ascii?Q?lBTGJd52MidWHIjtz6pdvtaDKUx+dghsW5OLvq0OzsQqWcXXlaPfXWAMflBP?=
 =?us-ascii?Q?kCy2JIfOTweokvQHXXduRiN8L00xd7aNoRVwx8gaFGvHFN4/2QEI5MT8JEIq?=
 =?us-ascii?Q?rtb0GLbziNrX5LS/uos5JQnqD3o2Yet4P6NFNijdLRP8asOMyEtO2TcEs+Pe?=
 =?us-ascii?Q?O73wnuDx0typMF634Qo/WrnykCq9z//6efJsPG3rYemn2ZtjwGg330PjNuH4?=
 =?us-ascii?Q?VhXMo6B+b1q5YxbTW8vQ+GZALwLAMwe3kqocn7oPmYNoRVTvU/M3s0qln9iW?=
 =?us-ascii?Q?GzTPkEneUPwAh3gDVyFK066NiWQFuIiBSaFjNdTrLkEdw8YNgBlndBD16RIp?=
 =?us-ascii?Q?x+B6Yoh4L6wjDzKaX2kWfXXBPoocN+mMep98oRmG8JxryHF6SIZYR2SbxtZu?=
 =?us-ascii?Q?wRMBVKgTtTISRGK2fo19IllrpY12WP+r8P2geL028mT0qkJYI/JItzeiALR3?=
 =?us-ascii?Q?6O2tViNwKEJmEA0GPFNKzD6ZhFC+fLxIuCrUyC1wqWZJcG7BlaeFM+M2M+k+?=
 =?us-ascii?Q?to0N+hmGgzq1yTg7Dpjk7KDkBO/ifjhJQ2qcSO2fyKvJ7FAWacrxRRc+7HuJ?=
 =?us-ascii?Q?yuRJIxOEVngAjNaECss56/Vk5o2w4K8EL6cfh4gITLmd/E+7lAMw9Q52ej+1?=
 =?us-ascii?Q?no62RPpfN5KfhcGppBLbTC959x8F5d66Fl/13L1Y4c6tcYLyaARm7t59IQHu?=
 =?us-ascii?Q?kfdKDI6m5FmNgiy31s/VzvbwJl+mUchi/7XLNgRB+l3a5qzi7dfUmHeyz5P4?=
 =?us-ascii?Q?I/dtSFa66rHpOmLB6PtoqGD3u1CF7HF1h6qJKtnwE5FCdXo6LArVwouLvc7B?=
 =?us-ascii?Q?iBjTeC5ouYvTDE4b4cnbuMPdGAQJ9VprOTBh/ehr/Mx57ifabW07y+6NvU2r?=
 =?us-ascii?Q?N4Idwz9s0J7djV78rfNEFUg1//zr7ZKm?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e91aa27-a51a-4b9a-4c1c-08d9951b84b3
X-MS-Exchange-CrossTenant-AuthSource: DM5PR10MB1466.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 05:19:27.4553 (UTC)
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
X-Proofpoint-GUID: DofVkvXyumaqwJ9jMVkdAJniid3IFMWz
X-Proofpoint-ORIG-GUID: DofVkvXyumaqwJ9jMVkdAJniid3IFMWz
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

Convert from vhost dev based helpers to vq ones.

Signed-off-by: Mike Christie <michael.christie@oracle.com>
---
 drivers/vhost/vsock.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
index 938aefbc75ec..c50c60d0955e 100644
--- a/drivers/vhost/vsock.c
+++ b/drivers/vhost/vsock.c
@@ -300,7 +300,7 @@ vhost_transport_send_pkt(struct virtio_vsock_pkt *pkt)
 	list_add_tail(&pkt->list, &vsock->send_pkt_list);
 	spin_unlock_bh(&vsock->send_pkt_list_lock);
 
-	vhost_work_queue(&vsock->dev, &vsock->send_pkt_work);
+	vhost_vq_work_queue(&vsock->vqs[VSOCK_VQ_TX], &vsock->send_pkt_work);
 
 	rcu_read_unlock();
 	return len;
@@ -612,7 +612,7 @@ static int vhost_vsock_start(struct vhost_vsock *vsock)
 	/* Some packets may have been queued before the device was started,
 	 * let's kick the send worker to send them.
 	 */
-	vhost_work_queue(&vsock->dev, &vsock->send_pkt_work);
+	vhost_vq_work_queue(&vsock->vqs[VSOCK_VQ_TX], &vsock->send_pkt_work);
 
 	mutex_unlock(&vsock->dev.mutex);
 	return 0;
@@ -712,7 +712,9 @@ static void vhost_vsock_flush(struct vhost_vsock *vsock)
 	for (i = 0; i < ARRAY_SIZE(vsock->vqs); i++)
 		if (vsock->vqs[i].handle_kick)
 			vhost_poll_flush(&vsock->vqs[i].poll);
-	vhost_work_dev_flush(&vsock->dev);
+
+	vhost_vq_work_flush(&vsock->vqs[VSOCK_VQ_TX]);
+	vhost_vq_work_flush(&vsock->vqs[VSOCK_VQ_RX]);
 }
 
 static void vhost_vsock_reset_orphans(struct sock *sk)
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
