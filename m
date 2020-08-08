Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE3F23F715
	for <lists.virtualization@lfdr.de>; Sat,  8 Aug 2020 11:32:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3916285187;
	Sat,  8 Aug 2020 09:32:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qya19gaX3xKK; Sat,  8 Aug 2020 09:32:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BD429874F0;
	Sat,  8 Aug 2020 09:32:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F063C0051;
	Sat,  8 Aug 2020 09:32:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 652A6C0051
 for <virtualization@lists.linux-foundation.org>;
 Sat,  8 Aug 2020 09:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 51AF0874F0
 for <virtualization@lists.linux-foundation.org>;
 Sat,  8 Aug 2020 09:32:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TnbjZ3EZWG2B
 for <virtualization@lists.linux-foundation.org>;
 Sat,  8 Aug 2020 09:32:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D221B85187
 for <virtualization@lists.linux-foundation.org>;
 Sat,  8 Aug 2020 09:32:16 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0789IwhO196333;
 Sat, 8 Aug 2020 09:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=BjxU2hYpE9qnHJRvR45YvDyFi9RxTKJ3dwV9r3j2u5E=;
 b=SX4hDaAtWjLoSp9bV+lFqb8NzZXc8N95/YVQ3PgsqBU0W8p4TsfrMRYgldIAaKv5Z9T0
 TYnw4ffDR1k53g7LhyPSxgqgVRmBOs4Bssf2wsVI8+o/h6K6Mret/3n7m6Q/pZjDFBNc
 MrRK8J8zHD/JHCTuzxEPjB+k4fLNCsJygAQGwvUNLGrq8yH8oWbm0oxIqt/4WkzsRSex
 /LiQnySmTMgQq/m4oQgbfaqz0USvMLMKT85zR/fwHKcLI8TV3IrTBvfcAYY+0olTvgY2
 tj6V4Q0GFm6hkC8PnS8aKse2ueDwTE4bojh49nBB/B6Hf+BjSeZJlTUUWQb64MzPoNxA YQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 32smpn0mej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 08 Aug 2020 09:32:15 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0789JKes005490;
 Sat, 8 Aug 2020 09:32:15 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 32sj396asa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 08 Aug 2020 09:32:15 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0789WEYZ013841;
 Sat, 8 Aug 2020 09:32:14 GMT
Received: from mwanda (/10.175.188.11) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sat, 08 Aug 2020 02:32:14 -0700
Date: Sat, 8 Aug 2020 12:32:07 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH] vdpa/mlx5: Missing error code on allocation failure
Message-ID: <20200808093207.GA115053@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9706
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 phishscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008080067
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9706
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1011 spamscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008080067
Cc: Parav Pandit <parav@mellanox.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Eli Cohen <eli@mellanox.com>
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

This should return -ENOMEM if the allocation fails.  Currently it
either returns success or an uninitialized value.

Fixes: 94abbccdf291 ("vdpa/mlx5: Add shared memory registration code")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/vdpa/mlx5/core/mr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/vdpa/mlx5/core/mr.c b/drivers/vdpa/mlx5/core/mr.c
index f5dec0274133..ef1c550f8266 100644
--- a/drivers/vdpa/mlx5/core/mr.c
+++ b/drivers/vdpa/mlx5/core/mr.c
@@ -319,8 +319,10 @@ static int add_direct_chain(struct mlx5_vdpa_dev *mvdev, u64 start, u64 size, u8
 	while (size) {
 		sz = (u32)min_t(u64, MAX_KLM_SIZE, size);
 		dmr = kzalloc(sizeof(*dmr), GFP_KERNEL);
-		if (!dmr)
+		if (!dmr) {
+			err = -ENOMEM;
 			goto err_alloc;
+		}
 
 		dmr->start = st;
 		dmr->end = st + sz;
-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
