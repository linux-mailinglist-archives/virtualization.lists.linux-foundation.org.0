Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B92E521E736
	for <lists.virtualization@lfdr.de>; Tue, 14 Jul 2020 06:59:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B44078A831;
	Tue, 14 Jul 2020 04:59:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pDRfyR+dT+OL; Tue, 14 Jul 2020 04:59:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2FB038A834;
	Tue, 14 Jul 2020 04:59:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B7C8C0733;
	Tue, 14 Jul 2020 04:59:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5BE1C0733
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 04:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BC3FB2C339
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 04:59:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I682bpe8IFU4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 04:59:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by silver.osuosl.org (Postfix) with ESMTPS id 51156203E6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 04:59:13 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06E4utuQ172701;
 Tue, 14 Jul 2020 04:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=8OamBc93tsElgQQ1UHHoc9Ay6yPCeE9e643okWZufPE=;
 b=RcQ8N4yE75AJIagGybBj1DOtp5WeLXeVMtnLPD7qSA1s9F8HbroJ3EngD0TfjMpAWiL5
 bEklOkbecflIy1SNslBC8cOi2ixycHJaUezl+e56jtcDbOPKFloEvpG61tHxbi7LFBkS
 nICuMdIbIJ53L52lKTOizUedA+Ky6g65LdPWbAUBqJllz8LIDmJUR5vHbS0nk3DFdyuT
 wAI0q9Cwp3w/kO5lZUKSzfhV/ApSg74ldxDoXt48oBkWaxQrKklt7/oen8IICsN3A+DX
 VMoXc3mJVH3gLonR22yKfXRFGULbH11pQti19gK2zWrTOjQyh0xljI0yk+O1f7JAWZsj mA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 3275cm2x3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 14 Jul 2020 04:59:01 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06E4vXKT174023;
 Tue, 14 Jul 2020 04:59:01 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 327qb2nuud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jul 2020 04:59:01 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06E4wxg2025076;
 Tue, 14 Jul 2020 04:58:59 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 13 Jul 2020 21:58:59 -0700
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: mst@redhat.com, pbonzini@redhat.com, jasowang@redhat.com,
 Xianting Tian <xianting_tian@126.com>, jejb@linux.ibm.com,
 stefanha@redhat.com
Subject: Re: [PATCH] scsi: virtio_scsi: remove unnecessary condition check
Date: Tue, 14 Jul 2020 00:58:47 -0400
Message-Id: <159470266467.11195.10910825066875185491.b4-ty@oracle.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <1594307167-8807-1-git-send-email-xianting_tian@126.com>
References: <1594307167-8807-1-git-send-email-xianting_tian@126.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9681
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=998
 malwarescore=0
 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007140037
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9681
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501
 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 clxscore=1011 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007140037
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 virtualization@lists.linux-foundation.org
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

On Thu, 9 Jul 2020 11:06:07 -0400, Xianting Tian wrote:

> kmem_cache_destroy and mempool_destroy can correctly handle
> null pointer parameter, so there is no need to check if the
> parameter is null before calling kmem_cache_destroy and
> mempool_destroy.

Applied to 5.9/scsi-queue, thanks!

[1/1] scsi: virtio_scsi: Remove unnecessary condition check
      https://git.kernel.org/mkp/scsi/c/92e8d0323a51

-- 
Martin K. Petersen	Oracle Linux Engineering
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
