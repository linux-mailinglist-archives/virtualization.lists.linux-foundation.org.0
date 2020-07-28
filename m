Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 728F5230C69
	for <lists.virtualization@lfdr.de>; Tue, 28 Jul 2020 16:28:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2DC9887082;
	Tue, 28 Jul 2020 14:28:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 20fiX9gECc06; Tue, 28 Jul 2020 14:28:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 69485871DE;
	Tue, 28 Jul 2020 14:28:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41053C004D;
	Tue, 28 Jul 2020 14:28:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44A03C004D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 14:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3187087C51
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 14:28:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3xV1wNngufpU
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 14:28:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A229487CA3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 14:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595946486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vk76CkPyZ5T42guo8MQRmFanU+aGvXip0+duA6MP1QY=;
 b=P6GuduwGET+FzVJNQbQDlfz3GoRMmBuVcPfjreT7NQMASuW5yPIn7yThSvZAlOefT+e+b4
 ohXeAcgqHboIxWQxDTuDau5BzLRV9h//Oxi89adpmQxh2LXi0l7cAJfI+0/31v15UZbZVc
 FjaE1eyZhIN8eoNh4UQb3S4yyUYT9Cc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-Jz4k5rM7NTirOgcPGnRijg-1; Tue, 28 Jul 2020 10:28:02 -0400
X-MC-Unique: Jz4k5rM7NTirOgcPGnRijg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80CAEE91C;
 Tue, 28 Jul 2020 14:27:58 +0000 (UTC)
Received: from fedora-32-enviroment (unknown [10.35.206.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA66F10013C4;
 Tue, 28 Jul 2020 14:27:42 +0000 (UTC)
Message-ID: <25011fed186bd8bfd1f25640158fbce60a7ad9ef.camel@redhat.com>
Subject: Re: [PATCH 02/10] block: virtio-blk: check logical block size
From: Maxim Levitsky <mlevitsk@redhat.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>, Christoph Hellwig
 <hch@lst.de>
Date: Tue, 28 Jul 2020 17:27:41 +0300
In-Reply-To: <f16aba1020019530564f0869a67951282104a5d2.camel@redhat.com>
References: <20200721105239.8270-1-mlevitsk@redhat.com>
 <20200721105239.8270-3-mlevitsk@redhat.com> <20200721151437.GB10620@lst.de>
 <yq1zh7sfedj.fsf@ca-mkp.ca.oracle.com>
 <f16aba1020019530564f0869a67951282104a5d2.camel@redhat.com>
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "open list:NVM EXPRESS DRIVER" <linux-nvme@lists.infradead.org>,
 "open list:VIRTIO CORE
 AND NET DRIVERS" <virtualization@lists.linux-foundation.org>,
 Hou Tao <houtao1@huawei.com>, Sagi Grimberg <sagi@grimberg.me>,
 "open list:SCSI CDROM DRIVER" <linux-scsi@vger.kernel.org>,
 Satya Tangirala <satyat@google.com>, Ajay Joshi <ajay.joshi@wdc.com>,
 Alex Dubov <oakad@yahoo.com>, "James E.J.
 Bottomley" <jejb@linux.ibm.com>, Josef Bacik <josef@toxicpanda.com>,
 Ming Lei <ming.lei@redhat.com>,
 "open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Colin Ian King <colin.king@canonical.com>, Keith Busch <kbusch@kernel.org>,
 "open list:NETWORK BLOCK DEVICE \(NBD\)" <nbd@other.debian.org>,
 Bart Van Assche <bvanassche@acm.org>, Maxim Levitsky <maximlevitsky@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, Jens Axboe <axboe@fb.com>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 "open list:SONY MEMORYSTICK SUBSYSTEM" <linux-mmc@vger.kernel.org>,
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

On Wed, 2020-07-22 at 12:11 +0300, Maxim Levitsky wrote:
> On Tue, 2020-07-21 at 22:55 -0400, Martin K. Petersen wrote:
> > Christoph,
> > 
> > > Hmm, I wonder if we should simply add the check and warning to
> > > blk_queue_logical_block_size and add an error in that case.  Then
> > > drivers only have to check the error return, which might add a lot
> > > less boiler plate code.
> > 
> > Yep, I agree.
> > 
> 
> I also agree that this would be cleaner (I actually tried to implement
> this the way you suggest), but let me explain my reasoning for doing
> it
> this way.
> 
> The problem is that most current users of blk_queue_logical_block_size
> (43 uses in the tree, out of which only 9 use constant block size)
> check
> for the block size relatively early, often store it in some internal
> struct etc, prior to calling blk_queue_logical_block_size thus making
> them only to rely on blk_queue_logical_block_size as the check for 
> block size validity will need non-trivial changes in their code.
> 
> Instead of this adding blk_is_valid_logical_block_size allowed me
> to trivially convert most of the uses.
> 
> For RFC I converted only some drivers that I am more familiar with
> and/or can test but I can remove the driver's own checks in most other
> drivers with low chance of introducing a bug, even if I can't test the
> driver.
> 
> What do you think?
> 
> I can also both make blk_queue_logical_block_size return an error
> value,
> and have blk_is_valid_logical_block_size and use either of these
> checks,
> depending on the driver with eventual goal of un-exporting
> blk_is_valid_logical_block_size.
> 
> Also note that I did add WARN_ON to blk_queue_logical_block_size.

Any update on this?

Best regards,
	Maxim Levitsky

> 
> Best regards,
> 	Maxim Levitsky

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
