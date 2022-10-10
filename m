Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AD65F9A82
	for <lists.virtualization@lfdr.de>; Mon, 10 Oct 2022 09:55:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B2E060BA6;
	Mon, 10 Oct 2022 07:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B2E060BA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7q8fRujFPxvX; Mon, 10 Oct 2022 07:55:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 380AB60AEB;
	Mon, 10 Oct 2022 07:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 380AB60AEB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 322FAC007C;
	Mon, 10 Oct 2022 07:55:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B497FC002D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Oct 2022 07:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8799060BA6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Oct 2022 07:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8799060BA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o0TR3qVMr14K
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Oct 2022 07:55:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 849CB60AEB
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 849CB60AEB
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Oct 2022 07:55:13 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 21BA768AA6; Mon, 10 Oct 2022 09:55:05 +0200 (CEST)
Date: Mon, 10 Oct 2022 09:55:04 +0200
From: Christoph Hellwig <hch@lst.de>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [RFC PATCH 00/21] block: add and use init tagset helper
Message-ID: <20221010075504.GA21272@lst.de>
References: <20221005032257.80681-1-kch@nvidia.com>
 <Y0BvRaVO0iUVmHgB@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y0BvRaVO0iUVmHgB@bombadil.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: vincent.fu@samsung.com, vincent.whitchurch@axis.com,
 baolin.wang@linux.alibaba.com, mst@redhat.com,
 linux-remoteproc@vger.kernel.org, hoeppner@linux.ibm.com,
 linux-nvme@lists.infradead.org, virtualization@lists.linux-foundation.org,
 bhelgaas@google.com, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 agordeev@linux.ibm.com, jinpu.wang@ionos.com, hch@lst.de, alyssa@rosenzweig.io,
 vigneshr@ti.com, linux-s390@vger.kernel.org, sagi@grimberg.me,
 linux-scsi@vger.kernel.org, richard@nod.at, damien.lemoal@opensource.wdc.com,
 vaibhavgupta40@gmail.com, joel@jms.id.au, shinichiro.kawasaki@wdc.com,
 idryomov@gmail.com, jejb@linux.ibm.com, asahi@lists.linux.dev, ohad@wizery.com,
 haris.iqbal@ionos.com, gor@linux.ibm.com, sven@svenpeter.dev,
 hca@linux.ibm.com, john.garry@huawei.com, josef@toxicpanda.com,
 efremov@linux.com, ming.lei@redhat.com, linux-block@vger.kernel.org,
 nbd@other.debian.org, christophe.jaillet@wanadoo.fr, sth@linux.ibm.com,
 stefanha@redhat.com, kbusch@kernel.org, ceph-devel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bvanassche@acm.org, axboe@kernel.dk, martin.petersen@oracle.com,
 wsa+renesas@sang-engineering.com, johannes.thumshirn@wdc.com,
 andersson@kernel.org, marcan@marcan.st, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dongsheng.yang@easystack.cn,
 christoph.boehmwalder@linbit.com, svens@linux.ibm.com, pbonzini@redhat.com
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

On Fri, Oct 07, 2022 at 11:26:13AM -0700, Luis Chamberlain wrote:
> *If* there were commonalities at init and these could be broken up into
> common groups, each having their own set of calls, then we simplify and
> can abstract these. I say this without doing a complete review of the
> removals, but if there really isn't much of commonalities I tend to
> agree with Bart that open coding this is better.

The commonality is that there are various required or optional
fields to fill out.  I actually have a WIP series to make the tag_set
dynamically allocated and refcounted to fix some long standing life time
issues.  That creates a new alloc helper that will take a few mandatory
arguments and would heavily clash with this series.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
