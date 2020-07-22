Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DAC228E5D
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 05:04:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7DE8586B31;
	Wed, 22 Jul 2020 03:04:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rBDeTttxmWyc; Wed, 22 Jul 2020 03:04:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 85B6286B1C;
	Wed, 22 Jul 2020 03:04:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6590DC016F;
	Wed, 22 Jul 2020 03:04:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DC189C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 03:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CFD6B881D2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 03:04:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9wzPKFdpJRyk
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 03:04:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0B461881BA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 03:04:49 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06M2kTjo191446;
 Wed, 22 Jul 2020 02:55:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=01BXubBTTggiGme5bAGTUB+IF85y9Gt5mJRvOB950ac=;
 b=Ert4ww4qHWKQEvayACm71Ls9WksxesZoOaQuXn1rooMPeky0Jrb3Txsjhfab7151opH+
 +ba9k2HaDjO+952t0cWNI9dQ5WIUYlfWf21ewpsJhWYjcp3N0pcTJv58VOOiL/rw4ZJ6
 iz8Tt3rOrUGPL774E+aOOMdpr1AJ4rPAQVYkJ8tuwulHR8WsPhlqGNhCTMtVwJGZI8Su
 HIBl9tQrmPPnenq/MvlY3LRHb4yzdgqsGtAjLjY176yMEaePZyb/9GiUf2AUdZxzL18+
 SsUZlrUq97Om51YkiNCIV1uh+Ie3EhzxivvOSUhEO/vIHZqNevq4QRm6YstexeMtuoCD CA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 32brgrgmt4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 22 Jul 2020 02:55:24 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06M2m6rK048369;
 Wed, 22 Jul 2020 02:55:24 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 32e9usdjva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 02:55:23 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06M2tDDp005896;
 Wed, 22 Jul 2020 02:55:13 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 22 Jul 2020 02:55:13 +0000
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 02/10] block: virtio-blk: check logical block size
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1zh7sfedj.fsf@ca-mkp.ca.oracle.com>
References: <20200721105239.8270-1-mlevitsk@redhat.com>
 <20200721105239.8270-3-mlevitsk@redhat.com>
 <20200721151437.GB10620@lst.de>
Date: Tue, 21 Jul 2020 22:55:07 -0400
In-Reply-To: <20200721151437.GB10620@lst.de> (Christoph Hellwig's message of
 "Tue, 21 Jul 2020 17:14:37 +0200")
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9689
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=1 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007220017
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9689
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=1 adultscore=0 clxscore=1011 mlxlogscore=999
 priorityscore=1501 phishscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007220017
Cc: "Michael S. Tsirkin" <mst@redhat.com>, "open list:NVM EXPRESS
 DRIVER" <linux-nvme@lists.infradead.org>,
 "open list:VIRTIO CORE AND NET DRIVERS"
 <virtualization@lists.linux-foundation.org>, Hou Tao <houtao1@huawei.com>,
 Satya Tangirala <satyat@google.com>, Sagi Grimberg <sagi@grimberg.me>,
 "open list:SCSI CDROM DRIVER" <linux-scsi@vger.kernel.org>,
 Maxim Levitsky <mlevitsk@redhat.com>, Ajay Joshi <ajay.joshi@wdc.com>,
 Alex Dubov <oakad@yahoo.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
 "open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Colin Ian King <colin.king@canonical.com>, Keith Busch <kbusch@kernel.org>,
 "open list:NETWORK BLOCK DEVICE \(NBD\)" <nbd@other.debian.org>,
 Bart Van Assche <bvanassche@acm.org>, Maxim Levitsky <maximlevitsky@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, Jens Axboe <axboe@fb.com>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, "open
 list:SONY MEMORYSTICK SUBSYSTEM" <linux-mmc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>
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


Christoph,

> Hmm, I wonder if we should simply add the check and warning to
> blk_queue_logical_block_size and add an error in that case.  Then
> drivers only have to check the error return, which might add a lot
> less boiler plate code.

Yep, I agree.

-- 
Martin K. Petersen	Oracle Linux Engineering
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
