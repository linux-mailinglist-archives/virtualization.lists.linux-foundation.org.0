Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E53FB88FE4
	for <lists.virtualization@lfdr.de>; Sun, 11 Aug 2019 07:56:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 24EB4AE7;
	Sun, 11 Aug 2019 05:56:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6AFF98B1;
	Sun, 11 Aug 2019 05:56:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BF70E6E0;
	Sun, 11 Aug 2019 05:56:11 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 0328568BFE; Sun, 11 Aug 2019 07:56:07 +0200 (CEST)
Date: Sun, 11 Aug 2019 07:56:07 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [RFC PATCH] virtio_ring: Use DMA API if guest memory is encrypted
Message-ID: <20190811055607.GA12488@lst.de>
References: <87zhrj8kcp.fsf@morokweng.localdomain>
	<20190810143038-mutt-send-email-mst@kernel.org>
	<20190810220702.GA5964@ram.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190810220702.GA5964@ram.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Alexey Kardashevskiy <aik@linux.ibm.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Paul Mackerras <paulus@ozlabs.org>, iommu@lists.linux-foundation.org,
	linuxppc-devel@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
	David Gibson <david@gibson.dropbear.id.au>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

sev_active() is gone now in linux-next, at least as a global API.

And once again this is entirely going in the wrong direction.  The only
way using the DMA API is going to work at all is if the device is ready
for it.  So we need a flag on the virtio device, exposed by the
hypervisor (or hardware for hw virtio devices) that says:  hey, I'm real,
don't take a shortcut.

And that means on power and s390 qemu will always have to set thos if
you want to be ready for the ultravisor and co games.  It's not like we
haven't been through this a few times before, have we?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
