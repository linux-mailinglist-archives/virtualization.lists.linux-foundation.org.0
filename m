Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B5639088F
	for <lists.virtualization@lfdr.de>; Tue, 25 May 2021 20:06:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7162F405DC;
	Tue, 25 May 2021 18:06:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pic1lF52apVj; Tue, 25 May 2021 18:06:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79D1C40592;
	Tue, 25 May 2021 18:06:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5414EC0001;
	Tue, 25 May 2021 18:06:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6BD73C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 18:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6730183CD8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 18:06:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=oracle.com header.b="YLJFzUxT";
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.b="GSPr8SCG"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9dZbFsaMvFwl
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 18:06:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8067383CBE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 18:06:23 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14PI5cui108028;
 Tue, 25 May 2021 18:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=v7Y+n/zT1DDY0nuWoiVGIYe7ZPWqvETQLL/RfPoiY+Q=;
 b=YLJFzUxT8mDxtnwAuVR4EJo2NOeJpEURIdnE1HAHGEoItQRZK6dbFQzWMZvrdytCx+L0
 Dp1ZEzbQj49PvR3EZUB6wB7PYRX2vQSV/YCECO9fLNhgpK7TBFZ63X1Gt/2PO5KWlsJP
 rAK+iQfdrjkHmhUA9ymf6weN329SMe3jYXvH54Z4BJoOjOfKeTRg+96pVsINdgpRp6M/
 IgJKV/Htpkxx+PTH8Hxjm6Rd9ADsUvGj7MFRIb8nA6gTkbhkMaoSEUvEiF+mGxduMXPU
 PDI6Dk6RJPKPDFo2ueIHhra3Kyx1s11rh/UdeOwcAyfuzWZ8fduoaWimEBLCjlucs1r/ Fg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 38q3q8xc0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 May 2021 18:06:22 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14PHosu2021990;
 Tue, 25 May 2021 18:06:21 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2043.outbound.protection.outlook.com [104.47.56.43])
 by aserp3020.oracle.com with ESMTP id 38rehapck3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 May 2021 18:06:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKvlC0286aw6oA6cb76wLHGRaog5IesfPm+TVk++PaT09TNlUwQOuS51/RcohjmZjZA8yMAeJRL7VnxetPN04gB8yY38o0E1i1qMqecDesPmDGuwylmyLwmCnBGw4WVb5NgHmb64JmRSv+rn2MnKa/JMnwKdP0CyjLW5OAJR68vJjMo2QXPHsH3B7k+N6MpUWTkASYWWw8rQYMK+7vuJrnmGW8JoUcje3x/KGcqMupuVxptnCn2AvPbVwoJt+OwsrCJFemWBHi0cnTzLXxrldyS15MbESwcsfwC/Bm+WvmkL3TFiTorkL/98K6nzFt1JEq5k9lGHiD2p6Ueux5D4Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7Y+n/zT1DDY0nuWoiVGIYe7ZPWqvETQLL/RfPoiY+Q=;
 b=QzxlUJWAg//KhX5/FZNHFaogGI66yipuhLbUcdpBSmfkIfg4S5tEFznXO6gXzOy6yEsb3Ap7C+fOjXKH1CXQZuLWV/zijaZvcDKgdrfkm3f5UAbyBlWnRFOnIesQLtmo2AcmM9pGey9K55k8vjHqx3TcNqYRcg1j8qW8OsIaMsQa/E0k0OHPCBTvI7dBm7p4Zz4AmKj5lEwvQW1M/vVmaDxztORB1/gNzxUAttXyVy97KE5JNJBKuXL9ejA2v40NOLYbe96N1zGKjizyKFlw077eZBrkNNe7eGm3hVJJthBclpDZvc61z6XIXsfXycGmBYtm9kENXyZuPUAoieRo5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7Y+n/zT1DDY0nuWoiVGIYe7ZPWqvETQLL/RfPoiY+Q=;
 b=GSPr8SCG2UUDdO/G2tOSeAKz0Lvll2Bh6DMI4jwEl4BhK41x+l9VUg8CgTIq98N4dqcx1qvCU0N5ekXte0RLhyRgHjNZzKRZqfdR+ebu344pqiUMARkom+L5ZwS0usQnrJ8KYOmnanlKA6wzBqvIdytw5wpdRNIKcVb+JlnOxFo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=oracle.com; 
Received: from BYAPR10MB3573.namprd10.prod.outlook.com (2603:10b6:a03:11e::32)
 by SJ0PR10MB4639.namprd10.prod.outlook.com (2603:10b6:a03:2db::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Tue, 25 May
 2021 18:06:19 +0000
Received: from BYAPR10MB3573.namprd10.prod.outlook.com
 ([fe80::b09d:e36a:4258:d3d0]) by BYAPR10MB3573.namprd10.prod.outlook.com
 ([fe80::b09d:e36a:4258:d3d0%7]) with mapi id 15.20.4173.020; Tue, 25 May 2021
 18:06:19 +0000
From: Mike Christie <michael.christie@oracle.com>
To: target-devel@vger.kernel.org, linux-scsi@vger.kernel.org,
 stefanha@redhat.com, pbonzini@redhat.com, jasowang@redhat.com,
 mst@redhat.com, sgarzare@redhat.com,
 virtualization@lists.linux-foundation.org
Subject: [PATCH 6/9] vhost-scsi: make SCSI cmd completion per vq
Date: Tue, 25 May 2021 13:05:57 -0500
Message-Id: <20210525180600.6349-7-michael.christie@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525180600.6349-1-michael.christie@oracle.com>
References: <20210525180600.6349-1-michael.christie@oracle.com>
X-Originating-IP: [73.88.28.6]
X-ClientProxiedBy: DM6PR13CA0021.namprd13.prod.outlook.com
 (2603:10b6:5:bc::34) To BYAPR10MB3573.namprd10.prod.outlook.com
 (2603:10b6:a03:11e::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (73.88.28.6) by
 DM6PR13CA0021.namprd13.prod.outlook.com (2603:10b6:5:bc::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.12 via Frontend Transport; Tue, 25 May 2021 18:06:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f339426a-300c-47fe-c510-08d91fa7cbf9
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4639:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4639D175C8CDA49C5CBEB14DF1259@SJ0PR10MB4639.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TWaRqwwVraO15lVxJbxNMyE6ckk58xu2MX/zU2FltQGmD42KkWzUqlLG3O660+4sL8ootdie+CbqNQ9mu8lCXvM/a4Wa5AxJy7sTJ898k+BZic/mSpwwb9ua+src6L4o/H2v2ggyf/v9IrIX6j832Y1Nx5Pw75ewBAHLl8q9v5PFlqqzFwqzrcKOHZuix/oV7+E80BcRCLLoHXC6GHiHgLJJggWt01JbRvfo/zrXhXUqXMQT6zOBoTrTvbPqeqVHf70e2iY0CHoN38xzrtPOkuUK6p+rhT/+U6YYJRhLVbMnA8iqOHbkaDDKnEChbGs3xaxwrD/G9hj+PLr1oSs2WQ8MJmlDHs6jphwWY5i3/GQCla7Ei/S/ZZtJ5yNiH2BY+vqyvqvnDxe4OXDItKwnjUkGjac53+Myv3ajginiJCjPbBhH7n3VypEbnAyQ7++Q/xZPBmVrlVdbZ7n6zjbaKk4+Jp9D8v22B64Dz6pF7c6fkNHSezdwZShBQuJn/DwhGpdn2nqgTZQNr/WYS71q9GXM9cYJkYlIbzBm40inb7inRqrDflPGEun6ph8pTPaS5hLhLgOjlrKlE0UOyU6aEWE89KbSixlJMsTxh2EZx11mpKUPvs68FdMsLAbWnKdIo72IRDwyX0NFQuGsQCR6WJackmQVSfxv83AIh3IOrYfmGUzU4pLmmoEpBcOYRsg5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3573.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(376002)(366004)(136003)(346002)(36756003)(2616005)(83380400001)(4326008)(186003)(316002)(6512007)(6666004)(6486002)(1076003)(8676002)(16526019)(478600001)(2906002)(52116002)(66556008)(38350700002)(86362001)(66476007)(26005)(5660300002)(38100700002)(956004)(66946007)(8936002)(6506007)(107886003)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?kak3ADUNYZj9q4wf5evOgAxpRNG3zT4Zm8rMM0OdPWTvMljNlFJcHWlyq/Tf?=
 =?us-ascii?Q?Hr2Oz4tsGsL91F8FBOh5HwFO2g6iLTEOZtb43mFYrVNYhnVI1EdQHK1XHk26?=
 =?us-ascii?Q?mYzv37L9ki5ejoC1PLbV45+6QIZ5kVnEQsneMxKr4jGt6jWK+4OCFpIIwlkM?=
 =?us-ascii?Q?bPzfsbjFkIsSqOGt8hSBCgyFnKi7n0RApVJGy4/Hl7fNWEdAywHJOAIMOZrs?=
 =?us-ascii?Q?LUAsQv09mKIGbUoTWf8tnLUW/Pr+B2p+i0+WdtKnKxks9MyA9Lw/rdKwoRhd?=
 =?us-ascii?Q?K2jRp5BkvZmgUDJETgJmatVxVdoP5MqdC/87gElS0GKS91r7Vl1SOtxEWy15?=
 =?us-ascii?Q?XmqaHlstFMZvdSSNXHIuv2CZD7dJYKY8+SuvVwwZk3JydPcBtoKLpQuy4ecS?=
 =?us-ascii?Q?BtRjZm69FDg0jNRTLnOVZdqGrfulTIRhQB1YVMD2XGxA6o6T5HDIwfECqM3o?=
 =?us-ascii?Q?HgJnzkQCizLoDeIX1LZsV9i5De09/ejN0p3HUui7iqBnMLRyXqYwNsQmNTkt?=
 =?us-ascii?Q?07l4X3/3uIZ2l3Aq/HCV/oEoCexi7UszchQgLGq+f0t9O1J5TAkw6pzZ6cxW?=
 =?us-ascii?Q?7jV0B1K1GNUESPlsleY206zALAcjiSztfXksd40D8hs2oTqDXTcMOWlAk8HT?=
 =?us-ascii?Q?AXFtqC1KWJvYo+wliS8QtDWXEpOy39M9HL7UfvYPCs2iESuKE0+fjXuq1xqI?=
 =?us-ascii?Q?Tcjb5wlmWjGVlv/8Rpmt5J1PiD3eoTHaJLgWGNnQCpKnpO4Zvp9fUEYcnhP3?=
 =?us-ascii?Q?B5Du6Qk/Xv0cZZ4wroY56T25bUvv0vkV+7Yh0rNsVigl6/hwJPAN3iQbetKA?=
 =?us-ascii?Q?StKD95kkQ81UB776y0FuFx8raKDcheW52L3Cri9+aU5RkXisd2uhiUaBRSHs?=
 =?us-ascii?Q?QfDBpXVdtHKYr9bxtIDKwAI8fL2LltxjgM8wRf7jdIT3ReBFu6EKM2DgwsJQ?=
 =?us-ascii?Q?MRRINsP6110vSEPGFt7BX1YfmaDH07FKxHPD/CDLl5h+PET9VRGAUGTFgXqY?=
 =?us-ascii?Q?GIEy6i72Fh6vhWGaIgpedNmkwSzvFMq3ENcOcxt2gN4MU42MGAPxHP4AxzIn?=
 =?us-ascii?Q?ibsN6Sm6vw3rtqV1gzp5L7m9F5+NtRBTHMCQfgS+oht98aPzGDb0edwZz0II?=
 =?us-ascii?Q?WQSZp4wXcX9z7HWVXJCUgqlhNrpe/8liN5S4Ijr0r5cd+Q+pY6nPP0m7PaBI?=
 =?us-ascii?Q?8j/SM+i0Jcjo9iyIgE+WZ6Lh0fWgMNzhsaBqYEovE9HV9H86pUxIGF8z8+AB?=
 =?us-ascii?Q?uWBRN647e3hq36vVdqqBD7tQGq8duvdbrf3ISb/thnMbPRoHLDw1R36Wpgkw?=
 =?us-ascii?Q?4PJTU5cOSOoRlheCn3Y4Fz5a?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f339426a-300c-47fe-c510-08d91fa7cbf9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3573.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 18:06:19.3518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9aLcnVk6h063kOrIm61+AwLXd26WIpRrk6DqSVGu5kLHHnktL5dNb8gTLQHbW4LP477KLGihmNMADA4R0ixYQItYZ+tJWtzknwg3nxo+vz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4639
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9995
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105250110
X-Proofpoint-GUID: 5chjdaacP6TVIkVK4PqoEGAhmu96sGU4
X-Proofpoint-ORIG-GUID: 5chjdaacP6TVIkVK4PqoEGAhmu96sGU4
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9995
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105250111
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

This patch separates the scsi cmd completion code paths so we can complete
cmds based on their vq instead of having all cmds complete on the same
worker/CPU. This will be useful with the next patch that allows us to
create mulitple worker threads and bind them to different vqs, so we can
have completions running on different threads/CPUs.

Signed-off-by: Mike Christie <michael.christie@oracle.com>
---
 drivers/vhost/scsi.c | 48 +++++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
index e585f2180457..b607bff41074 100644
--- a/drivers/vhost/scsi.c
+++ b/drivers/vhost/scsi.c
@@ -176,6 +176,7 @@ enum {
 
 struct vhost_scsi_virtqueue {
 	struct vhost_virtqueue vq;
+	struct vhost_scsi *vs;
 	/*
 	 * Reference counting for inflight reqs, used for flush operation. At
 	 * each time, one reference tracks new commands submitted, while we
@@ -190,6 +191,9 @@ struct vhost_scsi_virtqueue {
 	struct vhost_scsi_cmd *scsi_cmds;
 	struct sbitmap scsi_tags;
 	int max_cmds;
+
+	struct vhost_work completion_work;
+	struct llist_head completion_list;
 };
 
 struct vhost_scsi {
@@ -200,9 +204,6 @@ struct vhost_scsi {
 	struct vhost_dev dev;
 	struct vhost_scsi_virtqueue vqs[VHOST_SCSI_MAX_VQ];
 
-	struct vhost_work vs_completion_work; /* cmd completion work item */
-	struct llist_head vs_completion_list; /* cmd completion queue */
-
 	struct vhost_work vs_event_work; /* evt injection work item */
 	struct llist_head vs_event_list; /* evt injection queue */
 
@@ -377,10 +378,11 @@ static void vhost_scsi_release_cmd(struct se_cmd *se_cmd)
 	} else {
 		struct vhost_scsi_cmd *cmd = container_of(se_cmd,
 					struct vhost_scsi_cmd, tvc_se_cmd);
-		struct vhost_scsi *vs = cmd->tvc_vhost;
+		struct vhost_scsi_virtqueue *svq =  container_of(cmd->tvc_vq,
+					struct vhost_scsi_virtqueue, vq);
 
-		llist_add(&cmd->tvc_completion_list, &vs->vs_completion_list);
-		vhost_work_queue(&vs->dev, &vs->vs_completion_work);
+		llist_add(&cmd->tvc_completion_list, &svq->completion_list);
+		vhost_vq_work_queue(&svq->vq, &svq->completion_work);
 	}
 }
 
@@ -543,18 +545,17 @@ static void vhost_scsi_evt_work(struct vhost_work *work)
  */
 static void vhost_scsi_complete_cmd_work(struct vhost_work *work)
 {
-	struct vhost_scsi *vs = container_of(work, struct vhost_scsi,
-					vs_completion_work);
-	DECLARE_BITMAP(signal, VHOST_SCSI_MAX_VQ);
+	struct vhost_scsi_virtqueue *svq = container_of(work,
+				struct vhost_scsi_virtqueue, completion_work);
 	struct virtio_scsi_cmd_resp v_rsp;
 	struct vhost_scsi_cmd *cmd, *t;
 	struct llist_node *llnode;
 	struct se_cmd *se_cmd;
 	struct iov_iter iov_iter;
-	int ret, vq;
+	bool signal = false;
+	int ret;
 
-	bitmap_zero(signal, VHOST_SCSI_MAX_VQ);
-	llnode = llist_del_all(&vs->vs_completion_list);
+	llnode = llist_del_all(&svq->completion_list);
 	llist_for_each_entry_safe(cmd, t, llnode, tvc_completion_list) {
 		se_cmd = &cmd->tvc_se_cmd;
 
@@ -574,21 +575,16 @@ static void vhost_scsi_complete_cmd_work(struct vhost_work *work)
 			      cmd->tvc_in_iovs, sizeof(v_rsp));
 		ret = copy_to_iter(&v_rsp, sizeof(v_rsp), &iov_iter);
 		if (likely(ret == sizeof(v_rsp))) {
-			struct vhost_scsi_virtqueue *q;
+			signal = true;
 			vhost_add_used(cmd->tvc_vq, cmd->tvc_vq_desc, 0);
-			q = container_of(cmd->tvc_vq, struct vhost_scsi_virtqueue, vq);
-			vq = q - vs->vqs;
-			__set_bit(vq, signal);
 		} else
 			pr_err("Faulted on virtio_scsi_cmd_resp\n");
 
 		vhost_scsi_release_cmd_res(se_cmd);
 	}
 
-	vq = -1;
-	while ((vq = find_next_bit(signal, VHOST_SCSI_MAX_VQ, vq + 1))
-		< VHOST_SCSI_MAX_VQ)
-		vhost_signal(&vs->dev, &vs->vqs[vq].vq);
+	if (signal)
+		vhost_signal(&svq->vs->dev, &svq->vq);
 }
 
 static struct vhost_scsi_cmd *
@@ -1799,6 +1795,7 @@ static int vhost_scsi_set_features(struct vhost_scsi *vs, u64 features)
 
 static int vhost_scsi_open(struct inode *inode, struct file *f)
 {
+	struct vhost_scsi_virtqueue *svq;
 	struct vhost_scsi *vs;
 	struct vhost_virtqueue **vqs;
 	int r = -ENOMEM, i;
@@ -1811,7 +1808,6 @@ static int vhost_scsi_open(struct inode *inode, struct file *f)
 	if (!vqs)
 		goto err_vqs;
 
-	vhost_work_init(&vs->vs_completion_work, vhost_scsi_complete_cmd_work);
 	vhost_work_init(&vs->vs_event_work, vhost_scsi_evt_work);
 
 	vs->vs_events_nr = 0;
@@ -1822,8 +1818,14 @@ static int vhost_scsi_open(struct inode *inode, struct file *f)
 	vs->vqs[VHOST_SCSI_VQ_CTL].vq.handle_kick = vhost_scsi_ctl_handle_kick;
 	vs->vqs[VHOST_SCSI_VQ_EVT].vq.handle_kick = vhost_scsi_evt_handle_kick;
 	for (i = VHOST_SCSI_VQ_IO; i < VHOST_SCSI_MAX_VQ; i++) {
-		vqs[i] = &vs->vqs[i].vq;
-		vs->vqs[i].vq.handle_kick = vhost_scsi_handle_kick;
+		svq = &vs->vqs[i];
+
+		vqs[i] = &svq->vq;
+		svq->vs = vs;
+		init_llist_head(&svq->completion_list);
+		vhost_work_init(&svq->completion_work,
+				vhost_scsi_complete_cmd_work);
+		svq->vq.handle_kick = vhost_scsi_handle_kick;
 	}
 	vhost_dev_init(&vs->dev, vqs, VHOST_SCSI_MAX_VQ, UIO_MAXIOV,
 		       VHOST_SCSI_WEIGHT, 0, true, NULL);
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
