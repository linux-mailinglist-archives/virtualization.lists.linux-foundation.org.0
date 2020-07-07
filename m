Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C1C216882
	for <lists.virtualization@lfdr.de>; Tue,  7 Jul 2020 10:45:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3CF3A88F1F;
	Tue,  7 Jul 2020 08:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fmxChsliZmq5; Tue,  7 Jul 2020 08:45:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6AAE888F19;
	Tue,  7 Jul 2020 08:45:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4BCFBC08A2;
	Tue,  7 Jul 2020 08:45:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95A45C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 08:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 80BF088F36
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 08:45:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rAxc3lbcZAlL
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 08:45:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 368AF88F1F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 08:45:04 +0000 (UTC)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0678Ve6c104150; Tue, 7 Jul 2020 04:45:00 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 324bpmpx67-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 04:44:57 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0678XoAT110196;
 Tue, 7 Jul 2020 04:44:50 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 324bpmpx25-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 04:44:49 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0678iVx4002463;
 Tue, 7 Jul 2020 08:44:42 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 322hd81mdk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 08:44:42 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0678idwq49741930
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Jul 2020 08:44:39 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6511BA404D;
 Tue,  7 Jul 2020 08:44:39 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87860A4057;
 Tue,  7 Jul 2020 08:44:38 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.29.12])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Jul 2020 08:44:38 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] s390: virtio: let arch validate VIRTIO features
Date: Tue,  7 Jul 2020 10:44:35 +0200
Message-Id: <1594111477-15401-1-git-send-email-pmorel@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-07_05:2020-07-07,
 2020-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 suspectscore=1 bulkscore=0 clxscore=1015 cotscore=-2147483648 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2007070062
Cc: gor@linux.ibm.com, linux-s390@vger.kernel.org, frankja@linux.ibm.com,
 kvm@vger.kernel.org, mst@redhat.com, heiko.carstens@de.ibm.com,
 cohuck@redhat.com, linuxram@us.ibm.com,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, thomas.lendacky@amd.com, david@gibson.dropbear.id.au
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

Hi all,

I changed the patch subject to reflect the content, becoming more
general.

1) I removed the ack from Christian and Jason even far as
   I understand they gave it for the functionality more than for the
   implementation.
   @Jason, @Christian, please can I get back your acked-by with these changes?

2) previous patch had another name:
   [PATCH v3 0/1] s390: virtio: let arch choose to accept devices without IOMMU feature
   id: Message-Id: <1592390637-17441-2-git-send-email-pmorel@linux.ibm.com>

3) The new version generalize the validation of the features by the
   architecture, making it not IOMMU_PLATFORM specific anymore inside
   virtio.c

   The architecture specific code for s390 is now testing the virtio
   features.

4) Since I reworked the patch I also moved the arch specific code
   from arch/s390/mm/init.c to arch/s390/kernel/to uv.c

5) Finaly, I splitted the patch into generic virtio and arch
   specific code.

Regards,
Pierre

Pierre Morel (2):
  virtio: let arch validate VIRTIO features
  s390: virtio: PV needs VIRTIO I/O device protection

 arch/s390/kernel/uv.c         | 25 +++++++++++++++++++++++++
 drivers/virtio/virtio.c       | 19 +++++++++++++++++++
 include/linux/virtio_config.h |  1 +
 3 files changed, 45 insertions(+)

-- 
2.25.1

Changelog

to v4:

- separate virtio and arch code
  (Pierre)

- moved code from arch/s390/mm/init.c to arch/s390/kernel/uv.c
  (Heiko)

- moved validation inside the arch code
  (Connie)

- moved the call to arch validation before VIRTIO_F_1 test
  (Michael)

to v3:

- add warning
  (Connie, Christian)

- add comment
  (Connie)

- change hook name
  (Halil, Connie)

to v2:

- put the test in virtio_finalize_features()
  (Connie)

- put the test inside VIRTIO core
  (Jason)

- pass a virtio device as parameter
  (Halil)


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
