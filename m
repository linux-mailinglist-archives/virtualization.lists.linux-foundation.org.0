Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7390A428651
	for <lists.virtualization@lfdr.de>; Mon, 11 Oct 2021 07:39:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D650580F48;
	Mon, 11 Oct 2021 05:39:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FHLX1shcTyIN; Mon, 11 Oct 2021 05:39:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8102780F6F;
	Mon, 11 Oct 2021 05:39:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14FAAC000D;
	Mon, 11 Oct 2021 05:39:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E3EEDC000D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Oct 2021 05:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B74FB605F5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Oct 2021 05:39:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ibm.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yrnDd8e548-w
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Oct 2021 05:39:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D8A2E605D5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Oct 2021 05:39:34 +0000 (UTC)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B4482n036941; 
 Mon, 11 Oct 2021 01:39:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=4HW4pQ25GO1K6URUKRqS+7ujDcAMEDeHj0XORmuOSA8=;
 b=Fr4eXMe4OkDkyiQmqrBL1+8IzDGUg+4XlH/GOfVLDc05Wz+GqSmqX4QCgQgoN2InZsqQ
 9al/6cazEusi2dieO+HhlZuuf94GIhONYgfFzw5/5SMHmBlarli8aWimkPx89jIVeGzp
 ORvIT7fpybLJ9ukJmQg6goAyXjRgxa85YzgQUapdX9TEfLXzAaTpFlSlHsYQwaH4EMSg
 zrCOfr22XNXArC6wQiTrcN+Cb7nEF5aWwvfW7BFqUHghCYQ2YMPoYRIHNKdqk+oH94b1
 GrBXyX5RKK/jG3gxcA8lMO6fcssgShwVAfL090RY1H7sL140D6AeZ8s0iguk/wV4DDYq qQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bm25mugj6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 01:39:32 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19B5K9pm038567;
 Mon, 11 Oct 2021 01:39:32 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bm25mughk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 01:39:32 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19B5VlGF019479;
 Mon, 11 Oct 2021 05:39:30 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3bk2bht3y9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 05:39:30 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19B5dQCl5440160
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 05:39:27 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9F3442045;
 Mon, 11 Oct 2021 05:39:26 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 445CB42041;
 Mon, 11 Oct 2021 05:39:26 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 11 Oct 2021 05:39:26 +0000 (GMT)
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/1] virtio: write back F_VERSION_1 before validate
Date: Mon, 11 Oct 2021 07:39:21 +0200
Message-Id: <20211011053921.1198936-1-pasic@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MkvVeVrmStp-ePltWRF4RTURcd9rcOLa
X-Proofpoint-GUID: nhX1dJtH4R_VgKXe83_52DJi-xKWhRzH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-10_07,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110110032
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 stable@vger.kernel.org, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, stefanha@redhat.com
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

The virtio specification virtio-v1.1-cs01 states: "Transitional devices
MUST detect Legacy drivers by detecting that VIRTIO_F_VERSION_1 has not
been acknowledged by the driver."  This is exactly what QEMU as of 6.1
has done relying solely on VIRTIO_F_VERSION_1 for detecting that.

However, the specification also says: "... the driver MAY read (but MUST
NOT write) the device-specific configuration fields to check that it can
support the device ..." before setting FEATURES_OK.

In that case, any transitional device relying solely on
VIRTIO_F_VERSION_1 for detecting legacy drivers will return data in
legacy format.  In particular, this implies that it is in big endian
format for big endian guests. This naturally confuses the driver which
expects little endian in the modern mode.

It is probably a good idea to amend the spec to clarify that
VIRTIO_F_VERSION_1 can only be relied on after the feature negotiation
is complete. Before validate callback existed, config space was only
read after FEATURES_OK. However, we already have two regressions, so
let's address this here as well.

The regressions affect the VIRTIO_NET_F_MTU feature of virtio-net and
the VIRTIO_BLK_F_BLK_SIZE feature of virtio-blk for BE guests when
virtio 1.0 is used on both sides. The latter renders virtio-blk unusable
with DASD backing, because things simply don't work with the default.
See Fixes tags for relevant commits.

For QEMU, we can work around the issue by writing out the feature bits
with VIRTIO_F_VERSION_1 bit set.  We (ab)use the finalize_features
config op for this. This isn't enough to address all vhost devices since
these do not get the features until FEATURES_OK, however it looks like
the affected devices actually never handled the endianness for legacy
mode correctly, so at least that's not a regression.

No devices except virtio net and virtio blk seem to be affected.

Long term the right thing to do is to fix the hypervisors.

Cc: <stable@vger.kernel.org> #v4.11
Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
Fixes: 82e89ea077b9 ("virtio-blk: Add validation for block size in config space")
Fixes: fe36cbe0671e ("virtio_net: clear MTU when out of range")
Reported-by: markver@us.ibm.com
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---

@Connie: I made some more commit message changes to accommodate Michael's
requests. I just assumed these will work or you as well and kept your
r-b. Please shout at me if it needs to be dropped :)
---
 drivers/virtio/virtio.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
index 0a5b54034d4b..236081afe9a2 100644
--- a/drivers/virtio/virtio.c
+++ b/drivers/virtio/virtio.c
@@ -239,6 +239,17 @@ static int virtio_dev_probe(struct device *_d)
 		driver_features_legacy = driver_features;
 	}
 
+	/*
+	 * Some devices detect legacy solely via F_VERSION_1. Write
+	 * F_VERSION_1 to force LE config space accesses before FEATURES_OK for
+	 * these when needed.
+	 */
+	if (drv->validate && !virtio_legacy_is_little_endian()
+			  && device_features & BIT_ULL(VIRTIO_F_VERSION_1)) {
+		dev->features = BIT_ULL(VIRTIO_F_VERSION_1);
+		dev->config->finalize_features(dev);
+	}
+
 	if (device_features & (1ULL << VIRTIO_F_VERSION_1))
 		dev->features = driver_features & device_features;
 	else

base-commit: 60a9483534ed0d99090a2ee1d4bb0b8179195f51
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
