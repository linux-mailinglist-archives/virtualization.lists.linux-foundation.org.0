Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7A32318B0
	for <lists.virtualization@lfdr.de>; Wed, 29 Jul 2020 06:34:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DF75B85608;
	Wed, 29 Jul 2020 04:34:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pjN3pbA7fVRt; Wed, 29 Jul 2020 04:34:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6CCE48557E;
	Wed, 29 Jul 2020 04:34:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 48915C0053;
	Wed, 29 Jul 2020 04:34:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65A3EC004D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 04:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 50A4688167
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 04:33:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YjdOkOeWn1m4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 04:33:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5A04A8815F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 04:33:57 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06T4X5NE120312;
 Wed, 29 Jul 2020 04:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=h53xFNPOnAu2za+HlgzOC+33Caul8s3PIGMAjL9zqYc=;
 b=MUANNLB3paLQES1ITCwvWFQWzJZAFz7rsJkF3D6lhZO3wRENywTiG0r+5okWKkGJ2N2M
 DaGTv20AHMYg355l9ym2tW1wVzEVZfTRSL7rjD5IUZkPYC+JW5RHvEwNR6deIoJMP3fE
 vm85fX/uL2WSTVv4X7PydVVBu8Ij9SyFYxJzsk/Qrysb8Kw0RNxxwExX7tquU7glJRud
 mp56sD5XgSnc/DW+CDlCnIO0jaY7bONl+rx5yQx/tL6inf/00RKjw65HiJjYXxY21VPd
 VcHpdd/DrGG4sD2M3hwfszIYUQymWQs2xeIiKfHeKOQGZZsJ/pBsWvVANuIeFNVm/GlP 7Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 32hu1jb81y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 29 Jul 2020 04:33:22 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06T4XMJD078386;
 Wed, 29 Jul 2020 04:33:22 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 32hu5u1w9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jul 2020 04:33:11 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06T4X32F028038;
 Wed, 29 Jul 2020 04:33:03 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 28 Jul 2020 21:33:03 -0700
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH 02/10] block: virtio-blk: check logical block size
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1bljz7y9q.fsf@ca-mkp.ca.oracle.com>
References: <20200721105239.8270-1-mlevitsk@redhat.com>
 <20200721105239.8270-3-mlevitsk@redhat.com>
 <20200721151437.GB10620@lst.de> <yq1zh7sfedj.fsf@ca-mkp.ca.oracle.com>
 <f16aba1020019530564f0869a67951282104a5d2.camel@redhat.com>
Date: Wed, 29 Jul 2020 00:32:55 -0400
In-Reply-To: <f16aba1020019530564f0869a67951282104a5d2.camel@redhat.com>
 (Maxim Levitsky's message of "Wed, 22 Jul 2020 12:11:17 +0300")
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9696
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 mlxscore=0
 suspectscore=1 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007290031
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9696
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 clxscore=1015
 malwarescore=0 spamscore=0 suspectscore=1 bulkscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007290031
Cc: "Michael S. Tsirkin" <mst@redhat.com>, "open list:NVM EXPRESS
 DRIVER" <linux-nvme@lists.infradead.org>,
 "open list:VIRTIO CORE AND NET DRIVERS"
 <virtualization@lists.linux-foundation.org>, Hou Tao <houtao1@huawei.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 "open list:SCSI CDROM DRIVER" <linux-scsi@vger.kernel.org>,
 Satya Tangirala <satyat@google.com>, Ajay Joshi <ajay.joshi@wdc.com>,
 Alex Dubov <oakad@yahoo.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>, "open
 list:BLOCK LAYER" <linux-block@vger.kernel.org>,
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


Hi Maxim,

> Instead of this adding blk_is_valid_logical_block_size allowed me to
> trivially convert most of the uses.
>
> For RFC I converted only some drivers that I am more familiar with
> and/or can test but I can remove the driver's own checks in most other
> drivers with low chance of introducing a bug, even if I can't test the
> driver.
>
> What do you think?
>
> I can also both make blk_queue_logical_block_size return an error
> value, and have blk_is_valid_logical_block_size and use either of
> these checks, depending on the driver with eventual goal of
> un-exporting blk_is_valid_logical_block_size.

My concern is that blk_is_valid_logical_block_size() deviates from the
regular block layer convention where the function to set a given queue
limit will either adjust the passed value or print a warning.

I guess I won't entirely object to having the actual check in a helper
function that drivers with a peculiar initialization pattern can
use. And then make blk_queue_logical_block_size() call that helper as
well to validate the lbs.

But I do think that blk_queue_logical_block_size() should be the
preferred interface and that, where possible, drivers should be updated
to check the return value of that.

-- 
Martin K. Petersen	Oracle Linux Engineering
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
