Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFE240CF19
	for <lists.virtualization@lfdr.de>; Wed, 15 Sep 2021 23:58:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAFCA402D9;
	Wed, 15 Sep 2021 21:58:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HHNeOuQrDuT5; Wed, 15 Sep 2021 21:58:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 660DB4045A;
	Wed, 15 Sep 2021 21:58:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4EE4C0022;
	Wed, 15 Sep 2021 21:57:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 703E6C000D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Sep 2021 21:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46ABE402D9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Sep 2021 21:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d32WsiKtUoQw
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Sep 2021 21:57:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C0D54010D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Sep 2021 21:57:57 +0000 (UTC)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18FLfnuf017276;
 Wed, 15 Sep 2021 17:57:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=r0zjDPmxQlHjqKY3YS+Mw50PM/TTUsowd6SU3TAyazw=;
 b=aGHLz+XEFU5xya3U5icf20cqAKNsyD/LXGWbo2H1OsrA2/U8vRR4Mq0GJcS3O5cDQRtZ
 r4y1uvKuJjG5nNQEk/RyaE0psIWD43YSOCGYZOxYYsFLacsqt2XoSMMiJIJClBkQrygg
 9QxyObqyHEVshLzau/Z5B2epwA+6jbBL/azfKMmoxW1UaPOUNaK0o/jfVKeVyxx/D3Dc
 unMLpZ3QR3l5nHk8l0VwATxhITMFHKmnXGOkJWcje4MELGYDkFvSfcejio8xQsGl2Gut
 37aNRfwubp1S1KBaA6D2rrVwsoY15kUbUWK/J2grbBZeHybablYHXGGFr17hH4VSUttS ZA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b3rymr9c9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 17:57:56 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18FLhhCJ029044;
 Wed, 15 Sep 2021 17:57:56 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b3rymr9bp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 17:57:55 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18FLbGZ8022784;
 Wed, 15 Sep 2021 21:57:53 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3b0m3abcgs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 21:57:53 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18FLvokV36700416
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 21:57:50 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48FEE4204B;
 Wed, 15 Sep 2021 21:57:50 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C166F42042;
 Wed, 15 Sep 2021 21:57:49 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 15 Sep 2021 21:57:49 +0000 (GMT)
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>,
 Michael Mueller <mimu@linux.ibm.com>, linux-s390@vger.kernel.org,
 virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] virtio/s390: fix vritio-ccw device teardown
Date: Wed, 15 Sep 2021 23:57:42 +0200
Message-Id: <20210915215742.1793314-1-pasic@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EcaMy9tItbwygH455Px6hHg4hFKm1Mos
X-Proofpoint-GUID: 1qNY67DORGcy9q3LXMmJznCPVsezn5A_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 clxscore=1011 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109150122
Cc: bfu@redhat.com, Vineeth Vijayan <vneethv@linux.ibm.com>
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

Since commit 48720ba56891 ("virtio/s390: use DMA memory for ccw I/O and
classic notifiers") we were supposed to make sure that
virtio_ccw_release_dev() completes before the ccw device, and the
attached dma pool are torn down, but unfortunately we did not.
Before that commit it used to be OK to delay cleaning up the memory
allocated by virtio-ccw indefinitely (which isn't really intuitive for
guys used to destruction happens in reverse construction order).

To accomplish this let us take a reference on the ccw device before we
allocate the dma_area and give it up after dma_area was freed.

Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
Fixes: 48720ba56891 ("virtio/s390: use DMA memory for ccw I/O and
classic notifiers")
Reported-by: bfu@redhat.com
---

I'm not certain this is the only hot-unplug and teardonw related problem
with virtio-ccw.

Some things that are not perfectly clear to me:
* What would happen if we observed an hot-unplug while we are doing
  wait_event() in ccw_io_helper()? Do we get stuck? I don't thin we
  are guaranteed to receive an irq for a subchannel that is gone.
* cdev->online seems to be manipulated under cdev->ccwlock, but
  in virtio_ccw_remove() we look at it to decide should we clean up
  or not. What is the idea there? I guess we want to avoid doing
  if nothing is there or twice. But I don't understand how stuff
  interlocks.
* Can virtio_ccw_remove() get called while !cdev->online and 
  virtio_ccw_online() is running on a different cpu? If yes, what would
  happen then?
 
The main addresse of these questions is Conny ;).

An alternative to this approach would be to inc and dec the refcount
in ccw_device_dma_zalloc() and ccw_device_dma_free() respectively.

---
 drivers/s390/virtio/virtio_ccw.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
index d35e7a3f7067..99141df3259b 100644
--- a/drivers/s390/virtio/virtio_ccw.c
+++ b/drivers/s390/virtio/virtio_ccw.c
@@ -1006,10 +1006,12 @@ static void virtio_ccw_release_dev(struct device *_d)
 {
 	struct virtio_device *dev = dev_to_virtio(_d);
 	struct virtio_ccw_device *vcdev = to_vc_device(dev);
+	struct ccw_device *cdev = READ_ONCE(vcdev->cdev);
 
 	ccw_device_dma_free(vcdev->cdev, vcdev->dma_area,
 			    sizeof(*vcdev->dma_area));
 	kfree(vcdev);
+	put_device(&cdev->dev);
 }
 
 static int irb_is_error(struct irb *irb)
@@ -1262,6 +1264,7 @@ static int virtio_ccw_online(struct ccw_device *cdev)
 	struct virtio_ccw_device *vcdev;
 	unsigned long flags;
 
+	get_device(&cdev->dev);
 	vcdev = kzalloc(sizeof(*vcdev), GFP_KERNEL);
 	if (!vcdev) {
 		dev_warn(&cdev->dev, "Could not get memory for virtio\n");
@@ -1315,6 +1318,7 @@ static int virtio_ccw_online(struct ccw_device *cdev)
 				    sizeof(*vcdev->dma_area));
 	}
 	kfree(vcdev);
+	put_device(&cdev->dev);
 	return ret;
 }
 

base-commit: 3ca706c189db861b2ca2019a0901b94050ca49d8
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
