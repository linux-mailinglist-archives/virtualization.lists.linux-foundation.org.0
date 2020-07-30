Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E62792329E9
	for <lists.virtualization@lfdr.de>; Thu, 30 Jul 2020 04:24:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7B09786CBF;
	Thu, 30 Jul 2020 02:24:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KBpS-LY8Hhdn; Thu, 30 Jul 2020 02:24:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1757686CBB;
	Thu, 30 Jul 2020 02:24:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EB616C004D;
	Thu, 30 Jul 2020 02:24:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 97745C004D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 02:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8230086CB8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 02:24:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IvAd0m8x7Gzy
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 02:24:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CDE1786BAD
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 02:24:07 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06U2LxiM012523;
 Thu, 30 Jul 2020 02:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=eUTieb3q5B4ekvgmNe55qqLMuveEcKYOBUj6MInH6Vw=;
 b=kAunwwyc65LXH6hlG2O9SMNRLOtdwgBNfePRrU4VFlfElPxGfxbAPzkVXrNAezlAV9zm
 bi2+9Qbct/sbka9VLyoRcIn6j3nBDkCtGEdC6zbdeKJri+Gk7ExIR8/dP/U17JdV1Gtq
 AwdmEJr6Y+9e9UleRlD0U7lw2FM1ISHfUylON3keV5CCCRMtT+kKn7wuUq8Pe+0zrf3p
 2ZoyHj9XRM+plrD8piYQ6k4XQYluD2dC1fX4i1CBmdimZTn7gXA0dXR7OZg50w7FXEdt
 2U73B/4R0eVj3f9d5+vEZZDNfJVco0B+fTeY4E+hOvcPZhIq7y48xSthELu1cO3JXd9N zw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 32hu1js2wc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 30 Jul 2020 02:24:05 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06U2MVrI108907;
 Thu, 30 Jul 2020 02:24:04 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 32hu5ymfts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jul 2020 02:24:04 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06U2O3F8001101;
 Thu, 30 Jul 2020 02:24:03 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 29 Jul 2020 19:24:03 -0700
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-kernel@vger.kernel.org, Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH 0/1] virtio-scsi: fix missing unplug events when all LUNs
 are unplugged at the same time
Date: Wed, 29 Jul 2020 22:24:01 -0400
Message-Id: <159607582923.27464.4409897545362766716.b4-ty@oracle.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200729194806.4933-1-mlevitsk@redhat.com>
References: <20200729194806.4933-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9697
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007300015
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9697
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 mlxlogscore=999
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007300015
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
 "open list:SCSI SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "open list:VIRTIO BLOCK AND SCSI DRIVERS"
 <virtualization@lists.linux-foundation.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>
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

On Wed, 29 Jul 2020 22:48:05 +0300, Maxim Levitsky wrote:

> virtio-scsi currently has limit of 8 outstanding notifications so when more that
> 8 LUNs are unplugged, some are missed.
> 
> Commit 5ff843721467 ("scsi: virtio_scsi: unplug LUNs when events missed")
> Fixed this by checking the 'event overflow' bit and manually scanned the bus
> to see which LUNs are still there.
> 
> [...]

Applied to 5.9/scsi-queue, thanks!

[1/1] scsi: virtio-scsi: Correctly handle the case where all LUNs are unplugged
      https://git.kernel.org/mkp/scsi/c/b12149f2698c

-- 
Martin K. Petersen	Oracle Linux Engineering
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
