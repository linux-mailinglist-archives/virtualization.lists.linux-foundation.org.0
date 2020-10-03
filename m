Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCAB28219F
	for <lists.virtualization@lfdr.de>; Sat,  3 Oct 2020 07:43:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9D7AD87396;
	Sat,  3 Oct 2020 05:43:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CU3ChFtwO7Nl; Sat,  3 Oct 2020 05:43:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 253408733B;
	Sat,  3 Oct 2020 05:43:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BDD3C0051;
	Sat,  3 Oct 2020 05:43:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B743C0051
 for <virtualization@lists.linux-foundation.org>;
 Sat,  3 Oct 2020 05:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 897BF20390
 for <virtualization@lists.linux-foundation.org>;
 Sat,  3 Oct 2020 05:43:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jnqyMOkIrL7i
 for <virtualization@lists.linux-foundation.org>;
 Sat,  3 Oct 2020 05:43:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by silver.osuosl.org (Postfix) with ESMTPS id 85C3D1FEED
 for <virtualization@lists.linux-foundation.org>;
 Sat,  3 Oct 2020 05:43:17 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0935dw1J156091;
 Sat, 3 Oct 2020 05:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=9KxNDqQb/daFeFk4axWtWUrYIM1JzBO5oMsjX6VTYv4=;
 b=eIu0EI35rkEjtQ6/BtqEmRp6xWyCUxGkUmlkEzOrQbVq26a1x9Uh8wssQZeRZ8rAL3/H
 gvFuNAEwcPxA5HkUNwBtuzniYvmzhzDN9k02TZgRCUyISbCHE/Esnf1m8KglU8vVGpD6
 g+bJMWzr9d8ICsYIaAOZuZj72cgopeOKYK5xsnRDHtI6Siy6WJFsLvw9WM3IntXPxCHB
 WTCk4rzKuoV83v6syIBOxlpZT8Sm3z5AaFw1UwzVWWAptLOXZcoDwPjgE7irVBt2kWiu
 ozhVLH/ZVMHtRdGKrieZndZZOV/7kzNAxOmHJQt+Im3Q39NzS72qTLn7t1w5LQvbz33P EA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 33xetagabk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 03 Oct 2020 05:43:14 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0935eaSP071195;
 Sat, 3 Oct 2020 05:43:13 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 33xh3y29ut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 03 Oct 2020 05:43:13 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0935hDsX026233;
 Sat, 3 Oct 2020 05:43:13 GMT
Received: from ban25x6uut24.us.oracle.com (/10.153.73.24)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 02 Oct 2020 22:43:12 -0700
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: mst@redhat.com, jasowang@redhat.com, lingshan.zhu@intel.com
Subject: [PATCH v3 0/2] vhost-vdpa mapping error path fixes
Date: Sat,  3 Oct 2020 01:02:08 -0400
Message-Id: <1601701330-16837-1-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9762
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010030050
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9762
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010030050
Cc: netdev@vger.kernel.org, virtualization@lists.linux-foundation.org,
 boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Commit 4c8cf31885f6 ("vhost: introduce vDPA-based backend")
has following issues in the failure path of IOTLB update:

1) vhost_vdpa_map() does not clean up dangling iotlb entry
   upon mapping failure

2) vhost_vdpa_process_iotlb_update() has leakage of pinned
   pages in case of vhost_vdpa_map() failure

This patchset attempts to address the above issues.

Changes in v3:
- Factor out changes in vhost_vdpa_map() and the fix for
  page pinning leak to separate patches (Jason)

---
Si-Wei Liu (2):
  vhost-vdpa: fix vhost_vdpa_map() on error condition
  vhost-vdpa: fix page pinning leakage in error path

 drivers/vhost/vdpa.c | 122 +++++++++++++++++++++++++++++++--------------------
 1 file changed, 74 insertions(+), 48 deletions(-)

-- 
1.8.3.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
