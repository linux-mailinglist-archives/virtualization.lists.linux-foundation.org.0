Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAE039081E
	for <lists.virtualization@lfdr.de>; Tue, 25 May 2021 19:47:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B532A83CBC;
	Tue, 25 May 2021 17:47:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jtstmJlcflEs; Tue, 25 May 2021 17:47:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8997883CB4;
	Tue, 25 May 2021 17:47:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46F96C0001;
	Tue, 25 May 2021 17:47:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27967C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 17:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23A014052A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 17:47:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=oracle.com header.b="hBUIWvUn";
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.b="i7BHN2QB"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PfuO_aiqeGF3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 17:47:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDDE040566
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 17:47:52 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14PHhPvF084741;
 Tue, 25 May 2021 17:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=1ESmTwnAyXCq51btcYwNxM4nejxq0doON9ZIHHaw0ZY=;
 b=hBUIWvUnrDc6LEX1ciNRW927Mq7KJupLu2I6ZwJc3dv9jATnsqt+lifZnxGA5zO2lBO2
 NTszTmcHFPBl7//ExdOk9f1bDIPCq5+xV7RUuTqBeavLTMBHG9VtZ/L7OBG4UIUJ0qc+
 GR3gAcEuugJBTUR/cSew71PXwdRTBhNTqOww5NhGqtfU+FjJcFMQY2nCRjV7KxNgaRL2
 ry1vY1X2yhCmidsqOu34mwPZy43W9QXq+UxyTC1YM3kU8H9Uab9P+Sx4NvJOxxV13Its
 Z8PPFPiRyx8Pc/32s0vkLNn2FmWMZ0Jxwxdb8eZ2xRxftCew7t7owQSQO4kLq3doizZa Sg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 38q3q8xam4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 May 2021 17:47:51 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14PHeDnK133298;
 Tue, 25 May 2021 17:47:51 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2049.outbound.protection.outlook.com [104.47.51.49])
 by userp3020.oracle.com with ESMTP id 38qbqsfu7d-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 May 2021 17:47:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/umTKkZZV97hmSKc3bFkUNCLgGF83X5/5hE6kLm0B3rLckzPlSwfAhJVkv0W77jHSxtPmLv53mjo675nqjBj8MX9FK2VbZy+RKMyLcKJd9Kk5LTKy98U/fM/nDXb+SNlCxonfTNTCmZnJbRakvahbQF6yKdxY7iiKB6B8A9VhmeydoEWxXc4OnrlC8eKyBymS1zc/mZGLaE+eA9rfHjCUdLha6cMyFAqx0xHat1M4RzA5XRnx0QfZWtKsrhXXnC+7Au7iklzeHRzH1wPEB8LuzB742RuPIvMW9TcWk3V9HpHyNZdMBG+5Eme1ny9x97exu1UKTorE+e0/Z08yFzLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ESmTwnAyXCq51btcYwNxM4nejxq0doON9ZIHHaw0ZY=;
 b=InNIhNzXZ2GpisasrLjHpZsHUUV1dsiaF555EsCRDX9Ms96EhJ5Vv5Wq3lFZH68H6mEuWJNNUKl5w/NB5gzcude0us6/Mh3QWMh2ogDjbOK68KAJd/RO1slbwcztTZIvKfmMNeRI0TpljSRNU2lIuP3EuwimF0MDu6W2fWQJWX1kCGbn3iYq/tVWmJUhlYMOghhS0Uq/6eThiUBcuXZfUx0S6RLjX3xLjNggbUBgc7Mnbas3S9I+bJxEUnsl1xlEdvt8j+360l9zDlTCbnDfYkWDaCITuCMgEfpVxXluE4d+rE0pCnRy/dRO90autSMysAAhqsBQMjHEE+ItKXiVsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ESmTwnAyXCq51btcYwNxM4nejxq0doON9ZIHHaw0ZY=;
 b=i7BHN2QBTsp8/IrYDhif54rcv229aeEHQNFSaV/8iFG/O9Fe+Xp6tlnw/oaokAdP/1+cH0W3o86rew2RgRF6H7FttXQ9+p0DMmgb5R8Suytbxsn5kH/z1Id0+fXX/pAYI5+U8O/PLvZYBipTsOhoY02loq1HboFg2kLpVZb7ijg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=oracle.com; 
Received: from BYAPR10MB3573.namprd10.prod.outlook.com (2603:10b6:a03:11e::32)
 by SJ0PR10MB4720.namprd10.prod.outlook.com (2603:10b6:a03:2d7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Tue, 25 May
 2021 17:47:47 +0000
Received: from BYAPR10MB3573.namprd10.prod.outlook.com
 ([fe80::b09d:e36a:4258:d3d0]) by BYAPR10MB3573.namprd10.prod.outlook.com
 ([fe80::b09d:e36a:4258:d3d0%7]) with mapi id 15.20.4173.020; Tue, 25 May 2021
 17:47:47 +0000
From: Mike Christie <michael.christie@oracle.com>
To: target-devel@vger.kernel.org, linux-scsi@vger.kernel.org,
 stefanha@redhat.com, pbonzini@redhat.com, jasowang@redhat.com,
 mst@redhat.com, sgarzare@redhat.com,
 virtualization@lists.linux-foundation.org
Subject: [PATCH 4/5] vhost: fix poll coding style
Date: Tue, 25 May 2021 12:47:32 -0500
Message-Id: <20210525174733.6212-5-michael.christie@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525174733.6212-1-michael.christie@oracle.com>
References: <20210525174733.6212-1-michael.christie@oracle.com>
X-Originating-IP: [73.88.28.6]
X-ClientProxiedBy: DM5PR19CA0009.namprd19.prod.outlook.com
 (2603:10b6:3:151::19) To BYAPR10MB3573.namprd10.prod.outlook.com
 (2603:10b6:a03:11e::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (73.88.28.6) by
 DM5PR19CA0009.namprd19.prod.outlook.com (2603:10b6:3:151::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Tue, 25 May 2021 17:47:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86e7e204-5653-4ee4-062c-08d91fa5351b
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4720:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB472059623F7CBEA8348E78DAF1259@SJ0PR10MB4720.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:590;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lRzKa7zGvo9hh/65+9rlz/v5z6gV8Z5OZ/7s4jeFJwTOOfcE9AR6MW3HVcRJ6re1qQm6qUNDO4j8JZCVeePIym7nPX0Y2z3XFpa6SYpIkIIzdwUW6nrAJhF5Ed3ycSSm1PtgHqBsdVfwMi/uGPn/9xoRzoVy+WoKEfJjbYWx9P7yhXIM1IscCPgrTnxXDY6qeoZZo9fn8gzshM1Nw4x//eTNHMmO67XW0c1zEV2OpTO9+iU0vD8GvoPJBEkPRhY5AXD2aRSHL/x5hs+xAoSCWJdPfalqzw/HKTtjoc7V06Zrbl1kJSU95fWZ6cClLTgjcU0yi5qiLTOVHrDiiPLm/x5Lnq9SHCL6siQIV66oPMOcWhAk2ThbDYaOXp3LdHon5kjXA41dMqVFsmio+080kkEn6OqkfKycR1NJy3PnECCtKihc9Nns/lol7Cx6wOE/gKulGt9RgqUKX2+myiRMIht8ASHFJOzEvqiWoypCfTDPl1hDzu4eFNJiTFy4ZBcGUYNFzFTxpluYw2vndpenEe2vhznA1MX/stGnm9JamqlW9UdDvEpdgZxRhdVicqxJuX8/8ZvttyEzhbwLFLJQNxykA45HmMcOzgHXq1ndNrib0u24EIKJPkwjaCG1Ip1LnR5/2Q6yuHk8eQ1IDJoA5bzIsw7vi5jCwgN5AbWNuUvKJDc+tS1rT1GzYxNOobrP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3573.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(376002)(366004)(346002)(396003)(36756003)(83380400001)(54906003)(6512007)(38100700002)(52116002)(26005)(66476007)(478600001)(38350700002)(86362001)(66946007)(5660300002)(66556008)(316002)(8676002)(2906002)(6506007)(1076003)(8936002)(16526019)(186003)(6486002)(4326008)(6666004)(2616005)(956004)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ASRTTYClr14fcWx1PgcyuNUFYXHVoXX70oKy5p7g8zAFa8oQiLrZyg5t9cOA?=
 =?us-ascii?Q?DMDD68igb7IhCP6TsbRN3VXcMbWNiTlWmeQ4AwYFg+uN+PBz/tHIK8wOV+4d?=
 =?us-ascii?Q?Fy59zX/eLg1F++CEGGKW2/5sSE9AELSCXKOA1Ve10sNT8PWkgS46hBFpUxFc?=
 =?us-ascii?Q?Dk3LFQhhWehNxgO66S+QuHOYCkBdvJKzqysYSzMgxpX3dmFG6ZhYI/JsxSvr?=
 =?us-ascii?Q?IocI02eqzWMoX/IRMU+/KUOKYVi1fMnoB+HMvxJnOSAH8saEz1jURYvTmaNd?=
 =?us-ascii?Q?CkGSDvOYItSqEVYXt83nZrdKH5YTVS/NaaobhnizYTuVaWni3arZypE+wDYU?=
 =?us-ascii?Q?GRDYyIJuZeSBmcLlkvvz1UAgwkc9HdRVxMrOv4eeWYd6+jiifCds5/jX9JnI?=
 =?us-ascii?Q?iXtgkdJ4NT9Y0OSjAKq4emyZ3g8ddCFfppAMIzb77/uSTaKEnORkedCajvqM?=
 =?us-ascii?Q?D3ZZdTuqBTXbvv0Cxc5jvZ3yElIw1rOh1BuFmjQkFAP9BNrNql52MJrQjwiX?=
 =?us-ascii?Q?QIYKRak7fXSIsIn14M9WLFyEQ4p9Rt6ERfk0yKjJQrFwaLHse3oMWwGHqm/L?=
 =?us-ascii?Q?mf3rxZFjRSyY6ecwhpZJjdvqN+zYJnWt7QlQdD752sHbe+9ZI6yIZM9Dohp4?=
 =?us-ascii?Q?7AmUXbC9zRNmQGgVu41k4LtJLxBVmPuSLQ82KK0/QMoIAlFJjqrU8zDC/zU/?=
 =?us-ascii?Q?++HmBPjhGJTPS6nGed4AU5ye1Yef86ApXyb54ay5oS3wrp58m6dqddVEQWX6?=
 =?us-ascii?Q?CpzV7KFyvDjyRe8OWrv/5pnUAGcrQxsV/gbJTCgnFFqlJunpfmUSZr1jHDq6?=
 =?us-ascii?Q?R/qv9BRXphxoJ1lHbFQphLA8uXC+/8kSFWC1cGZvJn6ph08Hh/+m2dmfeANn?=
 =?us-ascii?Q?o8xUffZeJpkThXQ4giLjqRtSYoLEOojbvOWr4Zyss0c3p+BsrAyXHLRMpEhz?=
 =?us-ascii?Q?bfWHnQof4WoferH/d2dq7yVWRhyKJiMkTVjlq0bmtrixf8Y/vgWq/RSFPFao?=
 =?us-ascii?Q?uJNpgpUbilCweZoi3OysPgBRa0G0kJNwlbibugnlXhJfMh9HUu5GIACTPgqr?=
 =?us-ascii?Q?Dy6IK5vtcOmXYD7Q+1W+fA5nExnXgl02JwYRowRr7asKmIQxY+d5Gw6hJq30?=
 =?us-ascii?Q?yRtls3Rmmn28PqD2cxUT3MUjhe8s0wY7PDp9X2Z8rMzVvk9DA6w81aKUlDXA?=
 =?us-ascii?Q?I96g53E+hGZpWusaT2fV4WWf4uzG91ldul5mBw96TOgrZjQc8kYu+rMGzPrC?=
 =?us-ascii?Q?CGFBXZBdDa77BiMhxFTvR8n5f6hxIMMhPQrFZB8aH9hTbPiDDHVApyx/FYwj?=
 =?us-ascii?Q?GIFKjnUWdfY0TkqpQIukGDVp?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e7e204-5653-4ee4-062c-08d91fa5351b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3573.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 17:47:47.2213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jE3roVAnkmImloUibkTb+yhCDCAoF2jC2ay4rPy/ANzovPwPsZpauMqfFve52zGPBv6vuw7EvRjSeQaRXIeTeHwRH7k1UKdKR4PgIWZ2XpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4720
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9995
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105250109
X-Proofpoint-GUID: oi1PiXaNDzOrRqd1wzfjMaY6ex7jXC1b
X-Proofpoint-ORIG-GUID: oi1PiXaNDzOrRqd1wzfjMaY6ex7jXC1b
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9995
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105250109
Cc: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
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

We use 3 coding styles in this struct. Switch to just tabs.

Signed-off-by: Mike Christie <michael.christie@oracle.com>
Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vhost/vhost.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
index 1ba8e814989d..575c8180caad 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -28,12 +28,12 @@ struct vhost_work {
 /* Poll a file (eventfd or socket) */
 /* Note: there's nothing vhost specific about this structure. */
 struct vhost_poll {
-	poll_table                table;
-	wait_queue_head_t        *wqh;
-	wait_queue_entry_t              wait;
-	struct vhost_work	  work;
-	__poll_t		  mask;
-	struct vhost_dev	 *dev;
+	poll_table		table;
+	wait_queue_head_t	*wqh;
+	wait_queue_entry_t	wait;
+	struct vhost_work	work;
+	__poll_t		mask;
+	struct vhost_dev	*dev;
 };
 
 void vhost_work_init(struct vhost_work *work, vhost_work_fn_t fn);
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
