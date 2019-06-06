Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B497A37378
	for <lists.virtualization@lfdr.de>; Thu,  6 Jun 2019 13:53:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0DC5CD7D;
	Thu,  6 Jun 2019 11:51:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C699AD4F
	for <virtualization@lists.linux-foundation.org>;
	Thu,  6 Jun 2019 11:51:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5861584C
	for <virtualization@lists.linux-foundation.org>;
	Thu,  6 Jun 2019 11:51:49 +0000 (UTC)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x56BloGh065089 for <virtualization@lists.linux-foundation.org>;
	Thu, 6 Jun 2019 07:51:49 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2sy0vum8u3-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Thu, 06 Jun 2019 07:51:48 -0400
Received: from localhost
	by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<pasic@linux.ibm.com>; Thu, 6 Jun 2019 12:51:46 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
	by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 6 Jun 2019 12:51:43 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
	[9.149.105.62])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x56BpfTS17498570
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 6 Jun 2019 11:51:41 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D03CEAE045;
	Thu,  6 Jun 2019 11:51:41 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 28E50AE053;
	Thu,  6 Jun 2019 11:51:41 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu,  6 Jun 2019 11:51:41 +0000 (GMT)
From: Halil Pasic <pasic@linux.ibm.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
	Cornelia Huck <cohuck@redhat.com>, Sebastian Ott <sebott@linux.ibm.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [PATCH v4 8/8] virtio/s390: make airq summary indicators DMA
Date: Thu,  6 Jun 2019 13:51:27 +0200
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606115127.55519-1-pasic@linux.ibm.com>
References: <20190606115127.55519-1-pasic@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19060611-0020-0000-0000-000003474F30
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060611-0021-0000-0000-0000219A632F
Message-Id: <20190606115127.55519-9-pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-06-06_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1906060087
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Jason J. Herne" <jjherne@linux.ibm.com>,
	Christoph Hellwig <hch@infradead.org>, Thomas Huth <thuth@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Farhan Ali <alifm@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Michael Mueller <mimu@linux.ibm.com>,
	Viktor Mihajlovski <mihajlov@linux.ibm.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Hypervisor needs to interact with the summary indicators, so these
need to be DMA memory as well (at least for protected virtualization
guests).

Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
---
 drivers/s390/virtio/virtio_ccw.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
index e5e10aa54aa1..fe46079f105e 100644
--- a/drivers/s390/virtio/virtio_ccw.c
+++ b/drivers/s390/virtio/virtio_ccw.c
@@ -140,11 +140,17 @@ static int virtio_ccw_use_airq = 1;
 
 struct airq_info {
 	rwlock_t lock;
-	u8 summary_indicator;
+	u8 summary_indicator_idx;
 	struct airq_struct airq;
 	struct airq_iv *aiv;
 };
 static struct airq_info *airq_areas[MAX_AIRQ_AREAS];
+static u8 *summary_indicators;
+
+static inline u8 *get_summary_indicator(struct airq_info *info)
+{
+	return summary_indicators + info->summary_indicator_idx;
+}
 
 #define CCW_CMD_SET_VQ 0x13
 #define CCW_CMD_VDEV_RESET 0x33
@@ -209,7 +215,7 @@ static void virtio_airq_handler(struct airq_struct *airq, bool floating)
 			break;
 		vring_interrupt(0, (void *)airq_iv_get_ptr(info->aiv, ai));
 	}
-	info->summary_indicator = 0;
+	*(get_summary_indicator(info)) = 0;
 	smp_wmb();
 	/* Walk through indicators field, summary indicator not active. */
 	for (ai = 0;;) {
@@ -221,7 +227,7 @@ static void virtio_airq_handler(struct airq_struct *airq, bool floating)
 	read_unlock(&info->lock);
 }
 
-static struct airq_info *new_airq_info(void)
+static struct airq_info *new_airq_info(int index)
 {
 	struct airq_info *info;
 	int rc;
@@ -237,7 +243,8 @@ static struct airq_info *new_airq_info(void)
 		return NULL;
 	}
 	info->airq.handler = virtio_airq_handler;
-	info->airq.lsi_ptr = &info->summary_indicator;
+	info->summary_indicator_idx = index;
+	info->airq.lsi_ptr = get_summary_indicator(info);
 	info->airq.lsi_mask = 0xff;
 	info->airq.isc = VIRTIO_AIRQ_ISC;
 	rc = register_adapter_interrupt(&info->airq);
@@ -259,7 +266,7 @@ static unsigned long get_airq_indicator(struct virtqueue *vqs[], int nvqs,
 
 	for (i = 0; i < MAX_AIRQ_AREAS && !indicator_addr; i++) {
 		if (!airq_areas[i])
-			airq_areas[i] = new_airq_info();
+			airq_areas[i] = new_airq_info(i);
 		info = airq_areas[i];
 		if (!info)
 			return 0;
@@ -345,7 +352,7 @@ static void virtio_ccw_drop_indicator(struct virtio_ccw_device *vcdev,
 		if (!thinint_area)
 			return;
 		thinint_area->summary_indicator =
-			(unsigned long) &airq_info->summary_indicator;
+			(unsigned long) get_summary_indicator(airq_info);
 		thinint_area->isc = VIRTIO_AIRQ_ISC;
 		ccw->cmd_code = CCW_CMD_SET_IND_ADAPTER;
 		ccw->count = sizeof(*thinint_area);
@@ -613,7 +620,7 @@ static int virtio_ccw_register_adapter_ind(struct virtio_ccw_device *vcdev,
 	}
 	info = vcdev->airq_info;
 	thinint_area->summary_indicator =
-		(unsigned long) &info->summary_indicator;
+		(unsigned long) get_summary_indicator(info);
 	thinint_area->isc = VIRTIO_AIRQ_ISC;
 	ccw->cmd_code = CCW_CMD_SET_IND_ADAPTER;
 	ccw->flags = CCW_FLAG_SLI;
@@ -1493,8 +1500,17 @@ static void __init no_auto_parse(void)
 
 static int __init virtio_ccw_init(void)
 {
+	int rc;
+
 	/* parse no_auto string before we do anything further */
 	no_auto_parse();
-	return ccw_driver_register(&virtio_ccw_driver);
+
+	summary_indicators = cio_dma_zalloc(MAX_AIRQ_AREAS);
+	if (!summary_indicators)
+		return -ENOMEM;
+	rc = ccw_driver_register(&virtio_ccw_driver);
+	if (rc)
+		cio_dma_free(summary_indicators, MAX_AIRQ_AREAS);
+	return rc;
 }
 device_initcall(virtio_ccw_init);
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
